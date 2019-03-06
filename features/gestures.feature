@gestures
Feature: User is able to use gestures

  @open_menu_swipe
  Scenario: User is able to swipe to open Left side menu
    Given I land on home screen
    When I swipe from left to right
    Then I should see left side menu
    When I swipe from right to left
    Then I see "Length" as current unit converter

    #this test will fail !!! maybe there's a bug ?
    @open_calculator_swipe
  Scenario: User is able to swipe to open Calculator
    Given I land on home screen
    When I swipe from right to left
    Then I see "Calculator" as current unit converter
    When I swipe from left to right
    Then I see "Length" as current unit converter
