Instance: CancelPrescriptionERPOP
InstanceOf: OperationDefinition
Usage: #definition
Title: "$cancel-prescription-erp Operation"
Description: "The $cancel-prescription-erp operation is used by the E-Rezept-Fachdienst to cancel an already issued electronic prescription. This function is applied when a prescription is no longer needed for various reasons, such as changes in medication or errors in the initial issuance. After cancellation by the E-Rezept-Fachdienst, this information is transmitted to the ePA Medication Service, where the prescription is calculations. It can then no longer be used for dispensing medication. This process ensures accuracy and safety in the management of medications."
* insert MetaInst
* id = "cancel-prescription-erp-OP"
* name = "Cancel Prescription eRP"
* kind = #operation
* description = "The $cancel-prescription-erp operation is used by the E-Rezept-Fachdienst to cancel an already issued electronic prescription. This function is applied when a prescription is no longer needed for various reasons, such as changes in medication or errors in the initial issuance. After cancellation by the E-Rezept-Fachdienst, this information is transmitted to the ePA Medication Service, where the prescription is calculations. It can then no longer be used for dispensing medication. This process ensures accuracy and safety in the management of medications."
* code = #cancel-prescription-erp
* system = true
* type = false
* instance = false
* inputProfile = Canonical(https://gematik.de/fhir/epa-medication/StructureDefinition/epa-op-cancel-prescription-erp-input-parameters)
* outputProfile = Canonical(https://gematik.de/fhir/epa-medication/StructureDefinition/epa-op-rx-prescription-erp-output-parameters)
* parameter[+]
  * name = #RxPrescription
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
  * name = #RxPrescription
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
