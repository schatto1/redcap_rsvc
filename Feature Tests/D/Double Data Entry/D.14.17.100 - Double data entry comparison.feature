Feature: Data Comparison Tool / DDE Module: The system shall support the ability to compare two records within the same project and display their differences.

  As a REDCap end user
  I want to see that the data comparison tool displays the differences between two records

  Scenario: D.4.17.100.100 Compare two records
    #SETUP_PRODUCTION
    Given I login to REDCap with the user "Test_Admin"
    And I create a new project named "D.4.17.100.100" by clicking on "New Project" in the menu bar, selecting "Practice / Just for fun" from the dropdown, choosing file "Project_4.17.xml", and clicking the "Create Project" button

    #When I click on the link labeled "Edit Project Settings"
    #And I select "Enabled" on the dropdown field labeled "Double Data Entry module"
    #And I click on the button labeled "Save Changes"
    #Then I see Project status: "Your changes have been saved!"
    
    #When I click on the link labeled "My Projects"
    #And I click on the link labeled "D.4.17.100.100"    
    And I click on the link labeled "Project Setup"
    And I click on the button labeled "Move project to production"
    And I click on the radio labeled "Keep ALL data saved so far" in the dialog box
    And I click on the button labeled "YES, Move to Production Status" in the dialog box to request a change in project status
    Then I see Project status: "Production"

    ##SETUP_USER_RIGHTS
    When I click on the link labeled "User Rights"
    And I enter "Test_User1" into the field with the placeholder text of "Add new user"
    And I click on the button labeled "Add with custom rights"
    And I check the User Right named "Data Comparison Tool"
    #And I check the User Right named "Person #1"
    And I click on the button labeled "Add user"
    Then I should see "Test User1"

    When I click on the link labeled "User Rights"
    And I enter "Test_User2" into the field with the placeholder text of "Add new user"
    And I click on the button labeled "Add with custom rights"
    And I check the User Right named "Data Comparison Tool"
    And I select the "Person #2" option labeled "Double Data Entry" in User Rights
    And I click on the button labeled "Add user"
    Then I should see "Test User2"

    When I click on the link labeled "User Rights"
    And I enter "Test_User3" into the field with the placeholder text of "Add new user"
    And I click on the button labeled "Add with custom rights"
    And I check the User Right named "Data Comparison Tool"
    And I select the "Reviewer" option labeled "Double Data Entry" in User Rights
    And I click on the button labeled "Add user"
    Then I should see "Test User3"

    #FUNCTIONAL REQUIREMENT
    ##ACTION: create record 1
    Given I login to REDCap with the user "Test_User1"
    When I click on the link labeled "My Projects"
    And I click on the link labeled "D.4.17.100.100"
    And I click on the link labeled "Add / Edit Records"
    And I click on the button labeled "Add new record"
    And I click on the bubble for the "Text Validation" data collection instrument for record ID "1" 
    And I enter "Harry Potter" into the textarea field labeled "Name:" in the dialog box
    And I enter "hp@hogwarts.edu" into the textarea field labeled "Email:" in the dialog box
    And I select the submit option labeled "Save & Exit Form" on the Data Collection Instrument
    ##VERIFY
    Then I should see "Record ID 1 successfully added"

    ##VERIFY_LOG:
    When I click on the link labeled "Logging"
    Then I should see a table header and rows containing the following values in the logging table:
      | Time / Date      | Username   | Action         | List of Data Changes OR Fields Exported |
      | mm/dd/yyyy hh:mm | Test_User1 | Create record1 | record_id = '1'                         |

    #VERIFY_RSD:
    When I click on the link labeled "Record Status Dashboard"
    And I click on the link labeled exactly "1"
    Then I should see "Record ID 1"

    And I logout

    ##ACTION: create record 2
    Given I login to REDCap with the user "Test_User2"
    When I click on the link labeled "My Projects"
    And I click on the link labeled "D.4.17.100.100"
    And I click on the link labeled "Add / Edit Records"
    And I click on the button labeled "Add new record"
    And I click the bubble to add a record for the "Text Validation" instrument
    And I enter "Hermione Granger" into the textarea field labeled "Name:" in the dialog box
    And I enter "hg@hogwarts.edu" into the textarea field labeled "Email:" in the dialog box
    And I select the submit option labeled "Save & Exit Form" on the Data Collection Instrument

    ##VERIFY
    Then I should see "Record ID 2 successfully added"

    ##VERIFY_LOG:
    When I click on the link labeled "Logging"
    Then I should see a table header and rows containing the following values in the logging table:
      | Time / Date      | Username   | Action         | List of Data Changes OR Fields Exported |
      | mm/dd/yyyy hh:mm | Test_User2 | Create record2 | record_id = '2'                         |

    #VERIFY_RSD:
    When I click on the link labeled "Record Status Dashboard"
    And I click on the link labeled exactly "2"
    Then I should see "Record ID 2"

    And I logout

    ##ACTION: compare two records within the same project
    Given I login to REDCap with the user "Test_User3"
    When I click on the link labeled "My Projects"
    And I click on the link labeled "D.4.17.100.100"
    And I click on the link labeled "Data Comparison Tool"
    And I select "1" from the first dropdown, and I select "2" from the second dropdown, and I click on the button labeled "Compare"

    ##VERIFY
    Then I should see a table header and rows containing the following values in the data comparison tool table:
      | Label (field name) |    Form Name    | Record ID                                 |
      |                    |                 |  1                |          2            |
      | Name (ptname)      | Text Validation | Harry Potter      | Hermione Granger      |
      | Email (email)      | Text Validation | hp@hogwarts.edu   | hg@hogwarts.edu       |
