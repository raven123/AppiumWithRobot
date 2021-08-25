*** Settings ***
Library    AppiumLibrary    timeout=10

*** Variables ***
# *** PIA App configuration ***
${APP_PATH}             ${CURDIR}/../demoapp/pia-sdk-android-release-sample-2.4.0.apk
${APP_PACKAGE}          eu.nets.pia.sample
${APP_LAUNCH_ACTIVITY}  ${APP_PACKAGE}.ui.activity.main.MainActivity
#*** Appium Configuration ***
${DEVICE_NAME}      abc
${AUTOMATION_NAME}  UiAutomator2
# *** CUSTOMER ID Configuration ***
${CUST_ID}      101
${NEW_CUST_ID}  109
# *** Edit Customer alert ***
${EDIT_CUST_ALERT_TEXT}     New Customer ID
#*** LOCATORS for SIGN UP Screen ***
${CUSTOMER_ID_TEXT_FIELD}    id=customer_id_et
${SIGN_UP_BUTTON}            id=sign_up_btn
#*** Environment Description Alert ***
${OK_BUTTON}    xpath=//*[contains(@text,'OK')]
#*** Checkout view for payment screen ***
${BUY_BUTTON}       id=payment_btn
${SETTINGS_BUTTON}  id=settings_item
#*** settings  screen ***
${CUSTOMER_ID_LABEL}            id=customer_id_label
${CHANGE_CUSTOMER_ID_LABEL}     id=change_customer_id
#*** Edit Customer ID Alert ***
${EDIT_CUSTOMER_ID_ALERT}       id=alertTitle
${SAVE_BUTTON}                  xpath=//*[contains(@text,'SAVE')]
${CANCEL_BUTTON}                xpath=//*[contains(@text,'CANCEL')]
${EDIT_CUST_ID_TEXT_FIELD}      class=android.widget.EditText
*** Keywords ***
Launch PIA application
     Open Application    http://localhost:4723/wd/hub    platformName=Android    deviceName=${DEVICE_NAME}     app=${APP_PATH}     appPackage=${APP_PACKAGE}    appActivity=${APP_LAUNCH_ACTIVITY}    automationName=${AUTOMATION_NAME}

Sign Up In PIA Application With Customer ID
    [Arguments]     ${CUSTOMER_ID}=${CUST_ID}
    Input Text    ${CUSTOMER_ID_TEXT_FIELD}    ${CUSTOMER_ID}
    click element   ${SIGN_UP_BUTTON}

Dismiss The Environment Description Alert
    ${ALERT}    Run Keyword And Return Status    wait until element is visible    ${OK_BUTTON}
    Run Keyword If    '${ALERT}'=='True'     click element    ${OK_BUTTON}

Check Whether Checkout View For Purchasing Ligntning Cable Is Presented
    wait until element is visible    ${BUY_BUTTON}

Go To Settings Screen
    click element                       ${SETTINGS_BUTTON}
    wait until element is visible       ${CHANGE_CUSTOMER_ID_LABEL}

Assert Customer ID Is Displayed On the Settings Screen
    [Arguments]    ${CUSTOMER_ID}
     element should contain text    ${CUSTOMER_ID_LABEL}    ${CUSTOMER_ID}

Edit Customer ID On Settings Screen
    [Arguments]    ${CUSTOMER_ID}
    click element                       ${CHANGE_CUSTOMER_ID_LABEL}
    wait until element is visible       ${EDIT_CUSTOMER_ID_ALERT}
    element should contain text         ${EDIT_CUSTOMER_ID_ALERT}    ${EDIT_CUST_ALERT_TEXT}
    Input Text    ${EDIT_CUST_ID_TEXT_FIELD}    ${CUSTOMER_ID}
    click element   ${SAVE_BUTTON}
    #Assert new customer ID is displayed on the screen
    Assert Customer ID Is Displayed On The Settings Screen    ${CUSTOMER_ID}

Cancel Edit Customer ID On Settings Screen
    [Arguments]    ${CUSTOMER_ID}
    click element                       ${CHANGE_CUSTOMER_ID_LABEL}
    wait until element is visible       ${EDIT_CUSTOMER_ID_ALERT}
    element should contain text         ${EDIT_CUSTOMER_ID_ALERT}    ${EDIT_CUST_ALERT_TEXT}
    click element   ${CANCEL_BUTTON}
    # assert previous customer ID is displayed on the screen
    Assert Customer ID Is Displayed On The Settings Screen    ${CUSTOMER_ID}







