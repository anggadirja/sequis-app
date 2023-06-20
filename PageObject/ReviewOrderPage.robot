** Settings ***
Library    AppiumLibrary
Library    String
Library    DateTime

*** Variable ***
${buttonPlaceOrder}           xpath=//*[@content-desc="Place Order button"]

*** Keywords ***
user is on review order page
    Wait Until Element Is Visible    ${buttonPlaceOrder}
    Element Should Be Visible        ${buttonPlaceOrder}

user click place order
    Wait Until Element Is Visible    ${buttonPlaceOrder}
    Click Element                    ${buttonPlaceOrder}