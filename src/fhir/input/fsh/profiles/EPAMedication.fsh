Profile: EPAMedication
Parent: Medication
Id: epa-medication
Title: "EPA Medication"
Description: "Defines the medication resource for the Medication Service in the ePA system."
* insert Meta
* insert ProfileMeta
* extension contains 
    RxPrescriptionProcessIdentifierExtension named rxPrescriptionProcessIdentifier 0..1 and
    MedicationIsVaccineExtension named isVaccine 0..1 and
    DrugCategoryExtension named drugCategory 0..1 and
    ExtensionNormgroesseDeBasis named normSizeCode 0..1 and
    MedicationFormulationPackagingExtension named packaging 0..1 and
    MedicationManufacturingInstructionsExtension named manufacturingInstructions 0..1
* extension[rxPrescriptionProcessIdentifier].value[x]
* extension[isVaccine]
  * value[x] MS
  * valueBoolean MS
  * valueBoolean ^sliceName = "valueBoolean"
* extension[drugCategory]
  * value[x] MS
  * valueCoding MS
  * valueCoding ^sliceName = "valueCoding"
    * system MS
    * code MS
* extension[normSizeCode] ^short = "Package size according to N-designation"
* extension[normSizeCode] ^definition = "Description of the therapy-appropriate package size (e.g., N1)"
  * value[x] 1.. MS
    * ^slicing.discriminator.type = #type
    * ^slicing.discriminator.path = "$this"
    * ^slicing.rules = #open
  * valueCode MS
* extension[packaging]
  * value[x] MS
  * valueString MS
  * valueString ^sliceName = "valueString"
* extension[manufacturingInstructions]
  * value[x] MS
  * valueString MS
  * valueString ^sliceName = "valueString"
* obeys epa-med-1
* identifier 0..
  * ^slicing.discriminator.type = #pattern
  * ^slicing.discriminator.path = "$this"
  * ^slicing.rules = #open
  * ^slicing.ordered = false
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
    * version MS
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
    * ^patternCoding.system = $sct
    * system 1..1 MS
    * code 1..1 MS
    * version MS
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
    * ^patternCoding.system = $sct
    * system 1..1 MS
    * code 1..1 MS
    * version MS
    * display MS
  * coding[kbvDarreichungsform] from $vs-kbv-medication-darreichungsform (required)
    * ^patternCoding.system = $cs-kbv-medication-darreichungsform
    * system 1..1 MS
    * code 1..1 MS
    * display MS
* amount 0..1 MS
  * numerator 0..1 MS
    * extension
      * ^slicing.discriminator.type = #value
      * ^slicing.discriminator.path = "url"
      * ^slicing.rules = #open  
    * extension contains
        MedicationPackagingSizeExtension named packagingSize 0..1 and
        MedicationTotalQuantityFormulationExtension named totalQuantity 0..1
    * extension[packagingSize]
      * value[x] MS
      * valueString MS
      * valueString ^sliceName = "valueString"
    * extension[totalQuantity]
      * value[x] MS
      * valueString MS
      * valueString ^sliceName = "valueString"
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
  * extension
    * ^slicing.discriminator.type = #value
    * ^slicing.discriminator.path = "url"
    * ^slicing.rules = #open  
  * extension contains
      MedicationIngredientDarreichungsformExtension named darreichungsform 0..1
  * extension[darreichungsform]
    * value[x] MS
    * valueString MS
    * valueString ^sliceName = "valueString"
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
      * ^patternCoding.system = $sct
      * system 1..1 MS
      * code 1..1 MS
      * version MS
      * display MS
    * text MS
  * itemReference
    * ^short = "Component (reference to another medication)"
    * reference 0..1
  * isActive
    * ^short = "Is it an active ingredient?"
  * strength MS
    * ^short = "Strength"
    * extension
      * ^slicing.discriminator.type = #value
      * ^slicing.discriminator.path = "url"
      * ^slicing.rules = #open  
    * extension contains
        MedicationIngredientAmountExtensions named amountText 0..1
    * extension[amountText]
      * value[x] MS
      * valueString MS
      * valueString ^sliceName = "valueString"
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
* batch
  * ^short = "Batch Information"
  * lotNumber MS
    * ^short = "Batch Number"
