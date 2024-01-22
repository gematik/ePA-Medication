Profile: EPAMSOperationOutcome
Parent: OperationOutcome
Id: epa-ms-operation-outcome
Title: "EPA Medication Service OperationOutcome"
Description: "Defines the operation outcome for the Medication Service in the ePA system."
* insert Meta
* issue.severity MS
* issue.code MS
* issue.details 1..1 MS
* issue.details from EPAMSOperationOutcomeVS