Profile: RxPrescriptionProcessIdentifier
Parent: Identifier
Id: rx-prescription-process-identifier
Description: "This transaction identifier is used to track medication prescription transactions between the E-Rezept-Fachdienst and the ePA. It is generated by the E-Rezept-Fachdienst as a UUID, ensuring a consistent and unique identification of each transaction. The identifier is composed of the E-Prescription ID and the authoredOn-date of the medication request, providing a robust mechanism for referencing and managing medication-related resources across systems. "
* insert Meta
* system 1..1 MS
* system = "https://gematik.de/fhir/epa-medication/sid/rx-prescription-process-identifier"
* value 1.. MS

Extension: RxPrescriptionProcessIdentifierExtension
Id: rx-prescription-process-identifier-extension
Description: "Extension for attaching the Identifier profile for transaction of medication resources betweeen E-Rezept-Fachdienst and ePA system to prescription related resources"
Context: Medication, MedicationDispense
* value[x] only RxPrescriptionProcessIdentifier