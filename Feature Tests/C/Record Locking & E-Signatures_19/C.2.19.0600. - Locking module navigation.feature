Feature: User Interface: The tool shall support the ability to navigate directly to a selected record.

    As a REDCap end user
    I want to see that Record locking and E-signatures is functioning as expected

    Scenario: C.2.19.600.100 Navigate to record

        #SETUP
        Given I login to REDCap with the user "Test_Admin"
        #Manual: Append project name with the current version (i.e. "X.X.X.XXX.XXX - LTS X.X.X")
        And I create a new project named "C.2.19.600.100" by clicking on "New Project" in the menu bar, selecting "Practice / Just for fun" from the dropdown, choosing file "Project_1.xml", and clicking the "Create Project" button

        #SETUP_PRODUCTION
        When I click on the link labeled "Project Setup"
        And I click on the button labeled "Move project to production"
        And I click on the radio labeled "Keep ALL data saved so far" in the dialog box
        And I click on the button labeled "YES, Move to Production Status" in the dialog box to request a change in project status
        Then I should see Project status: "Production"

        #USER_RIGHTS
        When I click on the link labeled "User Rights"
        And I enter "Test_User1" into the input field labeled "Add with custom rights"
        And I click on the button labeled "Add with custom rights"
        Then I should see 'Adding new user "Test_User1"'

        When I click on the checkbox for the field labeled "Record Locking Customization"
        And I select the User Right named "Lock/Unlock Records" and choose "Locking / Unlocking with E-signature authority"
        And I click on the button labeled "Close" in the dialog box
        And I click on the checkbox for the field labeled "Lock/Unlock *Entire* Records (record level)"
        And I click on the button labeled "Add user"
        Then I should see 'User "Test_User1" was successfully added'

        ##VERIFY_LOG
        When I click on the link labeled "Logging"
        Then I should see a table header and rows containing the following values in the logging table:
            | Username   | Action              | List of Data Changes OR Fields Exported |
            | test_admin | Add user Test_User1 | user = 'Test_User1'                     |


        #FUNCTIONAL REQUIREMENT
        ##ACTION Navigate to record
        When I click on the link labeled "Customize & Manage Locking/E-signatures"
        And I click on the button labeled "I understand. Let me make changes" in the dialog box
        And I click on the link labeled "E-signature and Locking Management"
        Then I should see a table header and rows containing the following values in the e-signature and locking management table:
            | Record | Event Name             | Form Name       | Repeat Instance | Locked? | E-signed    |
            | 3      | Event 1 (Arm 1: Arm 1) | Text Validation |                 | N/A     | View record |

        And I click on the first link labeled "View record"

        ##VERIFY
        Then I should see "Text Validation"
        And I should see a checkbox labeled "Lock this instrument?" that is unchecked
#END