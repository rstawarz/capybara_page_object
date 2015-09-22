Feature: Ordered list

  Background:
    Given I am on the static elements page

  Scenario: Getting the first element from the ordered list
    When I get the first item from the ordered list
    Then the list items text should be "Number One"

  Scenario Outline: Locating ordered lists on the page
    When I search for the ordered list by "<search_by>"
    And I get the first item from the list
    Then the list items text should be "Number One"
    And the list should contain 3 items
    And each item should contain "Number"

  Scenarios:
    | search_by |
    | id        |
    | css       |
    | xpath     |

  Scenario: Getting the test for an ordered list
    Then the text for the ordered list should contain "Number One"
    And the text for the ordered list should contain "Number Two"
    And the text for the ordered list should contain "Number Three"
