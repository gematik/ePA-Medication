Instance: CortisonDexpantenolMedicationPreparation
InstanceOf: EPAMedication
Title: "CortisonDexpantenolMedication"
Usage: #example
* contained[+] = MedicationHydrocortison
* contained[+] = MedicationDexpanthenol
* identifier[EPAMedicationUniqueIdentifier].value = "570106FB94760C468D4431074523DDC3CC128385EB7F506FAB12F811790C15A9"
// Arzneimittelkategorie
* extension[drugCategory].valueCoding = EPADrugCategoryCS#00

//MedicationType
* extension[type].valueCoding = $sct#1208954007 "Extemporaneous preparation (product)"
  * version = $sct-version_20240201

// Impfstoff
* extension[isVaccine].valueBoolean = false

// normgroesse
* code.text = "Hydrocortison-Dexpanthenol-Salbe"
* form.coding[kbvDarreichungsform].system = "https://fhir.kbv.de/CodeSystem/KBV_CS_SFHIR_KBV_DARREICHUNGSFORM"
* form.coding[kbvDarreichungsform].code = #SAL
* amount.numerator.value = 20
* amount.numerator.unit = "ml"
* amount.numerator.extension[totalQuantity].valueString = "100 ml"
* amount.denominator.value = 1
* ingredient[+].itemReference = Reference(MedicationHydrocortison)
* ingredient[=].isActive = true
* ingredient[=].strength.numerator.value = 50
* ingredient[=].strength.numerator.system = "http://unitsofmeasure.org"
* ingredient[=].strength.numerator.code = #g
* ingredient[=].strength.denominator.value = 100
* ingredient[=].strength.denominator.system = "http://unitsofmeasure.org"
* ingredient[=].strength.denominator.code = #g
* ingredient[+].itemReference = Reference(MedicationDexpanthenol)
* ingredient[=].isActive = true
* ingredient[=].strength.numerator.value = 50
* ingredient[=].strength.numerator.system = "http://unitsofmeasure.org"
* ingredient[=].strength.numerator.code = #g
* ingredient[=].strength.denominator.value = 100
* ingredient[=].strength.denominator.system = "http://unitsofmeasure.org"
* ingredient[=].strength.denominator.code = #g

Instance: MedicationHydrocortison
InstanceOf: EPAMedicationPZNIngredient
Usage: #inline
* extension[type].valueCoding = $sct#781405001 "Medicinal product package (product)"
  * version = $sct-version_20240201
* code
  * coding[pzn]
    * code = #03424249
    * display = "Hydrocortison 1% Creme"
* batch.lotNumber = "56498416854"

Instance: MedicationDexpanthenol
InstanceOf: EPAMedicationPZNIngredient
Usage: #inline
* extension[type].valueCoding = $sct#781405001 "Medicinal product package (product)"
  * version = $sct-version_20240201
* code
  * coding[pzn]
    * code = #16667195
    * display = "Dexpanthenol 5% Creme"
* batch.lotNumber = "0132456"
