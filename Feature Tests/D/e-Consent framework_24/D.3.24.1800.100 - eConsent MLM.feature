Feature: User Interface: The system shall support the e-Consent Framework to display a consent form in a specific language.

 As a REDCap end user
 I want to see that eConsent is functioning as expected

    Scenario: D.3.24.1800.100 eConsent MLM
      #SETUP
      Given I login to REDCap with the user "Test_Admin"
      And I create a new project named "D.3.24.1800.100" by clicking on "New Project" in the menu bar, selecting "Practice / Just for fun" from the dropdown, choosing file "CTSIBMICCanonicalProject.xml", and clicking the "Create Project" button

      #SETUP
      Given I click on the link labeled "Designer"
      #button labeled e-Consent and PDF Snapshots, but is not defined yet
      When I click on the button labeled "e-Consent"
      And I click on the button labeled "Enable the e-Consent Framework for a survey"
      And I select "\"eConsent - ICF\" (econsent_icf)" on the dropdown field labeled "-- select a survey --"
      And I select "first_name" on the dropdown field labeled "First name field:"
      And I select "last_name" on the dropdown field labeled "Last name field:"
      And I select "sig \"Signature\"" on the dropdown field labeled "Signature field #1:"
      And I click on the button labeled "Save settings"
      ##VERIFY
      Then I should see "Saved!"
      
      #SETUP ENGLISH 
      When I click on the link labeled "Add consent form"
      And I enter "1.0" into the field with the placeholder text of "1.0" 
      And I select "pg1_v1 \"Page 1 Version 1\"" on the dropdown field labeled "Placement of consent form:"
      And I select "English" on the dropdown field labeled "Display for specific language:"
      #Need step definition for textarea below
      And I enter "Consent example English" into the textarea field labeled "Consent Form (Rich Text)" in the dialog box
      And I click on the button labeled "Add new consent form"
      ##VERIFY
      Then I should see "The consent form was successfully added!"
      
      #SETUP SPANISH
      When I click on the link labeled "Add consent form"
      And I enter "1.0" into the field with the placeholder text of "1.0" 
      And I select "pg1_v1 \"Page 1 Version 1\"" on the dropdown field labeled "Placement of consent form:"
      And I select "Spanish" on the dropdown field labeled "Display for specific language:"
      #Need step definition for textarea below
      And I enter "Ejemplo de consentimiento en español" into the textarea field labeled "Consent Form (Rich Text)" in the dialog box
      And I click on the button labeled "Add new consent form"
      ##VERIFY
      Then I should see "The consent form was successfully added!"

      #SETUP_PRODUCTION
      Given I click on the link labeled "Project Setup"
      And I click on the button labeled "Move project to production"
      And I click on the radio labeled "Keep ALL data saved so far" in the dialog box
      And I click on the button labeled "YES, Move to Production Status" in the dialog box to request a change in project status
      Then I should see Project status: "Production"

      #FUNCTIONAL REQUIREMENT
      ##ACTION: Open consent form in English
      When I click on the link labeled "Add / Edit Records"
      And I select "1 Tester 123" on the dropdown field labeled "Choose an existing Record ID"
      And I click the bubble to add a record for the "Screening" longitudinal instrument on event "Screening"
      And I enter "test@test.com" into the data entry form field labeled "Email Address for eConsent"
      And I select the radio option "English" for the field labeled "Preferred Language for Consent"
      And I select the radio option "Email invitation" for the field labeled "Preferred Contact Method"
      And I select the submit option labeled "Save & Exit Form" on the Data Collection Instrument
      And I click the bubble to add a record for the "eConsent - ICF" longitudinal instrument on event "Screening"
      And I click on the button labeled "Survey options"
      And I click on the survey option label containing "Open survey" label
      ##VERIFY
      Then I should see "Consent example English"

      #FUNCTIONAL REQUIREMENT
      ##ACTION: Open consent form in Spanish
      Given I login to REDCap with the user "Test_Admin"
      When I click on the link labeled "My Projects"
      And I click on the link labeled "D.3.24.1800.100"      
      And I click on the link labeled "Add / Edit Records"
      And I click on the button labeled "Add new record"
      And I click the bubble to add a record for the "Screening" longitudinal instrument on event "Screening"
      And I enter "test@test.com" into the data entry form field labeled "Email Address for eConsent"
      And I select the radio option "Spanish" for the field labeled "Preferred Language for Consent"
      And I select the radio option "Email invitation" for the field labeled "Preferred Contact Method"
      And I select the submit option labeled "Save & Exit Form" on the Data Collection Instrument
      And I click the bubble to add a record for the "eConsent - ICF" longitudinal instrument on event "Screening"
      And I click on the button labeled "Survey options"
      And I click on the survey option label containing "Open survey" label
      ##VERIFY
      Then I should see "Ejemplo de consentimiento en español"
