*** Settings ***
Documentation     A resource for global
Library           AppiumLibrary      10        run_on_failure=Capture Page Screenshot
Library           String
Library           BuiltIn
Library           DateTime
Library           Collections
Library           CustomLibrary

*** Variable ***
${EMAIL LOGIN NEW}          dhekapektoy2@gmail.com
${PASSWORD LOGIN NEW}       Anthony123!
${EMAIL LOGIN}              autosan01@mailsac.com
${PASSWORD LOGIN}           GenQ01
# ${EMAIL LOGIN}              testangga21@gmail.com
# ${PASSWORD LOGIN}           anggaiseng123
${NAME}                     QQQ Testing Auto Sanity 01
${DOB}                      18 November 1997
${DOB YEARS}                2005
${GENDER}                   Perempuan
${PHONE}                    6285163151218
${ADDRESS}                  Jakarta Pusat
${NAME FATHER}              QQQ Testing Suami Auto 01
${DOB FATHER}               21 April 1997
${GENDER FATHER}            Laki-laki
${PHONE FATHER}             6281220172375
${ADDRESS FATHER}           jakarta pusat
${HEIGHT}                   170
${WEIGHT}                   60
# ${APKPATH}                  /Users/sehatq/APK/app-sanity-v14022sept.apk
${APKPATH}                  /Users/sehatq/Documents/APK/Android-MyDemoAppRN.1.3.0.build-244.apk
${APP PACKAGE}              com.saucelabs.mydemoapp.rn
${APP ACTIVITY}             com.saucelabs.mydemoapp.rn.MainActivity
### Account for Add Family Member ###
${EMAIL LOGIN (2)}          autosan02@mailsac.com
${PASSWORD LOGIN (2)}       GenQ02
### Corporate User ###
${CORP EMAIL}               ades21@mailinator.com
${CORP PASSWORD}            pass123
${CORP OFFICE}              PT. Showcase
${CORP NAME}                Ade
${FAM NAME}                 Andara Jasmin
${FAM STATUS}               child
${CORP EMPLOYEE ID}         4
${CORP MEMBER ID}           CSQ2DDDE4D7
${CORP PLAN}                Plan Supervisor Benefit
${CORP EMAIL COMPANY}       ade@office.com
${CORP GENDER}              Perempuan
${CORP IDENTITY ID}         327105000
${CORP PHONE NUMBER}        6281233412
${FAM MEMBER ID}            CSQA19C7D2F
${FAM RELATIONSHIP}         Anak
${FAM PLAN}                 DUMMY
${FAM GENDER}               Perempuan
${FAM ID CARD}              1233111
### Booking landing variable ###
${FASKES BOOKING}           RS Dera As-Syifa
${LAYANAN BOOKING 1}        Cabut Gigi
${LAYANAN BOOKING 2}        darah
${PAKET BOOKING 1}          Pembersihan Karang Gigi (Scaling Gigi)
${PAKET BOOKING 2}          karang
${SPECIALIST BOOKING}       Umum
### HCF variable ###
${HOSPITAL NAME HCF}        Klinik Telemedika Health Center - Manado
${SPECIALIST HCF}           UMUM
${SEARCH VALUE HOSPITAL}    rumah sakit awal bros
${HCF FILTER TYPE VALUE}    Rumah Sakit
${HCF FILTER SPEC VALUE}    Veneer Gigi
${HCF FILTER CITY VALUE}    Denpasar
${HCF FILTER FACI VALUE}    Cuci Darah
#### HCP variable ###
${HCP DOCTOR AVAILABLE}     dr. Terence Alexander Wangko
${HCP DOCTOR AVAILABLE 2}   A. A. K. Sri Wira Wiraswati, M.Psi
${HCP DOCTOR AVAILABLE 3}   dr. A'ad Rahmawati Nori'in, Sp.S
${HCP DOCTOR NOT AVAIBLE}   dr. Adry Leonardy Tendean, Sp.PD
${HCP SEACH VALUE 1}        dr. Terence Alexander Wangko
${HCP SEACH VALUE 2}        dr albert
### HCS variable ###
${HCS SEACH VALUE 1}        tes gula darah
${HCS SEACH VALUE 2}        cek darah
${HCS NAME SELECTED}        Tes Darah Rutin
${HCS FILTER LAYANAN}       Scaling Gigi
${HCS FILTER CITY}          Bandung
${HCS FILTER PRICE}         50000,1500000
### Home Page Variable ###
${buttonNextTutorial}                   xpath=//*[contains(@resource-id, "tvNext")]
${buttonDissmiss}                       xpath=//*[contains(@resource-id, "tv_dismiss)]
${buttonLewatiTutorial}                 xpath=//*[@text="Lewati"]
${textFirstWelcome}                     xpath=//*[@text="Riwayat Konsultasi"]
${iconSehatQ}                           xpath=//*[contains(@resource-id, "imageView30")]
${buttonTurnOnLocation}                 xpath=//*[contains(@resource-id, "tv_turn_on") and contains(@text,"Aktifkan")]
${buttonLocatioWhileUsingApp}           xpath=//*[contains(@resource-id, "permission_allow_foreground_only_button")]
${buttonSkipToHalmanUtama}              xpath=//*[contains(@resource-id, "tvSkip")]
${menuProfile}                          xpath=//*[contains(@resource-id, "iv_profile_nav")]
 ### Variable Data Test Toko ### 
