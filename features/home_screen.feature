@home_screen
Feature: Tests for Homescreen functionality

  Background:
    Given I land on home screen

  @default
  Scenario: Deafault values on Hoe screen is Foot and Centimeter
    Then Left Unit picker value should be "Foot"
    And Right Unit picker value should be "Centimeter"

  @showAll
  Scenario: Show All button should be disabled at launch
    Given Show All button is disabled
    When I type "1" on application keyboard
    Then Show All button is enabled

  @conversions
  Scenario Outline: Verify default conversion
    When I type "<target>" on application keyboard
    Then I should see result as "<result>"
  Examples:
    |target|result  |
#    |1     |30.48   |
#    |2     |60.96   |
#    |3     |91.44   |
    |120   |3 657.6 |

  @add_conversion_to_favorites
  Scenario: User is able to add current conversions to Favourites list
    Given I tap on Add to Favorites icon
    When I tap on Menu icon
    And I tap on Favorite conversions
    Then I verify "Length" added to Favorite conversions list

  @search_existing_conversion_type
  Scenario: User is able to search by existing conversion type
    Given I tap on search icon
    When I type "Temperature" in search field
    And I tap on Return button on soft keyboard
    Then I see "Temperature" as current unit converter
    And Left Unit picker value should be "Celsius"
    And Right Unit picker value should be "Fahrenheit"

  @select_values_from_unit_pickers
  Scenario Outline: User is able to select values from unit picker
    Given I select "<unit_type>" from left unit picker
    When I type "<amount>" on application keyboard
    Then I should see result as "<unit_result>"
    Examples:
    |unit_type|amount |unit_result|
    | Inch    |   1   |    2.54   |
    | Link    |   1   |   20.1168 |

  @convert_values
  Scenario: User is able to convert values
    Given I tap on Menu icon
    And I select "Volume" from menu
    And I select "Cup" from right unit picker
    When I type "1" on application keyboard
    Then I should see result as "15.1416"

  @switch_btn
  Scenario: User is able to switch values
    Given Left Unit picker value should be "Foot"
    And Right Unit picker value should be "Centimeter"
    When I tap on switch units button
    Then Left Unit picker value should be "Centimeter"
    And Right Unit picker value should be "Foot"

    @clear_history
   Scenario: User is able to lean up conversion history
     When I tap on Menu icon
     And I select "History" from menu
     Then I see "History" as current unit converter
     Then I should see text "No history right now"
     When I tap on Menu icon
     Then I select "Length" from menu
     And I type "1" on application keyboard
     When I tap on Menu icon
     Then I select "History" from menu
     And I verify that 1st result in history list is "Length"
     When I press delete from history at 1st row
     Then I should see text "No history right now"









