*** Settings ***
Documentation        Information elements and actions of Seguradora Fidelidade

Library        Browser

*** Keywords ***
Information should be
    [Arguments]    ${expected_text}

    ${element}                   Set Variable        xpath=//h2[text()="${expected_text}"]
    
    # Checkpoint
    Wait For Elements State      ${element}        visible        
    Get Text                     ${element}        equal          ${expected_text}

Accept Cookies
    [Arguments]        ${language_item}

    ${element}         Set Variable               xpath=//button[text()="${language_item}"]

    Wait For Elements State     ${element}        visible    15
    Click    ${element}