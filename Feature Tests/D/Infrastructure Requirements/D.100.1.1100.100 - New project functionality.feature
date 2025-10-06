Feature: Infrastructure Requirements: The New Project Functionality is available for project creation

  As a REDCap administrator
  I want to see that the REDCap new project creation funcationality is available.

  Scenario: D.100.1.1100.100 New project functionality
    #FUNCTIONAL REQUIREMENT
    #ACTION
    Given I successfully login to REDCap with the user "Test_Admin"
    And I click on the link labeled "My Projects"
    Then I should see "New Project"
    
    Given I click on the link labeled "New Project"
    Then I should see "Create a new REDCap Project"
    And I should see "Project title:"
    And I should see "Project's purpose:"
    And I should see "Project notes (optional):"
    And I should see "Project creation option:"
    And I should see "Create Project"