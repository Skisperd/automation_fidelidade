*** Settings ***
Documentation    Car insurance simulation scenarios

Resource    ../../resources/base.resource

Test Setup       Start Session
Test Teardown    Finish Session

*** Test Cases ***
Submit a valid license plate
    [Tags]    critical

    ${data}    Get fixture    elements    elements
    Go to simulator page    ${data}[pt][option_1]

    ${data1}    Get fixture    license_plate    simulator
    Submit license_plate       ${data1}[simulator_success]
    Go to presimulation

    ${model_car_name}    Should be name of the car
    Write Test Result    The car model is: ${model_car_name}

    ${insurance_value}   Should be price of the insurance company
    Write Test Result    The insurance value is: R$ ${insurance_value}

Submit a invalid license plate
    [Tags]    critical

    ${data}    Get fixture    elements    elements
    Go to simulator page    ${data}[pt][option_1]

    ${data1}    Get fixture    license_plate    simulator
    Submit license_plate       ${data1}[simulator_unsuccess]
    Button disable
