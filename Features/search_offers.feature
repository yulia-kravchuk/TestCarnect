@search_offer
Feature: Search for offers
  In order to book a car rental the user will need to search for a rate that matches their
  rental criteria. The search criteria consist of a pick up location, a drop off location,
  a pick up date, and a drop off date. They will be presented with a list of offers that
  match their criteria. An offer is a unique identifier matched to a set of search
  criteria and a rate.  Each offer will have a reservation option beside it.

  Scenario: Placeholders are displayed correctly on search offers page
    Given I am on search page
    Then "Pickup Location" placeholder is "Pickup Location"
    And "Dropoff Location" placeholder is "Dropoff Location"

  Scenario: Date fields are displayed as a part of search criteria
    Given I am on search page
    Then "Pick up Date" field is displayed
    And "Drop off Date" field is displayed


  Scenario: Search for cars and get list of offers
    Given I am on search page
    When I specify search criteria and make a search
    Then I get offer list with Reserve buttons