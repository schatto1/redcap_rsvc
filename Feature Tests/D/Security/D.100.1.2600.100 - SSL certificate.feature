Feature: Security: All user interactions with the system will occur over an encrypted channel. 

  As a REDCap administrator
  I want to see that user interactions with the system will occur over an encrypted channel.
  #This feature is to be run completely MANUALLY

  Scenario: D.100.1.2600.100 SSL certificate
    #FUNCTIONAL REQUIREMENT
    #ACTION
    Given I navigate to "https://www.ssllabs.com/ssltest/"
    And I enter "https://redcap01.brisc.utah.edu/" into the input field labeled "Hostname:"
    And I click on the button labeled "Submit"

    #VERIFY
    Then I should see that the certificate exists and is in use