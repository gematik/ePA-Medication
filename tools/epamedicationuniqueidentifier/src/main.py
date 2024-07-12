#!/usr/bin/env python
# -*- coding: utf-8 -*-
import hashlib
import os
import sys
import argparse
from fhir.resources.R4B.medication import Medication

IDENTIFIER_SYSTEM = 'https://gematik.de/fhir/epa-medication/sid/epa-medication-unique-identifier'
TYPE_EXTENSION_URL = 'https://gematik.de/fhir/epa-medication/StructureDefinition/epa-medication-type-extension'
MEDICATION_MANUFACTURING_INSTRUCTIONS_EXTENSION_URL = 'https://gematik.de/fhir/epa-medication/StructureDefinition/medication-manufacturing-instructions-extension'

def generate_subhash(value):
    h = hashlib.sha256()
    h.update(str(value).encode()) 
    return str(h.hexdigest()).upper()

def generate_hash(medication):
    ####
    # Code = Medication.code
    ###
    code = ''
    if medication.code and medication.code.coding:
        code = ''.join(str(c.code) + str(c.system) for c in medication.code.coding)

    ####
    # IF Medication.code.text
    # {
    #     CodeText = Trim(Medication.code.text)
    #     CodeText = ToLower(CodeText)
    # }
    ###
    code_text = (medication.code.text or '').replace(" ", "").lower() if medication.code else ''

    ####
    # Form = Medication.form
    ###
    form = ''
    if medication.form and medication.form.coding:
        form = ''.join(str(f.code) + str(f.system) for f in medication.form.coding)

    ####
    # Extensions
    ###
    extensions = []
    if medication.extension:
        for ext in medication.extension:
            if ext.url == MEDICATION_MANUFACTURING_INSTRUCTIONS_EXTENSION_URL:
                if ext.valueCoding:
                    ext_value = ext.valueCoding.system + ext.valueCoding.code
                elif ext.valueString:
                    ext_value = (ext.valueString or '').replace(" ", "").lower() 
                elif ext.valueBoolean is not None:
                    ext_value = str(ext.valueBoolean).lower()
                else:
                    continue

                subhash = generate_subhash(ext_value)
                extensions.append(subhash)

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
            ingredient_code = ''
            ingredient_text = ''
            ingredient_strength = ''

            if ing.itemReference:
                references.append(ing.itemReference.reference)
                continue
            
            if ing.itemCodeableConcept and ing.itemCodeableConcept.coding:
                ingredient_code = ''.join(str(c.code) + str(c.system) for c in ing.itemCodeableConcept.coding)
                ingredient_text = (ing.itemCodeableConcept.text or '').replace(" ", "").lower()

            if ing.strength and ing.strength.numerator:
                numerator = ing.strength.numerator
                ingredient_strength += f"{numerator.system}{numerator.code}{numerator.value}"
                if ing.strength.denominator:
                    denominator = ing.strength.denominator
                    ingredient_strength += f"{denominator.system}{denominator.code}{denominator.value}"

            ingredient_value = ingredient_code + ingredient_text + ingredient_strength
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
    # EPAMedicationUniqueIdentifier = hash.sha256(Code, CodeText, Form, Ingredient_1 + Strength_1, Ingredient_2 + Strength_2, ..., Ingredient_N + Strength_N, Extensions)
    ###
    value_for_hash = code + code_text + form + ''.join(ingredients) + ''.join(sub_hashes) + ''.join(extensions)
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
    print('A tool for generating or validating the EPAMedicationUniqueIdentifier for the FHIR Profile EPAMedication.')
    print('-'*100)

    parser = argparse.ArgumentParser()
    parser.add_argument('-v', '--validate', dest='validate', action='store_true')
    parser.add_argument('filename', type=argparse.FileType('r'))
    parser.add_argument('--debug', dest='debug', action='store_true', help='Enable debugging mode to prevent system exit on error')
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
            print('OK: The EPAMedicationUniqueIdentifier is correct.')
            if not args.debug:
                sys.exit(os.EX_OK)
            else:
                return
        else:
            print(f'ERROR: The EPAMedicationUniqueIdentifier is incorrect. The value should be {hash_value}.')
            if not args.debug:
                sys.exit(os.EX_DATAERR)
            else:
                return

    print(f'VALUE: {hash_value}')

if __name__ == "__main__":
    main()