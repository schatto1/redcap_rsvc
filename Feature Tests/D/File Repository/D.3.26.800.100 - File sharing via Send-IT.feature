Feature: File Repository: The system shall support sharing of files via Send-IT.

  As a REDCap end user
  I want to see that the system will support sharing files via Send-IT

  Scenario: D.3.26.800.100 File sharing via Send-IT 
    #SETUP_PRODUCTION
    Given I successfully login to REDCap with the user "Test_Admin"
    And I click on the link labeled "Send-It"

    #FUNCTIONAL REQUIREMENT
    ##ACTION: Upload test file
    And I enter "test@test.com" into the textarea field labeled "To:"
    And I upload a "docx" format file located at "import_files/File_Upload.docx", by clicking the button near "Select a file:" to browse for the file
    And I click on the button labeled "Send It!"
    ##VERIFY
    Then I should see "File successfully uploaded!"
#END