Feature: Executed EIC Form Storage: The REDCap System and storage
location shall be backed up daily.
CS:
Bareos REDCap Host System
Backup Schedule
# redcap-r9.ctsi.utah.edu
*show schedule=srv-redcap-
r9.ctsi.utah.edu
Schedule {
    Name = "srv-redcap-r9.ctsi.utah.edu"
    Run = Full 1st Sat at 19:00
    Run = Incremental Mon-Fri at 20:00}
REDCap Nightly Database Backup
Schedule:
# rc-prod-db-r8.ctsi.utah.edu
*show schedule=srv-rc-prod-db-
r8.ctsi.utah.edu
Schedule {
    Name = "srv-rc-prod-db-
    r8.ctsi.utah.edu"
    Run = Full 1st Sat at 19:00
    Run = Incremental Mon-Fri at 20:00}
Bareos REDCap Database Filesystems
Backup:
# proj_redcap
*show schedule=proj_redcap
Schedule {
    Name = "proj_redcap"
    Run = Full 1 Jan at 20:30
    Run = Full 1 Apr at 20:30
    Run = Full 1 Jul at 20:30
    Run = Full 1 Oct at 20:30
    Run = Incremental Mon-Fri at 20:05}
Bareos REDCap SFTP Vault Location:
Incremental daily, full monthly
# proj_redcap_vault
*show schedule=proj_redcap_vault
Schedule {
    Name = "proj_redcap_vault"
    Run = Full 1 Jan at 20:30
    Run = Full 1 Apr at 20:30
    Run = Full 1 Jul at 20:30
    Run = Full 1 Oct at 20:30
    Run = Incremental Mon-Fri at 20:05}
Bareos REDCap eDocs Backup:
# proj_redcap_edocs
*show schedule=proj_redcap_edocs
Schedule {
    Name = "proj_redcap_edocs"
    Run = Full 1 Jan at 20:30
    Run = Full 1 Apr at 20:30
    Run = Full 1 Jul at 20:30
    Run = Full 1 Oct at 20:30
    Run = Incremental Tue at 20:05}

  As a REDCap end user
  I want to see that the REDCap System and storage
location shall be backed up daily.

  #This feature test is REDUNDANT and can be viewed in Feature: D.100.1.1500 - Secondary encrypted backup storage location connection
  #Scenario: D.100.1.1500.100 REDCap data files back up
  #Scenario: D.100.1.1500.200 REDCap production environment back up