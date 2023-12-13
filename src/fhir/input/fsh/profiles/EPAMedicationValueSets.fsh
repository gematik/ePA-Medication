ValueSet: KBVMedicationTypeVS
Id: kbv-medication-type-vs
Title: "KBV Medication Type VS"
Description: "Include all VS of KBV Medication Type"
* insert Meta
* include codes from system $kbv-medication-type-cs

ValueSet: KBVMedicationDarreichungsformVS
Id: kbv-medication-darreichungsform-vs
Title: "KBV Medication Darreichungsform VS"
Description: "Include all VS of KBV MedicationDarreichungsform Type"
* insert Meta
* include codes from system $kbv-medication-darreichungsform

ValueSet: EPAMedicationDispenseVS
Id: epa-medication-dispense-vs
Title: "EPA Medication Dispense VS"
Description: "Include all VS of KBV MedicationDarreichungsform Type"
* insert Meta
* medicationdispense-status#completed
* medicationdispense-status#declined
* medicationdispense-status#cancelled

ValueSet: EPAMedicationRequestVS
Id: epa-medication-request-vs
Title: "EPA Medication Request VS"
Description: "Include all VS of KBV MedicationDarreichungsform Type"
* insert Meta
* medicationdispense-status#active
* medicationdispense-status#completed
* medicationdispense-status#cancelled

ValueSet: OperationErrorCodesVS
Id: operation-error-codes-vs
Title: "Operation Error Codes VS"
Description: "Include all VS of OperationErrorCodesCS"
* insert Meta
* include codes from system OperationErrorCodesCS