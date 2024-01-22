Profile: EPAOpProvideDispensationERPInputParameters
Parent: Parameters
Id: epa-op-provide-dispensation-erp-input-parameters
Title: "EPA Operation ProvideDispensationERP Input-Parameter"
Description: "EPA Operation ProvideDispensationERP Input-Parameter"
* insert Meta
* parameter 1..
  * name MS
  * name = "RxDispensation"
  * value[x] 0..0
  * resource 0..0
  * part 5.. MS
    * ^slicing.discriminator.type = #pattern
    * ^slicing.discriminator.path = "$this"
    * ^slicing.rules = #open
  * part contains
    PrescriptionId 1..1 and
    authoredOn 1..1 and
    MedicationDispense 1.. and
    Medication 1.. and
    Organization 1..1
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
  * part[MedicationDispense]
    * name MS
    * name = "MedicationDispense"
    * value[x] 0..0
    * resource 1..1
    * resource only EPAMedicationDispense
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
