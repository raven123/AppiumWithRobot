*** Settings ***
Library         AppiumLibrary   timeout=10

*** Test Cases ***
Sign Up for PIASample App and validate
    Open Application    http://localhost:4723/wd/hub    platformName=Android    deviceName=abc     app=${PATH}/demoapp/pia-sdk-android-release-sample-2.4.0.apk     appPackage=eu.nets.pia.sample    appActivity=eu.nets.pia.sample.ui.activity.main.MainActivity    automationName=uiautomator2
    comment    Application launched
    Input Text    id=customer_id_et    ${CUST_ID}
    click element   id=sign_up_btn
    wait until element is visible    id=payment_btn
    comment    Login Successful
    click element   id=payment_btn
    wait until element is visible    xpath=//*[contains(@text,'OK')]
    click element    xpath=//*[contains(@text,'OK')]
    comment    click on ok button to dismiss alert
    click element    id=settings_item
    element should contain text    id=customer_id_label    ${CUST_ID}
    comment    ${CUST_ID} verified on settings screen
    Close Application

As a user, I'm able to change the Customer ID in the Settings view from PiA Android app
    Open Application    http://localhost:4723/wd/hub    platformName=Android    deviceName=BS7533M4KN0221008929     app=${PATH}/demoapp/pia-sdk-android-release-sample-2.4.0.apk     appPackage=eu.nets.pia.sample    appActivity=eu.nets.pia.sample.ui.activity.main.MainActivity    automationName=uiautomator2
    comment    Application launched
    Input Text    id=customer_id_et    ${CUST_ID}
    click element   id=sign_up_btn
    wait until element is visible    id=payment_btn
    comment    Login Successful
    click element    id=settings_item
    element should contain text    id=customer_id_label    ${CUST_ID}
    click element    id=change_customer_id
    wait until element is visible    id=alertTitle
    element should contain text    id=alertTitle    ${EDIT_CUST_ALERT_TEXT}
    comment    click on cancel to abort change of customer ID
    click element    xpath=//*[contains(@text,'CANCEL')]
    Comment    asserting customer ID is still the same
    element should contain text    id=customer_id_label    ${CUST_ID}
    Comment    now changing cust ID from 101 to 109
    click element    id=change_customer_id
    element should contain text    id=alertTitle    ${EDIT_CUST_ALERT_TEXT}
    Input Text    class=android.widget.EditText     ${NEW_CUST_ID}
     Comment    Click on save
    click element    xpath=//*[contains(@text,'SAVE')]
    element should contain text    id=customer_id_label    ${NEW_CUST_ID}
    Close Application
*** Variables ***
${PATH}    ${CURDIR}/..
${CUST_ID}  101
${EDIT_CUST_ALERT_TEXT}     New Customer ID
${NEW_CUST_ID}  101