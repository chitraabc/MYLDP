Feature: sample karate api test script
  for help, see: https://github.com/intuit/karate/wiki/ZIP-Release
  
Background:
    * url 'https://api.thecatapi.com/v1'
    * configure headers = { 'Content-Type': 'application/json', 'x-api-key' : '17d94b92-754f-46eb-99a0-65be65b5d18f' }
    

 @tag1
  Scenario: get all votes
    Given path 'votes'
    When method get
    Then print response
    Then status 200

