*** Settings ***
Library         AppiumLibrary   timeout=10
Resource        ../Resources/pia-resources.robot

*** Test Cases ***
As a user, I'm able to change the Customer ID in the Settings view from PiA Android app
    Launch PIA Application
    Sign Up In PIA Application With Customer ID    ${CUST_ID}
    Dismiss The Environment Description Alert
    Check Whether Checkout View For Purchasing Ligntning Cable Is Presented
    Go To Settings Screen
    Assert Customer ID Is Displayed On The Settings Screen      ${CUST_ID}
    Edit Customer ID On Settings Screen    ${NEW_CUST_ID}
    Close Application