Feature: Check Box
  In order to interact with check boxes
  Testers will need access and interrogation ability


  Background:
    Given I am on the static elements page

  Scenario: Selecting a check box
    When I select the First check box
    Then the First check box should be selected
    When I unselect the First check box
    Then the First check box should not be selected

  Scenario Outline: Locating check boxes on the page
    When I search for the check box by "<search_by>"
    Then I should be able to check the check box

  Scenarios:
    | search_by |
    | id        |
    | xpath     |
    | css       |

  Scenario: Retrieve a CheckBox
    When I retrieve a check box element
    Then I should know it exists
    And I should know it is visible
