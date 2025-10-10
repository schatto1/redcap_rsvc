Feature: Control Center: Computer adaptive tests (CATs) and Auto-scoring instruments services shall be enabled for The University of Utah REDCap application 

  As a REDCap administrator
  I want to see that computer adaptive tests are enabled.
  #This feature is to be run completely MANUALLY on the REDCap Shadow instance

  Scenario: D.100.1.3900.100 Computer adaptive tests
    #FUNCTIONAL REQUIREMENT
    #ACTION
    Given I successfully login to REDCap shadow with an Admin account
    And I click on the link labeled "Control Center"
    And I click on the link labeled "Modules/Services Configuration"

    #VERIFY
    Then I should see a field labeled "Computer adaptive tests (CATs) and Auto-scoring instruments" with the dropdown option "Enabled" selected

    #ACTION
    And I click on the button labeled "Test"
    
    #VERIFY
    Then I should see a dialog containing the following text: "Success!"