*** Settings ***
Library         AppiumLibrary   timeout=10
#eu.nets.pia.sample:id/
#eu.nets.pia.sample:id/sign_up_btn
#eu.nets.pia.sample:id/payment_btn
#OK & android:id/button1
#eu.nets.pia.sample:id/settings_item
#eu.nets.pia.sample:id/customer_id_label
#eu.nets.pia.sample:id/change_customer_id
#eu.nets.pia.sample:id/alertTitle
#CANCEL & android:id/button2
*** Test Cases ***
Sign Up for PIASample App and validate
    Open Application    http://localhost:4723/wd/hub    platformName=Android    deviceName=BS7533M4KN0221008929     app=${PATH}/demoapp/pia-sdk-android-release-sample-2.4.0.apk     appPackage=eu.nets.pia.sample    appActivity=eu.nets.pia.sample.ui.activity.main.MainActivity    automationName=uiautomator2
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
*** Variables ***
${PATH}    ${CURDIR}/..
${CUST_ID}  101