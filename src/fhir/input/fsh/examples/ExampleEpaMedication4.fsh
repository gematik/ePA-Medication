Instance: ExampleEpaMedication4
InstanceOf: EPAMedication
Usage: #example
* id = "4f9ab221-0eef-4e46-a8a9-38302e0488b1"
* extension[type].valueCoding = $sct#781405001 "Medicinal product package (product)"
  * version = $sct-version_20240201
* meta
  * versionId = "1"
  * lastUpdated = "2025-01-22T14:43:33.244Z"
* extension[rxPrescriptionProcessIdentifier].valueIdentifier.value = "160.153.303.257.459_20250122"
* extension[drugCategory].valueCoding.system = Canonical(EPADrugCategoryCS)
* extension[drugCategory].valueCoding.code = #00
* extension[normSizeCode].valueCode = #N3
* identifier[EPAMedicationUniqueIdentifier].value = "B849184C973EA5FA7D9751E6FAA6AFCFFD100183596239F84DD2C0DB4C751D67"
* identifier[RxOriginatorProcessIdentifier].value = "c7f34f27-7564-43ad-b13f-2be3c5d7fd3d_160.153.303.257.459"

* status = #active

* code.coding[pzn] = $cs-pzn#10019621 "IBU-ratiopharm 400mg akut Schmerztabletten"
* code.coding[atc-de] = $cs-atc-de#M01AE01 "Ibuprofen"
* code.coding[atc-de].version = "2022"
* form.coding[kbvDarreichungsform] = $cs-kbv-medication-darreichungsform#TAB "Tabletten"
* form.coding[kbvDarreichungsform].version = "1.10"
* form.coding[snomed] = $sct#385055001 "Tablet (basic dose form)"
* form.coding[snomed].version = $sct-version_20240201
* form.coding[edqm] = $cs-edqm#12200 "Tablet"
* amount.numerator = 50 '{Tablet}' "Tablet"
* amount.denominator = 1 '{Package}' "Package"
* ingredient.itemCodeableConcept.coding.version = $sct-version_20240201
* ingredient.itemCodeableConcept.coding = $sct#387207008 "Ibuprofen (substance)"
* ingredient.strength.numerator = 400 'mg' "MilliGram"
* ingredient.strength.denominator = 1 '{Tablet}' "Tablet"