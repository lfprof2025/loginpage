*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${LOGIN_PAGE}         http://localhost:8000/index.html
${VALID_USER}         admin
${VALID_PASSWORD}     123456
${INVALID_USER}       errado
${INVALID_PASSWORD}   000000

*** Test Cases ***

Login Com Sucesso
    Open Browser    ${LOGIN_PAGE}    chrome
    Input Text      id=username      ${VALID_USER}
    Input Text      id=password      ${VALID_PASSWORD}
    Click Button    xpath=//button
    Sleep           1s
    Location Should Contain    dashboard.html
    Close Browser

Login Com Usuário Inválido
    Open Browser    ${LOGIN_PAGE}    chrome
    Input Text      id=username      ${INVALID_USER}
    Input Text      id=password      ${VALID_PASSWORD}
    Click Button    xpath=//button
    Sleep           1s
    Element Text Should Be    id=error-message    Usuário ou senha incorretos.
    Close Browser

Login Com Senha Inválida
    Open Browser    ${LOGIN_PAGE}    chrome
    Input Text      id=username      ${VALID_USER}
    Input Text      id=password      ${INVALID_PASSWORD}
    Click Button    xpath=//button
    Sleep           1s
    Element Text Should Be    id=error-message    Usuário ou senha incorretos.
    Close Browser
