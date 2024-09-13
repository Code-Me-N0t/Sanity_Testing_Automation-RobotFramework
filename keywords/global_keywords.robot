*** Settings ***
Resource    ../settings/main_resources.robot
Library     ../helpers/user_agent.py


*** Keywords ***
Texts Should Be Equal
    [Arguments]    ${text1}    ${text2}
    Should Be Equal As Strings    ${text1}    ${text2}

Verify If Element Is Existing
    [Arguments]    ${locator}
    Wait Until Keyword Succeeds    10s    1s    Element Should Be Visible    ${locator}

Verify If Element Is Not Existing
    [Arguments]    ${locator}
    Wait Until Keyword Succeeds    10s    1s    Element Should Not Be Visible    ${locator}

Verify Element Value
    [Arguments]    ${locator}    ${expected-value}
    ${actual-value}=    Get Text    ${locator}
    Should Be Equal    ${actual-value}    ${expected-value}

Get The Text
    [Arguments]    ${locator}
    Wait Until Keyword Succeeds    10s    1s    Get Text    ${locator}

Click Specific Element
    [Arguments]    ${locator}
    Wait Until Keyword Succeeds    10s    1s    Click Element    ${locator}

Type A Specific Text
    [Arguments]    ${locator}    ${text}
    Wait Until Keyword Succeeds    10s    1s    Input Text    ${locator}    ${text}

Type A Random Text
    [Arguments]    ${locator}
    ${random_text}=    Generate Random String    8    [LETTERS]
    Input Text    ${locator}    ${random_text}
    RETURN    ${random_text}

Type A Random Number
    [Arguments]    ${locator}
    ${random_number}=    Generate Random String    8    [NUMBERS]
    Input Text    ${locator}    ${random_number}

Verify If Text Is Existing
    [Arguments]    ${text}
    Wait Until Keyword Succeeds    10s    1s    Page Should Contain    ${text}

Handle Alert Message
    Handle Alert    action=ACCEPT

Open New Tab
    [Arguments]    ${new_url}
    Execute Javascript    window.open('${new_url}')

Get The Value
    [Arguments]    ${locator}
    Wait Until Keyword Succeeds    10s    1s    Get Value    ${locator}

Mobile Browser 1
    ${mobile_emulation}=    Create Dictionary    deviceName=Nexus 5
    ${chrome_options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys
    Call Method    ${chrome_options}    add_experimental_option    mobileEmulation    ${mobile_emulation}
    Create Webdriver    Chrome    my_alias    options=${chrome_options}
    Set Window Size    360    940
    Set Window Position    1400    0

Mobile Browser 2
    ${user_agent}=    Evaluate    sys.modules['fake_useragent'].UserAgent(platforms='mobile').random    sys
    ${chrome_options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys
    ${user_agent_arg}=    Catenate    SEPARATOR=    --user-agent=    ${user_agent}
    ${log_level_arg}=    Catenate    SEPARATOR=    log-level=    ERROR
    Call Method    ${chrome_options}    add_argument    ${user_agent_arg}
    Call Method    ${chrome_options}    add_argument    --hide-scrollbars
    Call Method    ${chrome_options}    add_argument    ${log_level_arg}
    ${mobile_emulation}=    Create Dictionary    userAgent=${user_agent}
    Call Method    ${chrome_options}    add_experimental_option    mobileEmulation    ${mobile_emulation}
    ${exclude_switches}=    Create List    enable-automation
    Create Webdriver    Chrome    my_alias    options=${chrome_options}
    Set Window Position    1400    0
    Set Window Size    450    950
