Feature: The system shall support the ability for a participant to enter data in a data collection instrument enabled and distributed as a survey.

  As a REDCap end user
  I want to see that the participant can enter data into a survey

  Scenario: D.3.15.700.100 Distributed survey link functions in Survey mode
    #SETUP_PRODUCTION
    Given I login to REDCap with the user "Test_Admin"
    And I create a new project named "D.3.15.700.100" by clicking on "New Project" in the menu bar, selecting "Practice / Just for fun" from the dropdown, choosing file "CTSIBMICCanonicalProject.xml", and clicking the "Create Project" button
    And I click on the link labeled "Project Setup"
    And I click on the button labeled "Move project to production"
    And I click on the radio labeled "Keep ALL data saved so far" in the dialog box
    And I click on the button labeled "YES, Move to Production Status" in the dialog box to request a change in project status
    Then I see Project status: "Production"

    #FUNCTIONAL REQUIREMENT
    ##ACTION: Open survey from participant list
    When I click on the link labeled "Survey Distribution Tools"
    And I click on the link labeled "Participant List"
    #Need a step definition for the 'link' below
    And I click on the link in the column labeled "Link"
    Then I should see "Please complete the survey below."
    
    When I enter "test@test.com" into the input field labeled "Email Address for eConsent" 
    And I select the radio option "English" for the field labeled "Preferred Language for Consent"
    And I select the radio option "Email invitation" for the field labeled "Preferred Contact Method" 

    Given I click on the button labeled "Submit"
    And I click on the button labeled "Close survey"
    Then I should see "You may now close this tab/window"

    #VERIFY_LOG
    Given I return to the REDCap page I opened the survey from
    When I click on the link labeled "Logging"
    Then I should see a table header and rows containing the following values in the logging table:
      | Time / Date      | Username            | Action          |
      | mm/dd/yyyy hh:mm | [survey respondent] | Update Response |
#END