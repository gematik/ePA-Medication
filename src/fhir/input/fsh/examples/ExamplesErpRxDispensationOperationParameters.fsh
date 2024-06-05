Instance: ExampleEpaOpProvideDispensationERPInputParameters1
InstanceOf: EPAOpProvideDispensationERPInputParameters
Usage: #example

* id = "example-epa-op-provide-dispensation-erp-input-parameters-1"
* parameter[+]
  * name = "rxDispensation"
  * part[prescriptionId]
    * name = "prescriptionId"
    * valueIdentifier
      * system = "https://gematik.de/fhir/erp/NamingSystem/GEM_ERP_NS_PrescriptionId"
      * value = "160.153.303.257.459"
  * part[authoredOn]
    * name = "authoredOn"
    * valueDate = "2025-01-22"
  * part[medicationDispense]
    * name = "medicationDispense"
    * resource = ExampleParametersEpaMedicationDispense1
  * part[medication]
    * name = "medication"
    * resource = ExampleParametersEpaMedication2
  * part[organization]
    * name = "organization"
    * resource = ExampleParametersOrganizationDirectory2

Instance: ExampleEpaOpProvideDispensationERPInputParameters2
InstanceOf: EPAOpProvideDispensationERPInputParameters
Usage: #example

* id = "example-epa-op-provide-dispensation-erp-input-parameters-2"
* parameter[+]
  * name = "rxDispensation"
  * part[prescriptionId]
    * name = "prescriptionId"
    * valueIdentifier
      * system = "https://gematik.de/fhir/erp/NamingSystem/GEM_ERP_NS_PrescriptionId"
      * value = "160.153.303.257.459"
  * part[authoredOn]
    * name = "authoredOn"
    * valueDate = "2025-01-22"
  * part[medicationDispense]
    * name = "medicationDispense"
    * resource = ExampleParametersEpaMedicationDispense2
  * part[medication]
    * name = "medication"
    * resource = ExampleParametersEpaMedication2
  * part[organization]
    * name = "organization"
    * resource = ExampleParametersOrganizationDirectory2
    


Instance: ExampleEpaOpCancelDispensationERPInputParameters1
InstanceOf: EPAOpCancelDispensationERPInputParameters
Usage: #example

* id = "example-epa-op-cancel-dispensation-erp-input-parameters-1"
* parameter[+]
  * name = "rxDispensation"
  * part[prescriptionId]
    * name = "prescriptionId"
    * valueIdentifier
      * system = "https://gematik.de/fhir/erp/NamingSystem/GEM_ERP_NS_PrescriptionId"
      * value = "160.153.303.257.459"
  * part[authoredOn]
    * name = "authoredOn"
    * valueDate = "2025-01-22"



Instance: ExampleEpaOpRxDispensationOutputParameters1
InstanceOf: EPAOpRxDispensationERPOutputParameters
Usage: #example

* id = "example-epa-op-rx-dispensation-erp-output-parameters-1"
* parameter[+]
  * name = "rxDispensation"
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

    