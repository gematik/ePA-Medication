Invariant: epa-med-3
Description: "Medicinal product medications (Fertigarzneimittel) are not allowed to reference other medications via .ingredient.itemReference"
Severity: #error
Expression: "extension('https://gematik.de/fhir/epa-medication/StructureDefinition/epa-medication-type-extension').value.where(code = '781405001').exists() and form.coding.where(code = 'KPG').exists().not() implies ingredient.item.ofType(Reference).exists().not()"
