Feature: Control Center: The following functionalities shall be accessed through the Dashboard & Activity menu section: System Statistics, Activity Log, Activity Graph, Map of Users

  As a REDCap administrator
  I want to see that system statistics, activity log, activity graph, and map of users are accessible in the control center.
  #This feature is to be run completely MANUALLY on the REDCap Shadow instance

  Scenario: D.100.1.3300.100 Dashboard and activity menu
    #FUNCTIONAL REQUIREMENT
    #ACTION
    Given I successfully login to REDCap shadow with an Admin account
    And I click on the link labeled "Control Center"

    #VERIFY
    Then I should see "System Statistics"
    And I should see "User Activity Log"
    And I should see "User Activity Graphs"
    And I should see "Map of Users"

    #VERIFY
    ##D.100.1.3400.100
    And I should see "Browse Projects"
    And I should see "Edit Project Settings"
    And I should see "Survey Link Lookup"

    #VERIFY
    ##D.100.1.3500.100
    And I should see "Browse Users"
    And I should see "Add Users (Table-based Only)"
    And I should see "User Allowlist"
    And I should see "Email Users"
    And I should see "API Tokens"
    And I should see "Banned IP Addresses"
    And I should see "Administrator Privileges"

    #VERIFY
    ##D.100.1.3600.100
    And I should see "REDCap Community"
    And I should see "Project REDCap website"
    And I should see "REDCap Administrator Videos"
    And I should see "REDCap Training Materials"
    And I should see "REDCap Language Library"
    And I should see "Language File Creator/Updater"
    And I should see "API Documentation"
    And I should see "Plugin, Hook, & External Module Documentation"
    And I should see "URL Shortener"

    #VERIFY
    ##D.100.1.3700.100
    And I should see "Multi-Language Management"
    And I should see "Clinical Data Interoperability Services"
    And I should see "Dynamic Data Pull (DDP) - Custom"
    And I should see "Custom Application Links"
    And I should see "Publication Matching"