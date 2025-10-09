Feature: Infrastructure Requirements: Should have the below Software Configurations: Database details: MariaDB 10.1.48 or the latest, PHP v 7.4.30 or the latest, REDCap v 12.5.12 or the latest

  As a REDCap administrator
  I want to see that REDCap software configurations are up to date.
  #This feature is to be run completely MANUALLY on the REDCap Shadow instance

  Scenario: D.100.1.1200.100 Software configurations
    #FUNCTIONAL REQUIREMENT
    #ACTION
    Given I successfully login to REDCap shadow with an Admin account
    And I click on the link labeled "Control Center"

    #VERIFY
    Then I should see the REDCap version is greater than or equal to 15.5.7
    And I should see that the PHP version is greater than or equal to 7.4.30
    And I should see that the database version greater than or equal to 10.1.48
