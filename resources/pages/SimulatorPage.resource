*** Settings ***
Documentation            Elements and simulation actions of the insurance company Fidelidade

Library        SeleniumLibrary

*** Keywords ***
Go to simulator page
    [Arguments]        ${language_item}

    ${element_auto}                 Set Variable         xpath=//a[@class="header" and contains(text(), "${language_item}")]

    Wait Until Element Is Visible         ${element_auto}  
    Click Element    ${element_auto}
    ${element}                      Set Variable         xpath=//a[@id="ctl00_PlaceHolderMain_EditModePanel2_ProductDescription_lnkSimulateLink"] 
    Wait Until Element Is Visible           ${element}
    Click Element                           ${element}

Submit license plate
    [Arguments]                        ${simulator_success}

    Select Frame                        xpath=//iframe[@id="Simulator"]
    ${auto_element}                     Set Variable     xpath=//*[@class="OSFillParent"]
    ${input_place_filder}               Set Variable     xpath=//input[@id='CFID_B2C_SIM_Th_SIMAUTO_wt60_block_wtMainContent_CFID_B2C_SIM_Pat_SIMAUTO_wtCustomCard_block_wtCustomCardContent_CFID_B2C_SIM_Pat_SIMAUTO_wt9_block_wtContent_Sim_Auto_Web_Pat_wtLicensePlateBlock_block_wtInputPlaceholder_wttxtRegNumber']
    Wait Until Element Is Visible       ${auto_element} 
    Input Text                          ${input_place_filder}    ${simulator_success}
    Unselect Frame

Go to presimulation

    Select Frame                        xpath=//iframe[@id="Simulator"]
    ${element_button}                   Set Variable        xpath=//input[@id='CFID_B2C_SIM_Th_SIMAUTO_wt60_block_wtMainContent_CFID_B2C_SIM_Pat_SIMAUTO_wtCustomCard_block_wtCustomCardContent_CFID_B2C_SIM_Pat_SIMAUTO_wt9_block_wtFooter_wtbtnNext']
    Wait Until Element Is Enabled       ${element_button}
    Click Element                       ${element_button}
    Unselect Frame

Go to simulation insurance value
    Go To    https://www.fidelidade.pt/PT/particulares/Auto/Simuladores/Automovel/Paginas/default.aspx

Button disable
    Select Frame                        xpath=//iframe[@id="Simulator"]
    ${element_button}                   Set Variable        xpath=//input[@id='CFID_B2C_SIM_Th_SIMAUTO_wt60_block_wtMainContent_CFID_B2C_SIM_Pat_SIMAUTO_wtCustomCard_block_wtCustomCardContent_CFID_B2C_SIM_Pat_SIMAUTO_wt9_block_wtFooter_wtbtnNext']
    Element Should Be Disabled          ${element_button}
    Unselect Frame
