*** Settings ***
Library  Selenium2Library

*** Variables ***
${URL}    https://app-cxweb-uat.azurewebsites.net/auth/register
${BROWSER}    chrome    

# Elements
${InputEmail}    xpath=//nb-card-body//form//input[1]
${InputName}    xpath=//nb-card-body//form//input[2]
${InputPhone}    xpath=//nb-card-body//form//input[3]
${btnSubmit}    xpath=//button
${errorEmail}    xpath=//nb-card-body//form//div//div[1]//div
${requieEmail}    xpath=//nb-card-body//form//div//div[2]//div
${errorName}    xpath=//nb-card-body//form//div//div[3]//div
${requieName}    xpath=//nb-card-body//form//div//div[4]//div
${errorPhone}    xpath=//nb-card-body//form//div//div[5]//div
${requiePhone}    xpath=//nb-card-body//form//div//div[6]//div
${Event1}    xpath=//nb-card-body//li//span
${eSurvey}    xpath=//nb-card-body//li[1]//span
${VoiceSurvey}    xpath=//nb-card-body//li[2]//span
${IVR}    xpath=//nb-card-body//li[3]//span
${dashboard}    xpath=//nb-card-footer//button
${btnGoHome}    xpath=//nb-card-body//button

#eSurvey
${WelcomeText}    xpath=//div[@class='welcome_description']//p[4]
${btnStart}    xpath=//button
${btnNextS}    xpath=//div[@class='survey_buttons']//button[2]
${btnNext}    xpath=//div[@class='survey-navigate']//button[2]
${btnSubmitSurvey}    xpath=//div/button[@class='survey_button button_next']
${inputText}    xpath=//textarea
${ThankYouText}    xpath=//nb-card-body//div//section[1]//span

#VoiceSurvey
${btnNexTvs}    xpath=//button[contains(text(),'ถัดไป')]
${btnSubmitvs}    xpath=//div[@class='survey-navigate']//button[2]

#Dashboard
${header}    xpath=//nb-layout-header//app-header
${fbText}    xpath=//div[contains(text(),'Feedback Demo')]



