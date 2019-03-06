@custom_conversions
Feature: User is able to create and manage custom conversions

  @add_new_cusom_converersion
  Scenario: User is able to create new converersion
    Given I land on home screen
    And I tap on Menu icon
    And I tap on My conversions icon
    And I tap on Create your first conversion button
    And I type "Power" as custom conversion name
    And I tap on New unit button
    And I type "Horse power" as unit name
    And T type "HP" as unit symbol
    And I type "1" as unit value
    And I tap submit checkmark on Custom conversions screen
    And I tap on New unit button
    And I type "Mule power" as unit name
    And T type "MP" as unit symbol
    And I type "0.5" as unit value
    And I tap submit checkmark on Custom conversions screen
    When I tap on OK button on Custom conversions screen
    Then I verify "Power" was added to Custom conversions list