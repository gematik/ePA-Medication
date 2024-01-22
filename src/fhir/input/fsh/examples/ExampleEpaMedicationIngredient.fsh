Instance: ExampleEpaMedicationIngredient
InstanceOf: EPAMedication
Usage: #example
* id = "example-epa-medication-ingredient"
* extension[RxPrescriptionProcessIdentifier].valueIdentifier.value = "160.153.303.257.459_20240122"
* identifier[EPAMedicationUniqueIdentifier].value = "E8827EB3FC26FE461BF2D7C0E0C91A703B233E13E4F309D88C138459D9EF48E3"
* identifier[RxOriginatorProcessIdentifier].value = "6ae6a7ca-c9b5-46bf-9411-2ba49d96f988_160.153.303.257.459"
* code
  * coding = https://fhir.kbv.de/CodeSystem/KBV_CS_ERP_Medication_Type#freitext
  * text = "250ml 5-%iger (50 mg/ml) Glucose-Infusionsloesung"
* status = #active