${INVALID VOUCHER CODE}             anggaiseng
${EXPIRED VOUCHER CODE}             V20210125134551
${NOT MATCH TNC VOUCHER CODE}       V20210125135452

*** Keywords ***
Start Application on Local
    ${true}     Convert To Boolean    true
    Open Application    http://127.0.0.1:4723/wd/hub
    ...     platformName=android        platformVersion=12.0                   udid=emulator-5554
    ...     app=${APKPATH}              appPackage=${APP PACKAGE}            appActivity=${APP ACTIVITY}
    ...     newCommandTimeout=2500      noReset=true                         autoGrantPermissions=true     enableMultiWindows=${true}
    ...     unicodeKeyboard=true        resetKeyboard=true                   automationName=uiautomator2     dontStopAppOnReset=true     adbExecTimeout=60000
    # ${isBegining}                       Run Keyword And Return Status       Wait Until Element Is Visible 		${buttonSkipToHalmanUtama}         timeout=5
    # Run Keyword If                      ${isBegining}                       skip new welcome page
    # ${isLocation}                       Run Keyword And Return Status       Wait Until Element Is Visible       ${buttonTurnOnLocation}            timeout=5
    # Run Keyword If                      ${isLocation}                       activate location
	# ${isTutorial}                       Run Keyword And Return Status       Wait Until Element Is Visible 		${buttonLewatiTutorial}            timeout=5
    # Run Keyword If                      ${isTutorial}                       skip tutorial
    # Wait Until Element Is Visible       ${iconSehatQ}
    # Element Should Be Visible           ${menuProfile}

skip welcome page
    Run Keyword And Ignore Error        Wait Until Element Is Visible 		${textFirstWelcome}
	Run Keyword And Ignore Error        Swipe By Percent 					90	50	10	50
	Run Keyword And Ignore Error        Wait Until Element Is Visible 		xpath=//*[@text="Booking Dokter Tanpa Ribet"]
	Run Keyword And Ignore Error        Swipe By Percent 					90	50	10	50
	Run Keyword And Ignore Error        Wait Until Element Is Visible 		xpath=//*[@text="Mudahnya Beli Produk Kesehatan"]
	Run Keyword And Ignore Error        Element Should Be Visible 			${buttonNextTutorial}
	Run Keyword And Ignore Error        Click Element 						${buttonNextTutorial}
	Run Keyword And Ignore Error 		Click Element 						${buttonDissmiss}

skip new welcome page
    Run Keyword And Ignore Error        Wait Until Element Is Visible 		${buttonSkipToHalmanUtama}
	Run Keyword And Ignore Error 		Click Element 						${buttonSkipToHalmanUtama}

activate location
    Wait Until Element Is Visible        ${buttonTurnOnLocation}
    Click Element                        ${buttonTurnOnLocation}
    Wait Until Element Is Visible        ${buttonLocatioWhileUsingApp}
    Click Element                        ${buttonLocatioWhileUsingApp}

skip tutorial
    Run Keyword And Ignore Error        Wait Until Element Is Visible 		${buttonLewatiTutorial}
	Run Keyword And Ignore Error        Click Element 				 		${buttonLewatiTutorial}
    Sleep 								3

Before Test
    Start Activity          appPackage=${APP PACKAGE}    appActivity=${APP ACTIVITY}

After Suite
    Remove Application      ${APP PACKAGE}
    Close Application

Swipe Up to Element
    [Arguments]     ${element}      ${container}
    wait until page contains element    ${container}
    FOR    ${index}    IN RANGE    1    50
        ${elementSize}=        Get Element Size        ${container}
        ${elementLocation}=    Get Element Location    ${container}
        ${startX}=         Evaluate      ${elementLocation['x']} + (${elementSize['width']} * 0.5)
        ${startY}=         Evaluate      ${elementLocation['y']} + (${elementSize['height']} * 0.7)
        ${endX}=           Evaluate      ${elementLocation['x']} + (${elementSize['width']} * 0.5)
        ${endY}=           Evaluate      ${elementLocation['y']} + (${elementSize['height']} * 0.5)
        ${status}=         run keyword and return status       wait until element is visible       ${element}      timeout=2
        run keyword if     '${status}'=='False'    Swipe	     ${startX}  ${startY}  ${endX}  ${endY}     500
        ...     ELSE       run keyword             Exit For Loop
    END

