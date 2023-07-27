*** Settings ***
Documentation            Online website for testing

Resource        ../resources/base.resource

Test Setup      Start Session
Test Teardown   Take Screenshot

*** Test Cases ***
Web App must be online
    [Tags]    critical  

    ${data}   Get fixture       elements        elements

    Accept Cookies              ${data}[pt][cokies]
    Get Title                   equal            ${data}[pt][title]
    Information should be       ${data}[pt][eu-quero]