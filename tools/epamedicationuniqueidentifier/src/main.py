#!/usr/bin/env python
# -*- coding: utf-8 -*-
import argparse
import hashlib
import os
import sys

from fhir.resources.R4B.medication import Medication

IDENTIFIER_SYSTEM = (
    "https://gematik.de/fhir/epa-medication/sid/epa-medication-unique-identifier"
)
TYPE_EXTENSION_URL = "https://gematik.de/fhir/epa-medication/StructureDefinition/epa-medication-type-extension"
MEDICATION_MANUFACTURING_INSTRUCTIONS_EXTENSION_URL = "https://gematik.de/fhir/epa-medication/StructureDefinition/medication-manufacturing-instructions-extension"
MEDICATION_FORMULATION_PACKAGING_EXTENSION_URL = "https://gematik.de/fhir/epa-medication/StructureDefinition/medication-formulation-packaging-extension"
MEDICATION_TOTAL_QUANTITY_FORMULATION_EXTENSION_URL = "https://gematik.de/fhir/epa-medication/StructureDefinition/medication-total-quantity-formulation-extension"
MEDICATION_PACKAGING_SIZE_EXTENSION_URL = "https://gematik.de/fhir/epa-medication/StructureDefinition/medication-packaging-size-extension"
MEDICATION_INGREDIENT_DARREICHUNGSFORM_EXTENSION_URL = "https://gematik.de/fhir/epa-medication/StructureDefinition/medication-ingredient-darreichungsform-extension"
DATA_ABSENT_REASON_EXT = "http://hl7.org/fhir/StructureDefinition/data-absent-reason"


def _is_marked_absent(primitive_ext):
    return (
        primitive_ext is not None
        and primitive_ext.extension is not None
        and any(ext.url == DATA_ABSENT_REASON_EXT for ext in primitive_ext.extension)
    )


def quantity_hash_value(quantity):
    ####
    # Numeric value (value) as well as unit as coding (code and system).
    ###
    result = ""
    if quantity is None:
        return result
    if quantity.value is not None:
        result += str(quantity.value)
    if quantity.code is not None:
        result += str(quantity.code)
    if quantity.system is not None:
        result += str(quantity.system)
    return result


