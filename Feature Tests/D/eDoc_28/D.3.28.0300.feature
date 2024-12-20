Feature: User Interface: The system shall allow project level enabling or disabling to store non-e-Consent governed PDF Snapshots on the External Storage server if the snapshot contains a completed e-Consent response.

    As a REDCap end user
    I want to see that external storage is functioning as expected

    Scenario: D..3.28.0300.100 Project Level: The system shall allow project level enabling or disabling to store non-e-Consent governed PDF Snapshots on the External Storage server if the snapshot contains a completed e-Consent response.


        #SETUP
        Given I login to REDCap with the user "Test_Admin"
        And I create a new project named " A.3.28.0300.100" by clicking on "New Project" in the menu bar, selecting "Practice / Just for fun" from the dropdown, choosing file "24ConsentWithSetup.xml", and clicking the "Create Project" button

    ##ACTION: add record to get participant signature
    Scenario: Add record to get participant signature
        When I click on the link labeled "Add/Edit Records"
        And I click on the button labeled "Add new record for the arm selected above"
        And I click on the bubble labeled "Participant Consent" for event "Event 1"
        Then I should see "Adding new Record ID 1"

        When I click on the button labeled "Save & Stay"
        And I click on the button labeled "Okay" in the dialog box
        And I click on the button labeled "Survey options"
        And I click on the survey option label containing "Open survey" label
        And I enter "FirstName" into the input field labeled "First Name"
        And I enter "LastName" into the input field labeled "Last Name"
        And I enter "email@test.edu" into the input field labeled "Email"
        And I enter "01-01-2000" into the input field labeled "DOB"
        And I enter "MyName" into the input field labeled "Participant's Name Typed"
        And I enter a signature in the field labeled "Participant signature field"
        And I click "Submit"
        Then I should see "Close survey"

        When I click on the button labeled "Close survey"
        And I click on the button labeled "Leave without saving changes" in the dialog box
        ##VERIFY_RSD
        Then I should see "Record Home Page"
        And I should see "Completed Survey Response" icon for the bubble labeled "Participant Consent" for event "Event 1"

        ##VERIFY_FiRe
        ##e-Consent Framework not used, and PDF Snapshot is used
        When I click on the link labeled "File Repository"
        And I click on the link labeled "PDF Survey Archive"
        And I click on the link on the PDF link for record "1"
        Then I should have a pdf file with the following values in the header: "PID xxxx - LastName"
        And I should have a pdf file with the following values in the footer: "Type: Participant"
        #Manual: Close document

        When I click on the link labeled "Project Home"
        And I click on the link labeled "Edit Project Settings"
        And I select "Disabled" for the option labeled "Store non-e_Consent governed PDF Snapshots on the External Storage server if the snapshot contains a completed e-Consent response"
        And I click on the button labeled "Save Changes"
        Then I should see "Your changes have been saved!"

    ##ACTION: add record to get participant signature
    Scenario: Add record to get participant signature
        When I click on the link labeled "Add/Edit Records"
        And I click on the button labeled "Add new record for the arm selected above"
        And I click on the bubble labeled "Participant Consent" for event "Event 1"
        Then I should see "Adding new Record ID 1"

        When I click on the button labeled "Save & Stay"
        And I click on the button labeled "Okay" in the dialog box
        And I click on the button labeled "Survey options"
        And I click on the survey option label containing "Open survey" label
        And I enter "FirstName" into the input field labeled "First Name"
        And I enter "LastName" into the input field labeled "Last Name"
        And I enter "email@test.edu" into the input field labeled "Email"
        And I enter "01-01-2000" into the input field labeled "DOB"
        And I enter "MyName" into the input field labeled "Participant's Name Typed"
        And I enter a signature in the field labeled "Participant signature field"
        And I click "Submit"
        Then I should see "Close survey"

        When I click on the button labeled "Close survey"
        And I click on the button labeled "Leave without saving changes" in the dialog box
        ##VERIFY_RSD
        Then I should see "Record Home Page"
        And I should see "Completed Survey Response" icon for the bubble labeled "Participant Consent" for event "Event 1"

        ##VERIFY_FiRe
        ##e-Consent Framework not used, and PDF Snapshot is used
        When I click on the link labeled "File Repository"
        And I click on the link labeled "PDF Survey Archive"
        Then I should NOT have a pdf file for record 2
#Manual: Close document


##VERIFY_PDF Snapshot Specific File Location
#M REDCap Administrators may need to work with their Azure Administrator to get a screenshot that the PDF file exists
#END