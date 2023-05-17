*** Settings ***
Resource                      ../resourcefolder/commonaccountexcel.robot
Library                       DataDriver    reader_class=TestDataApi    name=Lead.csv    #iterates through the Leads csv
Suite Setup                   Setup Browser
Suite Teardown                End suite
Test Template                 Entering A Lead With Data
Library                        QForce
*** Test Cases ***
reading a account With Data with  ${Account_Name}   ${Sales_Owner}    ${Phone}    ${Company}    ${Website}
    [Tags]                    AllData

*** Keywords ***
Entering A Lead With Data
    [Arguments]               ${Account_Name}   ${Sales_Owner}     ${Phone}    ${Type}    ${Industry}    ${Employees}    ${Annual_Revenue}
    [tags]                   Account
    Home
    LaunchApp                 Sales

    ClickText                 Account
    TypeText                  First Name                  ${First Name}
    TypeText                  Last Name                   ${Last Name}
    Picklist                  Lead Status                 Working
    TypeText                  Phone                       ${Phone}                    First Name
    TypeText                  Company                     ${Company}                  Last Name
    TypeText                  Website                     ${Website}

    ClickText                 Lead Source
    ClickText                 Advertisement
    ClickText                 Save                        partial_match=False
    UseModal                  Off
    Sleep                     1

    #Delete the lead to clean up data
    LaunchApp                 Sales
    ClickText                 Leads
    VerifyText                Recently Viewed             timeout=120s

    ClickText                 ${first Name}
    ClickText                 Delete
    ClickText                 Delete
    VerifyText                Recently Viewed
    VerifyNoText              ${First Name}
    VerifyNoText              ${Last Name}