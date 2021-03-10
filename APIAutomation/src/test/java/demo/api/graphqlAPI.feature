Feature: GraphQL api

    Background:
   * url graphqlURL
   * header Accept = 'application/json'
   * header Authorization = 'Bearer #'
    
        
        Scenario: 
        
            Given text query =
            """
           query{
  launchesPast(limit: 10) {
    mission_name
    launch_date_local
    ships {
      name
      home_port
      image
    }
  }
}
"""

Given path '/'
And request {query: '#(query)'}
When method post
Then status 200
* print 'Response is: ', response


