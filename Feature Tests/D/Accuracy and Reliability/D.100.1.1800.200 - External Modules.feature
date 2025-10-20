Feature: Accuracy and Reliability: The system shall support the execution of single remote consent.

  As a REDCap administrator
  I want to see that REDCap shall support the execution of single remote consent.
  #This feature is to be run completely MANUALLY on the REDCap Shadow instance

  Scenario: D.100.1.1800.200 Canonical Project - External Modules
    #FUNCTIONAL REQUIREMENT
    Given I successfully login to REDCap shadow with an Admin account
    And I click on the link labeled "My Projects"
    And I click on the link labeled "Canonical REDCap Demonstration Project"
    And I click on the link labeled "Manage" in the "External Modules" box
    Then I should see "External Modules - Project Module Manager"
    Then I should see "Modules Currently Available on this System"
    Then I should see "Image Map"
    Then I should see "Instance Table"