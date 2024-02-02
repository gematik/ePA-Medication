Profile: EPAMedicationRequest
Parent: MedicationRequest
Id: epa-medication-request
Title: "EPA MedicationRequest"
Description: "Defines the medication request resource for the Medication Service in the ePA system."
* insert Meta
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
* identifier[RxOriginatorProcessIdentifier] only RxOriginatorProcessIdentifier
* status from EPAMedicationRequestVS
* intent MS
* intent ^short = "filler-order"
* intent ^definition = "When data is synchronized with the E-Rezept-Fachdienst, the 'filler-order' code should be used here."
* subject 1..1 MS
  * identifier 1.. MS
  * identifier only IdentifierKvid10
* medication[x] only Reference
* medicationReference MS
* medicationReference only Reference(EPAMedication)
* requester MS
* requester only Reference(PractitionerRole)
* authoredOn 1.. MS
* authoredOn ^short = "Ausstellungsdatum"
* authoredOn ^definition = "Ausstellungsdatum der Verordnung"
* note ..1 MS
* note.text MS
* note.text ^short = "Abgabehinweis"
* note.text ^definition = "Über die Dosierung hinausgehende Abgabehinweise an die Apotheke"
* dosageInstruction ..1 MS
  * text MS
  * text ^short = "Dosieranweisung"
  * text ^definition = "Dosieranweisung einer Verordnung"
  * patientInstruction MS
  * patientInstruction ^short = "Gebrauchsanweisung einer Rezeptur"
  * patientInstruction ^definition = "Gebrauchsanweisung einer Rezeptur"
* dispenseRequest 1.. MS
  * quantity 1.. MS
    * value 1.. MS
    * value ^short = "Anzahl der verordneten Packungen"
    * value ^definition = "Anzahl der verordneten Packungen"
    * system 1.. MS
    * system = "http://unitsofmeasure.org"
    * code 1.. MS
    * code = #{Package}
* substitution MS
* substitution.allowed[x] only boolean
* substitution.allowedBoolean 1.. MS
