Feature: The system shall support Bulk Delete functionality, allowing users to delete entire records or instrument-level data for multiple records within the Bulk Delete interface.

    As a REDCap end user
    I want to see that Bulk Record Delete is functioning as expected

    Scenario: B.3.14.1400.100: Bulk Delete Records Using Custom List
    Scenario: #SETUP
        Given I login to REDCap with the user "Test_Admin"
        And I create a new project named " B.3.14.1400.100" by clicking on "New Project" in the menu bar, selecting "Practice / Just for fun" from the dropdown, choosing file "Project_3.14.xml", and clicking the "Create Project" button
        And I click on the link labeled "My Projects"
        And I click on the link labeled "B.3.14.1400.100"

    Scenario: #SETUP_PRODUCTION
        When I click on the link labeled "Project Setup"
        And I click on the button labeled "Move project to production"
        And I click on the radio labeled "Keep ALL data saved so far" in the dialog box
        And I click on the button labeled "YES, Move to Production Status" in the dialog box to request a change in project status
        Then I should see Project status: "Production"

    Scenario:  #SET UP_USER_RIGHTS
        When I click on the link labeled "User Rights"
        And I click on the button labeled "Upload or download users, roles, and assignments"
        Then I should see "Upload users (CSV)"
        When I click on the link labeled "Upload users (CSV)"
        Then I should see a dialog containing the following text: "Upload users (CSV)"

        Given I upload a "csv" format file located at "import_files/user list for project 1.csv", by clicking the button near "Select your CSV" to browse for the file, and clicking the button labeled "Upload" to upload the file
        Then I should see a dialog containing the following text: "Upload users (CSV) - Confirm"
        And I should see a table header and rows containing the following values in a table in the dialog box:
            | username   |
            | test_admin |
            | test_user1 |
            | test_user2 |
            | test_user3 |
            | test_user4 |

        Given I click on the button labeled "Upload" in the dialog box
        Then I should see a dialog containing the following text: "SUCCESS!"
        And I click on the button labeled "Close" in the dialog box

        Then I should see a table header and rows containing the following values in a table:
            | Role name               | Username            |
            | —                       | test_admin          |
            | —                       | test_user1          |
            | —                       | test_user2          |
            | —                       | test_user3          |
            | —                       | test_user4          |
            | 1_FullRights            | [No users assigned] |
            | 2_Edit_RemoveID         | [No users assigned] |
            | 3_ReadOnly_Deidentified | [No users assigned] |
            | 4_NoAccess_Noexport     | [No users assigned] |

        When I click on the link labeled "test_user1"
        And I click on the button labeled "Edit user privileges"
        Then I should see a dialog containing the following text: "Editing existing user"
        When I check the User Right named "Delete Records"
        And I save changes within the context of User Rights

        When I click on the link labeled "test_user2"
        And I click on the button labeled "Edit user privileges"
        Then I should see a dialog containing the following text: "Editing existing user"
        When I uncheck the User Right named "Delete Records"
        And I save changes within the context of User Rights

    Scenario:   ##ACTION Verify record exist ##VERIFY_RSD
        When I click on the link labeled "Record Status Dashboard"
        Then I should see a table header and rows containing the following values in the record status dashboard table:
            | Record ID |
            | 1         |
            | 2         |
            | 3         |
            | 4         |
            | 5         |
            | 6         |
        And I log out

    ##FUNCTIONAL_REQUIREMENT
    Scenario:  ###ACTION Delete multiple records
        When I login with "test_user2"
        And I click on the link labeled "My Projects"
        And I click on the link labeled "B.3.14.1400.100"
        And I click on the link labeled "Project Setup"
        And I click on the link labeled "Other Functionality"
        Then I should not see "Bulk Record Delete" in the tab labeled "Other Functionality"
        And I log out

        When I login with "test_user1"
        And I click on the link labeled "My Projects"
        And I click on the link labeled "B.3.14.1400.100"
        And I click on the link labeled "Project Setup"
        And I click on the link labeled "Other Functionality"
        Then I should see "Bulk Record Delete" in the tab labeled "Other Functionality"

        When I click on the button labeled "Bulk Record Delete"
        Then I should see "Bulk Record Delete"

        When I click the bubble labeled "Delete entire records"
        And I click the bubble labeled "Enter a custom list of records"
        And I type "3,5" into "Step 3: Enter records to delete"
        And I click on the button labeled "Delete"
        And I type "delete"
        And I click on the button labeled "Delete"
        Then I should see "Deleted 2 record(s)"

    Scenario:  ##ACTION Verify record exist
        ##VERIFY_RSD
        When I click on the link labeled "Record Status Dashboard"
        Then I should see a table header and rows containing the following values in the record status dashboard table:
            | Record ID |
            | 1         |
            | 2         |
            | 4         |
            | 6         |

    Scenario:  ##VERIFY_LOG
        When I click on the link labeled "Logging"
        Then I should see a table header and rows containing the following values in the logging table:
            | Time / Date      | Username   | Action          | List of Data Changes OR Fields Exported |
            | mm/dd/yyyy hh:mm | test_user1 | Delete record 5 | record_id = '5'                         |
            | mm/dd/yyyy hh:mm | test_user1 | Delete record 3 | record_id = '3'                         |
    #END Scenario

    Scenario: B.3.14.1400.200: Bulk Delete Records Using Select Records from List
        When I click on the link labeled "Project Setup"
        And I click on the link labeled "Other Functionality"
        Then I should see "Bulk Record Delete" in the tab labeled "Other Functionality"

        When I click on the button labeled "Bulk Record Delete"
        Then I should see "Bulk Record Delete"
        And I click the bubble labeled "Delete entire records"
        And I click the bubble labeled "Select records from a list"
        And I select "2"
        And I select "6"
        And I click on the button labeled "Delete"
        And I type "delete"
        And I click on the button labeled "Delete"
        Then I should see "Deleted 2 record(s)"

    Scenario:  ##ACTION Verify record exist ##VERIFY_RSD
        When I click on the link labeled "Record Status Dashboard"
        Then I should see a table header and rows containing the following values in the record status dashboard table:
            | Record ID |
            | 1         |
            | 4         |
            | 6         |
        And I logout

    Scenario: ##VERIFY_LOG
        When I click on the link labeled "Logging"
        Then I should see a table header and rows containing the following values in the logging table:
            | Time / Date      | Username   | Action          | List of Data Changes OR Fields Exported |
            | mm/dd/yyyy hh:mm | test_user1 | Delete record 6 | record_id = '6'                         |
            | mm/dd/yyyy hh:mm | test_user1 | Delete record 2 | record_id = '2'                         |
            | mm/dd/yyyy hh:mm | test_user1 | Delete record 5 | record_id = '5'                         |
            | mm/dd/yyyy hh:mm | test_user1 | Delete record 3 | record_id = '3'                         |
    #END Scenario

    Scenario: B.3.14.1400.300: Bulk Delete Partial Records Using Custom List
        When I click on the link labeled "Project Setup"
        And I click on the link labeled "Other Functionality"
        Then I should see "Bulk Record Delete" in the tab labeled "Other Functionality"

        When I click the bubble labeled "Partial delete (instrument-level data only)"
        And I select "Data Types"
        And I click the bubble labeled "Enter a custom list of records"
        And I type "1" into "Step 3: Enter records to delete"
        And I click on the button labeled "Delete"
        And I type "delete"
        And I click on the button labeled "Delete"
        Then I should see "Deleted forms [event_1_arm_1] data_types for 1 record(s)"

    Scenario:##ACTION Verify record exist ##VERIFY_RSD
        When I click on the link labeled "Record Status Dashboard"
        Then I should see a table header and rows containing the following values in the record status dashboard table:
            | Record ID |
            | 1         |
            | 4         |
        And I should see "incomplete (no data saved)" for Record 1

        ##VERIFY_LOG
        When I click on the link labeled "Logging"
        Then I should see a table header and rows containing the following values in the logging table:
            | Time / Date      | Username   | Action          | List of Data Changes OR Fields Exported   |
            | mm/dd/yyyy hh:mm | test_user1 | Update record 1 | calc_text = '' , data_types_complete = '' |
            | mm/dd/yyyy hh:mm | test_user1 | Delete record 6 | record_id = '6'                           |
            | mm/dd/yyyy hh:mm | test_user1 | Delete record 2 | record_id = '2'                           |
            | mm/dd/yyyy hh:mm | test_user1 | Delete record 5 | record_id = '5'                           |
            | mm/dd/yyyy hh:mm | test_user1 | Delete record 3 | record_id = '3'                           |
    #END Scenario

    Scenario: B.3.14.1200.400: Bulk Delete Partial Records Using Select Records from List
        When I click on the link labeled "Project Setup"
        And I click on the link labeled "Other Functionality"
        Then I should see "Bulk Record Delete" in the tab labeled "Other Functionality"

        When I click the bubble labeled "Partial delete (instrument-level data only)"
        And I select "Data Types"
        And I click the bubble labeled "Enter a custom list of records"
        And I type "4" into "Step 3: Enter records to delete"
        And I click on the button labeled "Delete"
        And I type "delete"
        And I click on the button labeled "Delete"
        Then I should see "Deleted forms [event_1_arm_1] text_validation [event_1_arm_1] data_types [event_1_arm_1] consent for 1 record(s)"

    Scenario:##ACTION Verify record exist ##VERIFY_RSD
        When I click on the link labeled "Record Status Dashboard"
        Then I should see a table header and rows containing the following values in the record status dashboard table:
            | Record ID |
            | 1         |
            | 4         |
        And I should see "incomplete (no data saved)" for Record 4

        ##VERIFY_LOG
        When I click on the link labeled "Logging"
        Then I should see a table header and rows containing the following values in the logging table:
            | Time / Date      | Username   | Action          | List of Data Changes OR Fields Exported                                                                                                                                                |
            | mm/dd/yyyy hh:mm | test_user1 | Update record 4 | [instance = 3], checkbox(1) = unchecked, checkbox(2) = unchecked, checkbox(3) = unchecked, data_types_complete = '', required = '', date_ymd = '', datetime_ymd_hmss = '', calc_test = |
            | mm/dd/yyyy hh:mm | test_user1 | Update record 4 | [instance = 2], checkbox(1) = unchecked, checkbox(2) = unchecked, checkbox(3) = unchecked, data_types_complete = '', required = '', date_ymd = '', datetime_ymd_hmss = '', calc_test = |
            | mm/dd/yyyy hh:mm | test_user1 | Update record 4 | checkbox(1) = unchecked, checkbox(2) = unchecked, checkbox(3) = unchecked, data_types_complete = '', required = '', date_ymd = '', datetime_ymd_hmss = '', calc_test =                 |
            | mm/dd/yyyy hh:mm | test_user1 | Update record 1 | calc_text = '' , data_types_complete = ''                                                                                                                                              |
            | mm/dd/yyyy hh:mm | test_user1 | Delete record 6 | record_id = '6'                                                                                                                                                                        |
            | mm/dd/yyyy hh:mm | test_user1 | Delete record 2 | record_id = '2'                                                                                                                                                                        |
            | mm/dd/yyyy hh:mm | test_user1 | Delete record 5 | record_id = '5'                                                                                                                                                                        |
            | mm/dd/yyyy hh:mm | test_user1 | Delete record 3 | record_id = '3'                                                                                                                                                                        |
#END Scenario

#END