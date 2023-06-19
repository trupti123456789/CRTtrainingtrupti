*** Settings ***
Resource           ../resourcefolder/commonaccountexel.robot
Library            DataDriver                  reader_class=TestDataApi    name=accountexcelmultipl.xlsx                           #iterates through the Leads csv
Suite Setup       Setup Browser
Suite Teardown     End suite
Test Template      Reading account field
Library            QForce

*** Test Cases ***
reading an account With Data with  ${Account_Name}   ${Sales_Owner}    ${Phone}    ${Company}    ${Website}
    [Tags]         AllData

*** Keywords ***
REading an account With Data
    [Arguments]    ${Account_Name}             ${Sales_Owner}              ${Phone}                    ${Type}                     ${Industry}    ${Employees}    ${Annual_Revenue}
    [tags]         Account
    LaunchApp      Sales

*** Test Case ***
    Appstate       Home
    ClickText    App Launcher
    LaunchApp    Sales
    ClickText    Accounts
    clicktext      ${Account Name}
    clicktext      Details
    VerifyText     ${Account Name}             anchor=Fax
    VerifyText     ${Sales Owner}
    VerifyText     ${Phone}                    anchor= Fax
    VerifyText     ${Type}
    VerifyText     ${Industry}                 Anchor=Type
    VerifyText     ${Employees}
    VerifyText     ${Annual Revenue}
