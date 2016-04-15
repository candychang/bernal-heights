Feature: Search for a location on the hotspot map
  As a neighbor
  I want to be able to search for a location on the map
  So that I can accurately report to the neighborhood center where city officials need to go to resolve an issue
 
Background: 
  Given I am on the Hotspot map page

Scenario: Neighbor searches for a location first to report an issue
  When I fill in "searchbar" with "Bernal Heights"
  And I press "Search"
  Then I should be on the Hotspot map page
  Given I report issue for Bernal Heights
  Then location field should be prefilled with Bernal Heights coordinates

Scenario: Neighbor clicks on new hotspot form button to report an issue
  When I press "Create new hotspot"
  Then I should be on the Hotspot form page
  
Scenario: Neighbor leaves search field blank
  When I press "Search"
  Then I should be on the Hotspot map page