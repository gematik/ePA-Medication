Profile: EPAOpProvidePrescriptionERPInputParameters
Parent: Parameters
Id: epa-op-provide-prescription-erp-input-parameters
Title: "EPA Operation ProvidePrescription ERP Input-Parameters"
Description: "EPA Operation ProvidePrescription ERP Input-Parameters"
* insert Meta
* parameter 1..
  * name MS
  * name = "rxPrescription"
  * value[x] 0..0
  * resource 0..0
  * part 6..6 MS
    * ^slicing.discriminator.type = #pattern
    * ^slicing.discriminator.path = "name"
    * ^slicing.rules = #open
  * part contains
    prescriptionId 1..1 and
    authoredOn 1..1 and
    medicationRequest 1..1 and
    medication 1..1 and
    organization 1..1 and
    practitioner 1..1
  * part[prescriptionId]
    * name MS
    * name = "prescriptionId"
    * value[x] 1..1
    * value[x] only EPAeRPPrescriptionId
    * resource 0..0
    * part 0..0 
  * part[authoredOn]
    * name MS
    * name = "authoredOn"
    * value[x] 1..1
    * value[x] only date
    * resource 0..0
    * part 0..0 
  * part[medicationRequest]
    * name MS
    * name = "medicationRequest"
    * value[x] 0..0
    * resource 1..1
    * resource only EPAMedicationRequest
    * part 0..0 
  * part[medication]
    * name MS
    * name = "medication"
    * value[x] 0..0
    * resource 1..1
    * resource only EPAMedication
    * part 0..0 
  * part[organization]
    * name MS
    * name = "organization"
    * value[x] 0..0
    * resource 1..1
    * resource only OrganizationDirectory
    * part 0..0 
  * part[practitioner]
    * name MS
    * name = "practitioner"
    * value[x] 0..0
    * resource 1..1
    * resource only PractitionerDirectory
    * part 0..0 