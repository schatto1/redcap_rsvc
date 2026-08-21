Feature: Security: The New Project Functionality is available for project creation

  As a REDCap administrator
  I want to see that The system shall allow the password to be no less than 9 characters, require lowercase and uppercase letters for Table-based accounts
  #This feature is to be run completely MANUALLY on the REDCap Shadow instance


  Scenario: D.100.1.2700.100 Password requirements
    #FUNCTIONAL REQUIREMENT
    #ACTION
    Given I successfully login to REDCap shadow with an Admin account
    And I click on the link labeled "Control Center"
    And I click on the link labeled "Security & Authentication"
    
    #VERIFY
    Then I should see "9" in the field labeled "Password Minimum Length"
    And I should see the dropdown field labeled "Password Complexity" with the option "Requires lowercase and uppercase letters and numbers" selected

    #ACTION
    Given I navigate to "https://uofu.service-now.com/uitkb?id=uit_of_kb_article_view&sysparm_article=KB0000580" and log in

    #VERIFY
    Then I should see "University password requirements and guidelines"
    And I should see "Passwords must be at least 14 characters. There is no maximum character limit."
    And I should see "New passwords cannot match the previous five (5) passwords."
    And I should see "Passwords must contain all four of the following elements:"
    And I should see "A number"
    And I should see "A symbol ($, &, @, %, _, *)"
    And I should see "An UPPERCASE letter"
    And I should see "A lowercase letter"
    And I should see "Passwords cannot contain slashes ("/" or "\")."