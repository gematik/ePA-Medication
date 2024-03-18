Profile: EPAMedicationDispense
Parent: MedicationDispense
Id: epa-medication-dispense
Title: "EPA MedicationDispense"
Description: "Defines the medication dispense resource for the Medication Service in the ePA system."
* insert Meta
* extension contains RxPrescriptionProcessIdentifierExtension named rxPrescriptionProcessIdentifier 0..1
* extension[rxPrescriptionProcessIdentifier].value[x]
* identifier ^slicing.discriminator.type = #pattern
* identifier ^slicing.discriminator.path = "$this"
* identifier ^slicing.rules = #open
* identifier ^slicing.ordered = false
* identifier 0..
* identifier contains
    RxOriginatorProcessIdentifier 0..1
* identifier[RxOriginatorProcessIdentifier] only RxOriginatorProcessIdentifier
* identifier[RxOriginatorProcessIdentifier] ^patternIdentifier.system = "https://gematik.de/fhir/epa-medication/sid/rx-originator-process-identifier"
* status from EPAMedicationDispenseVS
* medication[x] only Reference
  * extension contains $data-absent-reason named dataAbsentReason 0..1 MS
  * extension[dataAbsentReason].valueCode = #unsupported
* medicationReference MS
* medicationReference only Reference(Medication)
* subject 1..1 MS
  * identifier MS
  * identifier only IdentifierKvid10
* performer 1..1 MS
  * actor only Reference(Organization)
* authorizingPrescription 0..
  * reference 1.. MS
* authorizingPrescription only Reference(MedicationRequest)
* whenHandedOver 1.. MS
* dosageInstruction MS
* substitution MS
