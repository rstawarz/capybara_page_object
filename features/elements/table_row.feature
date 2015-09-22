Feature: Table Row
  
  Background:
    Given I am on the static elements page

  Scenario: Retrieving the text from a table row
    When I retrieve the data from the table row
    Then the row should have 2 columns
    And the row data should be 'Data1 Data2'

  Scenario: Retrieving the table parent of the row
    When I search for the table row by "id"
    Then the row should have a parent table

  Scenario Outline: Locating table rows on the Page
    When I search for the table row by "<search_by>"
    Then the row data should be 'Data1 Data2'

    Scenarios:
      | search_by |
      | id        |
      | xpath     |
      | css       |