Swipe Down to Element
    [Arguments]     ${element}      ${container}
    wait until page contains element    ${container}
    FOR    ${index}    IN RANGE    1    20
        ${elementSize}=        Get Element Size        ${container}
        ${elementLocation}=    Get Element Location    ${container}
        ${startX}=         Evaluate      ${elementLocation['x']} + (${elementSize['width']} * 0.5)
        ${startY}=         Evaluate      ${elementLocation['y']} + (${elementSize['height']} * 0.3)
        ${endX}=           Evaluate      ${elementLocation['x']} + (${elementSize['width']} * 0.5)
        ${endY}=           Evaluate      ${elementLocation['y']} + (${elementSize['height']} * 0.7)
        ${status}=         run keyword and return status       wait until element is visible       ${element}      timeout=2
         run keyword if    '${status}'=='False'    Swipe      ${startX}    ${startY}  ${endX}  ${endY}  500
        ...     ELSE       run keyword             Exit For Loop
    END

Long Swipe Up
    [Arguments]     ${locator}      ${times}
    FOR    ${index}    IN RANGE    0    ${times}
        ${element_size}=        Get Element Size        ${locator}
        ${element_location}=    Get Element Location    ${locator}
        ${startX}=         Evaluate      ${elementLocation['x']} + (${elementSize['width']} * 0.5)
        ${startY}=         Evaluate      ${elementLocation['y']} + (${elementSize['height']} * 0.7)
        ${endX}=           Evaluate      ${elementLocation['x']} + (${elementSize['width']} * 0.5)
        ${endY}=           Evaluate      ${elementLocation['y']} + (${elementSize['height']} * 0.1)
        Swipe              ${startX}     ${startY}  ${endX}  ${endY}  500
    END

Long Swipe Down
    [Arguments]     ${locator}      ${times}
    FOR    ${index}    IN RANGE    0    ${times}
        ${element_size}=        Get Element Size        ${locator}
        ${element_location}=    Get Element Location    ${locator}
        ${startX}=         Evaluate      ${elementLocation['x']} + (${elementSize['width']} * 0.5)
        ${startY}=         Evaluate      ${elementLocation['y']} + (${elementSize['height']} * 0.1)
        ${endX}=           Evaluate      ${elementLocation['x']} + (${elementSize['width']} * 0.5)
        ${endY}=           Evaluate      ${elementLocation['y']} + (${elementSize['height']} * 0.7)
        Swipe              ${startX}     ${startY}  ${endX}  ${endY}  500
    END

Long Swipe Up to Element
    [Arguments]     ${element}      ${container}
    wait until page contains element    ${container}
    FOR    ${index}    IN RANGE    1    20
        ${elementSize}=        Get Element Size        ${container}
        ${elementLocation}=    Get Element Location    ${container}
        ${startX}=         Evaluate      ${elementLocation['x']} + (${elementSize['width']} * 0.5)
        ${startY}=         Evaluate      ${elementLocation['y']} + (${elementSize['height']} * 0.7)
        ${endX}=           Evaluate      ${elementLocation['x']} + (${elementSize['width']} * 0.5)
        ${endY}=           Evaluate      ${elementLocation['y']} + (${elementSize['height']} * 0.1)
        ${status}=         run keyword and return status       wait until element is visible       ${element}      timeout=2
        run keyword if     '${status}'=='False'    Swipe	     ${startX}  ${startY}  ${endX}  ${endY}     500
        ...     ELSE       run keyword             Exit For Loop
    END

Swipe Left
    [Arguments]        ${container}
    wait until page contains element    ${container}
    ${elementSize}=        Get Element Size        ${container}
    ${elementLocation}=    Get Element Location    ${container}
    ${startX}=         Evaluate      ${elementLocation['x']} + (${elementSize['width']} * 0.7)
    ${startY}=         Evaluate      ${elementLocation['y']} + (${elementSize['height']} * 0.5)
    ${endX}=           Evaluate      ${elementLocation['x']} + (${elementSize['width']} * 0.3)
    ${endY}=           Evaluate      ${elementLocation['y']} + (${elementSize['height']} * 0.5)
    Swipe      ${startX}    ${startY}  ${endX}  ${endY}  500

Swipe Left to Element
    [Arguments]     ${element}      ${container}
    wait until page contains element    ${container}
    FOR    ${index}    IN RANGE    1    20
        ${elementSize}=        Get Element Size        ${container}
        ${elementLocation}=    Get Element Location    ${container}
        ${startX}=         Evaluate      ${elementLocation['x']} + (${elementSize['width']} * 0.7)
        ${startY}=         Evaluate      ${elementLocation['y']} + (${elementSize['height']} * 0.5)
        ${endX}=           Evaluate      ${elementLocation['x']} + (${elementSize['width']} * 0.2)
        ${endY}=           Evaluate      ${elementLocation['y']} + (${elementSize['height']} * 0.5)
        ${status}=         run keyword and return status       wait until element is visible       ${element}      timeout=2
        run keyword if     '${status}'=='False'    Swipe      ${startX}    ${startY}  ${endX}  ${endY}  500
        ...     ELSE       run keyword             Exit For Loop
    END