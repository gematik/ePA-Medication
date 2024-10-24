Instance: ExampleEpaMedicationDispense1
InstanceOf: EPAMedicationDispense
Usage: #example
* id = "4e6e1623-778e-44a3-b208-8479f5339e43"
* meta
  * versionId = "1"
  * lastUpdated = "2025-01-22T14:43:33.244Z"

* extension[rxPrescriptionProcessIdentifier].valueIdentifier.value = "160.153.303.257.459_20250122"
* identifier[RxOriginatorProcessIdentifier].value = "5d8fbf7c-bdb0-44c2-95fe-423ae0404ccd_160.153.303.257.459"

* status = #completed
* medicationReference = Reference(ExampleEpaMedication1)
* subject = ExamplePatientReference
* whenHandedOver = "2025-01-22"
* performer.actor = Reference(Organization/3856402c-7636-4fbd-98bd-d278852b8e88)
* authorizingPrescription = Reference(ExampleEpaMedicationRequest1)
* dosageInstruction.text = "1-0-0-0"
* substitution
  * wasSubstituted = false


Instance: ExampleParametersEpaMedicationDispense1
InstanceOf: EPAMedicationDispense
Usage: #inline
* id = "5d8fbf7c-bdb0-44c2-95fe-423ae0404ccd"

* status = #completed
* medicationReference = Reference(urn:uuid:dc810e53-c26b-47bc-8c78-c7f79ea5f7ae)
* subject = ExamplePatientReference
* whenHandedOver = "2025-01-22"
* performer.actor = Reference(urn:uuid:151f1697-7512-4e21-9466-1b75207475d8)
* dosageInstruction.text = "1-0-0-0"
* substitution
  * wasSubstituted = false


Instance: ExampleEpaMedicationDispense2
InstanceOf: EPAMedicationDispense
Usage: #example
* id = "46865835-8c8f-4139-86ba-271bd3565250"
* meta
  * versionId = "1"
  * lastUpdated = "2025-01-22T14:43:33.244Z"

* extension[rxPrescriptionProcessIdentifier].valueIdentifier.value = "160.153.303.257.459_20250122"
* identifier[RxOriginatorProcessIdentifier].value = "86d65df3-5ca4-457d-8859-285830fe091b_160.153.303.257.459"

* status = #completed
* medicationReference = Reference(ExampleEpaMedication2)
* subject = ExamplePatientReference
* whenHandedOver = "2025-01-22"
* performer.actor = Reference(Organization/3856402c-7636-4fbd-98bd-d278852b8e88)
* authorizingPrescription = Reference(ExampleEpaMedicationRequest1)
* dosageInstruction.text = "1-0-0-0"
* substitution
  * wasSubstituted = false


Instance: ExampleParametersEpaMedicationDispense2
InstanceOf: EPAMedicationDispense
Usage: #inline
* id = "86d65df3-5ca4-457d-8859-285830fe091b"

* status = #completed
* medicationReference = Reference(urn:uuid:c7f34f27-7564-43ad-b13f-2be3c5d7fd3d)
* subject = ExamplePatientReference
* whenHandedOver = "2025-01-22"
* performer.actor = Reference(urn:uuid:151f1697-7512-4e21-9466-1b75207475d8)
* dosageInstruction.text = "1-0-0-0"
* substitution
  * wasSubstituted = false