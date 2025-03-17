Feature: Reporting: REDCap system shall include the following fields on the header and footer of a rendered report: Project Name, Study Id Number, Pagination, Date and Time, REDCap logo

  As a REDCap end user
  I want to see that logging reporting is functioning as expected

  Scenario: D.100.2.1900.100 Report header and footer logging
    #SETUP
    Given I login to REDCap with the user "Test_Admin"
    And I create a new project named "D.100.2.1900.100" by clicking on "New Project" in the menu bar, selecting "Practice / Just for fun" from the dropdown, choosing file "CTSIBMICCanonicalProject.xml", and clicking the "Create Project" button

    #FUNCTIONAL_REQUIREMENT
    ##ACTION
    When I click on the link labeled "Logging"

    ##VERIFY
    Then I should see "D.100.2.1900.100"
    And I should see "PID"
    And I should see "Page 1 of"
    And I should see "Time / Date"
    And I should see "REDCap"

#END