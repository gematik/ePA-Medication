Profile: EPAOpCancelDispensationERPInputParameters
Parent: Parameters
Id: epa-op-cancel-dispensation-erp-input-parameters
Title: "EPA Operation CancelDispensation ERP Input-Parameters"
Description: "EPA Operation CancelDispensation ERP Input-Parameters"
* insert Meta
* parameter 1..
* parameter ^slicing.discriminator.type = #value
* parameter ^slicing.discriminator.path = "name"
* parameter ^slicing.rules = #closed
* parameter contains rxDispensation 1..1
* parameter[rxDispensation]
  * name MS
  * name = "rxDispensation" (exactly)
  * value[x] 0..0
  * resource 0..0
  * part 2..2 MS
    * ^slicing.discriminator.type = #pattern
    * ^slicing.discriminator.path = "name"
    * ^slicing.rules = #open
  * part contains
    prescriptionId 1..1 and
    authoredOn 1..1
  * part[prescriptionId]
    * name MS
    * name = "prescriptionId" (exactly)
    * value[x] 1..1
    * value[x] only EPAeRPPrescriptionId
    * resource 0..0
    * part 0..0 
  * part[authoredOn]
    * name MS
    * name = "authoredOn" (exactly)
    * value[x] 1..1
    * value[x] only date
    * resource 0..0
    * part 0..0 
