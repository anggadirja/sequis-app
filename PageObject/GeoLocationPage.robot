*** Settings ***
Library    AppiumLibrary
Library    String
Library    DateTime

*** Variable ***
${textLatitudeValue}                     xpath=//*[@content-desc="latitude data"]
${textLongitudeValue}                    xpath=//*[@content-desc="longitude data"]
${buttonStartObserving}                  xpath=//*[@content-desc="Start Observing button"]
${buttonStopObserving}                   xpath=//*[@content-desc="Stop Observing button"]

*** Keywords ***
user is on geo location page
    Wait Until Element Is Visible    ${buttonStartObserving}
    Element Should Be Visible        ${buttonStartObserving}
    Element Should Be Visible        ${buttonStopObserving}

user click start observing 
    Wait Until Element Is Visible    ${buttonStartObserving}
    Click Element                    ${buttonStartObserving}

user click stop observing
    Wait Until Element Is Visible    ${buttonStopObserving} 
    Click Element                    ${buttonStopObserving}

user get latitude value
    Wait Until Element Is Visible    ${textLatitudeValue}
    ${latitude}                      Get Text                    ${textLatitudeValue}
    Log To Console    ini latitude : ${latitude}
    Set Global Variable    ${latitudeValue}    ${latitude}

user get logitude value
    Wait Until Element Is Visible    ${textLongitudeValue}
    ${longitude}                     Get Text                    ${textLongitudeValue}
    Log To Console    ini longitude : ${longitude}
    Set Global Variable    ${longitudeValue}    ${longitude}