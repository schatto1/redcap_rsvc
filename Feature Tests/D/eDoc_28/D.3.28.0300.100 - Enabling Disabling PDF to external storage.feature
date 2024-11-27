Feature: eDocs: The system shall allow project level enabling or disabling to store non-e-Consent governed PDF Snapshots on the External Storage server if the snapshot contains a completed e-Consent response

 As a REDCap end user
 I want to see that system allows enabling/disabling non-e-consent PDF snapshots to be saved to external storage if an e-consent form is included.
 #This feature is to be run completely MANUALLY on the REDCap Shadow instance

  Scenario: D.3.28.0300.100 Enabling/Disabling PDF to external storage 
    #SETUP
    Given I login to REDCap Shadow with an Admin account
    And I create a new project named "D.3.28.0300.100" by clicking on "New Project" in the menu bar, selecting "Practice / Just for fun" from the dropdown, choosing file "CTSIBMICCanonicalProject.xml", and clicking the "Create Project" button

    #SETUP_PRODUCTION
    ##REDUNDANT: D.3.24.3100.100
    Given I click on the link labeled "Designer"
    And I click on the button labeled "e-Consent and PDF Snapshots"
    And I click on the link labeled "PDF Snapshots of Records"
    And I click on the button labeled "Add new trigger"
    And I enter "Non-consent Test" into the field with the placeholder text of "Add optional title" 
    And I select "\"eConsent - ICF\" - [Any Event]" on the dropdown field labeled "---select a survey---" in Step 1
    And I click on the pencil icon in Step 2
    And I click on the link labeled "deselect all"
    And I select the checkbox option "eConsent - ICF" for the field labeled "[Any Event]" 
    And I select the checkbox option "Prescreening" for the field labeled "[Any Event]" 
    And I click on the button labeled "Update"
    And I select the checkbox option "Save to File Repository" in Step 3
    And I enter "[project-id]_Prescreening_ICF_[record-name]" into the field with the placeholder text of "pid[project-id]_form[instrument-label]_id[record-name]" in Step 4
    And I click on the button labeled "Save"
    Then I should see "Saved!"

    #FUNCTIONAL REQUIREMENT
    ##ACTION: create record
    When I click on the link labeled "Add / Edit Records"
    And I click on the button labeled "Add new record"
    And I click the bubble to add a record for the "Prescreening" longitudinal instrument on event "Screening"
    And I enter "Bilbo Baggins" into the data entry form field labeled "Preferred Name" 
    And I select the submit option labeled "Save & Exit Form" on the Data Collection Instrument
    ##VERIFY
    Then I should see "Record ID 2 successfully added"

    ##ACTION: create consent
    When I click the bubble to add a record for the "eConsent - ICF" longitudinal instrument on event "Screening"
    And I click on the button labeled "Survey options"
    And I click on the survey option label containing "Open survey" label
    And I enter a signature into the signature field
    And I click on the button labeled "Next Page >>"
    And I check the checkbox labeled "I certify that all of my information in the document above is correct" 
    And I click on the button labeled "Submit"
    And I click on the button labeled "Close survey"

    #FUNCTIONAL REQUIREMENT
    ##VERIFY: check external storage
    Given I open a new terminal window
    And I SSH to "redwood.chpc.utah.edu"
    And I SSH to "redwood.chpc.utah.edu"
    And I CD to "/uufs/chpc.utah.edu/common/HIPAA/proj_redcap_vault/shadow/"
    And I run the command "ls -Art | tail -n 3"
    Then I should see a row containing "Prescreening_ICF_2"
    And I should see a row containing "formeConsent-ICF_id2"

    #FUNCTIONAL REQUIREMENT
    ##ACTION: disable external file storage for non-consent PDF snapshots
    Given I login to REDCap Shadow with an Admin account
    And I click on the link labeled "My Projects"
    And I click on the link labeled "D.3.28.0300.100"
    And I click on the link labeled "Edit Project Settings"
    And I select "Disabled" on the dropdown field labeled "Store non-e-Consent governed PDF Snapshots on the External Storage server if the snapshot contains a completed e-Consent response."
    And I click on the button labeled "Save Changes"
    Then I see "Your changes have been saved!"

    #FUNCTIONAL REQUIREMENT
    ##ACTION: create record 2
    And I click on the link labeled "D.3.28.0300.100"
    And I click on the link labeled "Add / Edit Records"
    And I click on the button labeled "Add new record"
    And I click the bubble to add a record for the "Prescreening" longitudinal instrument on event "Screening"
    And I enter "Frodo Baggins" into the data entry form field labeled "Preferred Name" 
    And I select the submit option labeled "Save & Exit Form" on the Data Collection Instrument
    ##VERIFY
    Then I should see "Record ID 3 successfully added"

    ##ACTION: create consent 2
    When I click the bubble to add a record for the "eConsent - ICF" longitudinal instrument on event "Screening"
    And I click on the button labeled "Survey options"
    And I click on the survey option label containing "Open survey" label
    And I enter a signature into the signature field
    And I click on the button labeled "Next Page >>"
    And I check the checkbox labeled "I certify that all of my information in the document above is correct" 
    And I click on the button labeled "Submit"
    And I click on the button labeled "Close survey"

    #FUNCTIONAL REQUIREMENT
    ##VERIFY: check external storage
    Given I open a new terminal window
    And I SSH to "redwood.chpc.utah.edu"
    And I SSH to "redcap-c7.ccts.utah.edu"
    And I CD to "/uufs/chpc.utah.edu/common/HIPAA/proj_redcap_vault/shadow/"
    And I run the command "ls -Art | tail -n 3"
    Then I should NOT see a row containing "Prescreening_ICF_3"
    And I should see a row containing "formeConsent-ICF_id3"
#END