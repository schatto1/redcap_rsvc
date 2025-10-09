Feature: Control Center: The following functionalities shall be accessed through the System Configuration menu section: Configuration Check, General Configuration, Security & Authentication, User Settings, File Upload Settings, Modules/Services Configuration, Field Validation Types, Home Page Settings, Project Templates, Default Project Settings, Footer Settings (All Projects), Cron Jobs

  As a REDCap administrator
  I want to see that Configuration Check, General Configuration, Security & Authentication, User Settings, File Upload Settings, Modules/Services Configuration, Field Validation Types, Home Page Settings, Project Templates, Default Project Settings, Footer Settings (All Projects), Cron Jobs are accessible in the control center.
  #This feature is to be run completely MANUALLY on the REDCap Shadow instance

  Scenario: D.100.1.3800.100 System configuration menu
    #FUNCTIONAL REQUIREMENT
    #ACTION
    Given I successfully login to REDCap shadow with an Admin account
    And I click on the link labeled "Control Center"

    #VERIFY
    Then I should see "Configuration Check"
    And I should see "General Configuration"
    And I should see "Security & Authentication"
    And I should see "User Settings"
    And I should see "File Upload Settings"
    And I should see "Modules/Services Configuration"
    And I should see "Field Validation Types"
    And I should see "Home Page Settings"
    And I should see "Project Templates"
    And I should see "Default Project Settings"
    And I should see "Footer Settings (All Projects)"
    And I should see "Cron Jobs"

    #ACTION
    Given I click on the link labeled "Database Query Tool"
    And I click on the link labeled "21 CFR PART 11 CONFIG EXPORT"
    And I click on the button labeled "Export results (CSV)"
    Then I should have a latest downloaded "csv" file that contains the headings below
    | field_name | value | CONFIG_EXPORT_TIMESTAMP | 
    And I verify that the data matches the data outlined in the previous configuration export

