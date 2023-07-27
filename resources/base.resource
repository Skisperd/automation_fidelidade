*** Settings ***

Library        Browser
Library        JSONLibrary

Resource       pages/components/Header.resource
Resource       pages/components/Information.resource
Resource       pages/SimulatorPage.resource

Resource       env.resource

*** Keywords ***
Start Session
    ${data}   Get fixture    elements         elements 
    New Browser         browser=${BROWSER}    headless=False
    New Page            ${BASE_URL}
    Accept Cookies      ${data}[pt][cokies]

Get fixture
    [Arguments]        ${file_name}        ${scenario}

    ${data}    Load Json From File
    ...    ${EXECDIR}/resources/fixtures/${file_name}.json
    ...    encoding=utf-8
    
    [Return]    ${data}[${scenario}]