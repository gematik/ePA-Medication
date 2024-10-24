Profile: EPAMedicationRequest
Parent: MedicationRequest
Id: epa-medication-request
Title: "EPA MedicationRequest"
Description: "Defines the medication request resource for the Medication Service in the ePA system."
* insert Meta
* insert ProfileMeta
* identifier ^slicing.discriminator.type = #pattern
* identifier ^slicing.discriminator.path = "$this"
* identifier ^slicing.rules = #open
* identifier ^slicing.description = "ePrescription identifier and overall transaction identifier"
* identifier ^slicing.ordered = false
* identifier 0..
* identifier contains
    RxPrescriptionProcessIdentifier 0..1 and
    RxOriginatorProcessIdentifier 0..1
* identifier[RxPrescriptionProcessIdentifier] only RxPrescriptionProcessIdentifier
* identifier[RxPrescriptionProcessIdentifier] ^patternIdentifier.system = "https://gematik.de/fhir/epa-medication/sid/rx-prescription-process-identifier"
* identifier[RxOriginatorProcessIdentifier] only RxOriginatorProcessIdentifier
* identifier[RxOriginatorProcessIdentifier] ^patternIdentifier.system = "https://gematik.de/fhir/epa-medication/sid/rx-originator-process-identifier"
* extension 0..
  * ^slicing.discriminator.type = #value
  * ^slicing.discriminator.path = "url"
  * ^slicing.rules = #open
* extension contains
    MultiplePrescriptionExtension named multiplePrescription 0..1 MS and
    IndicatorBVGExtension named isBvg 0..1 MS

* extension[isBvg].value[x] MS
* extension[isBvg].valueBoolean MS
* extension[isBvg].valueBoolean ^sliceName = "valueBoolean"

* extension[multiplePrescription].extension[indicator].value[x] only boolean
* extension[multiplePrescription].extension[indicator].valueBoolean MS

* extension[multiplePrescription].extension[counter].value[x] only Ratio
* extension[multiplePrescription].extension[counter].valueRatio MS
* extension[multiplePrescription].extension[counter].valueRatio.numerator MS
* extension[multiplePrescription].extension[counter].valueRatio.numerator.value MS
* extension[multiplePrescription].extension[counter].valueRatio.denominator MS
* extension[multiplePrescription].extension[counter].valueRatio.denominator.value MS

* extension[multiplePrescription].extension[period].value[x] only Period
* extension[multiplePrescription].extension[period].valuePeriod MS
* extension[multiplePrescription].extension[period].valuePeriod.start MS
* extension[multiplePrescription].extension[period].valuePeriod.end MS

* extension[multiplePrescription].extension[id].value[x] only Identifier
* extension[multiplePrescription].extension[id].valueIdentifier MS
* extension[multiplePrescription].extension[id].valueIdentifier.system MS
* extension[multiplePrescription].extension[id].valueIdentifier.value MS

* status from EPAMedicationRequestVS
* intent MS
* intent ^short = "filler-order"
* intent ^definition = "When data is synchronized with the E-Rezept-Fachdienst, the 'filler-order' code should be used here."
* insert Subject
* medication[x] only Reference
* medicationReference MS
* medicationReference only Reference(Medication)
* requester MS
* requester only Reference(PractitionerRole)
* authoredOn 1.. MS
* authoredOn ^short = "Issue Date"
* authoredOn ^definition = "Issue Date of the Prescription"
* note ..1 MS
* note.text MS
* note.text ^short = "Dispensing Note"
* note.text ^definition = "Instructions to the pharmacy that go beyond the dosage information"
* dosageInstruction ..1 MS
  * text MS
  * text ^short = "Dosage Instructions"
  * text ^definition = "Dosage Instructions of a Prescription"
  * patientInstruction MS
  * patientInstruction ^short = "Instructions for Use"
  * patientInstruction ^definition = "Instructions for Use"
* dispenseRequest 1.. MS
  * quantity 1.. MS
    * value 1.. MS
    * value ^short = "Number of Prescribed Packages"
    * value ^definition = "Number of Prescribed Packages"
    * system 1.. MS
    * system = "http://unitsofmeasure.org"
    * code 1.. MS
    * code = #{Package}
* substitution MS
* substitution.allowed[x] only boolean
* substitution.allowedBoolean 1.. MS
