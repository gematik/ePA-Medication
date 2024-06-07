Profile: EPAOpRxPrescriptionERPOutputParameters
Parent: Parameters
Id: epa-op-rx-prescription-erp-output-parameters
Title: "EPA Operation RxPrescription ERP Output-Parameters"
Description: "EPA Operation RxPrescription ERP Output-Parameters"
* insert Meta
* parameter 1..
* parameter ^slicing.discriminator.type = #value
* parameter ^slicing.discriminator.path = "name"
* parameter ^slicing.rules = #closed
* parameter contains rxPrescription 1..1
* parameter[rxPrescription]
  * name MS
  * name = "rxPrescription" (exactly)
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