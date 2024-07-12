Instance: TabletSprayKombipackung
InstanceOf: EPAMedication
Title: "TabletSprayKombipackung"
Usage: #example
* contained[+] = Augentropfen
* contained[+] = NasenSpray
* identifier[EPAMedicationUniqueIdentifier].value = "B684B515A5522417DB46A2D6AF3F22A37BFFBA7A2263D1A75F9682FD1DA49061"
// Arzneimittelkategorie
* extension[drugCategory].valueCoding = EPADrugCategoryCS#00
//MedicationType
* extension[type].valueCoding = $sct#781405001 "Medicinal product package (product)"
  * version = $sct-version_20240201
// Impfstoff
* extension[isVaccine].valueBoolean = false
// normgroesse
* code.coding[pzn] = $cs-pzn#1746517 "CROMO-RATIOPHARM Kombipackung"
* form.coding[kbvDarreichungsform].system = "https://fhir.kbv.de/CodeSystem/KBV_CS_SFHIR_KBV_DARREICHUNGSFORM"
* form.coding[kbvDarreichungsform].code = #KPG
* ingredient[+].itemReference = Reference(NasenSpray)
* ingredient[+].itemReference = Reference(Augentropfen)

Instance: Augentropfen
InstanceOf: EPAMedicationPharmaceuticalProduct
Usage: #inline
* identifier[EPAMedicationUniqueIdentifier].value = "59F8B8EF490A2A6D49C66D8C02574AB1E7C2EA97AEB925343F86D32616365984"
* extension[type].valueCoding = $sct#373873005 "Pharmaceutical / biologic product (product)"
  * version = $sct-version_20240201
* code.coding[product-key] = $cs-product-key#01746517-1 "Augentropfen"
* batch.lotNumber = "0132456"
* ingredient[+]
  * itemCodeableConcept
    * coding[atc-de] = $cs-atc-de#R01AC01 "Natriumcromoglicat"
  * strength
    * numerator
      * value = 20
      * unit = "mg"
      * system = $cs-ucum
      * code = #mg
    * denominator
      * value = 1
      * unit = "ml"
      * system = $cs-ucum
      * code = #ml

Instance: NasenSpray
InstanceOf: EPAMedicationPharmaceuticalProduct
Usage: #inline
* identifier[EPAMedicationUniqueIdentifier].value = "FFE864A95C512A02207CDE2F38A0A21786FC5EC5E80491B2660C019CBC59ADA4"
* extension[type].valueCoding = $sct#373873005 "Pharmaceutical / biologic product (product)"
  * version = $sct-version_20240201
* code.coding[product-key] = $cs-product-key#01746517-2 "Nasenspray, Lösung"
* batch.lotNumber = "56498416854"
* ingredient[+]
  * itemCodeableConcept
    * coding[atc-de] = $cs-atc-de#R01AC01 "Natriumcromoglicat"
  * strength
    * numerator
      * value = 2.8
      * unit = "mg"
      * system = $cs-ucum
      * code = #mg
    * denominator
      * value = 1
      * unit = "Sprühstoß"
      * system = $cs-ucum
      * code = #1

