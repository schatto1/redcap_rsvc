Feature: Project status: While using the randomization module, the system shall block the ability for a project to be moved from Production to Development

    As a REDCap end user
    I want to see that a project cannot be moved back to development while randomization is enabled.

    Scenario: D.6.11.0400.100 Randomization production to development block 
        #SETUP
        Given I login to REDCap with the user "Test_Admin"
        And I create a new project named "D.6.11.0400.100" by clicking on "New Project" in the menu bar, selecting "Practice / Just for fun" from the dropdown, choosing file "CTSIBMICCanonicalProject.xml", and clicking the "Create Project" button

        #SETUP_RANDOMIZATION
        Given I click on the button labeled "Enable" in the "Randomization module" row in the "Enable optional modules and customizations" section
        And I click on the link labeled "Randomization"
        And I select "rand_group (Randomization Group Assigned)" on the dropdown field labeled "C) Choose your randomization field" 
        And I click on the button labeled "Save randomization model"
        And I upload a "csv" format file located at "import_files/RandomizationAllocationTable_Dev.csv", by clicking the button near "Upload allocation table (CSV file) for use in DEVELOPMENT status" to browse for the file, and clicking the button labeled "Upload File" to upload the file
        And I upload a "csv" format file located at "import_files/RandomizationAllocationTable_Prod.csv", by clicking the button near "Upload allocation table (CSV file) for use in PRODUCTION status" to browse for the file, and clicking the button labeled "Upload File" to upload the file

        #SETUP_PRODUCTION
        Given I click on the link labeled "Project Setup"
        And I click on the button labeled "Move project to production"
        And I click on the radio labeled "Keep ALL data saved so far" in the dialog box
        And I click on the button labeled "YES, Move to Production Status" in the dialog box to request a change in project status
        Then I should see Project status: "Production"

        #FUNCTIONAL REQUIREMENT
        #VERIFY
        Given I click on the link labeled "Other Functionality"
        Then I should see "Because Randomization is enabled, the project cannot be moved back to Development status."
#END