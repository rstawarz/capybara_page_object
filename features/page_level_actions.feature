Feature: Page level actions
  In order to act on pages from a web site
  Testers will need to use the page object to encapsulate access

  Background:
    Given I am on the static elements page


  Scenario: Getting the text from a web page
    Then the page should contain the text "Static Elements Page"

  Scenario: Getting the html from a web page
    Then the page should contain the html "<title>Static Elements Page</title>"

  Scenario: Getting the title from a web page
    Then the page should have the title "Static Elements Page"
    
  Scenario: Validating the page title
    Then the page should have the expected title

  Scenario: Validating the expected element
    Then the page should have the expected element

  Scenario: Validating element query and assert methods
    Then the page can assert the hello0 element is present
    Then the page can assert the hello42 element is NOT present
    
  Scenario: Validating that an expected element does not exist
    Then the page should not have the expected element

  Scenario: Handling alert popups
    When pending
    When I handle the alert
    Then I should be able to get the alert's message

  Scenario: Handling possible alert popups
    When pending
    When I handle the possible alert
    Then I should be able to verify the popup didn't have a message

  Scenario: Handling alert popups that reload the page
    When pending
    When I handle the alert that reloads the page
    Then I should be able to get the alert's message

  Scenario: Handling confirm popups
    When pending
    When I handle the confirm
    Then I should be able to get the confirm message

  Scenario: Handling possible confirm popups
    When pending
    When I handle the possible confirm
    Then I should be able to verify the popup didn't have a message

  Scenario: Handling confirm popups that reload the page
    When pending
    When I handle the confirm that reloads the page
    Then I should be able to get the confirm message

  Scenario: Handling prompt popups
    When pending
    When I handle the prompt
    Then I should be able to get the message and default value

  Scenario: Handling possible prompt popups
    When pending
    When I handle the possible prompt
    Then I should be able to verify the popup didn't have a message
    
  Scenario: Attach to window using title
    When pending
    When I open a second window
    Then I should be able to attach to a page object using title

  Scenario: Attach to window using title with multiple windows
    When pending
    When I open a second window
    When I open a third window
    Then I should be able to attach to a page object using title
    
  Scenario: Attach to window using url
    When pending
    When I open a second window
    Then I should be able to attach to a page object using url

  Scenario: Attach to window using url with multiple windows
    When pending
    When I open a second window
    When I open a third window
    Then I should be able to attach to a page object using url
    
  Scenario: Reloading the page
    Then I should be able to reload the page

  @javascript
  Scenario: Going back and forward
    When I select the link labeled "Google Search"
    Then the page should contain the text "Success"
    When I press the back button
    Then the page should contain the text "Static Elements Page"
    When I press the forward button
    Then the page should contain the text "Success"
    
