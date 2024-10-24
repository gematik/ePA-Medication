Instance: ExampleEpaMedication2
InstanceOf: EPAMedication
Usage: #example
* id = "3b990824-3814-4d75-80b1-e2935827f8f0"
* extension[type].valueCoding = $sct#781405001 "Medicinal product package (product)"
  * version = $sct-version_20240201
* meta
  * versionId = "1"
  * lastUpdated = "2025-01-22T14:43:33.244Z"
* extension[rxPrescriptionProcessIdentifier].valueIdentifier.value = "160.153.303.257.459_20250122"
* identifier[EPAMedicationUniqueIdentifier].value = "E5A0DE886C10E6A7C044D39204A23FE945CFA4C93C694837F43A2C9DE7C858DF"
* identifier[RxOriginatorProcessIdentifier].value = "ec4d55a0-dec1-46b7-96cc-096845b74c4b_160.153.303.257.459"
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