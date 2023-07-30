*** Settings ***
Documentation    Elements and simulation actions of the insurance company Fidelidade

Library    SeleniumLibrary
Library    String
Library    OperatingSystem

*** Variables ***
${RESULT_FILE}    output.txt

*** Keywords ***
Should be name of the car
    [Return]    ${model_car_name}

    Select Frame    xpath=//iframe[@id="Simulator"]
    ${text_element}    Get Text    xpath=//div[contains(text(),'Este é um exemplo de pré-simulação para o veículo ')]
    ${model_car_name}    Set Variable    ${text_element}[49:]
    Unselect Frame

Should be price of the insurance company
    [Return]    ${insurance_value}

    Select Frame    xpath=//iframe[@id="Simulator"]
    ${price_element}    Get Text    xpath=//span[@class='Price']
    ${price_decimals_element}    Get Text    xpath=//span[@class='Price_Decimals']
    ${insurance_value}    Set Variable    ${price_element}${price_decimals_element}
    Unselect Frame

Write Test Result
    [Arguments]    ${result}
    Append To File    ${RESULT_FILE}    ${result}
    Log    ${result}
