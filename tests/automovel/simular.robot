*** Settings ***
Documentation            Car insurance simulation scenarios

Resource        ../../resources/base.resource

Test Setup          Start Session
Test Teardown       Take Screenshot

*** Test Cases ***
Submit Enrollment success
    [Tags]    critical

    ${data}   Get fixture    elements    elements
    Go to simulator page      ${data}[pt][option_1]

    ${data1}   Get fixture     enrollment    simulator
    Submit enrollment auto       ${data1}[simulator_success]
    
    ${data}   Get fixture    elements    elements
    Must be valid registration




