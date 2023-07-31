*** Settings ***
Documentation    Car insurance simulation scenarios

Resource    ../../resources/base.resource

Test Setup       Start Session
Test Teardown    Finish Session

*** Test Cases ***
Submit multiple valid license plates
    [Tags]    critical

    ${data1}    Get fixture    license_plate    simulator
    
    FOR    ${placa}    IN    @{data1}[simulator_success][enrollment]
        Go to simulation insurance value
        Submit license plate    ${placa}
        Go to presimulation

        ${model_car_name}    Should be name of the car
        Write Test Result    O modelo do carro é: ${model_car_name}

        ${insurance_value}    Should be price of the insurance company
        Write Test Result    O valor do seguro é: R$ ${insurance_value}
    END

Submit invalid license plate
    [Tags]    critical

    ${data}    Get fixture    elements    elements
    Go to simulator page    ${data}[pt][option_1]

    ${data1}    Get fixture    license_plate    simulator
    Submit license_plate       ${data1}[simulator_unsuccess][enrollment]
    Button disable
