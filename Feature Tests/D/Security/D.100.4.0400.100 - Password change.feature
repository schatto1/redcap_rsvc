Feature: Security: REDCap application shall allow a table-based user to change their password. 

  As a REDCap end user
  I want to see that a table-based user can change their password

  Scenario: D.100.4.0400.100 Password change 
    #FUNCTIONAL REQUIREMENT
    ##ACTION: Change password
    Given I login to REDCap with the user "Test_User1"
    And I click on the link labeled "Profile"
    And I click on the button labeled "Reset password"
    And I click on the button labeled "Reset" in the dialog box
    And I enter "Testing123" into the input field labeled "Password"
    And I enter "Testing123" into the input field labeled "Re-type password"
    And I click on the button labeled "Submit"
    Then I should see "Welcome to REDCap!"
    
    #VERIFY
    Given I logout
    And I enter "Test_User1" into the input field labeled "Username"
    And I enter "Testing123" into the input field labeled "Password"
    And I click on the button labeled "Log In"
    Then I should see "Welcome to REDCap!"
#END


