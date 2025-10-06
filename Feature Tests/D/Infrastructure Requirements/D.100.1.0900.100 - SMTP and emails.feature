Feature: Infrastructure Requirements: The REDCap application is configured with SMTP and can send emails. 

  As a REDCap administrator
  I want to see that REDCap is configured with SMTP and can send emails.
  #This feature is to be run completely MANUALLY on the REDCap Shadow instance

  Scenario: D.100.1.0900.100 SMTP and emails
    #FUNCTIONAL REQUIREMENT
    #ACTION
    Given I successfully login to REDCap shadow with an Admin account
    And I click on the link labeled "Control Center"
    And I click on the link labeled "Configuration Check"
    And I wait for another 5 seconds

    #VERIFY
    Then I should see "REDCap is able to send emails"

    #ACTION
    Given I click on the link labeled "Email Users"

    #VERIFY
    Then I should see "Compose Message"
    And I should see "From"
    And I should see "To"
    And I should see "Subject"
    And I should see "Message"
    And I should see "Send email"
