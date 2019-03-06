@main_menu
Feature: As a user I want to convert units

  @see_menu
  Scenario: When I tap on icon, I should see left side menu
    Given I land on home screen
    When I tap on Menu icon
    Then I should see left side menu

    @my_conversions
  Scenario: I should be able to open My conversions screen
    Given I land on home screen
    When I tap on Menu icon
    And I tap on My conversions icon
    Then I land on My conversions screen
