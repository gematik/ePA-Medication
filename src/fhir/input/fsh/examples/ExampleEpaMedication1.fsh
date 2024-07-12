Instance: ExampleEpaMedication1
InstanceOf: EPAMedication
Usage: #example
* id = "2571d29b-e213-40ec-b817-a1490718a490"
* extension[type].valueCoding = $sct#781405001 "Medicinal product package (product)"
  * version = $sct-version_20240201
* meta
  * versionId = "1"
  * lastUpdated = "2025-01-22T14:43:33.244Z"
* extension[rxPrescriptionProcessIdentifier].valueIdentifier.value = "160.153.303.257.459_20250122"
* identifier[EPAMedicationUniqueIdentifier].value = "A632B2AB4232C9787E0731E3824942350070FB492EB1005A4AFA00F4BACD8AA1"
* identifier[RxOriginatorProcessIdentifier].value = "dc810e53-c26b-47bc-8c78-c7f79ea5f7ae_160.153.303.257.459"
* status = #active
* code.coding
  * system = $cs-ask
  * code = #5682
  * display = "Ibuprofen"