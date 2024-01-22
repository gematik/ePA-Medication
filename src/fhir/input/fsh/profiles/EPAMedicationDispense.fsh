Profile: EPAMedicationDispense
Parent: MedicationDispense
Id: epa-medication-dispense
Title: "EPA MedicationDispense"
Description: "Defines the medication dispense resource for the Medication Service in the ePA system."
* insert Meta
* extension contains RxPrescriptionProcessIdentifierExtension named RxPrescriptionProcessIdentifier 0..1
* extension[RxPrescriptionProcessIdentifierExtension].value[x]
* identifier ^slicing.discriminator.type = #pattern
* identifier ^slicing.discriminator.path = "$this"
* identifier ^slicing.rules = #open
* identifier ^slicing.ordered = false
* identifier 0..
* identifier contains
    RxOriginatorProcessIdentifier 0..1
* identifier[RxOriginatorProcessIdentifier] only RxOriginatorProcessIdentifier
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
* authorizingPrescription 0..
  * reference 1.. MS
* authorizingPrescription only Reference(EPAMedicationRequest)
* whenHandedOver 1.. MS
* dosageInstruction MS
* substitution MS
