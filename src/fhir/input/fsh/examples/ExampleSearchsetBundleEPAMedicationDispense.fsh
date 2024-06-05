Instance: ExampleSearchsetBundleEPAMedicationDispense
InstanceOf: Bundle
Usage: #example
* id = "example-searchset-medicationdispense"
* type = #searchset
* total = 100

* link[0].relation = "self"
* link[0].url = "/epa/medication/api/v1/fhir/MedicationDispense?_offset=20&_count=10" // The current page
* link[1].relation = "previous"
* link[1].url = "/epa/medication/api/v1/fhir/MedicationDispense?_offset=10&_count=10"
* link[2].relation = "next"
* link[2].url = "/epa/medication/api/v1/fhir/MedicationDispense?_offset=30&_count=10"

// Include entries with a MedicationDispense
* entry[0].fullUrl = "https://wwww.example.org/epa/medication/api/v1/fhir/MedicationDispense/4e6e1623-778e-44a3-b208-8479f5339e43"
* entry[0].resource = ExampleEpaMedicationDispense1
* entry[0].search.mode = #match

* entry[1].fullUrl = "https://wwww.example.org/epa/medication/api/v1/fhir/MedicationDispense/46865835-8c8f-4139-86ba-271bd3565250"
* entry[1].resource = ExampleEpaMedicationDispense2
* entry[1].search.mode = #match
