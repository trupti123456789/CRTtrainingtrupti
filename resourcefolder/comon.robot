*** Settings ***
Library                         QWeb
Library                         QForce
Library                         String
Suite Setup                     OpenBrowser                 about:blank                 chrome

*** Variables ***
${home_url}                     ${login_url}/lightning/page/home
${login_url}                    https://investcorp--devfulcrum.sandbox.lightning.force.com/

${username}                     mounika.t@cloudfulcrum.com.devfulcrum
${password}                     Investcorp@11
#${fullID}                        ${login_url}/lightning/r/Account/${url1}/view

*** Keywords ***
Setup Browser
    Set Library Search Order    QWeb                        QForce
    Open Browser                about:blank                 ${BROWSER}
    SetConfig                   LineBreak                   ${EMPTY}                    #\ue000
    SetConfig                   DefaultTimeout              20s                         #sometimes salesforce is slow


End suite
    Set Library Search Order    QWeb                        QForce
    Close All Browsers

Login
    [Documentation]             Login to Salesforce instance
    Set Library Search Order    QWeb                        QForce
    GoTo                        ${login_url}
    TypeText                    Username                    ${username}                 delay=1
    TypeText                    Password                    ${password}
    ClickText                   Log In


Home
    [Documentation]             Navigate to homepage, login if needed
    Set Library Search Order    QWeb                        QForce
    GoTo                        ${home_url}
    ${login_status} =           IsText                      To access this page, you have to log in to Salesforce.    2
    Run Keyword If              ${login_status}             Login
    ClickText                   Home
    VerifyTitle                 Home | Salesforce
    
