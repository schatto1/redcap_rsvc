Feature: File Repository: The system shall support sharing of files via Send-IT.

  As a REDCap end user
  I want to see that the system will support sharing files via Send-IT

  Scenario: D.3.26.800.100 File sharing via Send-IT 
    #SETUP_PRODUCTION
    Given I login to REDCap with the user "Test_Admin"
    And I create a new project named "D.3.26.800.100" by clicking on "New Project" in the menu bar, selecting "Practice / Just for fun" from the dropdown, choosing file "CTSIBMICCanonicalProject.xml", and clicking the "Create Project" button
    And I click on the link labeled "Project Setup"
    And I click on the button labeled "Move project to production"
    And I click on the radio labeled "Keep ALL data saved so far" in the dialog box
    And I click on the button labeled "YES, Move to Production Status" in the dialog box to request a change in project status
    Then I see Project status: "Production"

    #FUNCTIONAL REQUIREMENT
    ##ACTION: Upload test file
    Given I click on the link labeled "Add / Edit Records"
    And I select "1 Tester 123" on the dropdown field labeled "Choose an existing Record ID"
    And I click the bubble to add a record for the "Manual Consent Upload" longitudinal instrument on event "Screening"
    And I click on the link labeled "Upload file"
    And I upload a "docx" format file located at "import_files/File_Upload.docx", by clicking the button near "Upload file" to browse for the file, and clicking the button labeled "Upload file" to upload the file
    And I select the submit option labeled "Save & Stay" on the Data Collection Instrument
    And I click on the button labeled "Okay"
    And I click on the link labeled "Send-It"
    #Need step(s) to define pop-up window for send it - the To: field and Send It! button
    And I enter "test@test.com" into the textarea field field labeled "To:"
    And I click on the button labeled "Send It!"
    ##VERIFY
    Then I should see "Send-It: Sending file"
#END