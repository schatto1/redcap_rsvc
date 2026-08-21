Feature: Infrastructure Requirements: REDCap shall be hosted on Chip: x86 64 AMD EPYC 7502 32-CORE 2.5 Ghz, Memory: 32 GB, UPS: Two independent power grids with a battery backup (15 minutes). 5 generators with 22000 gallons of diesel, calculated to keep systems running for 3 days in the event of an emergency, Output: 110 V

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
    Then I should see "vendor_id       : AuthenticAMD"
    And I should see  "cpu family      : 23"
    And I should see  "model           : 49"
    And I should see  "model name      : AMD EPYC 7502 32-Core Processor"
    And I should see  "microcode       : 0x830107a"
    And I should see  "cpu MHz         : 2499.999"
    And I should see  "cache size      : 512 KB"

    Given I run the command "cat /proc/meminfo"
    Then I should see "MemTotal is greater than or equal to 32 GB"
    
