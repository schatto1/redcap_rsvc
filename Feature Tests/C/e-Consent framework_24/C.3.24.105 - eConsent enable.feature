Feature: User Interface: The system shall support the enabling of the e-Consent Framework with an active/inactive status.

As a REDCap end user
I want to see that eConsent is functioning as expected

Scenario: C.3.24.105.100 The system shall support the enabling of the e-Consent Framework with an active/inactive status.

#SETUP
Given I login to REDCap with the user "Test_Admin"
And I create a new project named " C.3.24.105.100" by clicking on "New Project" in the menu bar, selecting "Practice / Just for fun" from the dropdown, choosing file "24EConsentWithSetup.xml", and clicking the "Create Project" button 

#SETUP_PRODUCTION
When I click on the button labeled "Project Setup"
And I click on the button labeled "Move project to production"
And I click on the radio labeled "Keep ALL data saved so far" in the dialog box
And I click on the button labeled "YES, Move to Production Status" in the dialog box
Then I should see "Project Status: Production"

#FUNCTIONAL_REQUIREMENT
##ACTION: e-consent survey settings - disabled
When I click on the button labeled "Designer"
And I click on the button labeled "e-Consent and PDF Snapshots"
And I click on the button labeled "Hide inactive"
And I click on the button "E-Consent active" for survey labeled "Participant Consent"
Then I should not see an "e-Consent active?" for survey labeled "Participant Consent"

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
And I click "Submit"
Then I should see "Thank you for taking the survey."

When I click on the button labeled "Close survey"
And I click on the button labeled "Leave without saving changes" in the dialog box

##VERIFY_Record Status Dashboard
Then I should NOT see a Completed Survey Response icon for the Data Collection Instrument labeled "Consent" for event "Event 1"


##VERIFY_File Repository
When I click on the link labeled "File Repository"
Then I should see "0 Files" for the field labeled "PDF Survey Archive"

# ##VERIFY_LOG
# When I click on the link labeled "Logging"
# Then I should see a table header and rows including the following values in the logging table:
# | Username            | Action            | List of Data Changes OR Fields Exported |
# | [survey respondent] | Update Response 7 | consent_complete = '2'                  |


##ACTION: e-consent survey settings - enable
When I click on the button labeled "Designer"
And I click on the button labeled "e-Consent and PDF Snapshots"
And I click on the button labeled "Hide inactive"
And I click on the button "E-Consent active" for survey labeled "Participant Consent"
Then I should see an "e-Consent active?" for survey labeled "Participant Consent"


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

##VERIFY_File Repository
Then I should see a Completed Survey Response icon for the Data Collection Instrument labeled "Consent" for event "Event 1"

##VERIFY_File Repository
When I click on the link labeled "File Repository"
Then I should see "1 File" for the field labeled "PDF Survey Archive"

When I click on the link labeled "PDF Survey Archive"
And I click on the link on the PDF link for record "1"
Then I should have a pdf file with the following values in the header: "PID xxxx - LastName"
And I should have a pdf file with the following values in the footer: "Type: Particpant" 

# ##VERIFY_LOG
# When I click on the link labeled "Logging"
# Then I should see a table header and rows including the following values in the logging table:
# | Username            | Action            | List of Data Changes OR Fields Exported |
# | [survey respondent] | Update Response 7 | consent_complete = '2'                  |
#M: Close document
#END
