*** Settings ***
Library    AppiumLibrary
Library    String
Library    DateTime

*** Variable ***
${inputUsernameOnLoginPage}           xpath=//*[@content-desc="Username input field"]
${inputPasswordOnLoginPage}           xpath=//*[@content-desc="Password input field"]
${buttonLogin}                        xpath=//*[@content-desc="Login button"]
${textValidAutofillCredentials}       xpath=//*[@content-desc="bob@example.com-autofill"]
${textInvaliAutofillCredentials}      xpath=//*[contains(@content-desc,"locked out")]  
${textErrorOnLoginPage}               xpath=//*[@content-desc="generic-error-message"]

*** Keywords ***
user is on login page
    Wait Until Element Is Visible    ${inputUsernameOnLoginPage}
    Element Should Be Visible        ${inputUsernameOnLoginPage}
    Element Should Be Visible        ${inputPasswordOnLoginPage}
    Element Should Be Visible        ${buttonLogin}

user input username for login
    [Arguments]    ${userName}
    Wait Until Element Is Visible     ${inputUsernameOnLoginPage}
    Input Text                        ${inputUsernameOnLoginPage}    ${userName}

user input password for login
    [Arguments]    ${userPassword}
    Wait Until Element Is Visible     ${inputPasswordOnLoginPage}
    Input Text                        ${inputPasswordOnLoginPage}    ${userPassword}

user input credentials with autofill
    Wait Until Element Is Visible    ${textValidAutofillCredentials}
    Click Element                    ${textValidAutofillCredentials}

user click button login on login page
    Wait Until Element Is Visible    ${buttonLogin}
    Click Element                    ${buttonLogin}

user should failed to login
    Wait Until Element Is Visible    ${textErrorOnLoginPage}
    Element Should Be Visible        ${textErrorOnLoginPage}


user success to login
    Wait Until Page Does Not Contain    ${buttonLogin}
    Sleep    3
    Page Should Not Contain Element     ${buttonLogin}