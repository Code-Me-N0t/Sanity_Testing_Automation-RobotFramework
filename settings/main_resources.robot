*** Settings ***
Library        ../helpers/api_handler.py

Resource        library_resources.robot
Resource        setup_teardown.robot

Resource        ../keywords/global_keywords.robot
Resource        ../keywords/fe_sanity_keyword.robot

Resource        ../locators/fe_sanity_locators.robot

Resource        ../variables/fe_variables.robot