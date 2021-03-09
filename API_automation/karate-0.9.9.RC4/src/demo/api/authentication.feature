Feature: test favorites 
Background:
    * url oauthTokenUrl
    * configure headers = { 'Content-Type': 'application/x-www-form-urlencoded; charset=utf-8', 'x-api-key' : '17d94b92-754f-46eb-99a0-65be65b5d18f' }
    * def jsonPayload = read('../data/credentials.json')

  Scenario: get oauth token
   
    Given path 'login'
    And   request jsonPayload
    When method post
    Then print response
    Then status 200

    