Feature: File Repository: The system shall support file retention rules for the Recycle Bin.  Includes 30 Day file retention of deleted files | 30 Day file restore

  As a REDCap end user
  I want to see that the system will support file retention rules for the recycle bin

  Scenario: D.3.26.600.100 Recycle Bin file retention and restoration 
    #SETUP_PRODUCTION
    Given I login to REDCap with the user "Test_Admin"
    And I create a new project named "D.3.26.600.100" by clicking on "New Project" in the menu bar, selecting "Practice / Just for fun" from the dropdown, choosing file "CTSIBMICCanonicalProject.xml", and clicking the "Create Project" button
    And I click on the link labeled "Project Setup"
    And I click on the button labeled "Move project to production"
    And I click on the radio labeled "Keep ALL data saved so far" in the dialog box
    And I click on the button labeled "YES, Move to Production Status" in the dialog box to request a change in project status
    Then I see Project status: "Production"

    #FUNCTIONAL REQUIREMENT
    ##ACTION: Upload test file
    Given I click on the link labeled "File Repository"
    And I upload a "docx" format file located at "import_files/File_Upload.docx", by clicking the button near "Select files to upload" to browse for the file, and clicking the button labeled "Open" to upload the file
    Then I should see "100% uploaded"

    ##ACTION: Delete the file
    #Step is not defined for file repo
    Given I click on the checkbox within the file repository table in the following row: "File_Upload.docx"
    And I click on the button labeled "Delete"
    And I click on the button labeled "Delete"
    And I click on the button labeled "Close"
    And I click on the link labeled "Recycle Bin"

    #VERIFY
    Then I should see "Name"
    And I should see "Size"
    And I should see "Time Uploaded"
    And I should see "Comments"
    And I should see "Time Deleted"
    And I should see "Time until permanent deletion from Recycle Bin"
    And I should see "Restore file - or- Delete File"
    And I should see "File_Upload.docx"
    And I should see "21.5 KB"
    And I should see "Uploaded by test_admin. Deleted by test_admin"
    And I should see "30 days"
  #END
