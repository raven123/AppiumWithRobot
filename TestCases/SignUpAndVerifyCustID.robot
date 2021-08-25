*** Settings ***
Library         AppiumLibrary   timeout=10
Resource        ../Resources/pia-resources.robot

*** Test Cases ***
Sign Up for PIASample App and validate cust ID 101 on settings screen
    Launch PIA Application
    Sign Up In PIA Application With Customer ID    ${CUST_ID}
    Dismiss The Environment Description Alert
    Check Whether Checkout View For Purchasing Ligntning Cable Is Presented
    Go To Settings Screen
    Assert Customer ID Is Displayed On The Settings Screen      ${CUST_ID}
    Close Application