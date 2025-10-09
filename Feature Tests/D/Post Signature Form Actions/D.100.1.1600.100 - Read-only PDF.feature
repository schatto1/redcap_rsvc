Feature: Post Signature Form Actions: The system shall store any completed survey completed as read-only. 

  As a REDCap administrator
  I want to see that completed surveys are stored as read-only PDFs.
  #This feature is to be run completely MANUALLY on the REDCap Shadow instance

  Scenario: D.100.1.1600.100 Read-only PDF
    #FUNCTIONAL REQUIREMENT
    #ACTION
    Given I open a new terminal window
    And I SSH to "redwood.chpc.utah.edu"
    And I SSH to "redcap-r9.ctsi.utah.edu"
    And I CD to "/uufs/chpc.utah.edu/common/HIPAA/proj_redcap_vault/shadow/"
    And I run the command "ls -Art | tail -n 2"
    Then I should see 2 rows containing read only files ending in .pdf