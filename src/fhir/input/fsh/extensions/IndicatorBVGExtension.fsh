Extension: IndicatorBVGExtension
Id: indicator-bvg-extension
Description: "Indicator of whether this regulation is made in reference to the 'Bundesentschädigungsgesetz' or the 'Bundesversorgungsgesetz'."
* insert Meta

* value[x] only boolean
* value[x] N
  * ^slicing.discriminator.type = #type
  * ^slicing.discriminator.path = "$this"
  * ^slicing.rules = #open
* value[x] contains valueBoolean 1..1
* valueBoolean 1.. N
* valueBoolean only boolean
* valueBoolean ^short = "BVG"
* valueBoolean ^definition = """
    Indicator of whether this regulation applies to claimants under the 'Bundesentschädigungsgesetz' (BEG) or to claimants under the 'Bundesversorgungsgesetz' (BVG).
    \r\n\r\nfalse - not BVG (default value)
    \r\ntrue - BVG
"""
