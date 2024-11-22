Feature: eDocs: The system shall support enabling or disabling the use of external storage solutions (i.e., Amazon S3, Google Cloud Storage, and Microsoft Azure Blob Storage)

  As a REDCap end user
  I want to see that the system allows configuration of an external storage location.

  Scenario: D.3.28.0200.100 External storage  
    #FUNCTIONAL REQUIREMENT
    ##ACTION: Enable external file storage WebDAV
    Given I login to REDCap with the user "Test_Admin"
    And I click on the link labeled "Control Center"
    And I click on the link labeled "File Upload Settings"
    And I select "External server using WebDAV (SSL supported)" on the dropdown field labeled "STORAGE LOCATION OF UPLOADED FILES:"
    And I click on the button labeled "Save Changes"
    Then I should see "Your system configuration values have now been changed!"

    ##ACTION: Enable external file storage Amazon S3
    Given I select "Amazon S3 - see custom settings below" on the dropdown field labeled "STORAGE LOCATION OF UPLOADED FILES:"
    And I click on the button labeled "Save Changes"
    Then I should see "Your system configuration values have now been changed!"

    ##ACTION: Enable external file storage Google Cloud App Engine
    Given I select "Google Cloud Storage (for Google App Engine hosting only)" on the dropdown field labeled "STORAGE LOCATION OF UPLOADED FILES:"
    And I click on the button labeled "Save Changes"
    Then I should see "Your system configuration values have now been changed!"

    ##ACTION: Enable external file storage Google Cloud API
    Given I select "Google Cloud Storage using API Service Account" on the dropdown field labeled "STORAGE LOCATION OF UPLOADED FILES:"
    And I click on the button labeled "Save Changes"
    Then I should see "Your system configuration values have now been changed!"

    ##ACTION: Enable external file storage Microsoft Azure Blob
    Given I select "Microsoft Azure Blob Storage - see custom settings below" on the dropdown field labeled "STORAGE LOCATION OF UPLOADED FILES:"
    And I click on the button labeled "Save Changes"
    Then I should see "Your system configuration values have now been changed!"

    ##ACTION: Enable external file storage for file upload enhancement SFTP
    Given I click on the link labeled "Modules/Services Configuration"
    And I select "Enabled using SFTP" on the dropdown field labeled "Enable this system-level setting for password verification for File Upload fields AND enable the external storage device?"
    And I click on the button labeled "Save Changes"
    Then I should see "Your system configuration values have now been changed!"

    ##ACTION: Enable external file storage for file upload enhancement WebDAV
    Given I select "Enabled using WebDAV" on the dropdown field labeled "Enable this system-level setting for password verification for File Upload fields AND enable the external storage device?"
    And I click on the button labeled "Save Changes"
    Then I should see "Your system configuration values have now been changed!"

    ##ACTION: Enable external file storage for file upload enhancement Microsoft Azure Blob
    Given I select "Microsoft Azure Blob Storage (only if currently being used as system-level File Storage Method)" on the dropdown field labeled "Enable this system-level setting for password verification for File Upload fields AND enable the external storage device?"
    And I click on the button labeled "Save Changes"
    Then I should see "Your system configuration values have now been changed!"

    ##ACTION: Enable external file storage for file upload enhancement Amazon S3
    Given I select "Amazon S3 (only if currently being used as system-level File Storage Method)" on the dropdown field labeled "Enable this system-level setting for password verification for File Upload fields AND enable the external storage device?"
    And I click on the button labeled "Save Changes"
    Then I should see "Your system configuration values have now been changed!"

    ##ACTION: Enable external file storage for record-level locking enhancement SFTP
    Given I select "Enabled using SFTP" on the dropdown field labeled "Enable the external storage device and choose storage method (SFTP, WebDAV, Azure, S3):"
    And I click on the button labeled "Save Changes"
    Then I should see "Your system configuration values have now been changed!"

    ##ACTION: Enable external file storage for record-level locking enhancement WebDAV
    Given I select "Enabled using WebDAV" on the dropdown field labeled "Enable the external storage device and choose storage method (SFTP, WebDAV, Azure, S3):"
    And I click on the button labeled "Save Changes"
    Then I should see "Your system configuration values have now been changed!"

    ##ACTION: Enable external file storage for record-level locking enhancement Microsoft Azure Blob
    Given I select "Microsoft Azure Blob Storage (only if currently being used as system-level File Storage Method)" on the dropdown field labeled "Enable the external storage device and choose storage method (SFTP, WebDAV, Azure, S3):"
    And I click on the button labeled "Save Changes"
    Then I should see "Your system configuration values have now been changed!"

    ##ACTION: Enable external file storage for record-level locking enhancement Amazon S3
    Given I select "Amazon S3 (only if currently being used as system-level File Storage Method)" on the dropdown field labeled "Enable the external storage device and choose storage method (SFTP, WebDAV, Azure, S3):"
    And I click on the button labeled "Save Changes"
    Then I should see "Your system configuration values have now been changed!"

    ##ACTION: Enable external file storage for e-Consent framework SFTP
    Given I select "Enabled using SFTP" on the dropdown field labeled "Enable the external storage device and choose storage method (SFTP, WebDAV, Azure, S3):"
    And I click on the button labeled "Save Changes"
    Then I should see "Your system configuration values have now been changed!"

    ##ACTION: Enable external file storage for e-Consent framework WebDAV
    Given I select "Enabled using WebDAV" on the dropdown field labeled "Enable the external storage device and choose storage method (SFTP, WebDAV, Azure, S3):"
    And I click on the button labeled "Save Changes"
    Then I should see "Your system configuration values have now been changed!"

    ##ACTION: Enable external file storage for e-Consent frameworkt Microsoft Azure Blob
    Given I select "Microsoft Azure Blob Storage (only if currently being used as system-level File Storage Method)" on the dropdown field labeled "Enable the external storage device and choose storage method (SFTP, WebDAV, Azure, S3):"
    And I click on the button labeled "Save Changes"
    Then I should see "Your system configuration values have now been changed!"

    ##ACTION: Enable external file storage for e-Consent framework Amazon S3
    Given I select "Amazon S3 (only if currently being used as system-level File Storage Method)" on the dropdown field labeled "Enable the external storage device and choose storage method (SFTP, WebDAV, Azure, S3):"
    And I click on the button labeled "Save Changes"
    Then I should see "Your system configuration values have now been changed!"
#END
    