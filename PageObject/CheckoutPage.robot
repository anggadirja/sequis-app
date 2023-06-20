** Settings ***
Library    AppiumLibrary
Library    String
Library    DateTime

*** Variable ***
${inputNameOnCheckoutPage}          xpath=//*[@content-desc="Full Name* input field"]
${inputAddressLine1}                xpath=//*[@content-desc="Address Line 1* input field"]
${inputAddressLine2}                xpath=//*[@content-desc="Address Line 2 input field"]
${inputCity}                        xpath=//*[@content-desc="City* input field"]
${inputRegion}                      xpath=//*[@content-desc="State/Region input field"]
${inputZipCode}                     xpath=//*[@content-desc="Zip Code* input field"]
${inputCountry}                     xpath=//*[@content-desc="Country* input field"]
${buttonGoToPayment}                xpath=//*[@content-desc="To Payment button"]

*** Keywords ***
user is on checkout page
    Wait Until Element Is Visible    ${inputNameOnCheckoutPage}
    Element Should Be Visible        ${inputNameOnCheckoutPage}
    Element Should Be Visible        ${inputAddressLine1}
    Element Should Be Visible        ${inputCity}
    Element Should Be Visible        ${buttonGoToPayment}

user input name for checkout
    Wait Until Element Is Visible    ${inputNameOnCheckoutPage}
    Input Text    ${inputNameOnCheckoutPage}    anggadirja

user input address line 1 for checkout
    Wait Until Element Is Visible    ${inputAddressLine1}
    Input Text    ${inputAddressLine1}    JL Ciliwung

user input address line 2 for checkout
    Wait Until Element Is Visible    ${inputAddressLine2}
    Input Text    ${inputAddressLine2}    rumah angga

user input city for checkout
    Wait Until Element Is Visible    ${inputCity}
    Input Text    ${inputCity}    Jakarta

user input zip code for checkout
    Wait Until Element Is Visible    ${inputZipCode}
    Input Text    ${inputZipCode}    13640

user input country for checkout
    Wait Until Element Is Visible    ${inputCountry}
    Input Text    ${inputCountry}    Indonesia

user click go to payment page
    Wait Until Element Is Visible    ${buttonGoToPayment}
    Click Element    ${buttonGoToPayment}

user input address data for checkout
    user input name for checkout
    user input address line 1 for checkout
    user input address line 2 for checkout
    user input city for checkout
    user input zip code for checkout
    user input country for checkout