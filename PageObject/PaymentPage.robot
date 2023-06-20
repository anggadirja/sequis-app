** Settings ***
Library    AppiumLibrary
Library    String
Library    DateTime

*** Variable ***
${inputNameOnPaymentPage}           xpath=(//*[contains(@content-desc,"Full Name")])[1]
${inputCardNumber}                  xpath=(//*[contains(@content-desc,"Card Number")])[1]
${inputExpiredDateOnPaymentPage}    xpath=(//*[contains(@content-desc,"Expiration Date")])[1]
${inputSecurityCode}                xpath=(//*[contains(@content-desc,"Security Code")])[1]
${checkboxTNC}                      xpath=//*[contains(@content-desc,"checkbox for My billing")]
${buttonReviewOrder}                xpath=//*[@content-desc="Review Order button"]

*** Keywords ***
user is on payment page
    Wait Until Element Is Visible    ${inputNameOnPaymentPage}

user get payment credentials
    Set Global Variable    ${NameCC}    Rebecca Winter
    Set Global Variable    ${NoCC}      325812657568789
    Set Global Variable    ${ExpCC}     0325
    Set Global Variable    ${CodeCC}    123

user input payment credentials
    user get payment credentials
    Wait Until Element Is Visible                        ${inputNameOnPaymentPage}
    Input Text    ${inputNameOnPaymentPage}              ${NameCC}
    Input Text    ${inputCardNumber}                     ${NoCC}
    Input Text    ${inputExpiredDateOnPaymentPage}       ${ExpCC}
    Input Text    ${inputSecurityCode}                   ${CodeCC}

user click button review order 
    Wait Until Element Is Visible    ${buttonReviewOrder}
    Click Element                    ${buttonReviewOrder}