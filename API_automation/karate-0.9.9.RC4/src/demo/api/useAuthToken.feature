 Feature: sample karate api test script
  for help, see: https://github.com/intuit/karate/wiki/ZIP-Release

 Background:
    * url catURL
    * def otherFeature = read('votes.feature')
    * def result = call otherFeature

Scenario:
And header Authorization = 'Bearer'+ result.token
    
