*** Settings ***
Documentation     A resource for global
Library           AppiumLibrary      10        run_on_failure=Capture Page Screenshot
Library           String
Library           BuiltIn
Library           DateTime
Library           Collections
Library           CustomLibrary

*** Variable ***
${APKPATH}                  /Users/sehatq/Documents/APK/Android-MyDemoAppRN.1.3.0.build-244.apk
${APP PACKAGE}              com.saucelabs.mydemoapp.rn
${APP ACTIVITY}             com.saucelabs.mydemoapp.rn.MainActivity

*** Keywords ***
Start Application on Local
    ${true}     Convert To Boolean    true
    Open Application    http://127.0.0.1:4723/wd/hub
    ...     platformName=android        platformVersion=12.0                   udid=emulator-5554
    ...     app=${APKPATH}              appPackage=${APP PACKAGE}            appActivity=${APP ACTIVITY}
    ...     newCommandTimeout=2500      noReset=true                         autoGrantPermissions=true     enableMultiWindows=${true}
    ...     unicodeKeyboard=true        resetKeyboard=true                   automationName=uiautomator2     dontStopAppOnReset=true     adbExecTimeout=60000

Before Test
    Start Activity          appPackage=${APP PACKAGE}    appActivity=${APP ACTIVITY}

After Suite
    Remove Application      ${APP PACKAGE}
    Close Application
