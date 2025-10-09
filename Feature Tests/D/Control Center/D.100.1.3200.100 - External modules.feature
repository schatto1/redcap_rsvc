Feature: Control Center: The following modules are enabled for the University of Utah Clinical and Translational Science Institute REDCap External Modules – Module Manager: Image Map, Instance Table, Recalculate

  As a REDCap administrator
  I want to see that Image Map, Instance Table, and Recalculate external modules are enabled.
  #This feature is to be run completely MANUALLY on the REDCap Shadow instance

  Scenario: D.100.1.3200.100 External modules
    #FUNCTIONAL REQUIREMENT
    #ACTION
    Given I successfully login to REDCap shadow with an Admin account
    And I click on the link labeled "Control Center"
    And I click on the link labeled "Manage" in the External Modules section

    #VERIFY
    And I click on the button labeled "Configure" on the row labeled "Image Map"
    Then I should see "Configure Module: Image Map"
    And I click on the button labeled "Cancel" 
    And I click on the button labeled "Configure" on the row labeled "Instance Table"
    Then I should see "Configure Module: Instance Table"
    And I click on the button labeled "Cancel" 
    And I click on the button labeled "Configure" on the row labeled "Recalculate"
    Then I should see "Configure Module: Recalculate"
    And I click on the button labeled "Cancel" 
