Extension: MedicationIsVaccineExtension
Id: medication-id-vaccine-extension
Description: "Indicator of whether this is a vaccine."
Context: Medication
* insert Meta

* value[x] only boolean
  * ^slicing.discriminator.type = #type
  * ^slicing.discriminator.path = "$this"
  * ^slicing.rules = #open
* value[x] contains valueBoolean 1..1
* valueBoolean 1..
* valueBoolean only boolean
* valueBoolean ^short = "Vaccine Indicator"
* valueBoolean ^definition = """
    Indicator of whether this is a vaccine..
    \r\n\r\nfalse - no vaccine (default value)
    \r\ntrue - vaccine
"""
