Instance: ProvideDispensationERPOP
InstanceOf: OperationDefinition
Usage: #definition
Title: "$provide-dispensation-erp Operation"
Description: "The $provide-dispensation-erp operation in the ePA Medication Service is used to record information about the dispensing of medications based on an electronic prescription in the patient's record. This operation comes into play when a patient receives their medication from a pharmacy. It documents that the medication has been dispensed as per the prescription, including details like the quantity, date of dispensing, and pharmacy information. This helps maintain a comprehensive overview of the patient's medication history."
* insert MetaInst
* id = "provide-dispensation-erp-OP"
* name = "Provide Dispensation eRP"
* kind = #operation
* description = "The $provide-dispensation-erp operation in the ePA Medication Service is used to record information about the dispensing of medications based on an electronic prescription in the patient's record. This operation comes into play when a patient receives their medication from a pharmacy. It documents that the medication has been dispensed as per the prescription, including details like the quantity, date of dispensing, and pharmacy information. This helps maintain a comprehensive overview of the patient's medication history."
* code = #provide-dispensation-erp
* system = true
* type = false
* instance = false
* inputProfile = Canonical(https://gematik.de/fhir/epa-medication/StructureDefinition/epa-op-provide-dispensation-erp-input-parameters)
* outputProfile = Canonical(https://gematik.de/fhir/epa-medication/StructureDefinition/epa-op-rx-dispensation-erp-output-parameters)
* parameter[+]
  * name = #rxDispensation
  * use = #in
  * min = 1
  * max = "*"
  * part[+]
    * name = #prescriptionId
    * type = #Identifier
    * use = #in
    * min = 1
    * max = "1"
  * part[+]
    * name = #authoredOn
    * type = #date
    * use = #in
    * min = 1
    * max = "1"
  * part[+]
    * name = #medicationDispense
    * type = #MedicationDispense
    * use = #in
    * min = 1
    * max = "*"
  * part[+]
    * name = #medication
    * type = #Medication
    * use = #in
    * min = 0
    * max = "*"
  * part[+]
    * name = #organization
    * type = #Organization
    * use = #in
    * min = 1
    * max = "1"
* parameter[+]
  * name = #rxDispensation
  * use = #out
  * min = 1
  * max = "*"
  * part[+]
    * name = #prescriptionId
    * type = #Identifier
    * use = #out
    * min = 1
    * max = "1"
  * part[+]
    * name = #authoredOn
    * type = #date
    * use = #out
    * min = 1
    * max = "1"
  * part[+]
    * name = #operationOutcome
    * type = #OperationOutcome
    * use = #out
    * min = 1
    * max = "1"
