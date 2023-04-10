*** Settings ***
Resource          ../Resources/common.robot
Suite Setup       Setup Browser
Suite Teardown    End suite

*** Test Cases ***
hierarchy on already created account
    [tags]        Account                     Git Repo Exercise
    Appstate      Home
    ClickText     Account
    VerifyText    Recently Viewed
    ClickText     trA
    Clicktext     Details                     Anchor=Related
    ClickText     Edit Parent Account
    ComboBox      Search Accounts...          tr1
    clicktext     Save
    ClickText     Account
    VerifyText    Recently Viewed
    ClickText     tr1
    Clicktext     Details                     Anchor=Related
    ClickText     Edit Parent Account
    ComboBox      Search Accounts...          tr2
    clicktext     Save
    ClickText     Account
    VerifyText    Recently Viewed
    ClickText     tr2
    Clicktext     Details                     Anchor=Related
    ClickText     Edit Parent Account
    ComboBox      Search Accounts...          tr3
    clicktext     Save
    ClickText     Account
    VerifyText    Recently Viewed
    ClickText     t3
    Clicktext     Details                     Anchor=Related
    ClickText     Edit Parent Account
    ComboBox      Search Accounts...          tr4
    clicktext     Save
    ClickText     Account
    VerifyText    Recently Viewed
    ClickText     tr4
    VerifyText    tr4                         Anchor=Account
    ClickText     View Account Hierarchy
    ClickText     Expand                      tr3
    ClickText     Expand                      tr2
    ClickText     Expand                      tr1

hierarchy on creat
    [tags]        Account                     Git Repo Exercise
    Appstate      Home
    ClickText     Account
    ClickText     New                         Anchor=Import
    UseModal      on
    ClickText     Account Name
    TypeText      Account Name                thyy
    PickList      Sales Owner                 Shalini
    PickList      Industry                    Banking
    ClickText     Save
    useModal      Off
    ClickText     Cancel
    ClickText     Account
    ClickText     New                         Anchor=Import
    UseModal      on
    ClickText     Account Name
    TypeText      Account Name                thyy1
    PickList      Sales Owner                 Shalini
    PickList      Industry                    Banking
    ClickText     Save
    useModal      Off
    ClickText     Cancel
 assigning Parent
    ClickText    Account 
    VerifyText    Recently Viewed
     ClickText    thyy  
     clicktext    Details    Anchor=Related
     ClickText     Edit Parent Account
     ComboBox     Search Accounts...    trA
     ClickText    Save
     ClickText    Account 
    VerifyText    Recently Viewed
     ClickText    thyy1  
     clicktext    Details    Anchor=Related
     ClickText     Edit Parent Account
     ComboBox     Search Accounts...    trA
     ClickText    Save
     




