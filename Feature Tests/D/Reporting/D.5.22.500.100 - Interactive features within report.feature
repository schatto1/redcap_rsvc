Feature: Reporting: The system shall support the ability for reports to link with the following features:  Stats & Charts | Export Data  |  Print  |  Edit Report

  As a REDCap end user
  I want to see that Reporting is functioning as expected

  Scenario: D.5.22.500.100 Interactive features within report 
    #SETUP
    Given I login to REDCap with the user "Test_Admin"
    And I create a new project named "D.5.22.500.100" by clicking on "New Project" in the menu bar, selecting "Practice / Just for fun" from the dropdown, choosing file "CTSIBMICCanonicalProject.xml", and clicking the "Create Project" button

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
    And I enter "D.5.22.500.100 REPORT" into the input field labeled "Name of Report:"
    And I enter "prefname" into the input field labeled "Field 2"
    And I click on the button labeled "Save Report"
    And I click on the button labeled "Save Report"
    And I click on the button labeled "Return to My Reports & Exports"
    Then I should see a table row containing the following values in the reports table:
        | 1 | D.5.22.500.100 REPORT |
    
    ##VERIFY: stats & charts
    When I click on the "Stats & Charts" button for the "D.5.22.500.100 REPORT" report in the My Reports & Exports table 
    Then I should see "D.5.22.500.100 REPORT"
    And I should see "Preferred Name"
    And I should see "Total"
    And I should see "Count"
    And I should see "Missing"

    ##VERIFY: export data
    When I click on the button labeled "Export Data"
    Then I should see "Exporting \"D.5.22.500.100 REPORT\"" in the dialog box
    And I should see "Choose export format" in the dialog box
    And I should see "CSV / Microsoft Excel (raw data)" in the dialog box
    And I should see "CSV / Microsoft Excel (labels)" in the dialog box
    And I should see "SPSS Statistical Software" in the dialog box
    And I should see "SAS Statistical Software" in the dialog box
    And I should see "R Statistical Software" in the dialog box
    And I should see "Stata Statistical Software" in the dialog box
    And I should see "CDISC ODM (XML)" in the dialog box
    And I should see "De-identification options" in the dialog box
    And I should see "Known Identifiers:" in the dialog box
    And I should see "Remove All Identifier Fields" in the dialog box
    And I should see "Hash the Record ID field" in the dialog box
    And I should see "Free-form text:" in the dialog box
    And I should see "Remove unvalidated Text fields" in the dialog box
    And I should see "Remove Notes/Essay box fields" in the dialog box
    And I should see "Date and datetime fields:" in the dialog box
    And I should see "Remove all date and datetime fields" in the dialog box
    And I should see "Shift all dates by value between 0 and 364 days" in the dialog box
    And I should see "Also shift all survey completion timestamps by value between 0 and 364 days" in the dialog box
    And I should see "Advanced data formatting options" in the dialog box
    And I should see "Export blank values for gray Form Status?" in the dialog box
    And I should see "Set CSV delimiter character" in the dialog box
    And I should see "Force all numbers into a specified decimal format?" in the dialog box
    And I should see "Export Data" in the dialog box
    And I click on the button labeled "Cancel"

    ##VERIFY: print report
    When I click on the button labeled "Print Page"
    #Needs step definition for print dialog window
    Then I should see "Print"
    And I click on the button labeled "Cancel"

    ##VERIFY: edit report
    When I click on the button labeled "Edit Report"
    Then I should see "Edit Existing Report:"
    And I should see "D.5.22.500.100 REPORT"
    And I select "prescreening_complete \"Complete?\"" on the dropdown field labeled "Live Filter 1" 
    And I click on the button labeled "Save Report"
    Then I should see "Your report has been saved!" in the dialog box
    And I click on the button labeled "Return to My Reports & Exports"
    Then I should see a table row containing the following values in the reports table:
        | 1 | D.5.22.500.100 REPORT |

#END