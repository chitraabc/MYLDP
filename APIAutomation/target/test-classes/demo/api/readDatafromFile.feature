Feature: test favorites 
Background:
   
    * configure headers = { 'Content-Type': 'application/json' }

  Scenario Outline: <user>
  
  * url baseURL
   * def user =
      """
        {
        "id": <id>,
        "username": <username>,
        "firstName":  <firstname>,
        "lastName": <lastname>,
        "email": <email>,
        "password": <password>,
        "phone": "string",
        "userStatus": 0
        }
      
      """

    Given path 'v2/user'
    And request  user
    When method post
    Then status 200
    Then print response

 Examples:
  | read('../data/inputData.csv') |






