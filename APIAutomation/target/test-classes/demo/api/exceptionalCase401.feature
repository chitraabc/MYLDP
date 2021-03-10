Feature: test favorites 
Background:
    * url catURL
    * configure headers = { 'Content-Type': 'application/json' }

  #without authentication token

  Scenario: get all favorites and get first favourite by id
    Given path 'favourites'
    When method get
    Then print response
    Then status 401