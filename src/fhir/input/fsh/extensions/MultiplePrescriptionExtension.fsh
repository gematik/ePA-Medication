Extension: MultiplePrescriptionExtension
Id: multiple-prescription-extension
Title: "MultiplePrescription"
Description: "This FHIR Extension for multiple prescriptions adds details such as repetition count and time intervals for repeated medication orders to FHIR resources."
Context: MedicationRequest
* insert Meta
* value[x] 0..0
* extension 1..
  * ^slicing.discriminator.type = #value
  * ^slicing.discriminator.path = "url"
  * ^slicing.rules = #closed
* extension contains
    indicator 1..1 and 
    counter 0..1 and
    period 0..1 and
    id 0..1
* extension[indicator] 
  * value[x] only boolean
  * valueBoolean 1..
  * valueBoolean ^short = "Multiple Prescription Indicator"
  * valueBoolean ^definition = "Indicator of whether the current prescription is part of a multiple prescription\r\n\r\ntrue - the current prescription is part of a multiple prescription \r\nfalse - the current prescription is not part of a multiple prescription"
* extension[counter] 
  * value[x] only Ratio
  * valueRatio 1..
  * valueRatio.numerator 1..
  * valueRatio.numerator.value 1..
  * valueRatio.numerator.value ^short = "Multiple Prescription Counter"
  * valueRatio.numerator.value ^definition = "The field serves to indicate which number in a series of multiple prescriptions it is. Example: \"2\" in \"2 out of 4\""
  * valueRatio.numerator.comparator ..0
  * valueRatio.numerator.unit ..0
  * valueRatio.numerator.system ..0
  * valueRatio.numerator.code ..0
  * valueRatio.denominator 1..
  * valueRatio.denominator.value 1..
  * valueRatio.denominator.value ^short = "Denominator of Multiple Prescription Series"
  * valueRatio.denominator.value ^definition = "The field serves to indicate the length of this series. Example: \"4\" in \"2 out of 4\""
  * valueRatio.denominator.comparator ..0
  * valueRatio.denominator.unit ..0
  * valueRatio.denominator.system ..0
  * valueRatio.denominator.code ..0
* extension[period]
  * ^short = "Redemption Period"
  * value[x] 1..
  * value[x] only Period
  * valuePeriod 1..
  * valuePeriod only Period
  * valuePeriod obeys -limitationDateStart and -limitationDateEnd
    * start 1..
    * start ^short = "Start Date of the Prescription Redemption Period"
    * start ^definition = "Date from which the partial prescription of the multiple prescription can be redeemed"
    * end ^short = "End Date of the Prescription Redemption Period"
    * end ^definition = "Date of the last redemption day for the partial prescription within the multiple prescription series. \nThe issuer may specify a redemption period different from the one outlined in the Medicinal Products Prescription Ordinance (AMVV)"
* extension[id]
  * value[x] 1..
  * value[x] only Identifier
  * valueIdentifier only Identifier
    * use ..0
    * type ..0
    * system = "urn:ietf:rfc:3986" (exactly)
    * system ^short = "Specification as UUID"
    * value ^short = "Multiple Prescription ID"
    * value ^definition = "A unique ID that is identical across all partial prescriptions of a multiple prescription."
    * period ..0
    * assigner ..0

Invariant: -limitationDateStart
Description: "Limitation of the date format to 10 characters YYYY-MM-DD"
* severity = #error
* expression = "start.toString().length()=10"

Invariant: -limitationDateEnd
Description: "Limitation of the date format to 10 characters YYYY-MM-DD"
* severity = #error
* expression = "end.exists().not() or end.toString().length()=10"