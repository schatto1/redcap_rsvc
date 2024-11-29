Feature: C.3.30.0200 User Interface: The system shall allow enabling/disabling Randomization at the project level.
  As a REDCap end user
  I want to see that Randomization is functioning as expected

  Scenario: #SETUP project with randomization enabled - "Project 3.30 randAM.xml"
    Given I login to REDCap with the user "Test_User1"
    And I create a new project named "C.3.30.0200.0100" by clicking on "New Project" in the menu bar, selecting "Practice / Just for fun" from the dropdown, choosing file "Project 3.30 norand.xml", and clicking the "Create Project" button

  Scenario: #FUNCTIONAL_REQUIREMENT C.3.30.0200.0100. Enabling adds randomization module to project setup
    When I click on the link labeled "Project Setup"
    And I click on “Enable” in the "Randomization module" row in the "Enable optional modules and customizations" section

  Scenario: ##VERIFY C.3.30.0200.0200. Enabling adds randomization module to application box
    Then I should see “Disable” in the "Randomization module" row in the "Enable optional modules and customizations" section
    And I should see “Set up a randomization model”
    And I should see a link labeled “Randomization” in the "Applications" section

  Scenario: ##VERIFY_log Randomization at project level enabled recorded in logging table
    When I click on “Logging”
    Then I should see a table row containing the following values in the logging table : “test_user1”, “Manage/Design”, “Modify Project Settings”

  Scenario: #FUNCTIONAL_REQUIREMENT Randomization module opens
    When I click on the link labeled "Project Setup"
    And I click on “Enable” in the "Randomization module" row in the "Enable optional modules and customizations" section

  Scenario: C.3.30.0200.0300. Enabling adds randomization module options Setup, Dashboard, and Randomize to user rights privilege setup page.
    When I click on the link labeled "User Rights"
    And I click on the link labeled “1_FullRights”

  Scenario: ##VERIFY options Setup, Dashboard, and Randomize in user rights privilege setup page.
    Then I should see “Randomization”
    And I should see a checkbox labeled “Setup”
    And I should see a checkbox labeled “Dashboard”
    And I should see a checkbox labeled “Randomize”
    And I click on a button labeled “Cancel” within the open User Rights dialog box

  Scenario: C.3.30.0200.0400. Disabling removes randomization module from project setup
    When I click the link labeled “Project Setup”
    Then I should see “Disable” in the "Randomization module" row in the "Enable optional modules and customizations" section
    When I click on “Disable” in the "Randomization module" row in the "Enable optional modules and customizations" section
##VERIFY Randomization at project level disabled
    Then I should see “Enable” in the "Randomization module" row in the "Enable optional modules and customizations" section
    And I should NOT see “Set up a randomization model”

  Scenario: C.3.30.0200.0500. Disabling removes randomization module from application box.
    Then I should NOT see a link labeled “Randomization” in the "Applications" section

  Scenario: ##VERIFY_log Randomization at project level enabled recorded in logging table
    When I click on “Logging”
    Then I should see a table row containing the following values in the logging table : “test_user1”, “Manage/Design”, “Modify Project Settings”

  Scenario: C.3.30.0200.0600. Disabling removes randomization module options Setup, Dashboard, and Randomize to user rights privilege setup page.
    When I click on the link labeled "User Rights"
    And I click on the link labeled “1_FullRights”
##VERIFY options Setup, Dashboard, and Randomize NOT in user rights privilege setup page.
    Then I should NOT see “Randomization”
    And I should NOT see a checkbox labeled “Setup”
    And I should NOT see a checkbox labeled “Dashboard”
    And I should NOT see a checkbox labeled “Randomize”
    And I click on a button labeled “Cancel” within the open User Rights dialog box
    And I log out
#END