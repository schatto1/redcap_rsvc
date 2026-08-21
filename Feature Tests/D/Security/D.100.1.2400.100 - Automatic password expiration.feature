Feature: Security: The system will automatically expire the user password after 180 days

  As a REDCap administrator
  I want to see that the system will automatically expire the user password after 180 days.
  #This feature is to be run completely MANUALLY on the REDCap Shadow instance


  Scenario: D.100.1.2400.100 Automatic password expiration
    #FUNCTIONAL REQUIREMENT
    #ACTION
    Given I successfully login to REDCap shadow with an Admin account
    And I click on the link labeled "Control Center"
    And I click on the link labeled "Security & Authentication"
    
    #VERIFY
    Then I should see "180" in the field labeled "Force users to change their password after a specified number of days."