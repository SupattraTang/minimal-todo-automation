*** Settings ***
Library    AppiumLibrary
Resource   ../resources/todo_keywords.robot
Resource  ../variables/global_variables.robot

*** Test Cases ***
TC01 Open Application
    Launch app    ${PLATFORM_NAME}    ${PLATFORM_NAME}    ${APK_PATH}    ${AUTOMATION_NAME}
    Page Should Contain Element    id=main_todo_list
    Close Application

TC02 Add New Todo
    Launch app    ${PLATFORM_NAME}    ${PLATFORM_NAME}    ${APK_PATH}    ${AUTOMATION_NAME}
    Add Todo    Buy egg
    Todo Should Exist    Buy egg
    Close Application

TC03 Add Empty Todo
    Launch app    ${PLATFORM_NAME}    ${PLATFORM_NAME}    ${APK_PATH}    ${AUTOMATION_NAME}
    Click Element    id=new_todo_button
    Click Element    id=save_todo_button
    Page Should Contain    Please enter a todo
    Close Application

TC04 View Todo List
    Launch app    ${PLATFORM_NAME}    ${PLATFORM_NAME}    ${APK_PATH}    ${AUTOMATION_NAME}
    Element Should Be Visible    xpath=//android.widget.ListView/*
    Close Application

TC05 Delete Todo
    Launch app    ${PLATFORM_NAME}    ${PLATFORM_NAME}    ${APK_PATH}    ${AUTOMATION_NAME}
    Delete First Todo
    Close Application

TC06 Mark Todo Done
    Launch app    ${PLATFORM_NAME}    ${PLATFORM_NAME}    ${APK_PATH}    ${AUTOMATION_NAME}
    Mark First Todo As Done
    Close Application
