Profile: EPAMedicationPZNIngredient
Parent: Medication
Id: epa-medication-pzn-ingredient
Title: "EPA Medication Ingredient"
Description: "Defines the medication resource for a PZN ingredient of a compounding medication for the Medication Service in the ePA system. These profiles are intended to inherit from EPAMedication, but due to tooling issues, this inheritance cannot currently be implemented."
//TODO: as soon as the snapshotgenerator can deal with contained child-profiles remove the following insert statement and inherit from EPAMedication
* insert epaMedicationElements
* contained ..0
* extension[type].valueCoding from EPAMedicationTypeProductVS
* code
  * coding[pzn] 1..
* ingredient
  * itemReference ..0
    * ^short = "EPA Medication Ingredients can't have child Medications"