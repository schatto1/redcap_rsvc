Feature: Infrastructure Requirements: REDCap shall be hosted on Chip: x86 64 AMD EPYC 7502 32-CORE 2.5 Ghz, Memory: 32 GB, UPS: Two independent power grids with a battery backup (15 minutes). 5 generators with 22000 gallons of diesel, calculated to keep systems running for 3 days in the event of an emergency, Output: 110

  As a REDCap administrator
  I want to see that REDCap host configurations meet performance and backup requirements.
  #This feature is to be run completely MANUALLY on the REDCap Shadow instance

  Scenario: D.100.1.1300.100 Host configurations
    #FUNCTIONAL REQUIREMENT
    #ACTION
    Given I open a new terminal window
    And I SSH to "redwood.chpc.utah.edu"
    And I SSH to "redcap-r9.ctsi.utah.edu"
    And I CD to "/var/www/html/redcap01.brisc.utah.edu/ccts/redcap"
    And I run the command "cat /proc/cpuinfo"
    Then I should see "Chip: x86 64 AMD EPYC 7502 32-CORE 2.5 Ghz"
    And I should see "Memory: 32 GB"
    
