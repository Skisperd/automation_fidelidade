*** Settings ***
Documentation            Elements and simulation actions of the insurance company Fidelidade

Library        Browser
Resource       ../env.resource

*** Keywords ***
Go to simulator page
    [Arguments]        ${language_item}

    ${element_auto}                 Set Variable         xpath=//a[@class="header" and contains(text(), "${language_item}")]

    Wait For Elements State         ${element_auto}       visible    15
    Click    ${element_auto}

    ${element}                      Set Variable         xpath=//a[@id="ctl00_PlaceHolderMain_EditModePanel2_ProductDescription_lnkSimulateLink"] 
    
    Wait For Elements State         ${element}           visible    15
    Click                           ${element}