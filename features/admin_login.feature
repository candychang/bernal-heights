Feature: administrator login

  As the administrator
  I want to login 
  So that I can moderate events and view hotspot form submissions.

# Successful log in as an admin and see the admin-control actions on dashboard
Scenario: Successfully logged on as an administrator
  Given I am signed in as an admin
  Then I should be on the admin home page page
  And I should see "Confirm New Events"
  And I should see "View Hotspot Forms"
  
Scenario: Unsuccessfully logged in
  Given I am on the sign in page
  When I fill in "Email" with "user1@cucumbertest.com"
  And I fill in "Password" with "12345679"
  And I press "Log in"
  Then I should be on the sign in page