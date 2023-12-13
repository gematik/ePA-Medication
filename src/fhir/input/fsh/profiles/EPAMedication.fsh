Profile: EPAMedication
Parent: Medication
Id: epa-medication
Title: "EPA Medication"
Description: "Defines the medication resource for the Medication Service in the ePA system."
* insert Meta
* extension contains RxPrescriptionProcessIdentifierExtension named RxPrescriptionProcessIdentifier 1..1 MS
* obeys epa-med-1
* identifier ^slicing.discriminator.type = #pattern
* identifier ^slicing.discriminator.path = "$this"
* identifier ^slicing.rules = #open
* identifier ^slicing.ordered = false
* identifier 1.. MS
* identifier contains
    ePAMedicationUniqueIdentifier 1..1
* identifier[ePAMedicationUniqueIdentifier] only EPAMedicationUniqueIdentifier
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
  * itemReference MS
    * ^short = "Bestandteil (Referenz auf ein anderes Medikament)"
    * reference 1..1 MS
  * isActive MS
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

Instance: ExampleEpaMedication1
InstanceOf: EPAMedication
Usage: #example
* id = "example-epa-medication-1"
* extension[RxPrescriptionProcessIdentifier].valueIdentifier.value = "1234"
* identifier[ePAMedicationUniqueIdentifier].value = "B517B68E5764DD32896EF1F8771F861EC2DC30250A4EE6E2C2923CBE26DD8A9F"
* status = #active
* code.coding
  * system = $cs-ask
  * code = #5682
  * display = "Ibuprofen"

Instance: ExampleEpaMedication2
InstanceOf: EPAMedication
Usage: #example
* id = "example-epa-medication-2"
* extension[RxPrescriptionProcessIdentifier].valueIdentifier.value = "23569"
* identifier[ePAMedicationUniqueIdentifier].value = "8F6E41946E798D9C89384A0D2C9C7D9E4F6F0A2DE9EF62B7A4A26A329400735F"
* code.text = "Infusion bestehend aus 85mg Doxorubicin aufgeloest zur Verabreichung in 250ml 5-%iger (50 mg/ml) Glucose-Infusionsloesung"
* status = #active
* form.coding
  * system = $cs-edqm
  * code = #11210000
  * display = "Solution for infusion"
* ingredient[+]
  * itemCodeableConcept.coding
    * system = $cs-atc-de
    * code = #L01DB01
    * display = "Doxorubicin"
  * isActive = true
  * strength
    * numerator
      * value = 85
      * unit = "mg"
      * system = $cs-ucum
      * code = #mg
    * denominator
      * value = 250
      * unit = "Milliliter"
      * system = $cs-ucum
      * code = #mL
* ingredient[+]
  * itemReference = Reference(ExampleEpaMedicationIngredient)
  * isActive = true

Instance: ExampleEpaMedicationIngredient
InstanceOf: EPAMedication
Usage: #example
* id = "example-epa-medication-ingredient"
* extension[RxPrescriptionProcessIdentifier].valueIdentifier.value = "23569"
* identifier[ePAMedicationUniqueIdentifier].value = "E8827EB3FC26FE461BF2D7C0E0C91A703B233E13E4F309D88C138459D9EF48E3"
* code
  * coding = https://fhir.kbv.de/CodeSystem/KBV_CS_ERP_Medication_Type#freitext
  * text = "250ml 5-%iger (50 mg/ml) Glucose-Infusionsloesung"
* status = #active