Feature: Json schema validation

 Background:
   * url baseURL
   * header Accept = 'application/json'
   * header Authorization = 'Bearer #'
  * def expectedJsonSchema = read('data/schema.json')
    * def parameters =
      """
            {
              status: 'available'
            }
      """

       
        Scenario: Get list of available pets
        
            Given path petURLExtenstion
              And params parameters
             When method get
             Then status 200
              * def firstResponse = response[0]
              * print 'Response is: ', firstResponse
             Then match firstResponse == expectedJsonSchema