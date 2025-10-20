Feature: Accuracy and Reliability: The system shall support the execution of single remote consent.

  As a REDCap administrator
  I want to see that REDCap shall support the execution of single remote consent.

  Scenario: D.100.1.1800.100 Canonical Project - Single Remote Consent
    #SETUP_PRODUCTION
    Given I successfully login to REDCap with the user "Test_Admin"
    And I create a new project named "D.100.1.1800.100" by clicking on "New Project" in the menu bar, selecting "Practice / Just for fun" from the dropdown, choosing file "CTSIBMICCanonicalProject.xml", and clicking the "Create Project" button

    #ACTION
    And I click on the link labeled "Designer"
    #FUNCTIONAL REQUIREMENT
    ##VERIFY
    Then I see "Prescreening"
    Then I see "Screening"
    Then I see "Inclusion/Exclusion"
    Then I see "eConsent - ICF"
    Then I see "eConsent - Assent"
    Then I see "eConsent - PPF"
    Then I see "Attestation Data Entry"
    Then I see "Manual Consent Upload"
    Then I see "Documentation of Informed Consent"
    Then I see "Randomization"
    Then I see "Withdraw"
    Then I see "Adverse Events"
    Then I see "Medication"
    Then I see "PROMIS SF v1.0 - Anxiety 4a"
    Then I see "PROMIS Bank v1.1 - Anger"
    Then I see "Follow Up"

    #ACTION
    And I click on the link labeled "User Rights"
    #FUNCTIONAL REQUIREMENT
    ##VERIFY
    Then I see "Administrator"
    Then I see "Auditor / Monitor"
    Then I see "Data Entry Analyst"
    Then I see "Principle Investigator"
    Then I see "Study Coordinator"
    
    #ACTION
    And I click on the link labeled "Control Center"
    #FUNCTIONAL REQUIREMENT
    ##VERIFY
    Then I see "REDCap Community"
    Then I see "Project REDCap website"
    Then I see "REDCap Administrator Videos"
    Then I see "REDCap Training Materials"
    Then I see "REDCap Language Library"
    Then I see "Language File Creator/Updater"
    Then I see "API Documentation"
    Then I see "Plugin, Hook, & External Module Documentation"
    Then I see "URL Shortener"

    Then I see "System Statistics"
    Then I see "User Activity Log"
    Then I see "User Activity Graph"
    Then I see "Map of Users"

    #ACTION
    And I click on the link labeled "Database Query Tool"
    #FUNCTIONAL REQUIREMENT
    ##VERIFY
    Then I see "This page allows administrators to directly query REDCap's MySQL/MariaDB database."
    Then I see "SQL Query:"
    Then I see "Execute"

  
    
#END