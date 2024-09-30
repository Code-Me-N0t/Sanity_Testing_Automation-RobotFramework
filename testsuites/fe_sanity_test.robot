*** Settings ***
Resource            ../settings/main_resources.robot

Test Setup          Launch Testing Website
Test Teardown       Main Teardown


*** Test Cases ***
Test Scenario 1: Validate Lobby Page displays
    [Tags]    navigation    lobby    1727691482361
    Given The OG Logo displays
    When The loading is at    100.0%
    Then The lobby should display immediately

Test Scenario 2: Validate baccarat game tabs only displays baccarat games
    [Tags]    navigation    baccarat    1724740500683
    Given The lobby should display immediately
    When I navigate to    baccarat
    Then All the games displayed should only be    ["baccarat"]

Test Scenario 3: Validate Cards game tabs only displays Card games
    [Tags]    navigation    cards    1724740503770
    Given The lobby should display immediately
    When I navigate to    cards
    Then All the games displayed should only be    ["baccarat", "dt", "bull bull", "three cards"]

Test Scenario 4: Validate Others game tabs only displays Other games
    [Tags]    navigation    others    1724740505978
    Given The lobby should display immediately
    When I navigate to    others
    Then All the games displayed should only be    ["sedie", "roulette", "sicbo"]

Test Scenario 5: Validate Featured game tabs only displays featured games
    [Tags]    navigation    featured    1724740493238
    Given The lobby should display immediately
    When I navigate to    featured
    Then All the games displayed should only be
    ...    ["baccarat", "dt", "roulette", "sicbo", "three cards", "bull bull", "sedie"]

Test Scenario 6: Validate clicking the Language Icon should redirect to the language modal
    [Tags]    navigation    language    1724729648099
    Given The lobby should display immediately
    And I click the settings
    When I click the icon    language
    Then Text should be in the modal    language

Test Scenario 7: Validate clicking the History Icon should redirect to the history page
    [Tags]    navigation    record    1724734331005
    Given The lobby should display immediately
    And I click the settings
    When I click the icon    history
    Then Text should be in the modal    record

Test Scenario 8: Validate clicking the Follow Icon should redirect to the follow page
    [Tags]    navigation    follow    1727689005777
    Given The lobby should display immediately
    And I click the settings
    When I click the icon    follow
    Then Text should be in the modal    follow

Test Scenario 9: Validate clicking the Rule Icon should redirect to the rule page
    [Tags]    navigation    rules    1727688870133
    Given The lobby should display immediately
    And I click the settings
    When I click the icon    rules
    Then I should be redirected to the    rules

Test Scenario 10: Validate clicking the Sounds Icon should mute the sounds
    [Tags]    navigation    sounds    1727688767287
    Given The lobby should display immediately
    And I click the settings
    When I click the icon    sounds
    Then The sound should be muted

Test Scenario 11: Validate clicking the Profile Icon should open the profile modal
    [Tags]    navigation    profile    1727688652700
    Given The lobby should display immediately
    When I click the icon    profile
    Then I should be redirected to the    profile