Extension: MedicationIngredientDarreichungsformExtension
Id: medication-ingredient-darreichungsform-extension
Description: "Dosage form of an ingredient in a formulation."
* insert Meta

* value[x] only string
  * ^slicing.discriminator.type = #type
  * ^slicing.discriminator.path = "$this"
  * ^slicing.rules = #open
* value[x] contains valueString 1..1
* valueString 1..
* valueString only string
  * ^short = "Dosage form of an ingredient in a formulation."
  * ^definition = "The dosage form as free text can be used if the ingredient in the formulation is not a finished medicinal product."
  * ^maxLength = 30