Feature: sample karate api test script
  for help, see: https://github.com/intuit/karate/wiki/ZIP-Release

  Background:
    * url baseURL
    * configure headers = { 'Content-Type': 'application/json' }
    #creates a random string
    * def randomStringusername = 
    """
    currTime = new Date();
      function(){ return "random username "+currTime.getMilliseconds() } 
    """
      
    * def username = call randomStringusername 
  
  
  Scenario: post a new user
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
      }
      """
    Given path 'v2/user'
    And request user
    When method post
    Then status 200
    Then print response

