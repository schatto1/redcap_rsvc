Feature: Data Comparison Tool / DDE Module: The system shall allow the designation of two users or two roles as data entry persons 1 and 2, who may independently enter duplicate records while restricting their view of the other records.

  As a REDCap end user
  I want to see that the system allows restricted viewing rights across data entry persons 1 and 2 while using the double data entry module.

  Scenario: D.4.17.300.100 Restrict view of independent data entry users 
    #SETUP_PRODUCTION
    Given I login to REDCap with the user "Test_Admin"
    And I create a new project named "D.4.17.300.100" by clicking on "New Project" in the menu bar, selecting "Practice / Just for fun" from the dropdown, choosing file "CTSIBMICCanonicalProject.xml", and clicking the "Create Project" button
    And I click on the link labeled "Project Setup"
    And I click on the "Disable" button labeled "Use surveys in this project?" in the "Main project settings" section 
    And I click on the button labeled "Disable" in the dialog box 
    And I click on the link labeled "Project Setup"
    And I click on the button labeled "Move project to production"
    And I click on the radio labeled "Keep ALL data saved so far" in the dialog box
    And I click on the button labeled "YES, Move to Production Status" in the dialog box to request a change in project status
    Then I see Project status: "Production"

    ##ACTION: ENABLE DDE
    When I click on the link labeled "Project Setup"
    And I click on the link labeled "Edit Project Settings"
    And I select "Enabled" on the dropdown field labeled "Double Data Entry module"
    And I click on the button labeled "Save Changes"
    Then I see "Your changes have been saved!"

    ##ACTION: ADD DATA ENTRY PERSONS
    When  I click on the link labeled "D.4.17.300.100"
    And I click on the link labeled "User Rights"
    And I enter "Test_User2" into the field with the placeholder text of "Add new user"
    And I click on the button labeled "Add with custom rights"
    And I select the User Right named "Double Data Entry" and choose "Person #1" 
    And I click on the button labeled "Add user"
    Then I should see "Test User2"

    When I click on the link labeled "User Rights"
    And I enter "Test_User3" into the field with the placeholder text of "Add new user"
    And I click on the button labeled "Add with custom rights"
    And I select the User Right named "Double Data Entry" and choose "Person #2" 
    And I click on the button labeled "Add user"
    Then I should see "Test User3"
    And I logout

    #FUNCTIONAL REQUIREMENT
    ##ACTION: VIEW RECORDS AS TEST USER2
    Given I login to REDCap with the user "Test_User2"
    And I click on the link labeled "My Projects"
    And I click on the link labeled "D.4.17.300.100"
    And I click on the link labeled "Record Status Dashboard"
    Then I should NOT see "Test123"

    ##ACTION: ADD RECORD AS TEST USER2
    And I enter "2" into the field with the placeholder text of "Enter new record name" 
    And I click on the button labeled "Create"
    And I click the bubble to add a record for the "Prescreening" longitudinal instrument on event "Screening"
    And I enter "Jon Snow" into the input field labeled "Preferred Name"
    And I select the submit option labeled "Save & Exit Form" on the Data Collection Instrument
    Then I see "Record ID 2 successfully added."
    And I logout

    #FUNCTIONAL REQUIREMENT
    ##ACTION: VIEW RECORDS AS TEST USER3
    Given I login to REDCap with the user "Test_User3"
    And I click on the link labeled "My Projects"
    And I click on the link labeled "D.4.17.300.100"
    And I click on the link labeled "Record Status Dashboard"
    Then I should NOT see "Jon Snow"

    ##ACTION: ADD RECORD AS TEST USER3
    And I enter "2" into the field with the placeholder text of "Enter new record name" 
    And I click on the button labeled "Create"
    And I click the bubble to add a record for the "Prescreening" longitudinal instrument on event "Screening"
    And I enter "Daenerys Targaryen" into the input field labeled "Preferred Name"
    And I select the submit option labeled "Save & Exit Form" on the Data Collection Instrument
    Then I see "Record ID 2 successfully added."
    And I logout

    #VERIFY
    ##ACTION: VIEW RECORDS AS TEST USER3
    Given I login to REDCap with the user "Test_Admin"
    And I click on the link labeled "My Projects"
    And I click on the link labeled "D.4.17.300.100"
    And I click on the link labeled "Record Status Dashboard"
    Then I should see "Jon Snow"
    And I should see "Daenerys Targaryen"
#END
