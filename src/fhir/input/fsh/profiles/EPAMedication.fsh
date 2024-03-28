Profile: EPAMedication
Parent: Medication
Id: epa-medication
Title: "EPA Medication"
Description: "Defines the medication resource for the Medication Service in the ePA system."
* insert Meta
* extension contains 
    RxPrescriptionProcessIdentifierExtension named rxPrescriptionProcessIdentifier 0..1
* extension[rxPrescriptionProcessIdentifier].value[x]
* obeys epa-med-1
* identifier ^slicing.discriminator.type = #pattern
* identifier ^slicing.discriminator.path = "$this"
* identifier ^slicing.rules = #open
* identifier ^slicing.ordered = false
* identifier 0..
* identifier contains
    EPAMedicationUniqueIdentifier 0..1 and
    RxOriginatorProcessIdentifier 0..1
* identifier[EPAMedicationUniqueIdentifier] only EPAMedicationUniqueIdentifier
* identifier[EPAMedicationUniqueIdentifier] ^patternIdentifier.system = "https://gematik.de/fhir/epa-medication/sid/epa-medication-unique-identifier"
* identifier[RxOriginatorProcessIdentifier] only RxOriginatorProcessIdentifier
* identifier[RxOriginatorProcessIdentifier] ^patternIdentifier.system = "https://gematik.de/fhir/epa-medication/sid/rx-originator-process-identifier"
* code 0..1 MS
  * ^short = "Medication in coded form or as free text if necessary"
  * coding MS
    * ^slicing.discriminator.type = #pattern
    * ^slicing.discriminator.path = "$this"
    * ^slicing.rules = #open
  * coding contains
      pzn 0..1 MS and
      atc-de 0.. MS and
      ask 0.. MS and
      wg14 0.. and
      snomed 0..
  * coding[pzn]
    * ^patternCoding.system = $cs-pzn
    * system 1..1 MS
    * code 1..1 MS
    * display MS
  * coding[atc-de]
    * ^patternCoding.system = $cs-atc-de
    * system 1..1 MS
    * code 1..1 MS
    * display MS
  * coding[ask]
    * ^patternCoding.system = $cs-ask
    * system 1..1 MS
    * code 1..1 MS
    * display MS
  * coding[wg14]
    * ^patternCoding.system = $cs-wg14
    * system 1..1 MS
    * code 1..1 MS
    * display MS
  * coding[snomed]
    * ^patternCoding.system = $snomed-sct
    * system 1..1 MS
    * code 1..1 MS
    * display MS
  * text MS
* status 0..1 MS
  * ^short = "Status of Medication Information"
* manufacturer MS
  * ^short = "Manufacturer of the Medication"
  * ^comment = "Here, the actual manufacturer of the medication can be named, primarily in the case of active ingredient mixtures (compounding prescriptions), such as the hospital pharmacy. It is important to note that the licensing organization, as mentioned in the PZN (Pharmaceutical Central Number) data, is not considered the manufacturer."
  * display 1..1 MS
* form MS
  * ^short = "Form of Dispensing"
* form
  * coding MS
    * ^slicing.discriminator.type = #pattern
    * ^slicing.discriminator.path = "$this"
    * ^slicing.rules = #open
  * coding contains
      edqm 0.. MS and
      snomed 0.. and
      kbvDarreichungsform 0.. MS
  * coding[edqm] from $vs-edqm-doseform (preferred)
    * ^patternCoding.system = $cs-edqm
    * system 1..1 MS
    * code 1..1 MS
    * display MS
  * coding[snomed]
    * ^patternCoding.system = $snomed-sct
    * system 1..1 MS
    * code 1..1 MS
    * display MS
  * coding[kbvDarreichungsform] from $vs-kbv-medication-darreichungsform (required)
    * ^patternCoding.system = $cs-kbv-medication-darreichungsform
    * system 1..1 MS
    * code 1..1 MS
    * display MS
* amount 0..1 MS
  * numerator 0..1 MS
  * numerator from $hl7-vs-ucum-units (preferred)
    * value 0..1 MS
    * unit MS
    * system 0..1 MS
    * code 0..1 MS
  * denominator MS
  * denominator from $hl7-vs-ucum-units (preferred)
    * value 0..1 MS
    * unit MS
    * system 0..1 MS
    * code 0..1 MS
* ingredient MS
  * ^short = "Information on Components (Rezeptur)"
  * item[x] 1..1 MS
  * itemCodeableConcept MS
    * ^short = "Component in coded form or, if necessary, as free text"
    * coding 0.. MS
      * ^slicing.discriminator.type = #pattern
      * ^slicing.discriminator.path = "$this"
      * ^slicing.rules = #open
    * coding contains
        ask 0.. MS and
        atc-de 0.. MS and
        pzn 0.. MS and
        wg14 0.. and
        snomed 0..
    * coding[ask]
      * ^patternCoding.system = $cs-ask
      * system 1..1 MS
      * code 1..1 MS
      * display MS
    * coding[atc-de]
      * ^patternCoding.system = $cs-atc-de
      * system 1..1 MS
      * code 1..1 MS
      * display MS
    * coding[pzn]
      * ^patternCoding.system = $cs-pzn
      * system 1..1 MS
      * code 1..1 MS
      * display MS
    * coding[wg14]
      * ^patternCoding.system = $cs-wg14
      * system 1..1 MS
      * code 1..1 MS
      * display MS
    * coding[snomed]
      * ^patternCoding.system = $snomed-sct
      * system 1..1 MS
      * code 1..1 MS
      * display MS
    * text MS
  * itemReference
    * ^short = "Component (reference to another medication)"
    * reference 0..1
  * isActive
    * ^short = "Is it an active ingredient?"
  * strength MS
    * ^short = "Strength"
    * numerator 1..1 MS
    * numerator from $hl7-vs-ucum-units (preferred)
      * value 1..1 MS
      * unit MS
      * system 1..1 MS
      * code 1..1 MS
    * denominator MS
    * denominator from $hl7-vs-ucum-units (preferred)
      * value 1..1 MS
      * unit MS
      * system 1..1 MS
      * code 1..1 MS
* batch MS
  * ^short = "Batch Information"
  * lotNumber MS
    * ^short = "Batch Number"

Invariant: epa-med-1
Description: "Medication code, name, or ingredients must be specified"
Severity: #error
Expression: "code.exists() or ingredient.exists()"
