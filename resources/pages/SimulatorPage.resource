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

Submit enrollment auto
    [Arguments]     ${simulator_success}

    ${auto_element}    Set Variable     xpath=//iframe[@id="Simulator"] >>> xpath=//*[@class="OSFillParent"]   

    Wait For Elements State      ${auto_element}        visible    5
    
    Focus         ${auto_element}

    FOR    ${auto}    IN    @{simulator_success}[enrollment]
        Fill Text     ${auto_element}        ${auto}
        Sleep         3
        
    END

Must be valid registration
    [Arguments] 

    ${element}                 Set Variable          xpath=//iframe[@id="Simulator"] >>> xpath=//input[@value="Seguinte"]

    Wait For Elements State         ${element}       visible    15
    Click    ${element}

