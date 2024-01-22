Profile: EPAOpRxDispensationERPOutputParameters
Parent: Parameters
Id: epa-op-rx-dispensation-erp-output-parameters
Title: "EPA Operation RxDispensationnERP Output-Parameter"
Description: "EPA Operation RxDispensationERP Output-Parameter"
* insert Meta
* parameter 1..
  * name MS
  * name = "RxDispensation"
  * value[x] 0..0
  * resource 0..0
  * part 3..3 MS
    * ^slicing.discriminator.type = #pattern
    * ^slicing.discriminator.path = "$this"
    * ^slicing.rules = #open
  * part contains
    PrescriptionId 1..1 and
    authoredOn 1..1 and
    OperationOutcome 1..1
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
  * part[OperationOutcome]
    * name MS
    * name = "OperationOutcome"
    * value[x] 0..0
    * resource 1..1
    * resource only EPAMSOperationOutcome
    * part 0..0 