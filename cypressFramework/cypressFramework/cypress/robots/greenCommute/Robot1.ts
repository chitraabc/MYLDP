import { BaseHands, BaseEyes, BaseDependencies } from "../BaseRobot";

export class Dependencies extends BaseDependencies {
   
    visitGreenCommute() {
        let url = Cypress.env('url')
        this.accessUrl(url);
    }
}

export class RobotEyes extends BaseEyes {

    seesGreenCommutePageTitle(data : any) {
        this.seesPageTitle(data.title);  
    }

    seesFindJobsElement() {
        this.seesTextWithDomPath("data-testid" , "jobList-placeholder", "div","div", "h6", "Find Jobs");  
    }

    seesNoOptionsText(testData : any) {
        this.seesForTextInPage(testData.messageWhenInvalidDataIsEntered);   
    }
    
    seesEnteredTextInAutoSuggestion(testData:any) {
        let elmLen:any = cy.get('.MuiAutocomplete-listbox').eq(0).find('li').its('length');
        for(let i=0 ;i < elmLen ;i++) {
          cy.get('.MuiAutocomplete-listbox').eq(0).find('li').eq(i).contains(testData.autoSugestionOfEnteredText)
        }
    }

    seesJobSavedSuccessMessage(testData : any ) {
        this.seesForTextInPage(testData.savedJobSuccessMessage);   
    }

    seesYourLocationField(data:string) {
        //this.seesDomContainText("[placeholder='Enter your location']",data);
        this.seesAttributeValue("[placeholder='Enter your location']","value", data);
    }

    seesForJobIfNotPresentInPage(testData : any) {
        cy.contains(testData.jobAfterApplyingDistanceFilter).should("not.exist")
    }

    seesForJobIfPresentInPage(testData : any) {
        cy.contains(testData.jobAfterApplyingDistanceFilter).should("exist")
    }
   
    
}

export class RobotHands extends BaseHands {
    
    fillsYourLocation( testData: any){  
        this.selectElementFromAutoSuggestions("placeholder", "Enter your location", testData.yourLocation, '{downarrow}','{enter}');
        this.clickOnDomIndexChildIndex("data-testid", "button",1,"span",0)    
    }  

    fillsYourJobLocation( testData: any){  
         
        this.selectElementFromAutoSuggestions("placeholder", "Enter your job location", testData.yourJobLocation ,'{downarrow}','{enter}');
        this.clickOnDomIndexChildIndex("data-testid", "button",0,"span",0)    
           
    }

    fillsYourSkills( testData: any){  
        this.selectElementFromAutoSuggestions("placeholder", "Enter your skills", testData.yourSkills ,'{downarrow}','{enter}');
        this.clickOnDomIndexChildIndex("data-testid", "button",0,"span",0)    
    }
  
    fillInvalidDataInYourLocationField(newData: any) {
        this.typeTextonDom("placeholder", "Enter your location", newData.invalidYourLocation);
    }

    fillYourLocationFieldWithCaplitalLetters(newData: any) {
        this.typeTextonDom("placeholder", "Enter your location", newData.yourLocationInCaplitalLetters);
    }

    fillYourLocationFieldAsSubstring(newData: any) {
        this.typeTextonDom("placeholder", "Enter your location", newData.yourLocationAsSubstring);
    }

    clickOnJobCard() {
        this.clickOnDomIndex("data-testid","jobCard-placeholder",0)
    }

    clickOnSaveButton() {
        this.clickOnDomIndex("data-testid","button",0)
    }

    navigateToPreviousPage() {
        this.clickOnDom("[data-testid='back-button']")
    }

    clickOnNextButton() {
        this.clickOnDomIndexChildIndex("data-testid", "button",0,"span",0)  
    }

    
    clickOnFilter(){
        this.clickOnDomElement("[data-testid='filterButton']")
    }


      selectDistanceCheckBox(newData : any){
        this.selectCheckBox(`[type='checkbox'][name="${newData.distanceValue}"]`)
    }

    unSelectDistanceCheckBox(newData : any){
        this.unSelectCheckBox(`[type='checkbox'][name="${newData.distanceValue}"]`)
    }

    clickOnDistanceCheckBox(newData : any){
        this.selectCheckBox(`[type='checkbox'][name="${newData.distanceValue}"]`)
    }

    clickOnApplyButton() { 
        this. clickOnDomIndex("data-testid","button",1);
        }

    clickOnRemoveDistanceFilter() { 
        this.clickOnDom(`[data-testid='chip-placeholder']`)

    }
    
     
    
}

