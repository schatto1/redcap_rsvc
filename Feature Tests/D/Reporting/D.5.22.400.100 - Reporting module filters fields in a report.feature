Feature: Reporting: The system shall support the ability to limit filter/live filter records included in a report. 

  As a REDCap end user
  I want to see that Reporting is functioning as expected

  Scenario: D.5.22.400.100 Reporting module filters fields in a report 
    #SETUP
    Given I login to REDCap with the user "Test_Admin"
    And I create a new project named "D.5.22.400.100" by clicking on "New Project" in the menu bar, selecting "Practice / Just for fun" from the dropdown, choosing file "CTSIBMICCanonicalProject.xml", and clicking the "Create Project" button

    #SETUP_PRODUCTION
    When I click on the link labeled "Project Setup"
    And I click on the button labeled "Move project to production"
    And I click on the radio labeled "Keep ALL data saved so far" in the dialog box
    And I click on the button labeled "YES, Move to Production Status" in the dialog box to request a change in project status
    Then I should see Project status: "Production"

    #FUNCTIONAL_REQUIREMENT
    ##ACTION:  create report
    When I click on the link labeled "Data Exports, Reports, and Stats"
    And I click on the button labeled "Create New Report"
    And I enter "D.5.22.400.100 REPORT" into the input field labeled "Name of Report:"

    ##VERIFY: included field
    And I enter "prefname" into the input field labeled "Field 2"
    And I click on the button labeled "Save Report"
    And I enter "prefname" into the input field labeled "Filter 1"
    And I select "prescreening_complete \"Complete?\"" on the dropdown field labeled "Live Filter 1" 
    And I click on the button labeled "Save Report"
    Then I should see "Your report has been saved!" in the dialog box

    ##VERIFY: included field
    When I click on the button labeled "View report" in the dialog box
    Then I should see "Live filters:"
    And I should see "Tester 123"
    And I should see "Screening"
    And I should see "Visit 1"
    And I should see "Visit 2"

#END