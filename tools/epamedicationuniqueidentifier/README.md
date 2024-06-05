# EPAMedicationUniqueIdentifier Tool

This project is a Python tool for generating or validating the `EPAMedicationUniqueIdentifier` for the FHIR Profile `EPAMedication`.

## Features

- Generate a unique identifier (hash) for an EPAMedication resource.
- Validate the unique identifier of an EPAMedication resource.

## Installation

Install the required dependencies:
   ```bash
   pip install -r requirements.txt
   ```

## Usage

This tool can be used from the command line.

### Generate the EPAMedicationUniqueIdentifier

To generate the `EPAMedicationUniqueIdentifier` for a given FHIR `Medication` resource file:

```bash
python ./src/main.py path/to/medication.json
```

### Validate the EPAMedicationUniqueIdentifier

To validate the `EPAMedicationUniqueIdentifier` for a given FHIR `Medication` resource file:

```bash
python ./src/main.py -v path/to/medication.json
```

## Example

To generate the identifier:
```bash
python ./src/main.py examples/Medication1.json
```

To validate the identifier:
```bash
python ./src/main.py -v examples/Medication1.json
```

## Code Overview

The script defines the following main functions:

- `generate_hash(medication)`: Generates a SHA-256 hash based on the `Medication` resource attributes.
- `is_medicationuniqueidentifier_equal(medication, hash_value)`: Validates if the generated hash matches the identifier in the `Medication` resource.

### Main Script Execution

The main script execution involves:
1. Reading and parsing the `Medication` resource file.
2. Generating the hash value.
3. Optionally validating the hash value against the identifier in the `Medication` resource.
