Feature: Text Fields
  In order to interact with text fields
  Testers will need access and interrogation ability


  Background:
    Given I am on the static elements page

  Scenario: Setting and getting a value from a text field
    Then I should see that the text field exists
    When I type "abcDEF" into the text field
    Then the text field should contain "abcDEF"

  Scenario Outline: Locating text fields on the Page
    When I search for the text field by "<search_by>"
    Then I should be able to type "I found it" into the field

  Examples:
    | search_by  |
    | css        |
    | xpath      |


  Scenario: Retrieve a text field
    When I retrieve a text field
    Then I should know it exists
    And I should know it is visible
