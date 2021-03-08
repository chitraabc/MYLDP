 Feature: sample karate api test script
  for help, see: https://github.com/intuit/karate/wiki/ZIP-Release

 Background:
    * url 'https://api.thecatapi.com/v1'
    * configure headers = { 'Content-Type': 'application/json', 'x-api-key' : '17d94b92-754f-46eb-99a0-65be65b5d18f' }
    * def otherFeature = read('votes.feature')
    * def result = call otherFeature

    Scenario: get vote by id
     * def firstVote = result.response[0]
    Given path 'votes/', firstVote.id
    When method get
    Then print response
    Then status 200
    Then  match firstVote.id == response.id
   