# EPAMedicationDispenseUniqueIdentifier Tool

This project is a Python tool for generating or validating the `EPAMedicationDispenseUniqueIdentifier` for the FHIR Profile `EPAMedicationDispense`.

## Features

- Generate a unique identifier (hash) for an EPAMedicationDispense resource.
- Validate the unique identifier of an EPAMedicationDispense resource.

## Installation

Install the required dependencies:
   ```bash
   pip install -r requirements.txt
   ```

## Usage

This tool can be used from the command line.

### Generate the EPAMedicationDispenseUniqueIdentifier

To generate the `EPAMedicationDispenseUniqueIdentifier` for a given FHIR `MedicationDispense` resource file:

```bash
python ./src/main.py path/to/medicationdispense.json
```

### Validate the EPAMedicationDispenseUniqueIdentifier

To validate the `EPAMedicationDispenseUniqueIdentifier` for a given FHIR `MedicationDispense` resource file:

```bash
python ./src/main.py -v path/to/medicationdispense.json
```

## Example

To generate the identifier:
```bash
python ./src/main.py examples/MedicationDispense1.json
```

To validate the identifier:
```bash
python ./src/main.py -v examples/MedicationDispense1.json
```

## Code Overview

The script defines the following main functions:

- `generate_hash(dispense, base_dir)`: Generates a SHA-256 hash based on the `MedicationDispense` resource attributes.
- `is_dispenseuniqueidentifier_equal(dispense, hash_value)`: Validates if the generated hash matches the identifier in the `MedicationDispense` resource.

The `EPAMedicationUniqueIdentifier` of a referenced `Medication` is computed with the
reference implementation of the sibling tool located in
`../epamedicationuniqueidentifier`.

### Main Script Execution

The main script execution involves:
1. Reading and parsing the `MedicationDispense` resource file.
2. Generating the hash value.
3. Optionally validating the hash value against the identifier in the `MedicationDispense` resource.
