Feature: eDocs: The system shall support the option to configure the storage location for uploaded documents

  As a REDCap end user
  I want to see that the system allows configuration of the file upload storage location.

  Scenario: D.3.28.0100.100 File upload storage 
    #FUNCTIONAL REQUIREMENT
    ##ACTION: View configurable file upload storage settings in control center
    Given I login to REDCap with the user "Test_Admin"
    And I click on the link labeled "Control Center"
    And I click on the link labeled "File Upload Settings"
    Then I should see "File Storage Methods"
    And I should see the dropdown field labeled "STORAGE LOCATION OF UPLOADED FILES:" with the options below
    | Local (on REDCap web server)                               |
    | External server using WebDAV (SSL supported)               |
    | Amazon S3 - see custom settings below                      |
    | Google Cloud Storage (for Google App Engine hosting only)  |
    | Google Cloud Storage using API Service Account             |
    | Microsoft Azure Blob Storage - see custom settings below   |
#END
    