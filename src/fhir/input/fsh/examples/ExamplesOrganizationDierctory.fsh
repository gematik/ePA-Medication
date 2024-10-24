Alias: $ContactEntityTypeCS = http://terminology.hl7.org/CodeSystem/contactentity-type

Instance: ExampleParametersOrganizationDirectory1
InstanceOf: OrganizationDirectory
Description: "Example of an Organization as to be found in gematik FHIR Directory"
Usage: #inline
* id = "be51e0d2-783d-4e21-b16b-1a4cd7403515"
* meta.tag[Origin] = Origin#ldap
* identifier[TelematikID].value = "9-2.58.00000040"
* active = true
* type = OrganizationProfessionOID#1.2.276.0.76.4.58 "Betriebsstätte gematik"
* name = "gematik GmbH"
* active = true
* alias = "gematik"
* address.text = """gematik GmbH
Friedrichstr. 136, 
10117 Berlin"""
* address
  * line[+] = "Friedrichstr. 136"
  * city = "Berlin"
  * district = "Mitte"
  * state = "Berlin"
  * postalCode = "10117"
  * country = "DE"
* contact
  * purpose = $ContactEntityTypeCS#ADMIN
  * name.text = "gematik ITSM"
  * telecom[+].system = #email
  * telecom[=].value = "betrieb@gematik.de"



Instance: ExampleParametersOrganizationDirectory2
InstanceOf: OrganizationDirectory
Description: "Example of an Organization as to be found in gematik FHIR Directory"
Usage: #inline
* id = "151f1697-7512-4e21-9466-1b75207475d8"
* meta.tag[Origin] = Origin#ldap
* identifier[TelematikID].value = "9-2.58.00000040"
* active = true
* type = OrganizationProfessionOID#1.2.276.0.76.4.54 "Öffentliche Apotheke"
* name = "gematik Apotheke"
* active = true
* alias = "Apotheke"
* address.text = """gematik Apotheke
Friedrichstr. 136, 
10117 Berlin"""
* address
  * line[+] = "Friedrichstr. 136"
  * city = "Berlin"
  * district = "Mitte"
  * state = "Berlin"
  * postalCode = "10117"
  * country = "DE"
* contact
  * purpose = $ContactEntityTypeCS#ADMIN
  * name.text = "gematik ITSM"
  * telecom[+].system = #email
  * telecom[=].value = "betrieb@gematik.de"