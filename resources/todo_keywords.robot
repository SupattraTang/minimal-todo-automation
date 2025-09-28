*** Keywords ***
Launch app
    [Arguments]    ${PLATFORM_NAME}    ${PLATFORM_VERSION}    ${APP_PATH}
    Open Application    ${PLATFORM_NAME}    ${PLATFORM_VERSION}    ${APP_PATH}

Add Todo
    [Arguments]    ${todo_text}
    command / step to tap add / new todo
    Wait Until Element Is Visible    id=new_todo_button    timeout=10s
    Click Element    id=new_todo_button
    Input Text       id=todo_input_field    ${todo_text}
    Click Element    id=save_todo_button

Todo Should Exist
    [Arguments]    ${todo_text}
    # ค้นหา element ที่มีข้อความ todo_text
    Wait Until Element Is Visible    xpath=//android.widget.TextView[@text="${todo_text}"]    timeout=5s
    Element Should Contain    xpath=//android.widget.TextView[@text="${todo_text}"]    ${todo_text}

Close Application
    Close Application
