Profile: EPAOpRxDispensationERPOutputParameters
Parent: Parameters
Id: epa-op-rx-dispensation-erp-output-parameters
Title: "EPA Operation RxDispensation ERP Output-Parameters"
Description: "EPA Operation RxDispensation ERP Output-Parameters"
* insert Meta
* parameter 1..
  * name MS
  * name = "rxDispensation"
  * value[x] 0..0
  * resource 0..0
  * part 3..3 MS
    * ^slicing.discriminator.type = #pattern
    * ^slicing.discriminator.path = "name"
    * ^slicing.rules = #open
  * part contains
    prescriptionId 1..1 and
    authoredOn 1..1 and
    operationOutcome 1..1
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
  * part[operationOutcome]
    * name MS
    * name = "operationOutcome"
    * value[x] 0..0
    * resource 1..1
    * resource only EPAMSOperationOutcome
    * part 0..0 