*** Settings ***
Resource            ../resourcefolder/comon.robot
Suite Setup         Setup Browser
Suite Teardown      End suite

*** Test Cases ***
create Case(new)
    [tags]          Account                     Git Repo Exercise
    Appstate        Home
    ClickText       Setup                       anchor=Salesforce Help
    ClickText       Opens in a new tab
    SwitchWindow    NEW
    SwitchWindow    2
    ClickText       App Launcher
    TypeText        Quick Find                  PE-Europe
    ClickText       PE-Europe
    ClickText       PE Team Members
    ClickText       New                         anchor=Import
    PickList        Team Member                 Benjamin Marino
    PickList        Group                       Benelux
    PickList        Default                     Yes
    ClickText       Save
    ClickText       New                         anchor=Import
    PickList        Team Member                 Gustav Granryd
    PickList        Group                       Benelux
    PickList        Default                     No
    ClickText       Save
    ClickText       New                         anchor=Import
    PickList        Team Member                 Owen Li
    PickList        Group                       Benelux
    PickList        Default                     No
    ClickText       Save





