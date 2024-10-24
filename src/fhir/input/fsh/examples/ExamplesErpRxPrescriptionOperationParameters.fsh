Instance: ExampleEpaOpProvidePrescriptionERPInputParameters1
InstanceOf: EPAOpProvidePrescriptionERPInputParameters
Usage: #example

* id = "example-epa-op-provide-prescription-erp-input-parameters-1"
* parameter[rxPrescription]
  * name = "rxPrescription"
  * part[prescriptionId]
    * name = "prescriptionId"
    * valueIdentifier
      * system = "https://gematik.de/fhir/erp/NamingSystem/GEM_ERP_NS_PrescriptionId"
      * value = "160.153.303.257.459"
  * part[authoredOn]
    * name = "authoredOn"
    * valueDate = "2025-01-22"
  * part[medicationRequest]
    * name = "medicationRequest"
    * resource = ExampleParametersEpaMedicationRequest1
  * part[medication]
    * name = "medication"
    * resource = ExampleParametersEpaMedication1
  * part[organization]
    * name = "organization"
    * resource = ExampleParametersOrganizationDirectory1
  * part[practitioner]
    * name = "practitioner"
    * resource = ExampleParametersPractitionerDirectory


Instance: ExampleEpaOpProvidePrescriptionERPInputParameters2
InstanceOf: EPAOpProvidePrescriptionERPInputParameters
Usage: #example

* id = "example-epa-op-provide-prescription-erp-input-parameters-2"
* parameter[rxPrescription]
  * name = "rxPrescription"
  * part[prescriptionId]
    * name = "prescriptionId"
    * valueIdentifier
      * system = "https://gematik.de/fhir/erp/NamingSystem/GEM_ERP_NS_PrescriptionId"
      * value = "160.153.303.257.459"
  * part[authoredOn]
    * name = "authoredOn"
    * valueDate = "2025-01-22"
  * part[medicationRequest]
    * name = "medicationRequest"
    * resource = ExampleParametersEpaMedicationRequest2
  * part[medication]
    * name = "medication"
    * resource = ExampleParametersEpaMedication2
  * part[organization]
    * name = "organization"
    * resource = ExampleParametersOrganizationDirectory1
  * part[practitioner]
    * name = "practitioner"
    * resource = ExampleParametersPractitionerDirectory
    

Instance: ExampleEpaOpRxPrescriptionERPOutputParameters1
InstanceOf: EPAOpRxPrescriptionERPOutputParameters
Usage: #example

* id = "example-epa-op-rx-prescription-erp-output-parameters-1"
* parameter[rxPrescription]
  * name = "rxPrescription"
  * part[prescriptionId]
    * name = "prescriptionId"
    * valueIdentifier
      * system = "https://gematik.de/fhir/erp/NamingSystem/GEM_ERP_NS_PrescriptionId"
      * value = "160.153.303.257.459"
  * part[authoredOn]
    * name = "authoredOn"
    * valueDate = "2025-01-22"
  * part[operationOutcome]
    * name = "operationOutcome"
    * resource = ExampleEPAMSOperationOutcomeSuccess

    

Instance: ExampleEpaOpCancelPrescriptionERPInputParameters1
InstanceOf: EPAOpCancelPrescriptionERPInputParameters
Usage: #example

* id = "example-epa-op-cancel-prescription-erp-input-parameters-1"
* parameter[rxPrescription]
  * name = "rxPrescription"
  * part[prescriptionId]
    * name = "prescriptionId"
    * valueIdentifier
      * system = "https://gematik.de/fhir/erp/NamingSystem/GEM_ERP_NS_PrescriptionId"
      * value = "160.153.303.257.459"
  * part[authoredOn]
    * name = "authoredOn"
    * valueDate = "2025-01-22"
    