Invariant: epa-med-2
Description: "Extemporaneous preparation medications and 'Kombipackungen' have to reference their components via .ingredient.itemReference"
Severity: #error
Expression: "extension('https://gematik.de/fhir/epa-medication/StructureDefinition/epa-medication-type-extension').value.where(code = '1208954007').exists() or form.coding.where(code = 'KPG').exists() implies ingredient.item.ofType(Reference).exists()"
