@search_offer
Feature: Search for offers
  In order to book a car rental the user will need to search for a rate that matches their
  rental criteria. The search criteria consist of a pick up location, a drop off location,
  a pick up date, and a drop off date. They will be presented with a list of offers that
  match their criteria. An offer is a unique identifier matched to a set of search
  criteria and a rate.

  Scenario: Placeholders are displayed correctly on search offers page
    Given I am on search page
    Then "Pickup Location" placeholder is "Pickup Location"
    And "Dropoff Location" placeholder is "Dropoff Location"

  @test
  Scenario: Date fields are displayed as a part of search criteria
    Given I am on search page
    Then "Pick up Date" field is displayed
    And "Drop off Date" field is displayed