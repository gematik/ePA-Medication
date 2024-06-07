Extension: MultiplePrescriptionExtension
Id: multiple-prescription-extension
Title: "MultiplePrescription"
Description: "This FHIR Extension for multiple prescriptions adds details such as repetition count and time intervals for repeated medication orders to FHIR resources."
* insert Meta

* extension ^slicing.discriminator.type = #value
* extension ^slicing.discriminator.path = "url"
* extension ^slicing.rules = #closed
* extension contains
    indicator 0..1 and 
    counter 0..1 and
    period 0..1 and
    id 0..1
* extension[indicator]
  * value[x] 1..
  * value[x] only boolean
  * value[x] ^slicing.discriminator.type = #type
  * value[x] ^slicing.discriminator.path = "$this"
  * value[x] ^slicing.rules = #closed
  * value[x] contains valueBoolean 1..1
  * valueBoolean 1..
  * valueBoolean only boolean
  * valueBoolean ^short = "Multiple Prescription Indicator"
  * valueBoolean ^definition = "Indicator of whether the current prescription is part of a multiple prescription\r\n\r\ntrue - the current prescription is part of a multiple prescription \r\nfalse - the current prescription is not part of a multiple prescription"

* extension[counter]
  * value[x] 1..
  * value[x] only Ratio
  * value[x] ^slicing.discriminator.type = #type
  * value[x] ^slicing.discriminator.path = "$this"
  * value[x] ^slicing.rules = #closed
  * value[x] contains valueRatio 1..1
  * valueRatio 1..
  * valueRatio only Ratio
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
  * ^short = "Zeitraum der Einlösefrist"
  * value[x] 1..
  * value[x] only Period
  * value[x] ^slicing.discriminator.type = #type
  * value[x] ^slicing.discriminator.path = "$this"
  * value[x] ^slicing.rules = #closed
  * value[x] contains valuePeriod 1..1
  * valuePeriod 1..
  * valuePeriod only Period
  * valuePeriod obeys -limitationDateStart and -limitationDateEnd
  * valuePeriod.start 1..
  * valuePeriod.start ^short = "Start Date of the Prescription Redemption Period"
  * valuePeriod.start ^definition = "Date from which the partial prescription of the multiple prescription can be redeemed"
  * valuePeriod.end ^short = "End Date of the Prescription Redemption Period"
  * valuePeriod.end ^definition = "Date of the last redemption day for the partial prescription within the multiple prescription series. \nThe issuer may specify a redemption period different from the one outlined in the Medicinal Products Prescription Ordinance (AMVV)"

* extension[id]
  * value[x] 1..
  * value[x] only Identifier
  * value[x] ^slicing.discriminator.type = #type
  * value[x] ^slicing.discriminator.path = "$this"
  * value[x] ^slicing.rules = #closed
  * value[x] contains valueIdentifier 1..1
  * valueIdentifier only Identifier
  * valueIdentifier.use ..0
  * valueIdentifier.type ..0
  * valueIdentifier.system = "urn:ietf:rfc:3986" (exactly)
  * valueIdentifier.system ^short = "Specification as UUID"
  * valueIdentifier.value ^short = "Multiple Prescription ID"
  * valueIdentifier.value ^definition = "A unique ID that is identical across all partial prescriptions of a multiple prescription."
  * valueIdentifier.period ..0
  * valueIdentifier.assigner ..0
