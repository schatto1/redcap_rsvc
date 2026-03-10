Feature: Infrastructure Requirements: REDCap file structure is installed.

  As a REDCap administrator
  I want to see that the REDCap file structure is installed.
  #This feature is to be run completely MANUALLY on the REDCap Shadow instance

  Scenario: D.100.1.0100.100 REDCap file structure
    #FUNCTIONAL REQUIREMENT
    #ACTION
    Given I successfully login to REDCap shadow with an Admin account
    And I click on the link labeled "Control Center"
    And I click on the link labeled "Configuration Check"
    And I wait for another 5 seconds

    #VERIFY
    Then I should see "TEST 1: Establish basic REDCap file structure"
    And I should see "SUCCESSFUL! - All necessary files and folders were found."
    And I should see "TEST 2: Connect to the table named \"redcap_config\""
    And I should see "SUCCESSFUL! - The table \"redcap_config\" in the MySQL database named redcap was accessed successfully."
    And I should see "TEST 3: Check REDCap database table structure"
    And I should see "SUCCESSFUL! - Your REDCap database structure is correct!"
    And I should see "TEST 4: Check if PHP cURL extension is installed"
    And I should see "SUCCESSFUL! - The cURL extension is installed."
    And I should see "TEST 5: Checking communication with REDCap Consortium server"
    And I should see "SUCCESSFUL! - Communicated successfully with the REDCap Consortium server. You WILL be able to use the \"automatic reporting\" method to report your site stats, as well as use the REDCap Shared Library."
    And I should see "TEST 6: Check if REDCap Cron Job is running"
    And I should see "SUCCESSFUL! - REDCap Cron Job is running properly."
    
    #VERIFY
    And I should see "Using SSL"
    And I should see "GD library (version 2 or higher) is installed"
    And I should see "PHP Fileinfo extension is installed"
    And I should see "REDCap is able to send emails"
    And I should see "The REDCap web server's temp directory is writable"
    And I should see "\"temp\" directory is writable"
    And I should see "File upload directory is writable"