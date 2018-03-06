@home_screen
Feature: Tests for Homescreen functionality

  @default
  Scenario: Deafault values on Hoe screen is Foot and Centimeter
    Given I land on home screen
    Then Left Unit picker value should be "Foot"
    And Right Unit picker value should be "Centimeter"

  @showAll
  Scenario: Show All button should be disabled at launch
    Given I land on home screen
    And Show All button is disabled
    When I type "1" on application keyboard
    Then Show All button is enabled

  @conversions
  Scenario Outline: Verify default conversion
    Given I land on home screen
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
    Given I land on home screen
    When I tap on Add to Favorites icon
    Then I tap on Menu icon
    And I tap on Favorite conversions
    And I verify "Length" added to Favorite conversions list

  @search_existing_conversion_type
  Scenario: User is able to search by existing conversion type
    Given I land on home screen
    When I tap on search icon
    And I type "Temperature" in search field
    And I tap on Return button on soft keyboard
    Then I see "Temperature" as current unit converter
    And Left Unit picker value should be "Celsius"
    And Right Unit picker value should be "Fahrenheit"

  @select_values_from_unit_pickers
  Scenario Outline: User is able to select values from unit picker
    Given I land on home screen
    And I select "<unit_type>" from left unit picker
    When I type "<amount>" on application keyboard
    Then I should see result as "<unit_result>"
    Examples:
    |unit_type|amount |unit_result|
    | Inch    |   1   |    2.54   |
    | Link11    |   1   |   20.1168 |

  @convert_values
  Scenario: User is able to convert values
    Given I land on home screen
    When I tap on Menu icon
    And I select "Volume" from menu
    And I select "Cup" from right unit picker
    When I type "1" on application keyboard
    Then I should see result as "15.1416"







