*** Settings ***
Documentation            Fidelidade insurance company header elements and actions

Library        SeleniumLibrary

*** Keywords ***
Must display insurance options
    [Arguments]    ${insurance}

    ${element}                   Set Variable        xpath=//h2[text()="${insurance}"]
    
    # Checkpoint
    Wait Until Element Is Visible      ${element}  
    Element Text Should Be             ${element}        ${insurance}
