*** Settings ***
Documentation        Information elements and actions of Seguradora Fidelidade

Library        SeleniumLibrary

*** Keywords ***
Information should be
    [Arguments]    ${expected_text}

    ${element}                   Set Variable        xpath=//h2[text()="${expected_text}"]
    
    # Checkpoint
    Wait Until Element Is Visible      ${element}      
    Element Text Should Be             ${element}                ${expected_text}

Accept Cookies
    [Arguments]        ${language_item}

    ${element}         Set Variable               xpath=//button[text()="${language_item}"]

    Wait Until Element Is Visible     ${element}
    Click Element                     ${element}