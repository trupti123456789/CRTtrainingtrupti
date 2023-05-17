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

*** Test Case ***
     Appstate        Home
     clicktext       Account
     VerifyText     ${Account_Name}
     VerifyText    ${Sales_Owner}
     VerifyText    ${Phone}
     VerifyText    ${Type}
     VerifyText    ${Industry}
     VerifyText    ${Employees} 
     VerifyText     ${Annual_Revenue}