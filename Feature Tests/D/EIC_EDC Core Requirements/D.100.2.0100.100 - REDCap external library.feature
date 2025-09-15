Feature: EIC / EDC Core Requirements: The user shall be able to import a new instrument from the REDCap external library.

  As a REDCap end user
  I want to see that the system allows importing new instruments from the REDCap external library.

  Scenario: D.100.2.0100.100 REDCap external library
    #SETUP_PRODUCTION
    Given I login to REDCap with the user "Test_Admin"
    And I create a new project named "D.100.2.0100.100" by clicking on "New Project" in the menu bar, selecting "Practice / Just for fun" from the dropdown, choosing file "CTSIBMICCanonicalProject.xml", and clicking the "Create Project" button
    
    #FUNCTIONAL REQUIREMENT
    ##ACTION: Open REDCap shared library
    And I click on the link labeled "Designer"
    Then I should see "REDCap Instrument Library"
    And I click on the button labeled "Import"

    #VERIFY
    ##Checks for a couple downloadable instrumentss
    Then I should see "REDCap Shared Library"
    And I should see "Agitated Behavior Scale"
    And I should see "Alcohol Dependence Scale Scored"
#END
