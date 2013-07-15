Feature: This site has a home page.
  In order to verify success at installing the web site
  As an anonymous user
  I want to go to the home page without errors
  
  Scenario: Go to the home page
    When I go to the homepage
    Then the response status code should be 200
