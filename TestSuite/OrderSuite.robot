*** Settings ***
Resource              ../Config/prod.robot
Resource              ../TestScenario/OrderTest.robot
Suite Setup           Start Application on Local
Suite Teardown        After Suite

*** Test Cases ***
verify user can create order
    [Documentation]    this scenario to verify user can create order
    [Tags]             positive    prod    order
    Create order