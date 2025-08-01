<img align="right" width="250" height="47" src="images/Gematik_Logo_Flag_With_Background.png"/> <br/>    
 
# Release Notes ePA Medication
## information
This version 3.1.3 is the logically subsequent version of version 3.0.5 and incorporates the latest fixes and maintenance changes and also selected changes published for the intermediate release 3.1.2.
## Release 3.1.3 RC
### changes
- removed concept (now integrated in concept in epa-basic)
- removed outdated UML files
## Release 3.1.2
- release ePA-3.1.2
## Release 3.1.2 RC.1
### changes
- removed disclaimer
## Release 3.1.2 RC
### changes
- reduced content to concept and tools only for ePA-3.1.2
## Release 3.1.0
- release ePA-3.1.0
### changes
- incorporation of review comments
## Release 3.1.0 RC
- release candidate ePA-3.1.0
### changes
- eMP (medication plan) support
- support for dispensation without prescription
- medication management
- AMTS-rZI management
- FHIR Operation eML / eMP
- added example for the prescription process
- moved IG to simplifier
- moved FHIR R4 profiles to simplifier.net
## Release 3.0.2
- release ePA-3.0.2
### changes
- added error 409 for operation renderEMLAsHTML
- bugfix parameter validation and context removed from extensions
- additional FHIR Medication profiles
- bugfix openAPI search parameters
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
