Instance: ExampleEpaMedication3
InstanceOf: EPAMedication
Usage: #example
* id = "4bfef107-7d81-4d36-8aa0-7ea937969046"
* extension[type].valueCoding = $sct#781405001 "Medicinal product package (product)"
  * version = $sct-version_20240201
* meta
  * versionId = "1"
  * lastUpdated = "2025-01-22T14:43:33.244Z"
* extension[rxPrescriptionProcessIdentifier].valueIdentifier.value = "160.153.303.257.459_20250122"
* extension[drugCategory].valueCoding.system = Canonical(EPADrugCategoryCS)
* extension[drugCategory].valueCoding.code = #00
* identifier[EPAMedicationUniqueIdentifier].value = "5FD46319BA6C5C0D7626CFB709AF564362667A70D4A261E0F8EE57D9D837F394"
* identifier[RxOriginatorProcessIdentifier].value = "358f35e5-2e32-46bb-b565-c373ecfb6230_160.153.303.257.459"
* code
  * text = "250ml 5-%iger (50 mg/ml) Glucose-Infusionsloesung"
* status = #active