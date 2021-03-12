*** Settings ***
Library  Selenium2Library
Resource    ../Resource/common.robot

Suite Setup    Open Browser    ${URL}    ${BROWSER}    options=add_argument("--use-fake-ui-for-media-stream")
Suite Teardown    Close Browser

*** Test Cases ***
TC01 - Check Requie Error Text    
    Check Requie Error Text
TC02 - Check Invalid Format
    Check Invalid Format
TC03 - Register
    Register
TC04 - eSurvey
    eSurvey
TC05 - VoiceSurvey
    VoiceSurvey
TC06 - IVR
    IVR
TC07 - Dashboard
    Dashboard

*** Keywords ***
Check Requie Error Text 
    Wait Until Page Contains Element    ${btnSubmit}    20  
    Click Button    ${btnSubmit}
    Element Text Should Be    ${requieEmail}    * Email is required.  
    Element Text Should Be    ${requieName}    * Name is required.
    Element Text Should Be    ${requiePhone}    * Mobile Phone is required.
    
Check Invalid Format
    Wait Until Page Contains Element    ${btnSubmit}    20  None
    Input Text    ${InputEmail}    Test
    Input Text    ${InputName}    @@@@@@@@
    Input Text    ${InputPhone}    Tester
    Click Button    ${btnSubmit}
    Element Text Should Be    ${errorEmail}    * Email must be formatted correctly.  
    Element Text Should Be    ${errorName}    * Name must be formatted correctly.
    Element Text Should Be    ${errorPhone}    * Mobile Phone must be formatted correctly.
    
Register
    Wait Until Page Contains Element    ${btnSubmit}    20  None
    Input Text    ${InputEmail}    AutomatedTester@fb180.com    
    Input Text    ${InputName}    AutomatedTestE2E
    Input Text    ${InputPhone}    0800000000
    Click Button    ${btnSubmit}
    Wait Until Page Contains Element    ${Event1}    20  None
    Click Element    ${Event1}

eSurvey
    Wait Until Page Contains Element    ${dashboard}    20  
    Element Should Contain    ${eSurvey}    GetFeedback eSurvey
    Click Element    ${eSurvey}   
    Wait Until Page Contains Element    ${btnStart}    20  
    Element Text Should Be    ${WelcomeText}    กรุณาทำแบบสอบถาม เพื่อประเมินความพึงพอใจต่อการใช้บริการ
    Click Button    ${btnStart}
    Click Element    xpath=//div[@class='page_body']/descendant::div[@class='question_element'][1]/div/div/descendant::div[5]    
    Click Element    xpath=//div[@class='page_body']/descendant::div[@class='question_element'][2]/div/div/descendant::div[5]    
    Input Text    ${inputText}    Automated Test by Tester FB180 eSurvey
    Click Button    ${btnSubmitSurvey}
    Wait Until Page Contains Element    ${ThankYouText}    20  
    Element Text Should Be    ${ThankYouText}    ขอบคุณสำหรับความคิดเห็นของท่านเราจะนำมาปรับปรุงและพัฒนาการบริการ หรือผลิตภัณฑ์ของเราให้ดียิ่งขึ้น      
    Click Button    ${btnGoHome}
    
VoiceSurvey
    Wait Until Page Contains Element    ${dashboard}    20  
    Element Should Contain    ${VoiceSurvey}    Voice Survey
    Click Element    ${VoiceSurvey}
    Wait Until Page Contains Element    ${btnStart}    20  
    Click Button    ${btnStart}
    Wait Until Page Contains    1. กรุณาบอกเล่าความคิดเห็นที่คุณมีต่อการใช้บริการหรือผลิตภัณฑ์ของเราในครั้งล่าสุด     
    Input Text    ${inputText}    Automated Test by Tester FB180 VoiceSurvey Q1
    Click Button    ${btnNexTvs}
    Wait Until Page Contains    2. ขออภัยหากคุณไม่ได้รับประสบการณ์ที่ดีจากการใช้บริการหรือผลิตภัณฑ์ของเรา กรุณาระบุรายละเอียดเพื่อช่วยให้เราปรับปรุงและพัฒนาการบริการหรือผลิตภัณฑ์ของเราให้ดียิ่งขึ้น 
    Input Text    ${inputText}    Automated Test by Tester FB180 VoiceSurvey Q2  
    Click Button    ${btnNexTvs}
    Wait Until Page Contains    3. คุณมีคำแนะนำเพิ่มเติมหรือไม่ เพื่อที่เราจะมั่นใจว่าคุณจะได้รับการบริการที่ดีจากเรา
    Input Text    ${inputText}    Automated Test by Tester FB180 VoiceSurvey Q3
    Click Button    ${btnSubmitvs}
    Wait Until Page Contains Element    ${dashboard}    50  
    
IVR
    Wait Until Page Contains Element    ${dashboard}    20  
    Element Should Contain    ${IVR}    Call Complaint 
    
Dashboard
    Wait Until Page Contains Element    ${dashboard}    20  
   # Element Should Contain    ${dashboard}    ' Go to Report '
    Click Button    ${dashboard}
    Wait Until Page Contains Element    ${header}    20
    Element Text Should Be    ${fbText}    Feedback Demo
    
        
    

    

    
    
