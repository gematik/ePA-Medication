#!/usr/bin/env python
# -*- coding: utf-8 -*-
import argparse
import datetime as dt
import hashlib
import importlib.util
import json
import os
import sys

from fhir.resources.R4B.medication import Medication
from fhir.resources.R4B.medicationdispense import MedicationDispense

IDENTIFIER_SYSTEM = (
    "https://gematik.de/fhir/epa-medication/sid/epa-dispense-unique-identifier"
)
RENDERED_DOSAGE_INSTRUCTION_EXTENSION_URL = (
    "http://hl7.org/fhir/5.0/StructureDefinition/"
    "extension-MedicationDispense.renderedDosageInstruction"
)

# The EPAMedicationDispenseUniqueIdentifier reuses the EPAMedicationUniqueIdentifier
# of the referenced Medication. Load its reference implementation from the sibling tool.
_MED_TOOL_MAIN = os.path.abspath(
    os.path.join(
        os.path.dirname(__file__),
        "..",
        "..",
        "epamedicationuniqueidentifier",
        "src",
        "main.py",
    )
)
_spec = importlib.util.spec_from_file_location(
    "epa_medication_unique_identifier", _MED_TOOL_MAIN
)
_med_module = importlib.util.module_from_spec(_spec)
_spec.loader.exec_module(_med_module)
generate_medication_unique_identifier = _med_module.generate_hash


def _canonical_datetime(value):
    ####
    # Deterministic string for hashing (not a FHIR-conformant value).
    # Every value is expanded to a full UTC timestamp: missing month/day default to
    # 01, missing time to 00:00:00.000000, and offsets are converted to UTC.
    ###
    if not value:
        return ""
    if isinstance(value, dt.datetime):
        if value.tzinfo is None:  # absent timezone is interpreted as UTC
            value = value.replace(tzinfo=dt.timezone.utc)
        value = value.astimezone(dt.timezone.utc)
    elif isinstance(value, dt.date):
        value = dt.datetime(value.year, value.month, value.day, tzinfo=dt.timezone.utc)
    else:  # partial date kept as string: "YYYY" or "YYYY-MM"
        parts = str(value).split("-")
        year = int(parts[0])
        month = int(parts[1]) if len(parts) > 1 else 1
        value = dt.datetime(year, month, 1, tzinfo=dt.timezone.utc)
    return value.strftime("%Y-%m-%dT%H:%M:%S.%f") + "Z"


def _resolve_contained_medication(dispense, reference):
    if not dispense.contained:
        return None
    for contained in dispense.contained:
        if f"#{contained.id}" == reference:
            return contained
    return None


def _resolve_external_medication(reference, base_dir):
    ####
    # A literal reference such as "Medication/<id>" is resolved by scanning the
    # directory of the MedicationDispense file for the referenced Medication.
    ###
    if base_dir is None:
        return None
    resource_id = reference.split("/")[-1]
    for filename in sorted(os.listdir(base_dir)):
        if not filename.lower().endswith(".json"):
            continue
        path = os.path.join(base_dir, filename)
        try:
            with open(path, encoding="utf-8") as handle:
                data = json.load(handle)
        except (ValueError, OSError):
            continue
        if data.get("resourceType") == "Medication" and data.get("id") == resource_id:
            return Medication.parse_obj(data)
    return None


def medication_hash_value(dispense, base_dir):
    ####
    # MedicationDispense.medication[x]
    #   Literal reference (medicationReference.reference):
    #       use the EPAMedicationUniqueIdentifier of the resolved Medication.
    #   Logical reference (medicationReference.identifier):
    #       use its value directly.
    ###
    reference = dispense.medicationReference
    if reference is None:
        return ""

    if reference.reference:
        if reference.reference.startswith("#"): # local references start with "#", so this must point to a contained instance
            medication = _resolve_contained_medication(dispense, reference.reference)
        else:
            medication = _resolve_external_medication(reference.reference, base_dir)
        if medication is None:
            raise ValueError(
                f"Unable to resolve the referenced Medication '{reference.reference}'."
            )
        return generate_medication_unique_identifier(medication)

    elif reference.identifier and reference.identifier.value:
        # Logical reference -> use value directly
        return str(reference.identifier.value)

    else:
        # Reference is empty -> do nothing
        return ""


