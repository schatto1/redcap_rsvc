Feature: User Interface: The system shall provide the ability to create a new record with updated record ID information during data import, while retaining the original record and its associated data. The old record shall remain in the system under its original name, ensuring no data is lost or overwritten.

    As a REDCap end user
    I want to see that Data import is functioning as expected

    Scenario: B.3.16.1900.100  Adds new records that have been renamed
        #SETUP
        Given I login to REDCap with the user "Test_Admin"
        And I create a new project named "B.3.16.1900.100" by clicking on "New Project" in the menu bar, selecting "Practice / Just for fun" from the dropdown, choosing file "BigDataTestProject.xml", and clicking the "Create Project" button
        #SETUP_PRODUCTION
        Given I click on the link labeled "Project Setup"
        And I click on the button labeled "Move project to production"
        And I click on the radio labeled "Keep ALL data saved so far" in the dialog box
        And I click on the button labeled "YES, Move to Production Status" in the dialog box to request a change in project status
        Then I should see Project status: "Production"

        Given I click on the link labeled "Data Import Tool"
        When I select "Import in real time" on the dropdown field labeled "Choose an import option"
        And I select "Yes, display uploaded data prior to importing" on the dropdown field labeled "Display the data comparison table"
        And I upload a "csv" format file located at "import_files/BigDataTestProjectDATARename1.csv", by clicking the button near "Select your CSV data file" to browse for the file, and clicking the button labeled "Upload File" to upload the file
        And I click on the button labeled "Upload"
        And I click on the button labeled "Upload File"
        Then I should see "Instructions for Data Review"
        And I click on the button labeled "Import Data"
        Then I should see "Import Successful! 30 records where created of modified during the import"

        #VERIFY
        Given I click on the link labeled "Record Status Dashboard"
        Then I should see a table header and rows containing the following values in a table:
            | Record ID | Form 1 |
            | 1         |        |
            | 2         |        |
            | 3         |        |
            | 4         |        |
            | 5         |        |
            | 6         |        |
            | 7         |        |
        And I should see all records are in an unverified status

        When I click on the link labeled "Project Setup"
        And I disable the button labeled "Auto-numbering for Records"
        And I click on the link labeled "Data Import Tool"

        When I select "Import in real time" on the dropdown field labeled "Choose an import option"
        And I select "Yes, display uploaded data prior to importing" on the dropdown field labeled "Display the data comparison table"
        And I select "Yes, Blank values in the file will overwrite existing values" on the dropdown field labeled "Auto-number/overwrite record IDs?"
        And I upload a "csv" format file located at "import_files/BigDataTestProjectDATARename2.csv", by clicking the button near "Select your CSV data file" to browse for the file, and clicking the button labeled "Upload File" to upload the file
        And I click on the button labeled "Upload File"
        Then I should see "Import successful! 30 records were created or modified during the import"

        #VERIFY
        Given I click on the link labeled "Record Status Dashboard"
        Then I should see a table header and rows containing the following values in a table:
            | Record ID | Form 1 |
            | 1         |        |
            | 2         |        |
            | 3         |        |
            | 4         |        |
            | 5         |        |
            | 6         |        |
            | 7         |        |
        And I should see all records are in an unverified status
        #VERIFY
        When I click on the link labeled "Logging"
        Then I should see a table header and rows containing the following values in the logging table:
            | Username    | Action                    | List of Data Changes OR Fields Exported |
            | test_admin) | Create Record (import)900 | record_id='900'                         |
#END