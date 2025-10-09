Feature: Infrastructure Requirements: The system will automatically expire the user password after 180 days

  As a REDCap administrator
  I want to see that the system will automatically expire the user password after 180 days.
  #This feature is to be run completely MANUALLY on the REDCap Shadow instance


  Scenario: D.100.1.2400.100 Automatic password expiration
    #FUNCTIONAL REQUIREMENT
    #ACTION
    Given I successfully login to REDCap with the user "Test_Admin"
    And I click on the link labeled "Control Center"
    And I click on the link labeled "Security & Authentication"
    
    #VERIFY
    Then I verify "180" is within the input field labeled "Force users to change their password after a specified number of days."