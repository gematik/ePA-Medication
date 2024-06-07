Extension: MedicationFormulationPackagingExtension
Id: medication-formulation-packaging-extension
Description: "Information on the packaging of a formulation."
* insert Meta

* value[x] only string
  * ^slicing.discriminator.type = #type
  * ^slicing.discriminator.path = "$this"
  * ^slicing.rules = #open
* value[x] contains valueString 1..1
* valueString 1..
* valueString only string
  * ^short = "Packaging of a formulation."
  * ^definition = "Information on transport containers or packaging for a formulation."
  * ^maxLength = 90