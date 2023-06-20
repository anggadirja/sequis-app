*** Settings ***
Library    AppiumLibrary
Library    String
Library    DateTime

*** Variable ***
${textProductPrice}               xpath=//*[@content-desc="product price"]
${textProductQty}                 xpath=//*[@content-desc="counter amount"]
${buttonIncreaseQty}              xpath=//*[@content-desc="counter plus button"]
${buttonDecreaseQty}              xpath=//*[@content-desc="counter minus button"]
${buttonAddToCart}                xpath=//*[@content-desc="Add To Cart button"]
${iconCart}                       xpath=//*[@content-desc="cart badge"]

*** Keywords ***
user is on product detail page
    Wait Until Element Is Visible    ${textProductPrice}
    Element Should Be Visible        ${textProductPrice}
    Element Should Be Visible        ${buttonAddToCart}

user add product to cart
    Wait Until Element Is Visible    ${buttonAddToCart}
    Click Element                    ${buttonAddToCart}

user go to cart page
    Wait Until Element Is Visible    ${iconCart}
    Click Element                    ${iconCart}