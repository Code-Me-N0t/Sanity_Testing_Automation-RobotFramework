*** Settings ***
Resource        main_resources.robot

*** Keywords ***
Main Setup
    Empty Directory    testsuites/screenshots
    Set Screenshot Directory    testsuites/screenshots

Launch Testing Website
    Main Setup
    Mobile Browser 2
    ${url}=        Get Url
    Go To    ${url}

Main Teardown
    Capture Page Screenshot
    Close All Browsers