Profile: RxOriginatorProcessIdentifier
Parent: Identifier
Id: rx-originator-process-identifier
Description: "The RxOriginatorProcessIdentifier, generated within the Medication Service Backend, links the prescriptionID from the E-Rezept-Fachdienst with the original input FHIR resource ID, facilitating accurate tracking and utilization of medication data in operational processes within digital healthcare systems."
* insert Meta
* system 1..1 MS
* system = "https://gematik.de/fhir/epa-medication/sid/rx-originator-process-identifier"
* value 1.. MS
