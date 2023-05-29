*** Settings ***

Resource                ../resourcefolder/comon.robot
Library                 QWeb
Library                 QForce
Suite Setup             Open Browser                about:blank                 chrome
Suite Teardown          Close All Browsers


*** Test Cases ***
    #Test Cases for PE - Europe Functionality
    #Simple Test Cases
Test Case1: Test user login from Web

    Appstate            Home
    VerifyText          PE- Europe
    VerifyItem          utility:setup               tag=lightning-icon
    ClickText           Setup                       anchor=View profile
    ClickText           Setup for current app
    SwitchWindow        NEW
    VerifyText          Setup Home
    TypeText            Quick Find                  Profiles

    ClickText           Profiles
    ClickText           S                           partial_match=False
    ClickText           SSO - PE Europe Platform User
    ClickText           View Users                  anchor=Delete
    ClickText           Login                       anchor=Bersch, Tim
    VerifyText          Meeting Added - Last 7 days (10)
    VerifyText          Deals By Status
    VerifyText          Deals By Region
    VerifyText          Deals By Industry
    VerifyText          Important Links
    VerifyText          Recent Items
    VerifyText          Home
    VerifyText          Account
    VerifyText          Contact
    VerifyText          Deals
    VerifyText          Portfolio Companies
    VerifyText          Conferences
    VerifyText          Reports
    ClickText           More
    VerifyText          Dashboards

TestCase2: Dashboards Tab
    Appstate            Home
    VerifyText          PE- Europe
    VerifyItem          utility:setup               tag=lightning-icon
    ClickText           Setup                       anchor=View profile
    ClickText           Setup for current app
    SwitchWindow        NEW
    VerifyText          Setup Home
    TypeText            Quick Find                  Profiles

    ClickText           Profiles
    ClickText           S                           partial_match=False
    ClickText           SSO - PE Europe Platform User
    ClickText           View Users                  anchor=Delete
    ClickText           Login                       anchor=Bersch, Tim
    VerifyText          More                        anchor=Reports
    ClickText           More
    VerifyText          Dashboards
    ClickText           Dashboards
    ClickText           All Folders
    VerifyText          Name                        anchor=Created By
    ClickText           All Dashboards
    VerifyText          Dashboard Name              anchor=Description

TestCase3: Reports Tab 
    Appstate            Home
    VerifyText          PE- Europe
    VerifyItem          utility:setup               tag=lightning-icon
    ClickText           Setup                       anchor=View profile
    ClickText           Setup for current app
    SwitchWindow        NEW
    VerifyText          Setup Home
    TypeText            Quick Find                  Profiles

    ClickText           Profiles
    ClickText           S                           partial_match=False
    ClickText           SSO - PE Europe Platform User
    ClickText           View Users                  anchor=Delete
    ClickText           Login                       anchor=Bersch, Tim
    VerifyText          More                        anchor=Reports
    ClickText           More
    VerifyText          Reports
    ClickText           Reports
    ClickText           All Folders
    VerifyText          Name                        anchor=Created By
    ClickText           All Reports
    VerifyText          Report Name                 anchor=Description

    #Medium difficulty Test Cases
    #Test Cases for CI Functionality:
TestCase1: Duplicate Rule: Contact Unique Email and Phone
    Appstate            Home
    VerifyText          PE- Europe
    ClickText           Contacts
    VerifyText          Recently Viewed             timeout=120s
    ClickText           New
    ClickText           CI Contact
    ClickText           Next
    VerifyText          Contact Information
    UseModal            On                          # Only find fields from open modal dialog
    PickList            Title                       Ms.
    TypeText            First Name                  Tina
    TypeText            Last Name                   Smith
    ClickText           Account Name
    ClickText           New Account
    ClickText           CI Account
    ClickText           Next
    TypeText            Account Name                Growmore
    PickList            Billing Country             Austria  
    MultiPickList       Relationship                AT    timeout=20sec
    ClickText           Move selection to Chosen    anchor=Available
    sleep               10
    MultiPickList       Geography                   Europe
    ClickText           Move selection to Chosen    anchor=Available
    ClickText           Save                        anchor=Account Information
    TypeText            Phone 1                     +1234567890
    TypeText            Email                       tina.smith@gmail.com
    ClickText           Save                
    UseModal            Off
    Sleep               2


    ClickText           Contacts
    VerifyText          Recently Viewed             timeout=120s
    ClickText           New
    ClickText           CI Contact
    ClickText           Next
    VerifyText          Contact Information
    UseModal            On                          # Only find fields from open modal dialog
    PickList            Title                       Ms.
    TypeText            First Name                  John
    TypeText            Last Name                   Sinha
    ComboBox            Account Name                Growmore
    TypeText            Phone 1                     +1234567890
    TypeText            Email                       tina.smith@gmail.com
    ClickText           View Duplicates
    UseModal            On
    VerifyPageHeader    Tina Smith
    ClickText           mteeg
    VerifyPageHeader    tina.smith@gmail.com
    VerifyText          +1234567890
    ClickText           Close this window           anchor=Close error dialog
    UseModal            Off
    ClickText           Cancel
    
TestCase2: Login as a 'IRMW US Sales Team' Role user or 'IRMW Europe Sales Team' Role user (user who doesn't own the Account) & try to change Account's Name
    Appstate            Home
    VerifyText          PE- Europe
    VerifyItem          utility:setup               tag=lightning-icon
    ClickText           Setup                       anchor=Salesforce Help
    ClickText           Setup for current app
    SwitchWindow        NEW
    VerifyText          Setup Home
    ComboBox            Quick Find                  Users
    ClickText           Users                       anchor=User Interface
    
    

























