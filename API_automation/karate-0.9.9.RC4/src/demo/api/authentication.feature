Feature: test favorites 
Background:
    * url oauthTokenUrl
    * def jsonPayload = read('../data/credentials.json')

  Scenario: get oauth token
   
    And form field email = jsonPayload.email
    And form field password = jsonPayload.password
    When method post
    Then print response
    Then status 200

    