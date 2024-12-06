Feature: Security: The system shall support the use of multi-factor authentication. 

As a REDCap end user
I want to see that the system allows for the use of multi-factor authentication.
#This feature is to be run completely MANUALLY on the REDCap Shadow instance

Scenario: D.100.4.0800.100 Duo 2FA
    #SETUP
    Given I visit the REDCap Shadow login page
    And I enter (my Username)
    And I enter (my user Password)
    And I click on the button labeled "Log In"
    Then I should see a dialog containing the following text: "Two-step verification for REDCap login" 

    #FUNCTIONAL REQUIREMENT
    ##ACTION: Multi-factor authentication 
    Given I click on the radio labeled "Duo"
    ##VERIFY
    Then I should see a dialog containing the following text: "check for a Duo Push"

    #FUNCTIONAL REQUIREMENT
    ##ACTION: Duo Push
    Given I open the "DuoMobile" Application from (my device) 
    And I click on the button labeled "Approve" 
    ##VERIFY
    Then I should see "Sucess! Logging you in..." 
    And I should see "Welcome to REDCap!"
#END