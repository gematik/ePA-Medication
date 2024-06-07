Extension: MedicationPackagingSizeExtension
Id: medication-packaging-size-extension
Description: "Specification of the package size according to divided quantity (e.g., 100, 2x25), only appears in conjunction with \"unit\" (e.g., 100 Stück)."
* insert Meta

* value[x] only string
  * ^slicing.discriminator.type = #type
  * ^slicing.discriminator.path = "$this"
  * ^slicing.rules = #open
* value[x] contains valueString 1..1
* valueString 1..
* valueString only string
  * ^short = "Package size according to divided quantity"
  * ^definition = "Specification of the package size according to divided quantity (e.g., 100, 2x25), only appears in conjunction with \"unit\" (e.g., 100 Stück)."
  * ^maxLength = 7