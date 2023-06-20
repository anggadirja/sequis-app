*** Settings ***
Resource    LoginTest.robot
Resource    ../PageObject/ProductDetailPage.robot
Resource    ../PageObject/CartPage.robot
Resource    ../PageObject/CheckoutPage.robot
Resource    ../PageObject/PaymentPage.robot
Resource    ../PageObject/ReviewOrderPage.robot
Resource    ../PageObject/CheckoutCompletePage.robot


*** Keywords ***
Add product to cart
    Given Success login with autofill credentials
    When user go to product detail page
    And user add product to cart
    And user go to cart page
    Then user is on cart page

Create order
    Given Add product to cart
    When user go to checkout page
    Then user is on checkout page
    When user input address data for checkout
    And user click go to payment page
    Then user is on payment page
    When user input payment credentials
    And user click button review order
    Then user is on review order page
    When user click place order
    Then user is on checkout complete page