Profile: EPAMedicationDispense
Parent: MedicationDispense
Id: epa-medication-dispense
Title: "EPA MedicationDispense"
Description: "Defines the medication dispense resource for the Medication Service in the ePA system."
* insert Meta
* extension contains RxPrescriptionProcessIdentifierExtension named RxPrescriptionProcessIdentifier 1..1 MS
* extension[RxPrescriptionProcessIdentifierExtension].value[x] MS
* status from EPAMedicationDispenseVS
* medication[x] 1.. MS
* medication[x] only Reference(EPAMedication)
* medicationReference
  * reference 1..1 MS
* subject 1..1 MS
  * identifier 1.. MS
  * identifier only IdentifierKvid10
* performer 1..1 MS
  * actor only Reference(OrganizationDirectory)
* authorizingPrescription 1.. MS
  * reference 1.. MS
* authorizingPrescription only Reference(EPAMedicationRequest)
* whenHandedOver 1.. MS
* dosageInstruction MS
* substitution MS
