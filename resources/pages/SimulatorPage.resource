*** Settings ***
Documentation            Elements and simulation actions of the insurance company Fidelidade

Library        SeleniumLibrary

*** Variables ***
${auto_element}                     xpath=//*[@class="OSFillParent"]
${input_place_filder}               xpath=//input[contains(@id, 'wttxtRegNumbe')]
${element_button}                   xpath=//input[contains(@id, 'wtbtnNext')]
${element}                          xpath=//a[@id="ctl00_PlaceHolderMain_EditModePanel2_ProductDescription_lnkSimulateLink"] 

*** Keywords ***
Go to simulator page
    [Arguments]        ${language_item}

    ${element_auto}                 Set Variable         xpath=//a[@class="header" and contains(text(), "${language_item}")]

    Wait Until Element Is Visible         ${element_auto}  
    Click Element                         ${element_auto}
    Wait Until Element Is Visible         ${element}
    Click Element                         ${element}

Submit license plate
    [Arguments]                        ${simulator_success}

    Select Frame                        xpath=//iframe[@id="Simulator"]
    Wait Until Element Is Visible       ${auto_element} 
    Input Text                          ${input_place_filder}    ${simulator_success}
    Unselect Frame

Go to presimulation

    Select Frame                        xpath=//iframe[@id="Simulator"]
    Wait Until Element Is Enabled       ${element_button}
    Click Element                       ${element_button}
    Unselect Frame

Go to simulation insurance value
    Go To    https://www.fidelidade.pt/PT/particulares/Auto/Simuladores/Automovel/Paginas/default.aspx

Button disable
    Select Frame                        xpath=//iframe[@id="Simulator"]
    Element Should Be Disabled          ${element_button}
    Unselect Frame
