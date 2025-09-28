*** Settings ***
Library    AppiumLibrary
Resource   ../resources/todo_keywords.robot
Resource  ../variables/global_variables.robot

*** Test Cases ***
Add Todo Item
    [Documentation]    Validate adding a new todo item works
    Open Application    http://localhost:4723
    ...    platformName=${PLATFORM_NAME}
    ...    deviceName=${DEVICE_NAME}
    ...    app=${APK_PATH}
    ...    automationName=${AUTOMATION_NAME}
    Add Todo    Buy egg
    Todo Should Exist    Buy egg
    Close Application
