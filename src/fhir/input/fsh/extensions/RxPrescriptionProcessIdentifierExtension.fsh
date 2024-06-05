Extension: RxPrescriptionProcessIdentifierExtension
Id: rx-prescription-process-identifier-extension
Description: "This extension is used to track medication prescription transactions between the E-Rezept-Fachdienst and the ePA. The RxPrescriptionProcessIdentifier is generated by the ePA Medication Service and consists of the PrescriptionId and the authoredOn date of the operation parameters request. It ensures consistent referencing and management of medication-related resources across different systems."
Context: Medication, MedicationDispense
* insert Meta
* value[x] only RxPrescriptionProcessIdentifier