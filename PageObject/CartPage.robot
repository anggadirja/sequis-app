*** Settings ***
Library    AppiumLibrary
Library    String
Library    DateTime

*** Variable ***
${textProductNameOnCart}          xpath=//*[@content-desc="product label"]
${textProductPriceOnCart}         xpath=//*[@content-desc="product price"]
${textTotalPriceOnCart}           xpath=//*[@content-desc="total price"]
${buttonCheckout}                 xpath=//*[@content-desc="Proceed To Checkout button"]

*** Keywords ***
user is on cart page
    Wait Until Element Is Visible    ${textProductNameOnCart}
    Element Should Be Visible        ${textProductNameOnCart}
    Element Should Be Visible        ${textProductPriceOnCart}
    Element Should Be Visible        ${textTotalPriceOnCart}
    Element Should Be Visible        ${buttonCheckout}

user go to checkout page
    Wait Until Element Is Visible    ${buttonCheckout}
    Click Element                    ${buttonCheckout}