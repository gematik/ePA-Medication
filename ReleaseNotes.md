<img align="right" width="250" height="47" src="images/Gematik_Logo_Flag_With_Background.png"/> <br/>    
 
# Release Notes ePA Medication
## Release 3.0.2-alpha.1
- pre-release ePA-3.0.2
### changes
- added X-Request-ID in order to identify request and response message
- added HTTP Code 400 in I_Medication_Service_FHIR.yaml in case of error
- support for stateid in FHIR-based pagination
- fixed business logics in $provide-prescription-erp and $provide-dispensation-erp
- bugfix UserAgentType pattern (C_11780)
- removed Data-absent-reason from EPAMedicationDispense
- added necessary expansion of the extensions in the ePA profiles for eML (C_11868)
## Release 3.0.1
- release ePA-3.0.1
- (all changes from changelist 'ePAfueralle_3.0.1' and final review)
### changes
- changed profile and operations EPAMedication
- fixed binding for 'kbvDarreichungsform'
## Release 3.0.1 RC
- release candidate ePA-3.0.1
### changes
- Necessary FHIR profile changes for the Medication Service. (C_11716)
## Release 3.0.0
- release ePA-3.0
### changes
- editorial changes
- fixes in epa medication resources
- added sha256 for hash in epa medication guide
## Release 3.0.0 RC
- release candidate ePA-3.0
## Release 0.0.3
- initial content (pre-release ePA-3.0)
## Release 0.0.2
- initial setup branch
## Release 0.0.1
- initial setup repository