def generate_hash(medication):
    ####
    # Code = Medication.code
    ###
    code = ""
    if medication.code and medication.code.coding:
        code = "".join(str(c.code) + str(c.system) for c in medication.code.coding)

    ####
    # IF Medication.code.text
    # {
    #     CodeText = Trim(Medication.code.text)
    #     CodeText = ToLower(CodeText)
    # }
    ###
    code_text = (
        (medication.code.text or "").replace(" ", "").lower() if medication.code else ""
    )

    ####
    # Form = Medication.form
    ###
    form = ""
    if medication.form and medication.form.coding:
        form = "".join(str(f.code) + str(f.system) for f in medication.form.coding)

    ####
    # Manufacturer = Medication.manufacturer.display
    # IF present: Trim + ToLower
    ###
    manufacturer = ""
    if medication.manufacturer and medication.manufacturer.display:
        manufacturer = medication.manufacturer.display.replace(" ", "").lower()

    ####
    # Amount = Medication.amount (Ratio)
    #   numerator (value, code, system)
    #   denominator (value, code, system)
    #   MedicationTotalQuantityFormulationExtension on amount.numerator
    #   MedicationPackagingSizeExtension on amount.numerator
    ###
    amount = ""
    if medication.amount:
        amount += quantity_hash_value(medication.amount.numerator)
        amount += quantity_hash_value(medication.amount.denominator)
        numerator = medication.amount.numerator
        if numerator and numerator.extension:
            for ext in numerator.extension:
                if (
                    ext.url == MEDICATION_TOTAL_QUANTITY_FORMULATION_EXTENSION_URL
                    and ext.valueString
                ):
                    amount += ext.valueString.replace(" ", "").lower()
            for ext in numerator.extension:
                if (
                    ext.url == MEDICATION_PACKAGING_SIZE_EXTENSION_URL
                    and ext.valueString
                ):
                    amount += ext.valueString.replace(" ", "").lower()

    ####
    # Extensions
    ###
    extensions = []
    if medication.extension:
        for ext in medication.extension:
            if ext.url in (
                MEDICATION_MANUFACTURING_INSTRUCTIONS_EXTENSION_URL,
                MEDICATION_FORMULATION_PACKAGING_EXTENSION_URL,
            ):
                if ext.valueCoding:
                    ext_value = ext.valueCoding.system + ext.valueCoding.code
                elif ext.valueString:
                    ext_value = (ext.valueString or "").replace(" ", "").lower()
                elif ext.valueBoolean is not None:
                    ext_value = str(ext.valueBoolean).lower()
                else:
                    continue

                extensions.append(ext_value)

    extensions.sort()

    ####
    # Ingredient_N = Medication.ingredient[x].item[x]
    # Strength_N = Medication.ingredient[x].strength
    # Alphabetically sorted by Ingredient + Strength
    ###
    ingredients = []
    references = []
    if medication.ingredient:
        for ing in medication.ingredient:
            ingredient_code = ""
            ingredient_text = ""
            ingredient_strength = ""

            if ing.itemReference:
                if not _is_marked_absent(ing.itemReference):
                    references.append(ing.itemReference.reference)
                continue

            if ing.itemCodeableConcept and ing.itemCodeableConcept.coding:
                ingredient_code = "".join(
                    str(c.code) + str(c.system) for c in ing.itemCodeableConcept.coding
                )
                ingredient_text = (
                    (ing.itemCodeableConcept.text or "").replace(" ", "").lower()
                )

            if ing.strength and ing.strength.numerator:
                numerator = ing.strength.numerator
                if numerator.system is not None:
                    ingredient_strength += str(numerator.system)

                if numerator.code is not None:
                    ingredient_strength += str(numerator.code)

                ingredient_strength += str(numerator.value)
                if ing.strength.denominator:
                    denominator = ing.strength.denominator

                    if denominator.system is not None:
                        ingredient_strength += str(denominator.system)

                    if denominator.code is not None:
                        ingredient_strength += str(denominator.code)

                    ingredient_strength += str(denominator.value)

            ####
            # MedicationIngredientDarreichungsformExtension on ingredient
            # IF present: Trim + ToLower
            ###
            ingredient_darreichungsform = ""
            if ing.extension:
                for ext in ing.extension:
                    if (
                        ext.url == MEDICATION_INGREDIENT_DARREICHUNGSFORM_EXTENSION_URL
                        and ext.valueString
                    ):
                        ingredient_darreichungsform += (
                            ext.valueString.replace(" ", "").lower()
                        )

            ingredient_value = (
                ingredient_code
                + ingredient_text
                + ingredient_strength
                + ingredient_darreichungsform
            )
            ingredients.append(ingredient_value)

    # Sort the ingredients to ensure consistent order
    ingredients.sort()

    # Process the references to contained Medications
    sub_hashes = []
    for ref in references:
        for contained in medication.contained:
            if f"#{contained.id}" == ref:
                sub_hash = generate_hash(contained)
                sub_hashes.append(sub_hash)

    sub_hashes.sort()

    ###
    # EPAMedicationUniqueIdentifier = hash.sha256(
    #   Code, CodeText, Form, Manufacturer, Amount,
    #   Ingredient_1 + Strength_1, ..., Ingredient_N + Strength_N,
    #   Contained, Extensions)
    ###
    value_for_hash = (
        code
        + code_text
        + form
        + manufacturer
        + amount
        + "".join(ingredients)
        + "".join(sub_hashes)
        + "".join(extensions)
    )
    h = hashlib.sha256()
    h.update(str(value_for_hash).encode())
    return str(h.hexdigest()).upper()


def is_medicationuniqueidentifier_equal(medication, hash_value):
    if medication.identifier is None:
        return False

    for identifier in medication.identifier:
        if identifier.system == IDENTIFIER_SYSTEM:
            return hash_value == identifier.value
    return False


def main():
    print(
        "A tool for generating or validating the EPAMedicationUniqueIdentifier for the FHIR Profile EPAMedication."
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
        medication = Medication.parse_file(args.filename.name)
    except Exception as e:
        print(f"Error parsing the file: {e}")
        if not args.debug:
            sys.exit(os.EX_NOINPUT)
        else:
            return

    hash_value = generate_hash(medication)

    if args.validate:
        if is_medicationuniqueidentifier_equal(medication, hash_value):
            print("OK: The EPAMedicationUniqueIdentifier is correct.")
            if not args.debug:
                sys.exit(os.EX_OK)
            else:
                return
        else:
            print(
                f"ERROR: The EPAMedicationUniqueIdentifier is incorrect. The value should be {hash_value}."
            )
            if not args.debug:
                sys.exit(os.EX_DATAERR)
            else:
                return

    print(f"VALUE: {hash_value}")


if __name__ == "__main__":
    main()
