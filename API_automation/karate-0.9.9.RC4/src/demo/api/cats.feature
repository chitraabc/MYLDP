Feature: test favorites 
Background:
    * url catURL
    * configure headers = { 'Content-Type': 'application/json', 'x-api-key' : '17d94b92-754f-46eb-99a0-65be65b5d18f' }
    * def expectedOutput = read('../data/catResult.json')
    * def jsonPayload = read('../data/favouritePayLoad.json')

  Scenario: get all favorites and get first favourite by id
    Given path 'favourites'
    When method get
    Then print response
    Then status 200
    Then match expectedOutput[0].id == response[0].id
    * def firstFavourite = response[0]
  
    Given path 'favourites/', firstFavourite.id
    When method get
    Then print response
    Then status 200
    Then  match firstFavourite.id == response.id
    Then match response.created_at != null
    * def day = response.day
    And match day == null
    
  
  Scenario: post a favourite and delete it
    Given path 'favourites'
    And request jsonPayload[0]
    When method post
    Then status 200
    * def favourite = response
  
    Given path 'favourites/', favourite.id
    When method delete
    Then status 200
    


  