def generate_hash(dispense, base_dir=None):
    ####
    # Status = MedicationDispense.status
    ###
    status = str(dispense.status) if dispense.status else ""

    ####
    # Category = MedicationDispense.category
    #   All codings in the order given in the MedicationDispense instance.
    ###
    category = ""
    if dispense.category and dispense.category.coding:
        category = "".join(
            str(c.code) + str(c.system) for c in dispense.category.coding
        )

    ####
    # Medication = MedicationDispense.medication[x]
    ###
    medication = medication_hash_value(dispense, base_dir)

    ####
    # WhenHandedOver = MedicationDispense.whenHandedOver
    ###
    when_handed_over = _canonical_datetime(dispense.whenHandedOver)

    ####
    # WasSubstituted = MedicationDispense.substitution.wasSubstituted
    #   The boolean value is processed as "true" or "false".
    ###
    was_substituted = ""
    if dispense.substitution and dispense.substitution.wasSubstituted is not None:
        was_substituted = str(dispense.substitution.wasSubstituted).lower()

    ####
    # Extensions
    #   Values are lowercased, whitespace removed and sorted alphabetically.
    #   Only the renderedDosageInstruction extension flows into the hash.
    ###
    extensions = []
    if dispense.extension:
        for ext in dispense.extension:
            if ext.url != RENDERED_DOSAGE_INSTRUCTION_EXTENSION_URL:
                continue
            if ext.valueMarkdown is None:
                continue
            ext_value = ext.valueMarkdown.replace(" ", "").lower()
            extensions.append(ext_value)

    extensions.sort()

    ###
    # EPAMedicationDispenseUniqueIdentifier = hash.sha256(
    #   Status, Category, Medication, WhenHandedOver, WasSubstituted, Extensions)
    ###
    value_for_hash = (
        status
        + category
        + medication
        + when_handed_over
        + was_substituted
        + "".join(extensions)
    )
    h = hashlib.sha256()
    h.update(str(value_for_hash).encode())
    return str(h.hexdigest()).upper()


def is_dispenseuniqueidentifier_equal(dispense, hash_value):
    if dispense.identifier is None:
        return False

    for identifier in dispense.identifier:
        if identifier.system == IDENTIFIER_SYSTEM:
            return hash_value == identifier.value
    return False


def main():
    print(
        "A tool for generating or validating the EPAMedicationDispenseUniqueIdentifier "
        "for the FHIR Profile EPAMedicationDispense."
    )
    print("-" * 100)

    parser = argparse.ArgumentParser()
    parser.add_argument("-v", "--validate", dest="validate", action="store_true")
    parser.add_argument("filename", type=argparse.FileType("r"))
    parser.add_argument(
        "--debug",
        dest="debug",
        action="store_true",
        help="Enable debugging mode to prevent system exit on error",
    )
    args = parser.parse_args()

    try:
        dispense = MedicationDispense.parse_file(args.filename.name)
    except Exception as e:
        print(f"Error parsing the file: {e}")
        if not args.debug:
            sys.exit(os.EX_NOINPUT)
        else:
            return

    base_dir = os.path.dirname(os.path.abspath(args.filename.name))

    try:
        hash_value = generate_hash(dispense, base_dir)
    except ValueError as e:
        print(f"Error generating the identifier: {e}")
        if not args.debug:
            sys.exit(os.EX_DATAERR)
        else:
            return

    if args.validate:
        if is_dispenseuniqueidentifier_equal(dispense, hash_value):
            print("OK: The EPAMedicationDispenseUniqueIdentifier is correct.")
            if not args.debug:
                sys.exit(os.EX_OK)
            else:
                return
        else:
            print(
                "ERROR: The EPAMedicationDispenseUniqueIdentifier is incorrect. "
                f"The value should be {hash_value}."
            )
            if not args.debug:
                sys.exit(os.EX_DATAERR)
            else:
                return

    print(f"VALUE: {hash_value}")


if __name__ == "__main__":
    main()
