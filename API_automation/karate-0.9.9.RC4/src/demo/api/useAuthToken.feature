 Feature: sample karate api test script
  for help, see: https://github.com/intuit/karate/wiki/ZIP-Release

 Background:
    * url oauthTokenUrl
    * def otherFeature = read('votes.feature')
    * def result = call otherFeature
    * configure headers = { 'Content-Type': 'application/json', 'Authorization' : result.token }


    
