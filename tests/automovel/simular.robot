*** Settings ***
Documentation            Car insurance simulation scenarios

Resource        ../../resources/base.resource

Test Setup          Start Session
Test Teardown       Take Screenshot

*** Test Cases ***
Submit Enrollment success
    [Tags]    critical

    ${data}   Get fixture    language    language
    Go to simulator page      ${data}[pt][option_1]
    
    
    

