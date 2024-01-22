Instance: CancelDispensationERPOP
InstanceOf: OperationDefinition
Usage: #definition
Title: "$cancel-dispensation-erp Operation"
Description: "The $cancel-dispensation-erp operation, used by the E-Rezept-Fachdienst, in the context of the ePA Medication Service, is applied to cancel or reverse information regarding the dispensation of a medication. This operation is necessary when a medication dispensation is cancelled by a pharmacist or when there is a return of the medication by the insurant. After the E-Rezept-Fachdienst performs this operation, the corresponding dispensation entry for the medication in the patient's ePA is marked as cancelled, which the goal in ensuring an accurate and up-to-date record of the patient's medication data."
* insert MetaInst
* id = "cancel-dispensation-erp-OP"
* name = "Cancel Dispensation eRP"
* kind = #operation
* description = "The $cancel-dispensation-erp operation, used by the E-Rezept-Fachdienst, in the context of the ePA Medication Service, is applied to cancel or reverse information regarding the dispensation of a medication. This operation is necessary when a medication dispensation is cancelled by a pharmacist or when there is a return of the medication by the insurant. After the E-Rezept-Fachdienst performs this operation, the corresponding dispensation entry for the medication in the patient's ePA is marked as cancelled, which the goal in ensuring an accurate and up-to-date record of the patient's medication data."
* code = #cancel-dispensation-erp
* system = true
* type = false
* instance = false
* inputProfile = Canonical(https://gematik.de/fhir/epa-medication/StructureDefinition/epa-op-cancel-dispensation-erp-input-parameters)
* outputProfile = Canonical(https://gematik.de/fhir/epa-medication/StructureDefinition/epa-op-rx-dispensation-erp-output-parameters)
* parameter[+]
  * name = #RxDispensation
  * use = #in
  * min = 1
  * max = "*"
  * part[+]
    * name = #PrescriptionId
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
* parameter[+]
  * name = #RxDispensation
  * use = #out
  * min = 1
  * max = "*"
  * part[+]
    * name = #PrescriptionId
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
    * name = #OperationOutcome
    * type = #OperationOutcome
    * use = #out
    * min = 1
    * max = "1"
