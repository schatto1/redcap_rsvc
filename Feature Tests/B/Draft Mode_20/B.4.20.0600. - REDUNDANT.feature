Feature: User Interface: The system shall provide the option to require administrators to review any changes made in draft mode

    As a REDCap end user
    I want to see that Draft Mode is functioning as expected

    Scenario: B.4.20.0600.100.

    # This feature test is REDUNDANT and can be viewed in A.6.4.0400.100

#     Scenario: A.6.4.0400.100 User's ability to approve draft changes without administrative approval

#         Given I login to REDCap with the user "Test_Admin"
#         And I create a new project named "A.6.4.0400.100" by clicking on "New Project" in the menu bar, selecting "Practice / Just for fun" from the dropdown, choosing file "Project_1.xml", and clicking the "Create Project" button

#         # BEGIN: STEPS FOR ATS
#         # - EMAIL ADDRESS SET FOR REDCAP ADMIN - without it, project request behavior does not work properly
#         Given I click on the link labeled "Control Center"
#         And I click on the link labeled "General Configuration"
#         Then I should see "General Configuration"

#         When I enter "redcap@test.instance" into the input field labeled "Email Address of REDCap Administrator"
#         And I click on the button labeled "Save Changes"
#         Then I should see "Your system configuration values have now been changed"
#         # END: STEPS FOR ATS ###

#         When I click on the link labeled "My Projects"
#         And I click on the link labeled "A.6.4.0400.100"

#         And I click on the link labeled "User Rights"
#         And I enter "Test_User1" into the field with the placeholder text of "Assign new user to role"
#         And I click on the button labeled "Assign to role"
#         And I select "1_FullRights" on the dropdown field labeled "Select Role" on the role selector dropdown
#         When I click on the button labeled exactly "Assign" on the role selector dropdown
#         Then I should see "Test User1" within the "1_FullRights" row of the column labeled "Username" of the User Rights table

#         Given I click on the link labeled "Project Setup"
#         And I click on the button labeled "Move project to production"
#         And I click on the radio labeled "Keep ALL data saved so far" in the dialog box
#         And I click on the button labeled "YES, Move to Production Status" in the dialog box to request a change in project status
#         Then I should see Project status: "Production"

#         And I click on the link labeled "Logging"

#         Then I should see a table header and rows containing the following values in the logging table:
#             | Time / Date      | Username   | Action        | List of Data Changes OR Fields Exported |
#             | mm/dd/yyyy hh:mm | test_admin | Manage/Design | Move project to Production status       |

#         When I click on the link labeled "Control Center"
#         And I click on the link labeled "User Settings"
#         Then I should see "System-level User Settings"
#         When I select "Never (always require an admin to approve changes)" on the dropdown field labeled "Allow production Draft Mode changes to be approved automatically under certain conditions?"
#         And I click on the button labeled "Save Changes"
#         Then I should see "Your system configuration values have now been changed!"
#         Given I logout

#         Given I login to REDCap with the user "Test_User1"
#         When I click on the link labeled "My Projects"
#         And I click on the link labeled "A.6.4.0400.100"
#         And I click on the link labeled "Designer"
#         And I click on the button labeled "Enter Draft Mode"
#         Then I should see "The project is now in Draft Mode"
#         And I click on the link labeled "Logging"

#         Then I should see a table header and rows containing the following values in the logging table:
#             | Time / Date      | Username   | Action        | List of Data Changes OR Fields Exported |
#             | mm/dd/yyyy hh:mm | test_user1 | Manage/Design | Enter draft mode                        |

#         When I click on the link labeled "Designer"
#         When I click on the button labeled "Submit Changes for Review"
#         And I click on the button labeled "Submit" in the dialog box
#         Then I should see "Awaiting review of project changes"
#         And I click on the link labeled "Logging"

#         Then I should see a table header and rows containing the following values in the logging table:
#             | Time / Date      | Username   | Action        | List of Data Changes OR Fields Exported               |
#             | mm/dd/yyyy hh:mm | test_user1 | Manage/Design | Request approval for production project modifications |

#         Given I logout

#         Given I login to REDCap with the user "Test_Admin"
#         When I click on the link labeled "My Projects"
#         And I click on the link labeled "A.6.4.0400.100"
#         And I click on the link labeled "Designer"
#         Then I should see "REVIEW CHANGES?"

#         When I click on the button labeled "Project Modification Module"
#         And I click on the button labeled "Reject Changes"
#         And I click on the button labeled "Reject Changes" in the dialog box
#         Then I should see "Project Changes Rejected / User Notified"
#         Given I logout

#         Given I login to REDCap with the user "Test_User1"
#         When I click on the link labeled "My Projects"
#         And I click on the link labeled "A.6.4.0400.100"
#         And I click on the link labeled "Logging"

#         Then I should see a table header and rows containing the following values in the logging table:
#             | Time / Date      | Username   | Action        | List of Data Changes OR Fields Exported |
#             | mm/dd/yyyy hh:mm | test_admin | Manage/Design | Reject production project modifications |

#         And I click on the link labeled "Designer"
#         #THE PROJECT STAYS IN DRAFT MODE IF THE CHANGES ARE REJECTED SO DRAFT MODE BUTTON DOES NOT APPEAR
#         #And I click on the button labeled "Enter Draft Mode"
#         #Then I should see "The project is now in Draft Mode"

#         When I click on the button labeled "Submit Changes for Review"
#         And I click on the button labeled "Submit" in the dialog box
#         Then I should see "Awaiting review of project changes"
#         And I click on the link labeled "Logging"

#         Then I should see a table header and rows containing the following values in the logging table:
#             | Time / Date      | Username   | Action        | List of Data Changes OR Fields Exported               |
#             | mm/dd/yyyy hh:mm | test_user1 | Manage/Design | Request approval for production project modifications |

#         Given I logout

#         Given I login to REDCap with the user "Test_Admin"
#         When I click on the link labeled "My Projects"
#         And I click on the link labeled "A.6.4.0400.100"
#         And I click on the link labeled "Designer"
#         Then I should see "REVIEW CHANGES?"

#         When I click on the button labeled "Project Modification Module"
#         And I click on the button labeled "COMMIT CHANGES"
#         And I click on the button labeled "COMMIT CHANGES" in the dialog box
#         Then I should see "Project Changes Committed / User Notified"
#         Given I logout

#         Given I login to REDCap with the user "Test_User1"
#         When I click on the link labeled "My Projects"
#         And I click on the link labeled "A.6.4.0400.100"
#         And I click on the link labeled "Logging"

#         Then I should see a table header and rows containing the following values in the logging table:
#             | Time / Date      | Username   | Action        | List of Data Changes OR Fields Exported  |
#             | mm/dd/yyyy hh:mm | test_admin | Manage/Design | Approve production project modifications |

#         And I click on the link labeled "Designer"
#         Then I should see "Enter Draft Mode"
# #End