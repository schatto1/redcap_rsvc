Feature: User Interface: The tool shall only display forms that are designated to be locked.
    As a REDCap end user
    I want to see that Record locking and E-signatures is functioning as expected

  Scenario: C.2.19.200.100 Display forms that are designated
        #SETUP
    Given I login to REDCap with the user "Test_Admin"
        #Manual: Append project name with the current version (i.e. "X.X.X.XXX.XXX - LTS X.X.X")
    And I create a new project named "C.2.19.200.100" by clicking on "New Project" in the menu bar, selecting "Practice / Just for fun" from the dropdown, choosing file "Project_1.xml", and clicking the "Create Project" button

  Scenario: #SETUP_PRODUCTION
    When I click on the link labeled "Project Setup"
    And I click on the button labeled "Move project to production"
    And I click on the radio labeled "Keep ALL data saved so far" in the dialog box
    And I click on the button labeled "YES, Move to Production Status" in the dialog box to request a change in project status
    Then I should see Project status: "Production"

  Scenario: #SETUP form lock to display
        #FUNCTIONAL REQUIREMENT  C.2.19.200.100 
    When I click on the link labeled "Customize & Manage Locking/E-signatures"
    And I click on the button labeled "I understand. Let me make changes" in the dialog box
    And for the Column Name "Display the Lock option for this instrument?", I check the checkbox within the Record Locking Customization table for the Data Collection Instrument named "Data Type"
    Then I should see a table header and rows containing the following values in a table:
      | Display the Lock option for this instrument? | Data Collection Instrument | Also display E-signature option on instrument? |                           |
      | [✓]                                          | Text Validation            | [ ]                                            | Notes Box & "Save" button |
      | [✓]                                          | Data Type                  | [ ]                                            | Notes Box & "Save" button |
      | [✓]                                          | Survey                     | [ ]                                            | Notes Box & "Save" button |
      | [✓]                                          | Consent                    | [ ]                                            | Notes Box & "Save" button |

  Scenario: ##VERIFY: form display lock function
    When I click on the link labeled "Record Status Dashboard"
    And I locate the bubble for the "Text Validation" instrument on event "Event 1" for record ID "1" and click on the bubble
    Then I should see "Text Validation"
    And I should see a checkbox labeled "Lock this instrument?" that is unchecked
    When I click on the checkbox for the field labeled "Lock this instrument?"
    And I click on the button labeled "Save & Exit Form"
    Then I should see "Record Home Page"

  Scenario: ##VERIFY: form NOT display lock function
    When I click on the link labeled "Record Status Dashboard"
    And I locate the bubble for the "Data Type " instrument on event "Event 1" for record ID "1" and click on the bubble
    Then I should see "Data Type "
    And I should NOT "Lock this instrument?"
    And I click on the button labeled "Save & Exit Form"
    Then I should see "Record Home Page"
#END
