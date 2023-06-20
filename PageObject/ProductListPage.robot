*** Settings ***
Library    AppiumLibrary
Library    String
Library    DateTime

*** Variable ***
${buttonMenu}                     xpath=//*[@content-desc="open menu"]
${textGeoLocation}                xpath=//*[@content-desc="menu item geo location"]
${textLogin}                      xpath=//*[@content-desc="menu item log in"]
${textLogout}                     xpath=//*[@content-desc="menu item log out"]
${imageProduct}                   xpath=(//*[@content-desc='products screen']//*[@content-desc='store item'])[1]

*** Keywords ***
user is on product list page
    Wait Until Element Is Visible    ${imageProduct}
    Element Should Be Visible        ${imageProduct}

user open hamburger menu
    Wait Until Element Is Visible    ${buttonMenu}
    Click Element                    ${buttonMenu}

user go to geo location page
    Wait Until Element Is Visible    ${textGeoLocation}
    Click Element                    ${textGeoLocation}

user go to login page
    Wait Until Element Is Visible    ${textLogin}
    Click Element                    ${textLogin}

user go to product detail page
    Wait Until Element Is Visible    ${imageProduct}
    Click Element                    ${imageProduct}