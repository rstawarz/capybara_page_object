Feature: Page Factory

  Scenario: Navigating to a Page using the PageFactory
    When I visit the "Page"
    Then the page should have the title "Static Elements Page"

