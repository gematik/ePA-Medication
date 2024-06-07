Extension: MedicationTotalQuantityFormulationExtension
Id: medication-total-quantity-formulation-extension
Description: "Total quantity of the formulation (without the unit)."
* insert Meta

* value[x] only string
  * ^slicing.discriminator.type = #type
  * ^slicing.discriminator.path = "$this"
  * ^slicing.rules = #open
* value[x] contains valueString 1..1
* valueString 1..
* valueString only string
  * ^short = "Total quantity of the formulation."
  * ^definition = "Total quantity of the formulation (without the unit)."
  * ^maxLength = 7