Feature: Text Area


  Background:
    Given I am on the static elements page

  Scenario: Setting and getting a value from a text area
    Then I should see that the text area exists
    When I type "abcdefghijklmnop" into the text area
    Then the text area should contain "abcdefghijklmnop"

  Scenario: Clearing the text area
    When I type "abcdefghijklmnop" into the text area
    Then the text area should contain "abcdefghijklmnop"
    When I clear the text area
    Then the text area should contain ""
