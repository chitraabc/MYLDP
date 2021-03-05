Feature: test favorites 
Background:
    * url 'https://api.thecatapi.com/v1'
    * configure headers = { 'Content-Type': 'application/json' }

  #without authentication token

  Scenario: get all favorites and get first favourite by id
    Given path 'favourites'
    When method get
    Then print response
    Then status 200