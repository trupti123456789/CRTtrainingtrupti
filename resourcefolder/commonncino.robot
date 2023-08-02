*** Settings ***
Library                   QForce
Library                   String


*** Variables ***
# IMPORTANT: Please read the readme.txt to understand needed variables and how to handle them!!
${BROWSER}                chrome
${home_url}               ${login_url}/lightning/page/home


*** Keywords ***
Setup Browser
    # Setting search order is not really needed here, but given as an example 
    # if you need to use multiple libraries containing keywords with duplicate names
    Set Library Search Order                          QForce
    Open Browser          about:blank                 ${BROWSER}
    SetConfig             LineBreak                   ${EMPTY}               #\ue000
    SetConfig             DefaultTimeout              20s                    #sometimes salesforce is slow


End suite
    Close All Browsers


Login
    [Documentation]       Login to Salesforce instance
    GoTo                  ${login_url}
    TypeText              Username                    ${username}             delay=1
    TypeText              Password                    ${password}
    ClickText             Log In
    # We'll check if variable ${secret} is given. If yes, fill the MFA dialog.
    # If not, MFA is not expected.
    # ${secret} is ${None} unless specifically given.
    ${MFA_needed}=       Run Keyword And Return Status          Should Not Be Equal    ${None}       ${secret}
    Run Keyword If       ${MFA_needed}               Fill MFA
  

Fill MFA
    ${mfa_code}=         GetOTP    ${username}   ${secret}   ${login_url}    
    TypeSecret           Verification Code       ${mfa_code}      
    ClickText            Verify 


Home
    [Documentation]       Navigate to homepage, login if needed
    GoTo                  ${home_url}
    ${login_status} =     IsText                      To access this page, you have to log in to Salesforce.    2
    Run Keyword If        ${login_status}             Login
    ClickText             Home
    VerifyTitle           Home | Salesforce

Relationships
    [Documentation]        Custom appstate to go directly to nCino / Relationships
    Home
    LaunchApp              nCino LOS
    VerifyText             Welcome to nCino
    ClickText              Relationships
    VerifyPageHeader       Relationships


Loans
    [Documentation]        Custom appstate to go directly to nCino / Relationships
    Home
    LaunchApp              nCino LOS
    VerifyText             Welcome to nCino
    ClickText              Loans
    VerifyPageHeader       Loans


Verify nCino Value
    [Documentation]       Verifies values from nCino views based on label
    [Arguments]           ${label}                     ${value}
    # handles two different custom components
    ${text}=              GetText     //label[text()\="${label}"]/ancestor::nc-field-label-template/following-sibling::nc-read-only-field-template|//label[text()\="${label}"]/ancestor::nds-label/following-sibling::div
    Should Be Equal As Strings        ${text}          ${value}


nCino Dropdown
    [Documentation]       Selects a value from nCino custom "dropdown"
    [Arguments]           ${label}                     ${value}
    VerifyText            ${label}
    ${id}=                GetAttribute    //nds-label/label[text()\="${label}"]     for
    ClickElement          //*[@id\="${id}" and @role\="combobox"]
    ClickText             ${value}        anchor=${label}  

# Example of custom keyword with robot fw syntax
VerifyStage
    [Documentation]       Verifies that stage given in ${text} is at ${selected} state; either selected (true) or not selected (false)
    [Arguments]           ${text}                     ${selected}=true
    VerifyElement         //a[@title\="${text}" and @aria-checked\="${selected}"]


NoData
    VerifyNoText          ${data}                     timeout=3                        delay=2


DeleteRelationship
    [Documentation]       RunBlock to remove all data until it doesn't exist anymore
    ClickText             Show Actions    anchor=${data}
    ClickText             Delete
    VerifyText            Are you sure you want to delete this relationship?
    ClickText             Delete                      anchor=Cancel
    VerifyText            Undo
    VerifyNoText          Undo
    ClickText             Relationships                    partial_match=False




