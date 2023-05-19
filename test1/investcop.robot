*** Settings ***
Resource          ../resourcefolder/comon.robot
Suite Setup       Setup Browser
Suite Teardown    End suite

*** Test Cases ***
create Case(new)
    [tags]        Account                        Git Repo Exercise
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