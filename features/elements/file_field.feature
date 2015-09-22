Feature: File Field

  Background:
    Given I am on the static elements page

  @javascript
  Scenario: Setting the value on the file field
    When I set the file field to the step definition file
    Then its' value should equal that file

  Scenario Outline: Locating file fields on the Page
    When I search for the file field by "<search_by>"
    Then I should be able to set the file field

  Examples:
    | search_by |
    | id        |
    | xpath     |
    | css       |
