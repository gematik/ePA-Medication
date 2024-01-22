# Implementation Guide 

The digitally supported medication process (German "***digital gestützter Medikationsprozess***" - dgMP) describes the initial implementation of the following use cases that generate an editable ***electronic Medication List*** (eML). Please consider the underlying FHIR profile specification on the [Simplifier](https://simplifier.net/epa-medication) platform.

- Provide Prescription eRP
- Cancel Prescription ePR
- Provide Dispensation eRP
- Cancel Dispensation eRP

These use cases are implemented by means of [FHIR Operations](https://hl7.org/fhir/R4/operationslist.html). The following business logic MUST be implemented when executed each of these operations.


The following conditions related to the FHIR specification have been set for the Medication Service.
- The Patient FHIR resource is transmitted via the KVNR identifier.
- In the Medication Service, the removal of prescription data or dispensing information is executed by updating their status to "cancelled" or "declined".
- For the FHIR operations, it is necessary that referencing of resources within the parameters is possible.

## Use Cases

### Provide Prescription

Firstly, this operation validates all incoming parameters. Secondly, it iterates the given prescriptions in the parameter *RxPrescription* and generates the internal *RxPrescriptionProcessIdentifier* (cf. [Uniqueness of FHIR Medication Resources](#uniqueness-of-fhir-medication-resources)). If there is already a *MedicationRequest* associated with the *RxPrescriptionProcessIdentifier* the operation aborts and returns an error. Otherwise, necessary FHIR resources are created or updated in order to fill the eML.

<table>
    <tr>
        <td>OperationDefinition</td>
        <td>https://gematik.de/fhir/epa-medication/OperationDefinition/provide-prescription-erp-OP|1.0.0</td>
    </tr>
    <tr>
        <td>Input-Parameter </td>
        <td>https://gematik.de/fhir/epa-medication/StructureDefinition/epa-op-provide-prescription-erp-input-parameters|1.0.0</td>
    </tr>
    <tr>
        <td>Output-Paramter</td>
        <td>https://gematik.de/fhir/epa-medication/StructureDefinition/epa-op-rx-prescription-erp-output-parameters|1.0.0</td>
    </tr>
</table>

![Provide Prescription](/images/plantuml/operation.provide-prescription-erp.png)


### Cancel Prescription

For each given prescriptions in the parameter *RxPrescription* an internal *RxPrescriptionProcessIdentifier* is generated. If there is a *MedicationRequest* associated with the *RxPrescriptionProcessIdentifier* and its status is "active" (i.e. already dispensed), the operation aborts and returns an error. Otherwise, the associated resources *MedicationRequest* and *MedicationDispense* are cancelled. The linked *Medication* resources are set to the status "inactive".

<table>
    <tr>
        <td>OperationDefinition</td>
        <td>https://gematik.de/fhir/epa-medication/OperationDefinition/cancel-prescription-erp-OP|1.0.0</td>
    </tr>
    <tr>
        <td>Input-Parameter </td>
        <td>https://gematik.de/fhir/epa-medication/StructureDefinition/epa-op-cancel-prescription-erp-input-parameters|1.0.0</td>
    </tr>
    <tr>
        <td>Output-Paramter</td>
        <td>https://gematik.de/fhir/epa-medication/StructureDefinition/epa-op-rx-prescription-erp-output-parameters|1.0.0</td>
    </tr>
</table>

![Cancel Dispensation](/images/plantuml/operation.cancel-prescription-erp.png)


### Provide Dispensation

All incoming FHIR resources are validated. For each given dispensation in the parameter *RxDispensation* an internal *RxPrescriptionProcessIdentifier* is generated. If the is a *MedicationRequest* resource associated with the *RxPrescriptionProcessIdentifier* available in the Medication Service store, the operation aborts and returns an error. Otherwise, FHIR resources are created or updated.

<table>
    <tr>
        <td>OperationDefinition</td>
        <td>https://gematik.de/fhir/epa-medication/OperationDefinition/provide-dispensation-erp-OP|1.0.0</td>
    </tr>
    <tr>
        <td>Input-Parameter </td>
        <td>https://gematik.de/fhir/epa-medication/StructureDefinition/epa-op-provide-dispensation-erp-input-parameters|1.0.0</td>
    </tr>
    <tr>
        <td>Output-Paramter</td>
        <td>https://gematik.de/fhir/epa-medication/StructureDefinition/epa-op-rx-dispensation-erp-output-parameters|1.0.0</td>
    </tr>
</table>

![Provide Dispensation](/images/plantuml/operation.provide-dispensation-erp.png)


### Cancel Dispensation

For each given dispensation in the parameter *RxDispensation* an internal *RxPrescriptionProcessIdentifier* is generated. If there is no *MedicationDispense* associated with the *RxPrescriptionProcessIdentifier*, the operation aborts and returns an error. Otherwise, the associated *MedicationDispense* resource is cancelled, the linked *Medication* resource is set "active", and the linked *MedicationRequest* resource is set to the status "active".


<table>
    <tr>
        <td>OperationDefinition</td>
        <td>https://gematik.de/fhir/epa-medication/OperationDefinition/cancel-dispensation-erp-OP|1.0.0</td>
    </tr>
    <tr>
        <td>Input-Parameter </td>
        <td>https://gematik.de/fhir/epa-medication/StructureDefinition/epa-op-cancel-dispensation-erp-input-parameters|1.0.0</td>
    </tr>
    <tr>
        <td>Output-Paramter</td>
        <td>https://gematik.de/fhir/epa-medication/StructureDefinition/epa-op-rx-dispensation-erp-output-parameters|1.0.0</td>
    </tr>
</table>

![Cancel Dispensation](/images/plantuml/operation.cancel-dispensation-erp.png)


## Deduplication of FHIR Resources

Central deduplication of resources in the Medication Service with identical content is crucial to ensure both the usefulness and quality of the data in the Medication Service. The approach below avoids client systems developing their own, possibly different, aggregation algorithms in a decentralized manner, which could lead to inconsistencies in the representation of the eML. In addition, central deduplication improves the linkability and integration of the existing FHIR resources, which not only increases clarity and user-friendliness, but is also in line with the principle of data economy.

For clear identification, the following identifiers are generated while receiving a prescription or its associated dispensation and then added to the necessary FHIR resources:

- *RxPrescriptionProcessIdentifier*: This identifier MUST be generated within the Medication Service and MUST follow the following pattern (PrescriptionID + "_" + authoredOn[YYYYMMDD]). This identifier is associated with the FHIR resources *MedicationRequest*, *MedicationDispense* as well as *Medication*.

_Example Identifier:_
>
    {
        "system": "https://gematik.de/fhir/epa-medication/sid/rx-prescription-process-identifier",
        "value": "160.153.303.257.459_20240117"
    }


_Example Extension:_
>
    {
        "valueIdentifier": {
            "system": "https://gematik.de/fhir/epa-medication/sid/rx-prescription-process-identifier",
            "value": "160.153.303.257.459_20240117"
        },
        "url": "https://gematik.de/fhir/epa-medication/StructureDefinition/rx-prescription-process-identifier-extension|1.0.0"
    }


- *EPAMedicationUniqueIdentifier*: This identifier MUST be generated within the Medication Service and ensures the uniqueness on the basis of hash values via Medication.code, Medication.ingredientand Medication.form in compoundings or free texts. The elements "id", "identifier", "meta", "amount", "batch", "status" and "extension" are excluded from hash value creation.

_Example:_
>
    {
        "system": "https://gematik.de/fhir/epa-medication/sid/epa-medication-unique-identifier",
        "value": "8F6E41946E798D9C89384A0D2C9C7D9E4F6F0A2DE9EF62B7A4A26A329400735F"
    }


- *RxOriginatorProcessIdentifier*: The RxOriginatorProcessIdentifier generated in the Medication Service Backend links each PrescriptionID with the original ResourceID of the creating system, ensuring precise tracking and coordination of medication data. The creation follows the schema ResourceId + "_" + PrescriptionID.

_Example:_
>
    {
        "system": "https://gematik.de/fhir/epa-medication/sid/rx-originator-process-identifier",
        "value": "6ae6a7ca-c9b5-46bf-9411-2ba49d96f988_160.153.303.257.459"
    }


### Uniqueness of FHIR Medication Resources

The following usage specifications for the FHIR medication resources processed whithin the Medication Service for internal system comparisons in the business logic are defined:

>
    Code = Medication.code
    CodeText = ""
    IF Medication.code.text
    {
        CodeText = Trim(Medication.code.text)
        CodeText = ToLower(CodeText)
    }
    Form = Medication.form
    Ingredient_N = Medication.ingredient[x].item[x]
    Strength_N = Medication.ingredient[x].strength
    Alphabetically sorted by Ingredient + Strength
    EPAMedicationUniqueIdentifier = hash<Code, CodeText, Form, Ingredient_1 + Strength_1, Ingredient_2 + Strength_2, ..., Ingredient_N + Strength_N>


### Other FHIR Resources

* *MedicationRequest*/*MedicationDispense*: Using *rxPrescriptionProcessIdentifier*, these resources can be clearly identified during update operations.
* *Practitioner*/*Organization*: These resources are uniquely identified by means of a Telematik-ID. The Medication Service uses the VZD-FHIR-Directory profiles for this purpose.  
    * OrganizationDirectory: https://gematik.de/fhir/directory/StructureDefinition/OrganizationDirectory|0.10.2
    * PractitionerDirectory: https://gematik.de/fhir/directory/StructureDefinition/PractitionerDirectory|0.10.2
* *PractitionerRole*: This resource conforms to [PractitionerRole](https://hl7.org/fhir/R4/practitionerrole.html). It may be created and provided ad hoc when the operation is being executed.
* *Patient*: This is a logical FHIR reference via a KVNR (German "Krankenversicherungsnummer").


#### Information Elements for the Medication Service Based on FHIR

![Medication FHIR Model](/images/plantuml/medication.fhir.model.png)