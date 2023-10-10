*** Settings ***
Resource          ../resourcefolder/Common.robot
Library           DataDriver                  reader_class=TestDataApi    name=Lead.12.csv    #iterates through the Leads csv
Test Template                 Entering A Lead With Data




*** Test Cases ***
    Appstate      Home
Entering A Lead With Data with     ${Last Name}        ${Company}     ${Lead Status} 
    [Tags]        AllData123
    *** Keywords ***
Entering A Lead With Data
    [Arguments]               ${Last Name}        ${Company}     ${Lead Status} 


    LaunchApp     Sales

    ClickText     Leads
    VerifyText    Recently Viewed             timeout=120s
    ClickText     New
    VerifyText    Lead Information
    UseModal      On                          # Only find fields from open modal dialog


    TypeText      Last Name                   ${Last Name}
    Picklist      Lead Status                 ${Lead Status}
    TypeText      Company                     ${Company}
    ClickText     Save                        partial_match=False
    UseModal      Off
    Sleep         1

    #verifyind data
    Clicktext     Details
    VerifyText    Name
    VerifyText    Company
    VerifyText    Lead Status

    #converted the lead
    ClickText     Converted
    ClickText     Select Converted Status
    UseModal      On
    ClickText     Convert                     partial_match=False
    UseModal      Off
    UseModal      On
    UseModal      Off
    ClickText     Go to Leads

