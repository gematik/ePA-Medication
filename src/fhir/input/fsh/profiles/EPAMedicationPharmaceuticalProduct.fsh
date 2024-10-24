Profile: EPAMedicationPharmaceuticalProduct
Parent: Medication
Id: epa-medication-pharmaceutical-product
Title: "EPA Pharmaceutical Product Medication"
Description: "Defines the medication resource for a component of a 'Kombipackung' for the Medication Service in the ePA system. These profiles are intended to inherit from EPAMedication, but due to tooling issues, this inheritance cannot currently be implemented."
//TODO: as soon as the snapshotgenerator can deal with contained child-profiles remove the following insert statement and inherit from EPAMedication
* insert epaMedicationElements
* contained ..0
* extension[type].valueCoding from EPAMedicationTypePharmaceuticalProductVS
* code
  * coding[pzn] 0..0
  * coding contains
      product-key 1..1 MS
  * coding[product-key]
    * ^patternCoding.system = $cs-product-key
    * system 1..1 MS
    * code 1..1 MS
    * version MS
    * display MS
* ingredient
  * itemReference 0..0
    * ^short = "EPA Medication Pharmaceutical Product can't have child Medications"