Instance: ProvidePrescriptionERPOP
InstanceOf: OperationDefinition
Usage: #definition
Title: "$provide-prescription-erp Operation"
Description: "The $provide-prescription-erp operation in the ePA MedicationService is used to add electronic prescriptions to a patient's record. These prescriptions are already made by the E-Rezept-Fachdienst. This operation does not create new patient prescriptions; it just puts the ones made by the E-Rezept-Fachdienst into the patient's ePA, making sure they are stored safely and can be easily accessed."
* insert MetaInst

* id = "provide-prescription-erp-OP"
* name = "Provide Prescription eRP"
* kind = #operation
* description = "The $provide-prescription-erp operation in the ePA MedicationService is used to add electronic prescriptions to a patient's record. These prescriptions are already made by the E-Rezept-Fachdienst. This operation does not create new patient prescriptions; it just puts the ones made by the E-Rezept-Fachdienst into the patient's ePA, making sure they are stored safely and can be easily accessed."
* code = #provide-prescription-erp
* system = true
* type = false
* instance = false
* inputProfile = Canonical(EPAOpProvidePrescriptionERPInputParameters)
* outputProfile = Canonical(EPAOpRxPrescriptionERPOutputParameters)
* parameter[+]
  * name = #rxPrescription
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
    * name = #medicationRequest
    * type = #MedicationRequest
    * use = #in
    * min = 1
    * max = "1"
  * part[+]
    * name = #medication
    * type = #Medication
    * use = #in
    * min = 1
    * max = "1"
  * part[+]
    * name = #organization
    * type = #Organization
    * use = #in
    * min = 1
    * max = "1"
  * part[+]
    * name = #practitioner
    * type = #Practitioner
    * use = #in
    * min = 1
    * max = "1"
* parameter[+]
  * name = #rxPrescription
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
