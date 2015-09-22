Feature: Button
  In order to interact with buttons
  Testers will need access and interrogation ability

  Background:
    Given I am on the static elements page

  Scenario: Clicking a button (type=submit)
    When I click the button
    Then I should be on the success page

  Scenario: Clicking a button (type=image)
    When I click the button with type image
    Then I should be on the success page

  Scenario: Retrieve a button element
    When I retrieve a button element
    Then I should know it exists
    And I should know it is visible

  Scenario Outline: Locating buttons on the page
    When I search for the button by "<search_by>"
    Then I should be able to click the button

  Scenarios:
    | search_by |
    | id        |
    | xpath     |
    | css       |

  Scenario Outline: Locating real buttons on the page
    When I search for the button by "<search_by>"
    Then I should be able to click the real button

  Scenarios:
    | search_by |
    | id        |
    | css       |
    | text      |
    | value     |

    @dane
  Scenario Outline: Getting the text from a button
    When I get the text for a button that is a "<tag>"
    Then the text should be "This button is a <tag>"

  Scenarios:
    | tag    |
    | button |
    | input  |
