Extension: DrugCategoryExtension
Id: drug-category-extension
Description: "Extension for indicating the medication category."
* insert Meta

* value[x] only Coding
  * ^slicing.discriminator.type = #type
  * ^slicing.discriminator.path = "$this"
  * ^slicing.rules = #open
* value[x] contains valueCoding 1..1
* valueCoding 1..
* valueCoding only Coding
* valueCoding from EPADrugCategoryVS (required)
  * code ^short = "Category"
  * code ^definition = "Drug Category"
