Profile: EPAOpCancelPrescriptionERPInputParameters
Parent: Parameters
Id: epa-op-cancel-prescription-erp-input-parameters
Title: "EPA Operation CancelPrescriptionERP Input-Parameter"
Description: "EPA Operation CancelPrescriptionERP Input-Parameter"
* insert Meta
* parameter 1..
  * name MS
  * name = "RxPrescription"
  * value[x] 0..0
  * resource 0..0
  * part 2..2 MS
    * ^slicing.discriminator.type = #pattern
    * ^slicing.discriminator.path = "$this"
    * ^slicing.rules = #open
  * part contains
    PrescriptionId 1..1 and
    authoredOn 1..1
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
