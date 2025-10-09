Feature: Infrastructure Requirements: The New Project Functionality is available for project creation

  As a REDCap administrator
  I want to see that The system shall allow the password to be no less than 9 characters, require lowercase and uppercase letters for Table-based accounts
  #This feature is to be run completely MANUALLY on the REDCap Shadow instance


  Scenario: D.100.1.2700.100 Automatic account suspension
    #FUNCTIONAL REQUIREMENT
    #ACTION
    Given I successfully login to REDCap with the user "Test_Admin"
    And I click on the link labeled "Control Center"
    And I click on the link labeled "Security & Authentication"
    
    #VERIFY
    Then I verify "9" is within the input field labeled "Password Minimum Length"
    And I should see the dropdown field labeled "Password Complexity" with the option "Requires lowercase and uppercase letters and numbers" selected