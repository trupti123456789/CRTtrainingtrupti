*** Settings ***
Resource            ../resourcefolder/Common.robot
Library             DataDriver                  reader_class=TestDataApi    name=Lead.12.csv  #iterates through the Leads csv
Suite Setup         Setup Browser
Suite Teardown      End suite


*** Test Cases ***
  Appstate        Home
Entering A Lead With Data with     ${Last Name}        ${Company}    ${Lead Currency}  ${Lead Status} 
    [Tags]          AllData

   
    LaunchApp       Sales

    ClickText       Leads
    VerifyText      Recently Viewed             timeout=120s
    ClickText       New
    VerifyText      Lead Information
    UseModal        On                          # Only find fields from open modal dialog


    TypeText        Last Name                   ${Last Name}
    Picklist        Lead Status                 ${Lead Status}
    TypeText        Company                     ${Company}
    PickList        Lead Currency               ${Lead Currency}
    ClickText       Save                        partial_match=False
    UseModal        Off
    Sleep           1

    #Delete the lead to clean up data
    LaunchApp       Sales
    ClickText       Leads
    VerifyText      Recently Viewed             timeout=120s

    ClickText       ${first Name}
    ClickText       Delete
    ClickText       Delete
    VerifyText      Recently Viewed
    VerifyNoText    ${First Name}
    VerifyNoText    ${Last Name}
