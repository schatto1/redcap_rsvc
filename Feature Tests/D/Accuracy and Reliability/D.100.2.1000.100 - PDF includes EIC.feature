Feature: Accuracy and Reliability: The first pages of the printable pdf shall include: Embedded images of the EIC

  As a REDCap end user
  I want to see that the system allows the completed EIC PDF to contain embedded images of the EIC form.

  Scenario: D.100.2.1000.100 PDF includes EIC
    #SETUP_PRODUCTION
    Given I login to REDCap with the user "Test_Admin"
    And I create a new project named "D.100.2.1000.100" by clicking on "New Project" in the menu bar, selecting "Practice / Just for fun" from the dropdown, choosing file "CTSIBMICCanonicalProject.xml", and clicking the "Create Project" button
    And I click on the link labeled "Project Setup"
    And I click on the button labeled "Move project to production"
    And I click on the radio labeled "Keep ALL data saved so far" in the dialog box
    And I click on the button labeled "YES, Move to Production Status" in the dialog box to request a change in project status
    Then I see Project status: "Production"
    
    #ACTION
    When I click on the link labeled "Record Status Dashboard"
    And I click on the link labeled "1"
    And I click the bubble to add a record for the "eConsent - ICF" longitudinal instrument on event "Screening"
    And I click on the button labeled "Survey options"
    And I click on the survey option label containing "Log out+ Open survey" label
    And I click on the button labeled "English"
    And I click on the link labeled "Add signature"
    And I draw a signature in the signature field area
    And I click on the button labeled "Save signature" in the dialog box
    And I click on the button labeled "Next Page >>"

    #FUNCTIONAL REQUIREMENT
    ##VERIFY
    Then I should see "Consent example English"
#END