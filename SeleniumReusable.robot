*** Settings ***
Documentation    Suite description
Library  SeleniumLibrary

*** Test Cases ***
Test title
    close_all_bowsers


*** Keywords ***
Close_All_Bowsers
    Close All Browsers

Close_Window
    Close_Window

Delete_cookie ${name}
    Delete cookie  ${name}

Get_ALL_LINKS_IN_PAGE
    Get All Links



