Alias: $version = 1.0.2-rc1
RuleSet: Meta
* ^version = $version
* ^status = #active
* ^experimental = false
* ^publisher = "gematik GmbH"
* ^date = "2024-06-07"

RuleSet: MetaInst
* version = $version
* status = #active
* publisher = "gematik GmbH"
* date = "2024-06-07"

RuleSet: ProfileMeta
* meta MS
  * versionId MS
  * lastUpdated MS

RuleSet: Subject
* subject 1..1 MS
* subject only Reference(Patient)
  * identifier MS
  * identifier only IdentifierKvid10