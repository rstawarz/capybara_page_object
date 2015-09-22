Feature: Unordered list

  Background:
    Given I am on the static elements page

  Scenario: Getting the first element from the unordered list
    Then I should see that the unordered list exists
    When I get the first item from the unordered list
    Then the list items text should be "Item One"

  Scenario Outline: Locating unordered lists on the page
    When I search for the unordered list by "<search_by>"
    And I get the first item from the list
    Then the list items text should be "Item One"
    And the list should contain 3 items
    And each item should contain "Item"

  Scenarios:
    | search_by |
    | id        |
    | xpath     |
    | css       |

  Scenario: Getting the text from an unordered list
    Then the text for the unordered list should contain "Item One"
    And the text for the unordered list should contain "Item Two"
    And the text for the unordered list should contain "Item Three"
