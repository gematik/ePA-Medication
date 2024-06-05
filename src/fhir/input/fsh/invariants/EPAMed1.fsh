Invariant: epa-med-1
Description: "Medication code, name, or ingredients must be specified"
Severity: #error
Expression: "code.exists() or ingredient.exists()"