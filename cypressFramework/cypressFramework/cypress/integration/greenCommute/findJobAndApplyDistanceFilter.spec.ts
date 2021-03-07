import { RobotEyes, Dependencies, RobotHands } from '../../robots/greenCommute/Robot1';
import { BaseHands } from '../../robots/BaseRobot';

const robotEyes = new RobotEyes();
const robotHands = new RobotHands();
const dependencies = new Dependencies();
let newData='';

context('LaunchWebsiteFillData', () => {
    beforeEach(() => {
    cy.fixture('example').then(function(data) {
         newData = data;
    })
})
    
    it('Filling details in the first page', () => {
     dependencies.visitGreenCommute();
     robotHands.fillsYourLocation(newData);
     robotHands.fillsYourJobLocation(newData);
     robotHands.fillsYourSkills(newData)
     robotEyes.seesFindJobsElement();
    });

    it('Check if a job is not displayed with distance filter applied', () => {
        robotHands.clickOnFilter();
        robotHands.selectDistanceCheckBox(newData);
        robotHands.clickOnApplyButton();
        robotEyes.seesForJobIfNotPresentInPage(newData);
        assert.isBoolean(true, 'Job found')
    });

    it('Check if a job is displayed without distance filter applied', () => {
        robotHands.clickOnFilter();
        robotHands.unSelectDistanceCheckBox(newData);
        robotHands.clickOnApplyButton();
        robotEyes.seesForJobIfPresentInPage(newData);
        assert.isBoolean(false, 'Job not found')
    });
})

