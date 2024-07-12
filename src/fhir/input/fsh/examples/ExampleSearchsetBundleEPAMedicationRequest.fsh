Instance: ExampleSearchsetBundleEPAMedicationRequest
InstanceOf: Bundle
Usage: #example
* id = "example-searchset-medicationrequest"
* type = #searchset
* total = 100

* link[0].relation = "self"
* link[0].url = "/epa/medication/api/v1/fhir/MedicationRequest?_offset=20&_count=10" // The current page
* link[1].relation = "previous"
* link[1].url = "/epa/medication/api/v1/fhir/MedicationRequest?_offset=10&_count=10"
* link[2].relation = "next"
* link[2].url = "/epa/medication/api/v1/fhir/MedicationRequest?_offset=30&_count=10"

// Include entries with a MedicationRequest
* entry[0].fullUrl = "https://epa-as-0.prod.epa4all.de/vau-cid-1234/epa/medication/api/v1/fhir/MedicationRequest/bb91cde8-0426-4f4b-a766-5d818d0605bd"
* entry[0].resource = ExampleEpaMedicationRequest1
* entry[0].search.mode = #match

* entry[1].fullUrl = "https://epa-as-0.prod.epa4all.de/vau-cid-1234/epa/medication/api/v1/fhir/MedicationRequest/3d7252b4-7814-4d40-8ca2-2f731648f22d"
* entry[1].resource = ExampleEpaMedicationRequest2
* entry[1].search.mode = #match

