Feature: User Interface: The system shall support the eConsent framework ability to inserti select text fields into the footer of the PDF consent form. Selectors include e-Consent version | First name field | Last name field | e-Consent custom tag/category | Date of birth field.

    As a REDCap end user
    I want to see that eConsent is functioning as expected

    Scenario: C.3.24.205.100 e-Consent text validation

        #SETUP
        Given I login to REDCap with the user "Test_Admin"
        And I create a new project named " C.3.24.205.100" by clicking on "New Project" in the menu bar, selecting "Practice / Just for fun" from the dropdown, choosing file "24EConsentNoSetup.xml", and clicking the "Create Project" button

        #SETUP_PRODUCTION
        When I click on the button labeled "Project Setup"
        And I click on the button labeled "Move project to production"
        And I click on the radio labeled "Keep ALL data saved so far" in the dialog box
        And I click on the button labeled "YES, Move to Production Status" in the dialog box
        Then I should see "Project Status: Production"

        #SETUP_eConsent for participant consent process
        When I click on the button labeled "Designer"
        And I click on the button labeled "e-Consent and PDF Snapshots"
        And I click on the button labeled "+Enable the e-Consent Framework for a survey"
        And I select "Participant Consent" from the dialogue box labeled "Enable e-Consent for a Survey"
        Then I should see a dialogue box labeled "enable e-Consent"

        And I verify I see "version test" in the field labeled "e-Consent version:"
        And I verify I see "select a field" in the field labeled "First name field:"
        And I verify I see "select a field" in the field labeled "Last name field:"
        And I verify I see "select a field" in the field labeled "Date of birth field:"

        And I click the checkbox labeled "Allow e-Consent responses to be edited by users?"
        And I click "f_name" in the field labeled "First name field:"
        And I click "l_name" in the field labeled "Last name field:"
        And I click "dob" in the field labeled "Date of birth field:"
        And I enter "Participant" in the field labeled "e-Consent tag/category:"
        And I enter" PID [project-id] - [l_name]" in the field labeled "Custom label for PDF header"
        And I select "part_sign Particiant signature" for the field labeled "Signature field #1"
        And I select the checkbox labeled "Save to a specific field"
        And I select "participant_file" for the dropdown labeled "select a File Upload field"
        And I click the button labeled "Save settings"
        Then I should see "Saved! E-Consent settings were successfully modified for survey Participant Consent"
        And I should see "Participant Consent"
        #SETUP_eConsent for coordinator signature (second signature) process
        When I click on the button labeled "e-Consent and PDF Snapshots"
        And I click on the button labeled "+Enable the e-Consent Framework for a survey"
        And I select "Coordinator Signature" from the dialogue box labeled "Enable e-Consent for a Survey"
        Then I should see a dialogue box labeled "enable e-Consent"

        And I verify I see "select a field" in the field labeled "First name field:"
        And I verify I see "select a field" in the field labeled "Last name field:"
        And I verify I see "select a field" in the field labeled "Date of birth field:"

        And I click the checkbox labeled "Allow e-Consent responses to be edited by users?"

        And I enter "Coordinator" in the field labeled "e-Consent tag/category:"
        And I enter" PID [project-id] - [l_name]" in the field labeled "Custom label for PDF header"
        And I select "coo_sign1 Coordinator’s signature" for the field labeled "Signature field #1"
        And I select the checkbox labeled "Save to a specific field"
        And I select "coo_sign Coordinator Signature file" for the dropdown labeled "select a File Upload field"
        And I click the button labeled "Save settings"
        Then I should see "Saved! E-Consent settings were successfully modified for survey Participant Consent"
        And I should see "Coordinator Signature"

        #SETUP Trigger to combine the PDFs to one combined PDF
        When I click on the button labeled "PDF Snapshots of Record"
        And I click the button "+Add new trigger"
        And I enter "Combine PDF file" in the box labeled "Name of trigger"
        And I enter "[participant_consent_complete]='2' and [coordinator_signature_complete]='2'"in the box labeled "When the following logic becomes true"
        And I click the checkbox labeled " Save to File Repository"
        And I click the checkbox labeled " Save to specific field"
        And I select "Current event"
        And I select "combo_file Combine both files together" in the dropdown labeled "select a File Upload field"
        And I click "Save"
        Then I should see "Saved! Trigger for PDF Snapshot was successfully modified"

        And I verify the Save to file Repository is selected
        And I verify the Store the translated version of the PDF (if using Multi-language Management) is selected
        And I click on the button labeled "Save Settings"
        Then I should see "Your survey settings were successfully saved!"
        And I should see "Participant Consent"


        #SETUP_eConsent for Coordinators signature
        When I click on the button labeled "+Enable the e-Consent Framework for a survey"
        And I select "Coordinator Signature" from the dialogue box labeled "Enable e-Consent for a Survey"
        Then I should see a dialogue box labeled "enable e-Consent"

        And I verify I see "version test" in the field labeled "e-Consent version:"
        And I verify I see "fname "Name"" in the field labeled "First name field:"
        And I verify I see "lname "Name"" in the field labeled "Last name field:"
        And I verify I see "dob "DOB"" in the field labeled "Date of birth field:"
        And I verify I see "type test" in the field labeled "e-Consent tag/category:"
        And I verify I see "signature_consent "Signature"" in the field labeled "Signature field #1:"

        And I verify the Save to file Repository is selected
        And I verify the Store the translated version of the PDF (if using Multi-language Management) is selected
        And I click on the button labeled "Save Settings"
        Then I should see "Your survey settings were successfully saved!"
        And I should see "Coordinator Signature"


        ##ACTION: add record to get participant signature
        When I click on the link labeled "Add/Edit Records"
        And I click on the button labeled "Add new record for the arm selected above"
        And I click on the bubble labeled "Participant Consent" for event "Event 1"
        Then I should see "Adding new Record ID 1."

        When I click on the button labeled "Save & Stay"
        And I click on the button labeled "Okay" in the dialog box
        And I select the dropdown option labeled "Open survey" from the dropdown button with the placeholder text of "Survey options"
        Then I should see "Participant Consent"
        And I verify I see "FirstName" in the field labeled "1) Name"
        And I verify I see "LastName" in the field labeled "2) Name"
        And I verify I see "email@test.edu" in the field labeled "3) Email"
        And I verify I see "2023-09-03" in the field labeled "4) DOB"
        And I enter the "MyName" in the field labeled "Participant’s Name Typed"
        And I enter a signature in the field labeled "Participant signature field"
        And I click "Save signature"

        When I click on the button labeled "Next Page"
        Then I should see "Displayed below is a read-only copy of your survey responses."
        And I should see a checkbox for the field labeled "I certify that all of my information in the document above is correct."

        When I check the checkbox labeled "I certify that all of my information in the document above is correct."
        And I click on the button labeled "Submit"
        Then I should see "Thank you for taking the survey."

        When I click on the button labeled "Close survey"
        And I click on the button labeled "Leave without saving changes" in the dialog box
        ##VERIFY_Record Status Dashboard
        Then I should see a Completed Survey Response icon for the Data Collection Instrument labeled "Consent" for event "Event 1"

        ##VERIFY_File Repository
        When I click on the link labeled "File Repository"
        Then I should see "1 File" for the field labeled "PDF Survey Archive"

        When I click on the link labeled "PDF Survey Archive"
        And I click on the link on the PDF link for record "1"
        Then I should have a pdf file with the following values in the header: "PID xxxx - LastName"
        And I should have a pdf file with the following values in the footer: "Type: Particpant"
        #M: Close document

        # ##VERIFY_LOG
        # When I click on the link labeled "Logging"
        # Then I should see a table header and rows including the following values in the logging table:
        # | Username            | Action            | List of Data Changes OR Fields Exported |
        # | [survey respondent] | Update Response 7 | consent_complete = '2'                  |

        ##ACTION: add Coordinator Signature
        When I click on the link labeled "Record Status Dashboard"
        And I click on the bubble labeled "Coordinator Signature" for event "Event 1 and Record 1"
        Then I should see "Coordinator Signature."

        And I select the dropdown option labeled "Open survey" from the dropdown button with the placeholder text of "Survey options"
        Then I should see " Coordinator Signature "
        And I enter the "Coordinator Name" in the field labeled "Coordinator Name Typed"
        And I enter a signature in the field labeled "Coordinator’sSignature"
        And I click "Save signature"

        When I click on the button labeled "Next Page"
        Then I should see "Displayed below is a read-only copy of your survey responses."
        And I should see a checkbox for the field labeled "I certify that all of my information in the document above is correct
        When I click on the button labeled "Close survey"
        And I click on the button labeled "Leave without saving changes" in the dialog box

        ##VERIFY_Record Status Dashboard
        Then I should see a Completed Survey Response icon for the Data Collection Instrument labeled "Coordinator Signature" for event "Event 1"
        And I should see an Incomplete Survey Response icon for the Data Collection Instrument labeled "PDF And Combined Signatures PDF" for event "Event 1"
        And I click on the bubble labeled " PDF And Combined Signatures PDF " for event "Event 1 Then I should see "Participant Consent file."
        And I should see "Coordinator Signature file."
        And I should see " PDF And Combined Signatures PDF."


        ##VERIFY_File Repository
        When I click on the link labeled "File Repository"
        Then I should see "3 File" for the field labeled "PDF Survey Archive"

        When I click on the link labeled "PDF Survey Archive"
        And I click on the link on the PDF link for record "1 Coordinator"
        Then I should have a pdf file with the following values in the header: "PID xxxx - LastName"
        And I should have a pdf file with the following values in the footer: "Type: Coordinator"
        #M: Close document

        When I click on the link on the PDF link for record "1 Combo_file"
        Then I should have a pdf file with the following values in the header: "PID xxxx - LastName"
        And I should have a pdf file with the following values in the footer: "Type: Participant"
        And I should have a pdf file with the following values in the header: "PID xxxx - LastName"
        And I should have a pdf file with the following values in the footer: "Type: Coordinator"
        #M: Close document

        # ##VERIFY_LOG
        # When I click on the link labeled "Logging"
        # Then I should see a table header and rows including the following values in the logging table:
        # | Username            | Action            | List of Data Changes OR Fields Exported |
        # | [survey respondent] | Update Response 7 | consent_complete = '2'                  |








        #Stuff below this line does not belong to this script however it is written and we will need this for other scripts

        ##SETUP Allow e-Consent responses to be edited by users?
        When I click on the button labeled "Designer"
        And I click on the button labeled "e-Consent and PDF Snapshots"
        And I click on the button labeled "+Enable the e-Consent Framework for a survey"
        And I select "Participant Consent" from the dialogue box labeled "Enable e-Consent for a Survey"
        Then I should see a dialogue box labeled "enable e-Consent"
        And I click the checkbox labeled "Allow e-Consent responses to be edited by users?"
        And I click "Save settings"
        Then I should see "Saved E-Consent settings were successfully modified for survey "Participant Consent".

        ##ACTION: add record_missing sig_1
        When I click on the link labeled "Add/Edit Records"
        And I click on the button labeled "Add new record for the arm selected above"
        And I click on the bubble labeled "Participant Consent" for event "Event 1"
        Then I should see "Adding new Record ID 2."

        When I click on the button labeled "Save & Stay"
        And I click on the button labeled "Okay" in the dialog box
        And I select the dropdown option labeled "Open survey" from the dropdown button with the placeholder text of "Survey options"
        Then I should see "Consent"
        And I verify I see "Name" in the field labeled "1) Name"
        And I verify I see "Name" in the field labeled "2) Name"
        And I verify I see "email@test.edu" in the field labeled "3) Email"
        And I verify I see "2023-09-03" in the field labeled "DOB"
        And I DO NOT enter a signature in the field labeled "Participant Signature"

        When I click on the button labeled "Next Page"
        Then I should see "NOTE: Some fields are required!"

        When I click on the button labeled "Okay" in the dialog box
        #M: Close browser page
        And I click on the button labeled "Leave without saving changes" in the dialog box
        ##VERIFY_Record Status Dashboard
        Then I should see a Partial Survey Response icon for the Data Collection Instrument labeled "Consent" for event "Event 1" for record "1"

        When I click on the Partial Survey Response icon for the Data Collection Instrument labeled "Consent" for event "Event 1"
        And I select the dropdown option "Open survey" from the dropdown field labeled "Survey Options"
        Then I should see "Consent"
        And I should see "You have not completed the entire survey, and your responses are thus considered only partially complete. For security reasons, you will not be allowed to continue taking the survey from the place where you stopped."
        And I should see the button labeled "Start Over"
        #M: Close browser page
        And I click on the button labeled "Leave without saving changes" in the dialog box

        ##VERIFY_File Repository
        When I click on the link labeled "File Repository"
        And I click on the link labeled "PDF Survey Archive"
        Then I should NOT see a PDF link for record "2"

# ##VERIFY_LOG
# When I click on the link labeled "Logging"
# Then I should see a table header and rows including the following values in the logging table:
# | Username            | Action            | List of Data Changes OR Fields Exported |
# | [survey respondent] | Update Response 7 | consent_complete = '2'                  |
#M: Close document
#END
