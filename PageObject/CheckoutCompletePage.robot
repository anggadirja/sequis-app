** Settings ***
Library    AppiumLibrary
Library    String
Library    DateTime

*** Variable ***
${buttonContinueShopping}           xpath=//*[@content-desc="Continue Shopping button"]

*** Keywords ***
user is on checkout complete page
    Wait Until Element Is Visible    ${buttonContinueShopping}
    Element Should Be Visible        ${buttonContinueShopping}