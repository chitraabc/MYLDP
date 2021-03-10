Feature: sample karate api test script
  for help, see: https://github.com/intuit/karate/wiki/ZIP-Release

  Background:
    * url baseURL
    * configure headers = { 'Content-Type': 'application/json' }
    * def jsonPayload = read('data/favouritePayLoad.json')

    #creates a random string
    * def randomStringusername = 
    """
    currTime = new Date();
      function(){ return "randomusername"+currTime.getMilliseconds() } 
    """
      
    * def username = call randomStringusername 
  
  
  Scenario: put call 
    * def user =
      """
      {
       "id": 0,
       "username":  #(username),
       "firstName":  "firstname",
       "lastName": "lastname",
       "email": "email",
       "password": "string",
       "phone": "string",
      "userStatus": 0
        }
      """
    Given path 'v2/user', jsonPayload[2].username
    And request user
    When method put
    Then status 200
    Then print response


    

