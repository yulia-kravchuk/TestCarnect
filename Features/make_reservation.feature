@reserve
Feature: Make reservation
  Reservation option will take the user to
  the reservation form, where they will present their customer details, consisting of
  a forename, surname, and age. Once these are provided, the reservation will be
  made and the customer taken to a reservation confirmation page, which will contain
  the details of the reservation.


  Scenario: After selecting offer user is taken to reservation form with customer details fields
    Given I am on search page
    And I specify search criteria and make a search
    When I click Reserve
    Then I am taken to the reservation form
    And "Forename" field is displayed
    And "Surname" field is displayed
    And "Age" field is displayed


  Scenario: Placeholders are displayed correctly on reservation page
    Given I am on search page
    And I specify search criteria and make a search
    When I click Reserve
    Then "Forename" placeholder is "Forename"
    And "Surname" placeholder is "Surname"
    And "Age" placeholder is "Age"