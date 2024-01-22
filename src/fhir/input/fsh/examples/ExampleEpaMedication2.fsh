Instance: ExampleEpaMedication2
InstanceOf: EPAMedication
Usage: #example
* id = "example-epa-medication-2"
* extension[RxPrescriptionProcessIdentifier].valueIdentifier.value = "160.153.303.257.459_20240122"
* identifier[EPAMedicationUniqueIdentifier].value = "8F6E41946E798D9C89384A0D2C9C7D9E4F6F0A2DE9EF62B7A4A26A329400735F"
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