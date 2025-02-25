Feature: User Interface: The tool shall display e-signature status of forms for all records.

    As a REDCap end user
    I want to see that Record locking and E-signatures is functioning as expected

    Scenario: C.2.19.500.100 Display e-signature

        #SETUP
        Given I login to REDCap with the user "Test_Admin"
        #Manual: Append project name with the current version (i.e. "X.X.X.XXX.XXX - LTS X.X.X")
        And I create a new project named "C.2.19.500.100" by clicking on "New Project" in the menu bar, selecting "Practice / Just for fun" from the dropdown, choosing file "Project_1.xml", and clicking the "Create Project" button

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

        When I click on the checkbox for the field labeled "Logging"
        And I click on the checkbox for the field labeled "Record Locking Customization"
        And I select the radio option "Locking / Unlocking with E-signature authority" for the field labeled "Lock / Unlock Records (instrument level)"
        And I click on the button labeled "Close" in the dialog box
        And I click on the button labeled "Add user"
        Then I should see 'User "Test_User1" was successfully added'

        ##VERIFY_LOG
        When I click on the link labeled "Logging"
        Then I should see a table header and rows containing the following values in the logging table:
            | Username   | Action              | List of Data Changes OR Fields Exported |
            | test_admin | Add user test_user1 | user = 'test_user1'                     |

        And I logout

        Given I login to REDCap with the user "Test_User1"
        And I click on the link labeled "My Projects"
        And I click on the link labeled "C.2.19.500.100"
        #SETUP
        When I click on the link labeled "Customize & Manage Locking/E-signatures"
        And I click on the button labeled "I understand. Let me make changes" in the dialog box
        And for the Column Name "Display the Lock option for this instrument?", I check the checkbox within the Record Locking Customization table for the Data Collection Instrument named "Text Validation"
        And for the Column Name "Also display E-signature option on instrument?", I check the checkbox within the Record Locking Customization table for the Data Collection Instrument named "Text Validation"
        Then I should see a table header and rows containing the following values in a table:
            | Display the Lock option for this instrument? | Data Collection Instrument | Also display E-signature option on instrument? |
            | [✓]                                          | Text Validation            | [✓]                                            |
            | [✓]                                          | Consent                    |                                                |


        ##ACTION
        When I click on the link labeled "Record Status Dashboard"
        And I locate the bubble for the "Text Validation" instrument on event "Event 1" for record ID "3" and click on the bubble
        Then I should see "Text Validation"
        And I should see a checkbox labeled "Lock this instrument?" that is unchecked
        And I should see a checkbox labeled "E-signature" that is unchecked

        When I click on the checkbox for the field labeled "Lock this instrument?"
        And I click on the checkbox labeled "E-signature"
        And I click on the button labeled "Save & Exit Form"
        Then I should see a dialog containing the following text: "E-signature: Username/password verification"

        Given I enter Test_User login credentials
        Then I should see "Record Home Page"
        And I should see a table header and rows containing the following values in the record home page table:
            | Data Collection Instrument | Event 1         |
            | Text Validation            | [lock icon]     |
            | Text Validation            | [e-signed icon] |

        ##VERIFY_LOG
        When I click on the link labeled "Logging"
        Then I should see a table header and rows containing the following values in the logging table:
            | Username   | Action               | List of Data Changes OR Fields Exported                                    |
            | test_user1 | E-signature 3        | Action: Save e-signature, Record: 3, Form: Text Validation, Event: Event 1 |
            | test_user1 | Lock/Unlock Record 3 | Action: Lock instrument, Record: 3, Form: Text Validation, Event: Event 1  |

        #FUNCTIONAL REQUIREMENT
        ##ACTION Record lock and signature status
        When I click on the link labeled "Customize & Manage Locking/E-signatures"
        And I click on the button labeled "I understand. Let me make changes" in the dialog box
        And I click on the link labeled "E-signature and Locking Management"

        ##VERIFY
        Then I should see a table header and rows containing the following values in a table:
            | Record | Form Name       | Locked?     | E-signed?       |
            | 3      | Text Validation | [lock icon] | [e-signed icon] |
            | 3      | Consent         |             | N/A             |
#END