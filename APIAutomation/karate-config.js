function fn() {
     
  var config = { 
       baseURL : 'https://petstore.swagger.io',
       petURLExtenstion : 'v2/pet/findByStatus',
       catURL : 'https://api.thecatapi.com/v1',
       jsonValidationUrl : 'https://jsonplaceholder.typicode.com',
       oauthTokenUrl : 'https://reqres.in/api/login',
       graphqlURL : 'https://api.spacex.land/graphql'
  };
  
  

  karate.configure;
  return config;

} 