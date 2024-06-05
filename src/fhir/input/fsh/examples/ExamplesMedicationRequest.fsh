Instance: ExampleEpaMedicationRequest1
InstanceOf: EPAMedicationRequest
Usage: #example
* id = "bb91cde8-0426-4f4b-a766-5d818d0605bd"
* meta
  * versionId = "1"
  * lastUpdated = "2025-01-22T14:43:33.244Z"
* identifier[RxPrescriptionProcessIdentifier].value = "160.153.303.257.459_20250122"
* identifier[RxOriginatorProcessIdentifier].value = "6ae6a7ca-c9b5-46bf-9411-2ba49d96f988_160.153.303.257.459"

* extension[multiplePrescription].extension[indicator].valueBoolean = false

* status = #active
* intent = #filler-order
* medicationReference = Reference(ExampleEpaMedication1)
* subject = ExamplePatientReference
* authoredOn = "2025-01-22"
* requester = Reference(PractitionerRole/3856402c-7636-4fbd-98bd-d278852b8e88)
* dosageInstruction.text = "1-0-0-0"
* dispenseRequest.quantity = 1 '{Package}'
* substitution.allowedBoolean = true


Instance: ExampleParametersEpaMedicationRequest1
InstanceOf: EPAMedicationRequest
Usage: #inline
* id = "6ae6a7ca-c9b5-46bf-9411-2ba49d96f988"

* extension[multiplePrescription].extension[indicator].valueBoolean = false

* status = #active
* intent = #order
* medicationReference = Reference(urn:uuid:dc810e53-c26b-47bc-8c78-c7f79ea5f7ae)
* subject = ExamplePatientReference
* authoredOn = "2025-01-22"
* dosageInstruction.text = "1-0-0-0"
* dispenseRequest.quantity = 1 '{Package}'
* substitution.allowedBoolean = true


Instance: ExampleEpaMedicationRequest2
InstanceOf: EPAMedicationRequest
Usage: #example
* id = "3d7252b4-7814-4d40-8ca2-2f731648f22d"
* meta
  * versionId = "1"
  * lastUpdated = "2025-01-22T14:43:33.244Z"
* identifier[RxPrescriptionProcessIdentifier].value = "160.153.303.257.459_20250122"
* identifier[RxOriginatorProcessIdentifier].value = "7a86ebaf-526b-488a-9025-21913bc4dacc_160.153.303.257.459"

* extension[multiplePrescription].extension[indicator].valueBoolean = false

* status = #active
* intent = #filler-order
* medicationReference = Reference(ExampleEpaMedication2)
* subject = ExamplePatientReference
* authoredOn = "2025-01-22"
* requester = Reference(PractitionerRole/3856402c-7636-4fbd-98bd-d278852b8e88)
* dosageInstruction.text = "1-0-0-0"
* dispenseRequest.quantity = 1 '{Package}'
* substitution.allowedBoolean = true


Instance: ExampleParametersEpaMedicationRequest2
InstanceOf: EPAMedicationRequest
Usage: #inline
* id = "7a86ebaf-526b-488a-9025-21913bc4dacc"

* extension[multiplePrescription].extension[indicator].valueBoolean = false

* status = #active
* intent = #order
* medicationReference = Reference(urn:uuid:c7f34f27-7564-43ad-b13f-2be3c5d7fd3d)
* subject = ExamplePatientReference
* authoredOn = "2025-01-22"
* dosageInstruction.text = "1-0-0-0"
* dispenseRequest.quantity = 1 '{Package}'
* substitution.allowedBoolean = true
