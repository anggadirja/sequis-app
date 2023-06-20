*** Settings ***
Resource    ../PageObject/ProductListPage.robot
Resource    ../PageObject/LoginPage.robot
Resource    ../PageObject/GeoLocationPage.robot

*** Keywords ***
Access geo location page
    Given user is on product list page
    When user open hamburger menu
    And user go to geo location page
    Then user is on geo location page

Get latlong from geo location
    Given user is on geo location page
    When user get latitude value
    And user get logitude value

Access login page
    When user open hamburger menu
    And user go to login page
    Then user is on login page

Input latlong value on login page
    Given Access geo location page
    When Get latlong from geo location
    And Access login page
    And user input username for login    ${latitudeValue}
    And user input password for login    ${longitudeValue}
    And user click button login on login page
    Then user should failed to login

Success login with autofill credentials
    Given Access login page
    When user input credentials with autofill
    And user click button login on login page
    Then user success to login