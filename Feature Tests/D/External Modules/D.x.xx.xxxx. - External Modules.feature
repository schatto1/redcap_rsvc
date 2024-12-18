Feature: External Modules: The system shall support the use of certain External Modules within validated projects.

        As a REDCap end user
        I want to see that certain External Modules are functioning as expected

        Scenario: D.x.xx.xxxx.100 Enable/Disable External Modules
                #SETUP
                Given I login to REDCap with the user "Test_Admin"
                #Manual: Append project name with the current version (i.e. "X.X.X.XXX.XXX - LTS X.X.X")
                And I create a new project named "D.x.xx.xxxx.100" by clicking on "New Project" in the menu bar, selecting "Practice / Just for fun" from the dropdown, choosing file "Project_Tier_D.xml", and clicking the "Create Project" button

                #Download and Enable Instance Table EM in the Control Center
                And I click on the link labeled "Control Center"
                # will need to add step definition/command to handle "in the External Modules box" for manual specificity
                And I click on the link labeled exactly "Manage"
                Then I should see "External Modules - Module Manager"
                
                When I click on the button labeled "View modules available in the REDCap Repo"
                And I enter "Instance Table" into the field with the placeholder text of "Search"
                Then I should see "Showing 1 to 1 of 1 entries"

                When I click on the button labeled "Download"
                # will need to add step definition/command to handle "for the module labeled "Instance Table" for manual specificity
                And I click on the button labeled "I Agree" in the dialog box
                And I wait for 2 seconds
                And I click on the button labeled "Close" in the dialog box
                And I click on the button labeled "Download"
                Then I should see "SUCCESS" in the dialog box

                When I click on the button labeled "Close" in the dialog box
                Then I should see "Available Modules"

                When I enter "Instance Table" into the field with the placeholder text of "Search available modules"
                And I wait for 2 seconds
                And I click on the button labeled "Enable" in the dialog box
                And I should see "Enable Module" in the dialog box
                And I click on the button labeled "Enable" in the dialog box
                Then I should see "External Modules - Module Manager"
                And I should see "Instance Table"

                #Enable module in the REDCap project
                When I click on the link labeled "My Projects"
                And I click on the link labeled "D.x.xx.xxxx.100"
                # will need to add step definition/command to handle "in the External Modules box" for manual specificity
                And I click on the link labeled exactly "Manage"
                Then I should see "External Modules - Project Module Manager"

                When I click on the button labeled "Enable a module"
                Then I should see "Instance Table" in the dialog box

                When I click on the button labeled "Enable" in the dialog box
                Then I should see "External Modules - Project Module Manager"
                And I should see "Instance Table"
                
                # Add Test User 1 and then log out
                When I click on the link labeled "User Rights"
                And I enter "Test_User1" into the field with the placeholder text of "Assign new user to role"
                And I click on the button labeled "Assign to role"
                And I select "Data Entry Analyst" on the dropdown field labeled "Select Role" on the role selector dropdown
                When I click on the button labeled exactly "Assign" on the role selector dropdown
                Then I should see "Test User1" within the "Data Entry Analyst" row of the column labeled "Username" of the User Rights table
                Given I logout

                #Verify module functionality as a normal user
                Given I login to REDCap with the user "Test_User1"
                When I click on the link labeled "My Projects"
                And I click on the link labeled "D.x.xx.xxxx.100"
                When I click on the link labeled "Record Status Dashboard"
                And I locate the bubble for the "Medication" instrument on event "Screening" for record ID "1" and click the repeating instrument bubble for the first instance
                # How can I get the table comparison to work in the data entry screen?
                # Then I should see a table header and rows containing the following values in a table:
                #     | Medication Name | Medication Dose | Route of medication | Start Date |
                #     | Ibuprofen       | 200mg           | Oral                | 10-01-2024 |
                #     | Tylenol         | 100mg           | Oral                | 10-01-2024 |

                Then I should see "Medication Name"
                And I should see "Medication Dose"
                And I should see "Route of medication"
                And I should see "Start Date"
                And I should see "Form Status"

                And I should see "Ibuprofen"
                And I should see "200mg"
                And I should see "Oral"
                And I should see "10-01-2024"
                And I should see "Tylenol"
                And I should see "100mg"
                And I should see "Oral"
                And I should see "10-01-2024"

                Given I logout

                #Disable and delete the module from the filesystem
                Given I login to REDCap with the user "Test_Admin"
                And I click on the link labeled "Control Center"
                # will need to add step definition/command to handle "in the External Modules box" for manual specificity
                And I click on the link labeled exactly "Manage"
                Then I should see "External Modules - Module Manager"
                And I should see "Instance Table"

                When I click on the button labeled "Disable"
                Then I should see "Disable module" in the dialog box
                And I click on the button labeled "Disable module" in the dialog box
                Then I should see "External Modules - Module Manager"

                When I click on the button labeled "Enable a module"
                And I enter "Instance Table" into the field with the placeholder text of "Search available modules"
                Then I should see "Instance Table"

                When I click on the button labeled "Delete Versions" in the dialog box
                And I click on the button labeled "Select all versions" in the dialog box
                And I click on the button labeled "Delete Versions" in the dialog box
                Then I should see "SUCCESS" in the dialog box

                When I click on the button labeled "Close" in the dialog box
                And I click on the button labeled "Close" in the dialog box
                Then I should see "Modules Currently Available on this System"
                And I should see "None"

                