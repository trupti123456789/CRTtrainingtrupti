*** Settings ***
Resource             ../Resources/Common.robot
Suite Setup          Setup Browser
Suite Teardown       End suite


*** Test Cases ***
As a User I Should able to create custom metadata type to synch pipeline repository with the respective git repository.
    Appstate         Home
    VerifyText       More       
    VerifyIcon       Setup                   
    ClickText        Setup                       anchor=Salesforce Help
    ClickText        Opens in a new tab
    SwitchWindow     NEW
    SwitchWindow     2

    ClickText        Quick Find
    TypeText         Quick Find                  Custom Metadata Type
    ClickText         Custom Metadata Type
    ClickText        Manage Records              anchor=Copado Utility Configuration
    ClickText        New
    TypeText         Label                       Production Status
    TypeText         Value                       Draft
    ClickText        Save

As a User I should able to do cleanup of unused data from 3 months in your org(Soft Delete) 
    ClickText        App Launcher

    ClickText        View All                    parent=LIGHTNING-BUTTON
    UseModal         On
    ClickText        CloudFulcrum Extensions for Copado


    ClickText        Copado Cleanup Utilities    anchor=App Launcher
    ClickText        Record Cleanup
    ClickCheckbox    Copado User Story           on
    ClickText        3 Months
    ClickText        Run Now
    ClickText        Next
    ClickText        Okay
    UseTable         Select All
    ClickCell        r2c2                        on
    ClickCell        r3c2                        on
    ClickCell        r4c2                        on                          
    ClickText        Next
    ClickText        Recycle Bin
    ClickText        Ok
    ClickText        AuditLog
    VerifyText       Recently Viewed             timeout=120s
    ClickText        Recently Viewed
    UseModal         On
    ClickText        All
    ClickCell        r1c2
    VerifyText       Soft Deleted
As a User I should able to do cleanup of unused data from 3 months in your org(Hard Delete)
    ClickText        Getting Started
    ClickText        Copado Cleanup Utilities    anchor=App Launcher
    ClickText        Record Cleanup
    ClickCheckbox    Copado User Story           on
    ClickText        3 Months
    ClickText        Run Now
    ClickText        Next
    ClickCell        r2c2                        on
    ClickCell        r3c2                        on
    ClickCell        r4c2                        on                          on
    ClickText        Next
    ClickText        Permanently Deleted
    ClickText        Ok
    ClickText        AuditLog
    VerifyText       Recently Viewed             timeout=120s
    ClickText        Recently Viewed
    UseModal         On
    ClickText        All
    ClickCell        r1c2
    VerifyText       Hard Deleted

As a user I should able to Archive some of the records by 3 Months as a retention window.
    ClickText        Getting Started
    ClickText        Copado Cleanup Utilities    anchor=App Launcher
    ClickText        Archival Records
    ClickText        3 Months
    ClickText        Run Now
    ClickText        Next
    ClickCheckbox    Copado User Story           on
    ClickText        Okay
    UseTable         Select All
    ClickCheckbox    r1c2                        on
    #Clickitem       Checkbox                    anchor=Index 1 tag=input
    ClickCell        r2c2                        on
    ClickCell        r3c2                        on
    ClickCell        r4c2                        on
    ClickText        Next
    ClickText        Archieved
    ClickText        Ok

As a user I should able to see Devops Maturity Report.
    ClickText        Devops Maturity Report
    ClickText        View Report (Success Ratio by week per month)

As a user I should able to cleanup Git Branches Unused Records from 3 months of Branch type user story.
    ClickText        Getting Started
    ClickText        Copado Cleanup Utilities    anchor=App Launcher
    ClickText        Git Branches
    ComboBox         Git Repository              Copado-Training
    TypeText         API Key                     736e5f6e93cb78c393253938eecb251a
    TypeText         Server URL                  https://app-api.copado.com
    ClickText        User Story                  anchor=Branch Type
    ClickText        3 Months                    anchor=Retention Window
    ClickText        Run Now                     anchor=Execute
    ClickCell        r2c2                        on
    ClickCell        r3c2                        on
    ClickCell        r4c2                        on
    ClickText        Next
    ClickText        Delete

As a user I should able to cleanup Git Branches Unused Records from 3 months of Branch type Promotion branch.
    ClickText        Getting Started
    ClickText        Copado Cleanup Utilities    anchor=App Launcher
    ClickText        Git Branches
    ComboBox         Git Repository              Copado-Training
    TypeText         API Key                     736e5f6e93cb78c393253938eecb251a
    TypeText         Server URL                  https://app-api.copado.com
    ClickText        Promotion Branch            anchor=Branch Type
    ClickText        3 Months                    anchor=Retention Window
    ClickText        Run Now                     anchor=Execute
    ClickCell        r2c2                        on
    ClickCell        r3c2                        on
    ClickCell        r4c2                        on
    ClickText        Delete
----------------------------------------------------------------------------------------------
*** Settings ***
Library                   QWeb
Library                   QForce
Library                   String
Suite Setup        OpenBrowser    about:blank    chrome

*** Variables ***
${username}               YOUR USERNAME HERE
${login_url}              https://YOURDOMAIN.my.salesforce.com          # Salesforce instance. NOTE: Should be overwritten in CRT variables
${home_url}               ${login_url}/lightning/page/home


*** Keywords ***
Setup Browser
    Set Library Search Order                          QWeb                   QForce
    Open Browser          about:blank                 ${BROWSER}
    SetConfig             LineBreak                   ${EMPTY}               #\ue000
    SetConfig             DefaultTimeout              20s                    #sometimes salesforce is slow


End suite
    Set Library Search Order                          QWeb                   QForce
    Close All Browsers


Login
    [Documentation]       Login to Salesforce instance
    Set Library Search Order                          QWeb                   QForce
    GoTo                  ${login_url}
    TypeText              Username                    ${username}             delay=1
    TypeText              Password                    ${password}
    ClickText             Log In

    
Home
    [Documentation]       Navigate to homepage, login if needed
    Set Library Search Order                          QWeb                   QForce
    GoTo                  ${home_url}
    ${login_status} =     IsText                      To access this page, you have to log in to Salesforce.    2
    Run Keyword If        ${login_status}             Login
    ClickText             App Launcher
    ClickText            Sales
    ClickText            Home
    VerifyTitle           Home 
    













