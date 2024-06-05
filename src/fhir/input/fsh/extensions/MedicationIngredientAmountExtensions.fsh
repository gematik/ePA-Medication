Extension: MedicationIngredientAmountExtensions
Id: medication-ingredient-amount-extension
Description: "Free-text amount of the ingredient for classical Latin notations such as \"ad 100.0\" or \"quantum satis,\" including the unit."
Context: Medication
* insert Meta

* value[x] only string
  * ^slicing.discriminator.type = #type
  * ^slicing.discriminator.path = "$this"
  * ^slicing.rules = #open
* value[x] contains valueString 1..1
* valueString 1..
* valueString only string
  * ^short = "Free-text amount of an ingredient in a formulation."
  * ^definition = "Free-text amount of the ingredient for classical Latin notations such as \"ad 100.0\" or \"quantum satis,\" including the unit."
  * ^maxLength = 20
