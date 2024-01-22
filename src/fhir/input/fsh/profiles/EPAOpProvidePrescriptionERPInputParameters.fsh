Profile: EPAOpProvidePrescriptionERPInputParameters
Parent: Parameters
Id: epa-op-provide-prescription-erp-input-parameters
Title: "EPA Operation ProvidePrescriptionERP Input-Parameter"
Description: "EPA Operation ProvidePrescriptionERP Input-Parameter"
* insert Meta
* parameter 1..
  * name MS
  * name = "RxPrescription"
  * value[x] 0..0
  * resource 0..0
  * part 6..6 MS
    * ^slicing.discriminator.type = #pattern
    * ^slicing.discriminator.path = "$this"
    * ^slicing.rules = #open
  * part contains
    PrescriptionId 1..1 and
    authoredOn 1..1 and
    MedicationRequest 1..1 and
    Medication 1..1 and
    Organization 1..1 and
    Practitioner 1..1
  * part[PrescriptionId]
    * name MS
    * name = "PrescriptionId"
    * value[x] 1..1
    * value[x] only GEM_ERP_PR_PrescriptionId
    * resource 0..0
    * part 0..0 
  * part[authoredOn]
    * name MS
    * name = "authoredOn"
    * value[x] 1..1
    * value[x] only date
    * resource 0..0
    * part 0..0 
  * part[MedicationRequest]
    * name MS
    * name = "MedicationRequest"
    * value[x] 0..0
    * resource 1..1
    * resource only EPAMedicationRequest
    * part 0..0 
  * part[Medication]
    * name MS
    * name = "Medication"
    * value[x] 0..0
    * resource 1..1
    * resource only EPAMedication
    * part 0..0 
  * part[Organization]
    * name MS
    * name = "Organization"
    * value[x] 0..0
    * resource 1..1
    * resource only OrganizationDirectory
    * part 0..0 
  * part[Practitioner]
    * name MS
    * name = "Practitioner"
    * value[x] 0..0
    * resource 1..1
    * resource only PractitionerDirectory
    * part 0..0 