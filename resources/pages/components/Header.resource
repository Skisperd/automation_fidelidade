*** Settings ***
Documentation            Fidelidade insurance company header elements and actions

Library        String
Library        Browser

*** Keywords ***
Must display insurance options
    [Arguments]    ${insurance}

    ${element}                   Set Variable        xpath=//h2[text()="${insurance}"]
    
    # Checkpoint
    Wait For Elements State      ${element}        visible        
    Get Text                     ${element}        equal          ${insurance}