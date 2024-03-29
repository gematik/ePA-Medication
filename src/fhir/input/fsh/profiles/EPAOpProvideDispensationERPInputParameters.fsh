Profile: EPAOpProvideDispensationERPInputParameters
Parent: Parameters
Id: epa-op-provide-dispensation-erp-input-parameters
Title: "EPA Operation ProvideDispensation ERP Input-Parameters"
Description: "EPA Operation ProvideDispensation ERP Input-Parameters"
* insert Meta
* parameter 1..
  * name MS
  * name = "rxDispensation"
  * value[x] 0..0
  * resource 0..0
  * part 4.. MS
    * ^slicing.discriminator.type = #pattern
    * ^slicing.discriminator.path = "name"
    * ^slicing.rules = #open
  * part contains
    prescriptionId 1..1 and
    authoredOn 1..1 and
    medicationDispense 1.. and
    medication 0.. and
    organization 1..1
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
  * part[medicationDispense]
    * name MS
    * name = "medicationDispense"
    * value[x] 0..0
    * resource 1..1
    * resource only EPAMedicationDispense
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
