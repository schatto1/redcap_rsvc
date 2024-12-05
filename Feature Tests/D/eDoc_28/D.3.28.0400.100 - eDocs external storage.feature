Feature: eDocs: The system shall ensure that files uploaded to the file repository are saved in the configured eDoc external storage

  As a REDCap end user
  I want to see that the system allows file repository uploads to be saved in eDocs external storage.
   #This feature is to be run completely MANUALLY on the REDCap Shadow instance

  Scenario: D.3.28.0400.100 eDocs external storage 
    #SETUP
    Given I login to REDCap Shadow with an Admin account
    And I create a new project named "D.3.28.0400.100" by clicking on "New Project" in the menu bar, selecting "Practice / Just for fun" from the dropdown, choosing file "CTSIBMICCanonicalProject.xml", and clicking the "Create Project" button
    And I click on the link labeled "File Repository"
    And I upload a "docx" format file located at "import_files/File_Upload.docx", by clicking the button near "Select files to upload" to browse for the file, and clicking the button labeled "Open" to upload the file
    Then I should see "100% Uploaded"

    #FUNCTIONAL REQUIREMENT
    ##VERIFY: Check external eDocs storage location
    Given I open a new terminal window
    And I SSH to "redwood.chpc.utah.edu"
    And I SSH to "redcap-c7.ccts.utah.edu"
    And I CD to "/var/www/redcap_uploads/shadow/edocs"
    And I run the command "ls -Art | tail -n 2"
    Then I should see a row containing the file upload timestamp and the PID of D.3.28.0400.100 ending in .docx
#END
    