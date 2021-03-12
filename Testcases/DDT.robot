*** Settings ***
Library  Selenium2Library
Library    DataDriver    ../DataTest/DataTest.xlsx    sheet_name=Sheet1
Resource    ../Resource/common.robot

Suite Setup    Open Browser    ${URL}    ${BROWSER}    options=add_argument("--use-fake-ui-for-media-stream")
Suite Teardown    Close Browser

Test Template    Login Negative type
*** Test Cases ***
Login Negative type    ${email}    ${name}	   ${phone}    ${alertTextEmail}    ${alertTextName}    ${alertTextPhone}

*** Keywords ***
Login Negative type
    [Arguments]    ${email}    ${name}	   ${phone}    ${alertTextEmail}    ${alertTextName}    ${alertTextPhone}
    Wait Until Page Contains Element    ${btnSubmit}    20  
    Input Text    ${InputEmail}    ${email}
    Input Text    ${InputName}    ${name}
    Input Text    ${InputPhone}    ${phone}
    Click Button    ${btnSubmit}
    Element Text Should Be    ${errorEmail}    ${alertTextEmail}  
    Element Text Should Be    ${errorName}    ${alertTextName}
    Element Text Should Be    ${errorPhone}    ${alertTextPhone}
    
Register
    Wait Until Page Contains Element    ${btnSubmit}    20  
    Input Text    ${InputEmail}    AutomatedTester@fb180.com    
    Input Text    ${InputName}    AutomatedTestE2E
    Input Text    ${InputPhone}    0800000000
    Click Button    ${btnSubmit}
    Wait Until Page Contains Element    ${Event1}    20  
    Click Element    ${Event1}