Instance: ProvidePrescriptionOP
InstanceOf: OperationDefinition
Usage: #definition
Title: "$provide-prescription Operation"
Description: "The $provide-prescription operation in the ePA MedicationService is used to add electronic prescriptions to a patient's record. These prescriptions are already made by the E-Rezept-Fachdienst. This operation does not create new patient prescriptions; it just puts the ones made by the E-Rezept-Fachdienst into the patient's ePA, making sure they are stored safely and can be easily accessed."
* insert MetaInst
* id = "provide-prescription-OP"
* name = "Provide Prescription"
* kind = #operation
* description = "The $provide-prescription operation in the ePA MedicationService is used to add electronic prescriptions to a patient's record. These prescriptions are already made by the E-Rezept-Fachdienst. This operation does not create new patient prescriptions; it just puts the ones made by the E-Rezept-Fachdienst into the patient's ePA, making sure they are stored safely and can be easily accessed."
* code = #provide-prescription
* system = true
* type = false
* instance = false
* parameter[+]
  * name = #RxPrescription
  * use = #in
  * min = 1
  * max = "*"
  * part[+]
    * name = #RxPrescriptionProcessIdentifier
    * type = #Identifier
    * use = #in
    * min = 1
    * max = "1"
  * part[+]
    * name = #MedicationRequest
    * type = #MedicationRequest
    * use = #in
    * min = 1
    * max = "1"
  * part[+]
    * name = #Medication
    * type = #Medication
    * use = #in
    * min = 1
    * max = "1"
  * part[+]
    * name = #Organization
    * type = #Organization
    * use = #in
    * min = 1
    * max = "1"
  * part[+]
    * name = #Practitioner
    * type = #Practitioner
    * use = #in
    * min = 1
    * max = "1"

Instance: ProvideDispensationOP
InstanceOf: OperationDefinition
Usage: #definition
Title: "$provide-dispensation Operation"
Description: "The $provide-dispensation operation in the ePA Medication Service is used to record information about the dispensing of medications based on an electronic prescription in the patient's record. This operation comes into play when a patient receives their medication from a pharmacy. It documents that the medication has been dispensed as per the prescription, including details like the quantity, date of dispensing, and pharmacy information. This helps maintain a comprehensive overview of the patient's medication history."
* insert MetaInst
* id = "provide-dispensation-OP"
* name = "Provide Dispensation"
* kind = #operation
* description = "The $provide-dispensation operation in the ePA Medication Service is used to record information about the dispensing of medications based on an electronic prescription in the patient's record. This operation comes into play when a patient receives their medication from a pharmacy. It documents that the medication has been dispensed as per the prescription, including details like the quantity, date of dispensing, and pharmacy information. This helps maintain a comprehensive overview of the patient's medication history."
* code = #provide-dispensation
* system = true
* type = false
* instance = false
* parameter[+]
  * name = #RxDispensation
  * use = #in
  * min = 1
  * max = "*"
  * part[+]
    * name = #RxPrescriptionProcessIdentifier
    * type = #Identifier
    * use = #in
    * min = 1
    * max = "1"
  * part[+]
    * name = #MedicationDispense
    * type = #MedicationDispense
    * use = #in
    * min = 1
    * max = "*"
  * part[+]
    * name = #Medication
    * type = #Medication
    * use = #in
    * min = 1
    * max = "*"
  * part[+]
    * name = #Organization
    * type = #Organization
    * use = #in
    * min = 1
    * max = "1"

Instance: CancelPrescriptionOP
InstanceOf: OperationDefinition
Usage: #definition
Title: "$cancel-prescription Operation"
Description: "The $cancel-prescription operation is used by the E-Rezept-Fachdienst to cancel an already issued electronic prescription. This function is applied when a prescription is no longer needed for various reasons, such as changes in medication or errors in the initial issuance. After cancellation by the E-Rezept-Fachdienst, this information is transmitted to the ePA Medication Service, where the prescription is calculations. It can then no longer be used for dispensing medication. This process ensures accuracy and safety in the management of medications."
* insert MetaInst
* id = "cancel-prescription-OP"
* name = "Cancel Prescription"
* kind = #operation
* description = "The $cancel-prescription operation is used by the E-Rezept-Fachdienst to cancel an already issued electronic prescription. This function is applied when a prescription is no longer needed for various reasons, such as changes in medication or errors in the initial issuance. After cancellation by the E-Rezept-Fachdienst, this information is transmitted to the ePA Medication Service, where the prescription is calculations. It can then no longer be used for dispensing medication. This process ensures accuracy and safety in the management of medications."
* code = #cancel-prescription
* system = true
* type = false
* instance = false
* parameter[+]
  * name = #RxPrescriptionProcessIdentifier
  * type = #Identifier
  * use = #in
  * min = 1
  * max = "*"

Instance: CancelDispensationOP
InstanceOf: OperationDefinition
Usage: #definition
Title: "$cancel-dispensation Operation"
Description: "The $cancel-dispensation operation, used by the E-Rezept-Fachdienst, in the context of the ePA Medication Service, is applied to cancel or reverse information regarding the dispensation of a medication. This operation is necessary when a medication dispensation is cancelled by a pharmacist or when there is a return of the medication by the insurant. After the E-Rezept-Fachdienst performs this operation, the corresponding dispensation entry for the medication in the patient's ePA is marked as cancelled, which the goal in ensuring an accurate and up-to-date record of the patient's medication data."
* insert MetaInst
* id = "cancel-dispensation-OP"
* name = "Cancel Dispensation"
* kind = #operation
* description = "The $cancel-dispensation operation, used by the E-Rezept-Fachdienst, in the context of the ePA Medication Service, is applied to cancel or reverse information regarding the dispensation of a medication. This operation is necessary when a medication dispensation is cancelled by a pharmacist or when there is a return of the medication by the insurant. After the E-Rezept-Fachdienst performs this operation, the corresponding dispensation entry for the medication in the patient's ePA is marked as cancelled, which the goal in ensuring an accurate and up-to-date record of the patient's medication data."
* code = #cancel-dispensation
* system = true
* type = false
* instance = false
* parameter[+]
  * name = #RxPrescriptionProcessIdentifier
  * type = #Identifier
  * use = #in
  * min = 1
  * max = "*"
