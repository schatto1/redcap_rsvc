Feature: Security: The system will automatically suspend a Table-based user's account after 180 days of non-use

  As a REDCap administrator
  I want to see that the system will automatically suspend a Table-based user's account after 180 days of non-use.
  #This feature is to be run completely MANUALLY on the REDCap Shadow instance


  Scenario: D.100.1.2500.100 Automatic account suspension
    #FUNCTIONAL REQUIREMENT
    #ACTION
    Given I successfully login to REDCap shadow with an Admin account
    And I click on the link labeled "Control Center"
    And I click on the link labeled "User Settings"
    
    #VERIFY
    Then I should see "Auto-suspend users after period of inactivity"
    And I should see "180" in the field labeled "Period of inactivity:"