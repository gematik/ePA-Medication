Instance: SumatripanMedication
InstanceOf: EPAMedication
Title:   "Sample Medication Sumatripan"
Usage: #example
// Arzneimittelkategorie
* extension[drugCategory].valueCoding.system = "https://gematik.de/fhir/dev-epa-medication/CodeSystem/epa-drug-category-cs"
* extension[drugCategory].valueCoding.code = #00

// Impfstoff
* extension[isVaccine].valueBoolean = false

// normgroesse
* extension[normSizeCode].url = "http://fhir.de/StructureDefinition/normgroesse"
* extension[normSizeCode].valueCode = #N1
* code.coding[pzn].system = "http://fhir.de/CodeSystem/ifa/pzn"
* code.coding[pzn].code = #06313728
* code.text = "Sumatriptan-1a Pharma 100 mg Tabletten"
* form.coding[kbvDarreichungsform].system = "https://fhir.kbv.de/CodeSystem/KBV_CS_SFHIR_KBV_DARREICHUNGSFORM"
* form.coding[kbvDarreichungsform].code = #TAB
* amount.numerator.value = 20
* amount.numerator.unit = "St"
* amount.numerator.extension[totalQuantity].valueString = "20 St."
* amount.denominator.value = 1
