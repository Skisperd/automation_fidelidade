*** Settings ***

Library        JSONLibrary
Library        SeleniumLibrary

Resource       pages/components/Header.resource
Resource       pages/components/Information.resource
Resource       pages/SimulatorPage.resource
Resource       pages/ResultPage.resource

***Variables
${BASE_URL}                 https://www.fidelidade.pt/PT/particulares
${BROWSER}                  chrome
${TIMEOUT}                  5
${LONG_TIMEOUT}             5   
${WIDTH}                    1400    
${HEIGHT}                   900

*** Keywords *** 
Start Session
    ${data}         Get fixture     elements    elements 
    Open Browser                    ${BASE_URL}     ${BROWSER}
    #Set Window Size                 ${WIDTH}        ${HEIGHT}
    Set Selenium Implicit Wait      ${TIMEOUT}
    Set Selenium Timeout            ${TIMEOUT}
    Accept Cookies                  ${data}[pt][cokies]
    Title Should Be                 ${data}[pt][title]

Get fixture
    [Arguments]        ${file_name}        ${scenario}

    ${data}    Load Json From File
    ...    ${EXECDIR}/resources/fixtures/${file_name}.json
    ...    encoding=utf-8
    
    [Return]    ${data}[${scenario}]

Finish Session
    Capture Page Screenshot
    Close All Browsers