Instance: ExampleEpaMedication2
InstanceOf: EPAMedication
Usage: #example
* id = "example-epa-medication-2"
* extension[rxPrescriptionProcessIdentifier].valueIdentifier.value = "160.153.303.257.459_20240122"
* identifier[EPAMedicationUniqueIdentifier].value = "F5559CCEBF31CDCC373F75B8FA9398B8AD6532134B231A15A25F353961BDD761"
* identifier[RxOriginatorProcessIdentifier].value = "6ae6a7ca-c9b5-46bf-9411-2ba49d96f988_160.153.303.257.459"
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