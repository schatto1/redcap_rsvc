Feature: Data Archiving / Storage: Standard encryption will be employed for the EIC files. Will be employed in transit and at rest.

  As a REDCap administrator
  I want to see that standard encryption will be employed for the EIC files. Will be employed in transit and at rest.
  #This feature is to be run completely MANUALLY on the REDCap Shadow instance

  Scenario: D.100.1.1700.100 Backup storage location encryption
    #FUNCTIONAL REQUIREMENT
    #ACTION
    Given I access Box
    And I navigate to the folder "BMIC Operations > REDCap > Part11-Validation > Validation Documentation > Transition to RSVC > Utah Tier D Release > Installation Qualification Testing (IQ) > IQ evidence and documents"
    And I open the file "ArchiveSolutionattheCenterForHighPerformanceComputing.pdf"
    Then I should have a latest downloaded "pdf" file that contains the contents below:
    ```
    Archive Solution at the Center For High Performance Computing
    ```

  Scenario: D.100.1.1700.200 Transmission traffic encryption
    #FUNCTIONAL REQUIREMENT
    #ACTION
    Given I open a new terminal window
    And I SSH to "redwood.chpc.utah.edu"
    And I SSH to "redcap-r9.ctsi.utah.edu"
    And I run the command "sudo cat /etc/ssh/sshd_config"
    And I type in my password
    Then I should see "build"
    And I should see "daily"
    Then I run the command "sudo crontab -l"
    And I type in my password
    Then I should see "AuthorizedKeysFile     .ssh/authorized_keys"

    Given I open a new browser window
    And I navigate to "https://docs.bareos.org/TasksAndConcepts/TransportEncryption.html"
    Then I should take a screenshot that contains the contents below:
    ```
    Transport Encryption

    Bareos uses TLS (Transport Layer Security) to provide secure network transport. For data encryption in contrast, please see the Data Encryption chapter. The initial Bacula encryption implementation has been written by Landon Fuller.

    With Version >= 18.2.4 the TLS code has been enhanced by the TLS-PSK (Pre Shared Keys) feature which allows the daemons to setup an encrypted connection directly without using certificates. The library used for TLS is openSSL.
    ```

    Given I access Box
    And I navigate to the folder "BMIC Operations > REDCap > Part11-Validation > Validation Documentation > Transition to RSVC > Utah Tier D Release > Installation Qualification Testing (IQ) > IQ evidence and documents"
    And I open the file "PE_CHPC-Protected_Environment-Network.pdf"
    Then I should have a latest downloaded "pdf" file that contains the contents below:
    ```
    Protected Environment - Instrument
    And I should see "Firewall
    ```

  Scenario: D.100.1.1700.300 SSL certificates for data transmission
    #FUNCTIONAL REQUIREMENT
    #ACTION
    Given I open a new browser window
    And I navigate to "https://www.ssllabs.com/ssltest/"
    And in the hostname field I enter "https://redcap01.brisc.utah.edu/"
    And I click on the "Submit" button
    Then I should see "SSL Report: redcap01.brisc.utah.edu"
    Then I should take a screenshot that contains the contents below:
    ```
    SSL Report: redcap01.brisc.utah.edu
    Then I should see "Overall Rating: A-
    Then I should see "TLS 1.3 Yes"
    Then I should see "TLS 1.2 Yes"
    ```