*** Settings ***
Resource             ../resourcefolder/comon.robot
Suite Setup          Setup Browser
Suite Teardown       End suite

*** Test Cases ***
Create some Test data records for 'PE Team Member' object             
    [tags]           Account                     Git Repo Exercise
    Appstate         Home
    #ClickText       Setup                       anchor=Salesforce Help
    #ClickText       Opens in a new tab
    #SwitchWindow    NEW
    # SwitchWindow                               2
    # ClickText      App Launcher
    #TypeText        Quick Find                  PE-Europe
    # ClickText      PE-Europe
    ClickText        PE Team Members
    ClickText        New                         anchor=Import
    PickList         Team Member                 Benjamin Marino
    PickList         Group                       Benelux
    PickList         Default                     Yes
    ClickText        Save                        partial_match=False
    ClickText        New                         anchor=Import
    PickList         Team Member                 Gustav Granryd
    PickList         Group                       Benelux
    PickList         Default                     No
    ClickText        Save                        partial_match=False
    ClickText        New                         anchor=Import
    PickList         Team Member                 Owen Li
    PickList         Group                       Benelux
    PickList         Default                     No
    ClickText        Save                        partial_match=False
 Login as 'SSO - PE Europe Platform User’ profile user 

    VerifyItem       utility:setup               tag=lightning-icon
    ClickText        Setup                       anchor=Salesforce Help
    ClickText        Setup for current app
    SwitchWindow     NEW
    VerifyText       Setup Home

    ClickText        Setup                       anchor=Salesforce Help
    ClickText        Opens in a new tab
    SwitchWindow     NEW
    SwitchWindow     2
    TypeText         Quick Find                  Profile
    ClickText        profile
    ClickText        SSO - PE Europe Platform
    ClickText        View Users
    ClickText        Bersch, Tim
    ClickText        Login
 Create 'CI Account'& 'CIE Contact' records
    ClickText        Accounts
    ClickText        New                         anchor= Discover Companies
    UseModal         On
    TypeText         Account Name                PE_Account1
    ComboBox         Search Accounts...          PEAccountTC
    MultiPickList    Geography                   North America
    ClickText        Move selection to Chosen    anchor=Available
    MultiPickList    Relationship                AD
    ClickText        Move selection to Chosen    anchor=Available
    ClickText        Save                        partial_match=False
    ClickText        Contacts
    ClickText        New                         anchor=Import
    TypeText         First Name                  PE_contact
    TypeText         Last Name                   TC
    ComboBox         Search Accounts...          PE_Account1
    ClickText        Save                        partial_match=False
Create CIE Meeting as Email Recipients field populated.
    ClickText        PE_contact TC
    ClickText        New Meeting                 anchor=Delete
    UseModal         On
    PickList         Type                        Call
    PickList         Group                       CIE
    MultiPickList    Email Recipients            Benjamin Marino
    ClickText        Move selection to Chosen    anchor=Available
    MultiPickList    Email Recipients            Gustav Granryd
    ClickText        Move selection to Chosen    anchor=Available
    MultiPickList    Email Recipients            Jose Pfeifer
    ClickText        Move selection to Chosen    anchor=Available
    ClickText        Save
    UseModal         Off
Create CIE Meeting as Email Recipients field blank
    ClickText        New Meeting                 anchor=Delete
    UseModal         On
    PickList         Type                        Call
    PickList         Group                       CIE
    ClickText        Save
    UseModal         Off

