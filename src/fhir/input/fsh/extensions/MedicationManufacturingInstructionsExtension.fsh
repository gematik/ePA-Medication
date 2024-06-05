Extension: MedicationManufacturingInstructionsExtension
Id: medication-manufacturing-instructions-extension
Description: "Manufacturing instructions regarding the preparation of a formulation (Subscriptio)."
Context: Medication
* insert Meta

* value[x] only string
  * ^slicing.discriminator.type = #type
  * ^slicing.discriminator.path = "$this"
  * ^slicing.rules = #open
* value[x] contains valueString 1..1
* valueString 1..
* valueString only string
  * ^short = "Manufacturing instructions for a formulation."
  * ^definition = "Manufacturing instructions regarding the preparation of a formulation (Subscriptio)."
  * ^maxLength = 500