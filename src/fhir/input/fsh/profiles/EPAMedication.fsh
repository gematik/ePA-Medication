Profile: EPAMedication
Parent: Medication
Id: epa-medication
Title: "EPA Medication"
Description: "Defines the medication resource for the Medication Service in the ePA system."
* insert Meta
* extension contains RxPrescriptionProcessIdentifierExtension named RxPrescriptionProcessIdentifier 0..1
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
* identifier[RxOriginatorProcessIdentifier] only RxOriginatorProcessIdentifier
* code MS
  * ^short = "Medication in coded form or as free text if necessary"
  * coding MS
    * ^slicing.discriminator.type = #pattern
    * ^slicing.discriminator.path = "$this"
    * ^slicing.rules = #open
  * coding contains
      PZN 0..1 MS and
      ATC-DE 0..1 MS and
      ASK 0..1 MS and
      WG14 0..1 MS and
      verordnungskategorieCode 0..1 MS
  * coding[PZN]
    * ^patternCoding.system = $cs-pzn
    * system 1..1 MS
    * code 1..1 MS
    * display MS
  * coding[ATC-DE]
    * ^patternCoding.system = $cs-atc-de
    * system 1..1 MS
    * code 1..1 MS
    * display MS
  * coding[ASK]
    * ^patternCoding.system = $cs-ask
    * system 1..1 MS
    * code 1..1 MS
    * display MS
  * coding[WG14]
    * ^patternCoding.system = $cs-wg14
    * system 1..1 MS
    * code 1..1 MS
    * display MS
  * coding[verordnungskategorieCode]
    * system 1..1 MS
    * code 1..1 MS
    * code from KBVMedicationTypeVS
    * display MS
  * text MS
* status 1..1 MS
  * ^short = "Status der Medikamenteninformation"
* manufacturer MS
  * ^short = "Hersteller des Medikaments"
  * ^comment = "Hier kann der tatsächliche Hersteller des Medikaments benannt werden, vornehmlich im Fall von Wirkstoffmischungen (Rezepturen), beispielsweise die Krankenhausapotheke. Zu beachten ist, dass die zulassende Organisation, wie sie z.B. in den Daten zur PZN benannt ist, nicht als Hersteller gilt."
  * display 1..1 MS
* form MS
  * ^short = "Abgabeform"
* form
  * coding MS
    * ^slicing.discriminator.type = #pattern
    * ^slicing.discriminator.path = "$this"
    * ^slicing.rules = #open
  * coding contains
      EDQM 0..1 MS and
      KBVDarreichungsform 0..1 MS
  * coding[EDQM] from $vs-edqm-doseform (required)
    * system 1..1 MS
    * code 1..1 MS
    * display MS
  * coding[KBVDarreichungsform] from KBVMedicationDarreichungsformVS (required)
    * system 1..1 MS
    * code 1..1 MS
    * display MS
* amount MS
  * numerator 1..1 MS
    * ^patternQuantity.system = $cs-ucum
    * value 1..1 MS
    * unit MS
    * system 1..1 MS
    * code 1..1 MS
  * denominator MS
    * ^patternQuantity.system = $cs-ucum
    * value 1..1 MS
    * unit MS
    * system 1..1 MS
    * code 1..1 MS
* ingredient MS
  * ^short = "Informationen zu Bestandteilen (Rezeptur)"
  * itemCodeableConcept MS
    * ^short = "Bestandteil in codierter Form oder ggf. als Freitext"
    * coding 1.. MS
      * ^slicing.discriminator.type = #pattern
      * ^slicing.discriminator.path = "$this"
      * ^slicing.rules = #open
    * coding contains
        ASK 0..1 MS and
        ATC-DE 0..1 MS and
        PZN 0..1 MS and
        WG14 0..1 MS
    * coding[ASK]
      * ^patternCoding.system = $cs-ask
      * system 1..1 MS
      * code 1..1 MS
      * display MS
    * coding[ATC-DE]
      * ^patternCoding.system = $cs-atc-de
      * system 1..1 MS
      * code 1..1 MS
      * display MS
    * coding[PZN]
      * ^patternCoding.system = $cs-pzn
      * system 1..1 MS
      * code 1..1 MS
      * display MS
    * coding[WG14]
      * ^patternCoding.system = $cs-wg14
      * system 1..1 MS
      * code 1..1 MS
      * display MS
    * text MS
  * itemReference
    * ^short = "Bestandteil (Referenz auf ein anderes Medikament)"
    * reference 0..1
  * isActive
    * ^short = "handelt es sich um einen aktiven Bestandteil?"
  * strength MS
    * ^short = "Stärke"
    * numerator 1..1 MS
      * ^patternQuantity.system = $cs-ucum
      * value 1..1 MS
      * unit MS
      * system 1..1 MS
      * code 1..1 MS
    * denominator MS
      * ^patternQuantity.system = $cs-ucum
      * value 1..1 MS
      * unit MS
      * system 1..1 MS
      * code 1..1 MS
* batch MS
  * ^short = "Angaben zur Charge"
  * lotNumber MS
    * ^short = "Chargennummer"

Invariant: epa-med-1
Description: "Medikamenten-Code, -Bezeichnung oder Inhaltsstoffe müssen angegeben werden."
Severity: #error
Expression: "code.exists() or ingredient.exists()"
