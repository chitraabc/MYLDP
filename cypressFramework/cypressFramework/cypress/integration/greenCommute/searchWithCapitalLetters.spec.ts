import { RobotEyes, Dependencies, RobotHands } from '../../robots/greenCommute/Robot1';

const robotEyes = new RobotEyes();
const robotHands = new RobotHands();
const dependencies = new Dependencies();
let newData ="";

context('LaunchWebsiteSearchWithUpperCaseData', () => {
    beforeEach(() => {
        cy.fixture('example').then(function(data) {
             newData = data;
             
        })
    })
  
    it('Filling details in the first page', () => {
     dependencies.visitGreenCommute();
     
     robotHands.fillYourLocationFieldWithCaplitalLetters(newData)
     
     robotEyes.seesEnteredTextInAutoSuggestion(newData); 
     
    });
})