*** Settings ***
Resource              ../Config/prod.robot
Resource              ../TestScenario/LoginTest.robot
Suite Setup           Start Application on Local
Suite Teardown        After Suite

*** Test Cases ***
verify user can input latlong fron geo location on login page
    [Documentation]    this scenario to verify user can input latlong on login page
    [Tags]             negative    prod    login    credentials    latlong    geolocation
    Input latlong value on login page


verify user can login with autofill credentials
    [Documentation]    this scenario to verify user can login with autofill credentials
    [Tags]             positive    prod    login    credentials
    Success login with autofill credentials
