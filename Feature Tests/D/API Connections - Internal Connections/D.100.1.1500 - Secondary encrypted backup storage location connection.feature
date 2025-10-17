Feature: API Connections / Internal Connections: REDCap storage is connected with a secondary encrypted backup storage location through a developed internal connection.

  As a REDCap administrator
  I want to see that REDCap storage is connected with a secondary encrypted backup storage location through a developed internal connection.
  #This feature is to be run completely MANUALLY on the REDCap Shadow instance

  Scenario: D.100.1.1500.100 REDCap data files back up
    #FUNCTIONAL REQUIREMENT
    #ACTION
    Given I open a new terminal window
    And I SSH to "redwood.chpc.utah.edu"
    And I SSH to "rc-prod-db-r8.ctsi.utah.edu"
    And I CD to "/uufs/chpc./utah.edu/common/HIPAA/proj_redcap/prod/backup"
    And I run the command "ls -lah"
    Then I should see "build"
    And I should see "daily"
    Then I run the command "sudo crontab -l"
    And I type in my password
    Then I should see "# Daily mysql dump of production redcap database 3 AM"
    And I should see "0 03 * * * /export/backups/scripts/mysql_backup.sh PRODUCTION >/dev/null 2>&1; touch /uufs/chpc.utah.edu/common/HIPAA/proj_redcap/trigger_files/prod_backup_complete.txt;"
    Then I run the command "cat /export/backups/scripts/mysql_backup.sh"
    Then I should see 'ARCHIVE_DIR="/uufs/chpc.utah.edu/common/HIPAA/proj_redcap/prod/backup/daily/"'

  Scenario: D.100.1.1500.200 REDCap production environment back up
    #FUNCTIONAL REQUIREMENT
    #Would there be better evidence than an email?
    #ACTION
    Given I access Box
    And I navigate to the folder "BMIC Operations > REDCap > Part11-Validation > Validation Documentation > Transition to RSVC > Utah Tier D Release > Installation Qualification Testing (IQ) > IQ evidence and documents"
    And I open the file "REDCap validation updates.eml" in an email client
    Then I should see "Subject: RE: REDCap validation updates"
    And I should see the following:
        # proj_redcap
        *show schedule=proj_redcap
        Schedule {
        Name = "proj_redcap"
        Run = Full 1 Jan at 20:30
        Run = Full 1 Apr at 20:30
        Run = Full 1 Jul at 20:30
        Run = Full 1 Oct at 20:30
        Run = Incremental Mon-Fri at 20:05
        }
    And I should see the following:
        # proj_redcap_vault
        *show schedule=proj_redcap_vault
        Schedule {
        Name = "proj_redcap_vault"
        Run = Full 1 Jan at 20:30
        Run = Full 1 Apr at 20:30
        Run = Full 1 Jul at 20:30
        Run = Full 1 Oct at 20:30
        Run = Incremental Mon-Fri at 20:05
        }
    And I should see the following:
        # proj_redcap_edocs
        *show schedule=proj_redcap_edocs
        Schedule {
        Name = "proj_redcap_edocs"
        Run = Full 1 Jan at 20:30
        Run = Full 1 Apr at 20:30
        Run = Full 1 Jul at 20:30
        Run = Full 1 Oct at 20:30
        Run = Incremental Tue at 20:05
        }
    And I should see the following:
        # redcap-r9.ctsi.utah.edu
        *show schedule=srv-redcap-r9.ctsi.utah.edu
        Schedule {
        Name = "srv-redcap-r9.ctsi.utah.edu"
        Run = Full 1st Sat at 19:00
        Run = Incremental Mon-Fri at 20:00
        }
    And I should see the following:
        # rc-prod-db-r8.ctsi.utah.edu
        *show schedule=srv-rc-prod-db-r8.ctsi.utah.edu
        Schedule {
        Name = "srv-rc-prod-db-r8.ctsi.utah.edu                    
        Run = Full 1st Sat at 19:00
        Run = Incremental Mon-Fri at 20:00
        }

  Scenario: D.100.1.1500.300 REDCap project user roles
    #FUNCTIONAL REQUIREMENT
    #This seems out of place here, but will keep here for this validation
    #ACTION
    Given I successfully login to REDCap shadow with an Admin account
    And I click on the link labeled "My Projects"
    And I click on the link labeled "Canonical REDCap Demonstration Project"
    And I click on the link labeled "User Rights"
    Then I should see "Administrator"
    And I should see "Auditor / Monitor"
    And I should see "Data Entry Analyst"
    And I should see "Principle Investigator"
    And I should see "Study Coordinator"