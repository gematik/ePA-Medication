#!/usr/bin/env python
# -*- coding: utf-8 -*-
import hashlib
import os
import sys
import argparse
from fhir.resources.R4B.medication import Medication

IDENTIFIER_SYSTEM = 'https://gematik.de/fhir/epa-medication/sid/epa-medication-unique-identifier'

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
    # Ingredient_N = Medication.ingredient[x].item[x]
    # Strength_N = Medication.ingredient[x].strength
    # Alphabetically sorted by Ingredient + Strength
    ###
    ingredients = []
    if medication.ingredient:
        for ing in medication.ingredient:
            ingredient_code = ''
            ingredient_text = ''
            ingredient_strength = ''
            
            if ing.itemCodeableConcept and ing.itemCodeableConcept.coding:
                ingredient_code = ''.join(str(c.code) + str(c.system) for c in ing.itemCodeableConcept.coding)
                ingredient_text = (ing.itemCodeableConcept.text or '').replace(" ", "").lower()

            if ing.strength:
                numerator = ing.strength.numerator
                ingredient_strength += f"{numerator.system}{numerator.code}{numerator.value}"
                if ing.strength.denominator:
                    denominator = ing.strength.denominator
                    ingredient_strength += f"{denominator.system}{denominator.code}{denominator.value}"

            ingredients.append(ingredient_code + ingredient_text + ingredient_strength)
        ingredients.sort()

    ###
    # EPAMedicationUniqueIdentifier = hash.sha256(Code, CodeText, Form, Ingredient_1 + Strength_1, Ingredient_2 + Strength_2, ..., Ingredient_N + Strength_N)
    ###
    value_for_hash = code + code_text + form + ''.join(ingredients)
    h = hashlib.sha256()
    h.update(str(value_for_hash).encode()) 
    return str(h.hexdigest()).upper()


def is_medicationuniqueidentifier_equal(medication, hash_value):
    for identifier in medication.identifier:
        if identifier.system == IDENTIFIER_SYSTEM:
            return hash_value == identifier.value
    return False


def main():
    print('A tool for generating or validating the EPAMedicationUniqueIdentifier for the FHIR Profile EPAMedication.')
    print('-'*100)

    parser = argparse.ArgumentParser()
    parser.add_argument('filename', type=argparse.FileType('r'))
    parser.add_argument('-v', '--validate', dest='validate', action='store_true')
    args = parser.parse_args()

    try:
        medication = Medication.parse_file(args.filename.name)
    except Exception as e:
        print(f"Error parsing the file: {e}")
        sys.exit(os.EX_NOINPUT)

    hash_value = generate_hash(medication)

    if args.validate:
        if is_medicationuniqueidentifier_equal(medication, hash_value):
            print('OK: The EPAMedicationUniqueIdentifier is correct.')
            sys.exit(os.EX_OK)
        else:
            print(f'ERROR: The EPAMedicationUniqueIdentifier is incorrect. The value should be {hash_value}.')
            sys.exit(os.EX_DATAERR)

    print(f'VALUE: {hash_value}')


if __name__ == "__main__":
    main()