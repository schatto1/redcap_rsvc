Feature: A.3.30.0100 Control Center: The system shall support enabling or disabling the Randomization module system-wide.
  As a REDCap end user
  I want to see that Randomization is functioning as expected

  Scenario: Setup project with randomization enabled
    #SETUP
    Given I login to REDCap with the user "Test_Admin"
    When I create a new project named "A.3.30.0100.0100" by clicking on "New Project" in the menu bar, selecting "Practice / Just for fun" from the dropdown, choosing file "Project 3.30 baserand.REDCap.xml", and clicking the "Create Project" button

  Scenario: A.3.30.0100.0100: Enabled at system level allows randomization module option at the project level.
    #FUNCTIONAL_REQUIREMENT
    When I click on the link labeled "Control Center"
    And I click on the link labeled "Modules/Services Configuration"
    And I should see "Settings pertaining to the External Module Framework"
    Then I should see the dropdown field labeled "Randomization" with the option "Enabled" selected

  Scenario: ##VERIFY Randomization Module Enabled
    When I click on the link labeled "My Projects"
    And I click on the link labeled "A.3.30.0100"
    When I click on the link labeled "Project Setup"
    Then I should see "Set up a randomization model"
    And I should see a button labeled "Set up randomization"
    And I should see a link labeled "Randomization"

  Scenario: A.3.30.0100.0200: Disabled at system level removes randomization module option at the project level.
    #FUNCTIONAL_REQUIREMENT
    When I click on the link labeled "Control Center"
    And I click on the link labeled "Modules/Services Configuration"
    Then I should see "Settings pertaining to the External Module Framework"
    When I select "Disabled" on the dropdown field labeled "Randomization"
    And I click on the button labeled "Save Changes"

  Scenario: ##VERIFY Randomization Module Disabled
    Then I should see "Your system configuration values have now been changed!"
    When I click on the link labeled "My Projects"
    And I click on the link labeled "A.3.30.0100"
    When I click on the link labeled "Project Setup"
    Then I should NOT see "Set up a randomization model"
    And I should NOT see a button labeled "Set up randomization"
    And I should NOT see a link labeled "Randomization"
    And I logout
#END
