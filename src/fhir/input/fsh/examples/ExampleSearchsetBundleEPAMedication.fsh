Instance: ExampleSearchsetBundleEPAMedication
InstanceOf: Bundle
Usage: #example
* id = "example-searchset-medication"
* type = #searchset
* total = 100 // Set this to the total number of Medication resources in the bundle

* link[0].relation = "self"
* link[0].url = "/epa/medication/api/v1/fhir/Medication?_offset=20&_count=10" // The current page
* link[1].relation = "previous"
* link[1].url = "/epa/medication/api/v1/fhir/Medication?_offset=10&_count=10"
* link[2].relation = "next"
* link[2].url = "/epa/medication/api/v1/fhir/Medication?_offset=30&_count=10"


// Include entries with a Medication
* entry[0].fullUrl = "https://epa-as-0.prod.epa4all.de/vau-cid-1234/epa/medication/api/v1/fhir/Medication/2571d29b-e213-40ec-b817-a1490718a490"
* entry[0].resource = ExampleEpaMedication1
* entry[0].search.mode = #match

* entry[1].fullUrl = "https://epa-as-0.prod.epa4all.de/vau-cid-1234/epa/medication/api/v1/fhir/Medication/3b990824-3814-4d75-80b1-e2935827f8f0"
* entry[1].resource = ExampleEpaMedication2
* entry[1].search.mode = #match

* entry[2].fullUrl = "https://epa-as-0.prod.epa4all.de/vau-cid-1234/epa/medication/api/v1/fhir/Medication/4bfef107-7d81-4d36-8aa0-7ea937969046"
* entry[2].resource = ExampleEpaMedication3
* entry[2].search.mode = #match

* entry[3].fullUrl = "https://epa-as-0.prod.epa4all.de/vau-cid-1234/epa/medication/api/v1/fhir/Medication/4f9ab221-0eef-4e46-a8a9-38302e0488b1"
* entry[3].resource = ExampleEpaMedication4
* entry[3].search.mode = #match