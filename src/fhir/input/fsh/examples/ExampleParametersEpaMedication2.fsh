Instance: ExampleParametersEpaMedication2
InstanceOf: EPAMedication
Usage: #inline
* id = "c7f34f27-7564-43ad-b13f-2be3c5d7fd3d"
* extension[drugCategory].valueCoding.system = Canonical(EPADrugCategoryCS)
* extension[drugCategory].valueCoding.code = #00
* extension[normSizeCode].valueCode = #N3
* status = #inactive
* code.coding[pzn] = $cs-pzn#10019621 "IBU-ratiopharm 400mg akut Schmerztabletten"
* code.coding[atc-de] = $cs-atc-de#M01AE01 "Ibuprofen"
* code.coding[atc-de].version = "2022"
* form.coding[kbvDarreichungsform] = $cs-kbv-medication-darreichungsform#TAB "Tabletten"
* form.coding[kbvDarreichungsform].version = "1.10"
* form.coding[snomed] = $sct#385055001 "Tablet (basic dose form)"
* form.coding[snomed].version = $sct_20240501
* form.coding[edqm] = $cs-edqm#12200 "Tablet"
* amount.numerator = 50 '{Tablet}' "Tablet"
* amount.denominator = 1 '{Package}' "Package"
* ingredient.itemCodeableConcept.coding.version = $sct_20240501
* ingredient.itemCodeableConcept.coding = $sct#387207008 "Ibuprofen (substance)"
* ingredient.strength.numerator = 400 'mg' "MilliGram"
* ingredient.strength.denominator = 1 '{Tablet}' "Tablet"