*** Settings ***
Resource    ../settings/main_resources.robot


*** Keywords ***
The OG Logo displays
    Verify If Element Is Existing    ${loading_element}
    Verify If Element Is Existing    ${loading_logo}

The loading is at
    [Arguments]    ${text}
    Verify If Text Is Existing    ${text}

The lobby should display immediately
    Verify If Element Is Existing    ${lobby}

I navigate to
    [Arguments]    ${tab}
    Click Specific Element    ${${tab}_tab}

I click the settings
    Click Specific Element    ${setting}
    ${attrib}=    Get Element Attribute    ${setting_con}    style
    Should Not Contain    ${attrib}    display: none

Text should be in the modal
    [Arguments]    ${text}
    ${modal_text}=    Get Text    ${setting_title}
    ${modal_text}=    Convert To Lower Case    ${modal_text}
    Log    ${modal_text}
    Should Contain    ${modal_text}    ${text}

The sound should be muted
    ${attrib}=    Get Element Attribute    ${sounds_toggle}    class
    Should Not Contain    ${attrib}    toggled

I click the icon
    [Arguments]    ${icon}
    Click Specific Element    ${${icon}_icon}

I should be redirected to the
    [Arguments]    ${page}

    Verify If Element Is Existing    ${${page}_page}

All the games displayed should only be
    [Arguments]    ${game_tabs}
    ${games}=    Get WebElements    ${game_headers}
    FOR    ${game}    IN    @{games}
        ${game_text}=    Get Text    ${game}
        ${game_text}=    Convert To Lower Case    ${game_text}
        Log    ${game_text}
        ${game_tabs}=    Evaluate    [${game_tabs}] if isinstance(${game_tabs}, str) else ${game_tabs}
        ${match_found}=    Evaluate    any(tab in '${game_text}' for tab in ${game_tabs})
        Should Be True    ${match_found}    ${game_text} does not contain any of the expected values ${game_tabs}
    END
