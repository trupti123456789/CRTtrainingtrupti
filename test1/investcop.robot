*** Settings ***
Resource                 ../resourcefolder/comon.robot
Suite Setup              Setup Browser
Suite Teardown           End suite

*** Test Cases ***
Create some Test data records for 'PE Team Member' object             
    [tags]               Account                     Git Repo Exercise
    Appstate             Home
    ClickText            PE Team Members
    ClickText            New                         anchor=Import
    PickList             Team Member                 Benjamin Marino
    PickList             Group                       Benelux
    PickList             Default                     Yes
    ClickText            Save                        partial_match=False
    ClickText            PE Team Members
    ClickText            New                         anchor=Import
    PickList             Team Member                 Gustav Granryd
    PickList             Group                       Benelux
    PickList             Default                     No
    ClickText            Save                        partial_match=False
    ClickText            PE Team Members
    ClickText            New                         anchor=Import
    PickList             Team Member                 Owen Li
    PickList             Group                       Benelux
    PickList             Default                     No
    ClickText            Save                        partial_match=False
 Login as 'SSO - PE Europe Platform User' profile user 

    VerifyItem           utility:setup               tag=lightning-icon
    ClickText            Setup                       anchor=Salesforce Help
    ClickText            Setup for current app
    SwitchWindow         NEW
    VerifyText           Setup Home

    ClickText            Setup                       anchor=Salesforce Help
    ClickText            Opens in a new tab
    SwitchWindow         NEW
    SwitchWindow         2
    TypeText             Quick Find                  Profiles
    ClickText            profiles
    ClickText            SSO - PE Europe Platform
    ClickText            View Users
    ClickText            Bersch, Tim
    ClickText            Login
 Create 'CI Account'& 'CIE Contact' records
    ClickText            Accounts
    ClickText            New                         anchor= Discover Companies
    UseModal             On
    TypeText             Account Name                PE_Account1
    ComboBox             Search Accounts...          PEAccountTC
    MultiPickList        Geography                   North America
    ClickText            Move selection to Chosen    anchor=Available
    MultiPickList        Relationship                AD
    ClickText            Move selection to Chosen    anchor=Available
    ClickText            Save                        partial_match=False
    ClickText            Contacts
    ClickText            New                         anchor=Import
    TypeText             First Name                  PE_contact
    TypeText             Last Name                   TC
    ComboBox             Search Accounts...          PE_Account1
    ClickText            Save                        partial_match=False
Create CIE Meeting as Email Recipients field populated.
    ClickText            Contacts
    ClickText            PE_contact TC
    ClickText            New Meeting                 anchor=Delete
    UseModal             On
    PickList             Type                        Call
    PickList             Group                       CIE
    MultiPickList        Email Recipients            Benjamin Marino
    ClickText            Move selection to Chosen    anchor=Available
    MultiPickList        Email Recipients            Gustav Granryd
    ClickText            Move selection to Chosen    anchor=Available
    MultiPickList        Email Recipients            Jose Pfeifer
    ClickText            Move selection to Chosen    anchor=Available
    #picklist            Subject                     Call
    Clicktext            Subject
    ClickText            Email
    ClickText            Save
    VerifyText           Email Recipients
    VerifyText           Geography
    UseModal             Off

Create CIE Meeting as Email Recipients field blank
    ClickText            Contacts
    ClickText            PE_contact TC
    ClickText            New Meeting                 anchor=Delete
    UseModal             On
    PickList             Type                        Call
    PickList             Group                       CIE
    #picklist            Subject                     Call
    Clicktext            Subject
    ClickText            Call
    ClickText            Save
    VerifyText           Email Recipients
    VerifyText           Geography
    UseModal             Off
2 record for 'HF Account' Account                                          
    ClickText            Account
    ClickText            New                         Benelux= anchor= Discover Companies
    UseModal             On
    ClickText            HF AccountHF Account User
    ClickText            Next
    UseModal             On
    TypeText             Account Name                HF_Account2
    ComboBox             Search People...            Chris Mason
    PickList             Investor Type               Bank
    PickList             Billing Country             Armenia
    ClickText            Save                        partial_match=False
    UseModal             Off
record for 'HF Contact' Contact
    ClickText            Contacts
    ClickText            New
    UseModal             On
    ClickText            HF Contact
    ClickText            Next
    ComboBox             Search Accounts...          HF_Account2
    TypeText             First Name                  HF
    TypeText             Last Name                   Contact-2
    TypeText             Email                       trupti2@investcorp.com
    ClickText            Save                        partial_match=False
    UseModal             Off
Test Account with 'CI Account' Record Type
    ClickText            Accounts
    ClickText            New
    UseModal             On
    ClickText            CI AccountCI Account
    ClickText            Next
    TypeText             Account Name                Investcorp [M]
    MultiPickList        Geography                   North America
    ClickText            Move selection to Chosen    anchor=Available
    MultiPickList        Relationship                AD
    ClickText            Move selection to Chosen    anchor=Available
    ClickText            Save                        partial_match=False
    ClickText            Investcorp [M]
    ${href_content}=     GetUrl
    ${url}=              Evaluate                    $href_content.split("/")[6]

    UseModal             Off
Contact on 'Investcorp Employee' Contact Record Type 
    ClickText            Contacts
    ClickText            New
    UseModal             On
    ClickText            Investcorp Employee
    ClickText            Next
    TypeText             Last Name                   InvestcopEmp1
    ComboBox             Search Accounts...          Investcorp [M]
    ClickCheckbox        Investment Team             on
    TypeText             Email                       trupti2@investcorp.com
    ClickText            Save                        partial_match=False
    ClickText            Clone                       anchor=Delete
    TypeText             Email                       trupti3@investcorp.com
    ClickCheckbox        Investment Team             off
    ClickText            Save                        partial_match=False
    ClickText            Clone
    UseModal             On
    TypeText             Email                       trupti4@investcorp.com
    ClickCheckbox        Investment Team             off
    ClickText            Save                        partial_match=False
    UseModal             Off
    ClickText            Setup                       anchor=Salesforce Help
    ClickText            Opens in a new tab
    SwitchWindow         NEW
    SwitchWindow         2
    TypeText             Quick Find                  Custom Labels
    ClickText            Custom Labels
    ClickText            InvestCorp_account_Id
    ClickText            Edit
    ClickText            Value
    TypeText             Value                       ${url}
    ClickText            Save
Login as 'PRMW standard User' profile 
    ClickText            Setup                       anchor=Salesforce Help
    ClickText            Opens in a new tab
    SwitchWindow         NEW
    TypeText             Quick Find                  profile
    ClickText            Profile
    ClickText            P                           partial_match=False
    ClickText            PRMW standard User
    ClickText            View Users
    clicktext            Alarayedh, Loai
    ClickText            Edit
    ClickText            login
create Call Note on account record with Investcorp Attendee 
    ClickText            Accounts
    ClickText            Select a List View
    ClickText            All Accounts
    ClickText            HF_Account1
    ClickText            Call Note
    PickList             Type                        Meeting
    TypeText             Summary General Meeting Notes                           First Meeting
    DropDown             Client Attendee             Contact2 Contact2
    DropDown             Investcorp Attendee
    clicktext            Date
    ClickText            Today
    TypeText             Summary General Meeting Notes                           First Meeting
    ClickText            Save
edit Call Note on account record without Investcorp Attendee 
    ClickText            HF_Account1
    ClickText            Edit Call Note
    PickList             Type                        Meeting
    TypeText             Summary General Meeting Notes                           First Meeting
    DropDown             Client Attendee             Contact2 Contact2
    clicktext            Date
    ClickText            Today
    TypeText             Summary General Meeting Notes                           First Meeting
    ClickText            Save
Edit Call Note' button Remove all B on Call Note Screen 
    ###############

3 Task record should get created with Subject as provided by user
    ClickText            Accounts
    ClickText            HF_Account1
    ClickText            Call Note
    PickList             Type                        Meeting
    TypeText             Summary General Meeting Notes                           First Meeting
    DropDown             Client Attendee             Contact2 Contact2
    clicktext            Date
    ClickText            Today
    TypeText             Summary General Meeting Notes                           First Meeting
    ClickText            Add Opportunities
    DropDown             Product                     General
    ClickText            Save
    TypeText             Target Amount Min ($m)      444
    TypeText             Target Amount Max ($m)      555
    TypeText             Legal Comments              First comments
    ClickText            Save
    ClickText            Activity
    ClickText            SUBJECT                     anchor=Top 10 Activities Added

automated for PE - NA Functionality 
Login as 'SSO - PE NA Platform User' profile user 
    [tags]               PE-NA                       Git Repo Exercise
    ClickText            Setup                       anchor=Salesforce Help
    ClickText            Opens in a new tab
    SwitchWindow         NEW
    SwitchWindow         2
    TypeText             Quick Find                  Profiles
    ClickText            profiles
    ClickText            SSO - PE NA Platform
    ClickText            View Users
    ClickText            Bourchtein, Vitali
    ClickText            Login
    VerifyText           Meeting Added - Last 7 days (3)
    VerifyText           Deals by Status
    VerifyText           Deals by Month
    VerifyText           Deals by Industry
    VerifyText           Deals by Source
    VerifyText           Important Links
    VerifyText           Recent Items (4)
    VerifyText           General Business News(9)
    VerifyText           Home
    VerifyText           Accounts
    VerifyText           Contacts
    VerifyText           Deals
    VerifyText           Portfolio Companies
    ClickText            More
    VerifyText           Conferences
    VerifyText           Reports
    VerifyText           Dashboards
Click Deals Tab     
    clicktext            Deals
    Clicktext            Select a List View
    VerifyText           Active - CINA
    VerifyText           Active - CI TECH
    VerifyText           Active - CIE
    ClickText            Recently Viewed
    ClickText            New
    TypeText             Name                        TestDeal1
    PickList             Industry                    Industrial Services
    PickList             HQ State/Province           Alabama
    TypeText             HQ City                     hyderabad
    TypeText             Description                 Testcase1
    TypeText             Revenue                     500000
    TypeText             Equity Size                 200
    ClickText            Date Received
    ClickText            Today
    ClickText            Save                        partial_match=False
    VerifyText           Details
    VerifyText           Related
    clicktext            Related
    VerifyText           Activity History (0)        anchor=View All
    VerifyText           Edit
    VerifyText           Delete
    VerifyText           Clone
    ClickText            Show more actions
    VerifyText           Sharing
Click on Portfolio Companies Tab
    clicktext            Portfolio Companies
    ClickText            New
    UseModal             On
    ClickText            CINA Portfolio CompanyCINA Portfolio Company
    ClickText            CIE Portfolio CompanyCIE Portfolio Company
    ClickText            Next
    TypeText             Name                        TestPortfolioCompanies1
    PickList             Industry                    Energy
    PickList             HQ Region                   UK
    TypeText             HQ City                     hyderabad
    ClickText            Save                        partial_match=False
    VerifyText           Details
    ClickText            More                        anchor=Portfolio Bankers
    VerifyText           Related
    ClickText            Related
    VerifyText           Activity History (0)        anchor=View All
    VerifyText           Edit
    VerifyText           Delete
    VerifyText           Clone
    ClickText            Show more actions
    VerifyText           Sharing
Duplicate Rule: Contact Unique First Name Last Name and Mobile or Phone or Email 
    [tags]               CI Functionality            Git Repo Exercise
    ClickText            Contacts
    ClickText            New
    UseModal             On
    ClickText            CI ContactCI: Use this for most contacts (just track contact/address information)
    ClickText            Next
    TypeText             First Name                  TestCI
    TypeText             Last Name                   CIfunction
    ComboBox             Search Accounts...          TestAccount
    TypeText             Email                       trupti@investcorp.com
    TypeText             Phone 1                     56788877
    ClickText            Save                        partial_match=False
    UseModal             Off
    ClickText            Contacts
    ClickText            New
    UseModal             On
    ClickText            CI ContactCI: Use this for most contacts (just track contact/address information)
    ClickText            Next
    TypeText             First Name                  TestCI
    TypeText             Last Name                   CIfunction
    ComboBox             Search Accounts...          TestAccount
    TypeText             Email                       trupti@investcorp.com
    TypeText             Phone 1                     56788877
    ClickText            Save                        partial_match=False
    ClickText            Save                        partial_match=False
    ClickText            View Duplicates
    ClickText            Close this window           anchor=Close error dialog
    UseModal             Off
Login as a ‘IRMW US Sales Team' Role user (user who doesn’t own the Account) & try to change Account's Name
    ClickText            Setup                       anchor=Salesforce Help
    ClickText            Opens in a new tab
    SwitchWindow         NEW
    SwitchWindow         2
    TypeText             Quick Find                  Profiles
    ClickText            profiles
    ClickText            PRMW Standard User
    ClickText            View Users
    ClickText            Alarayedh, Loai
    ClickText            Login
    ClickText            Accounts
    ClickText            New                         anchor= Discover Companies
    UseModal             On
    TypeText             Account Name                test123
    PickList             Investor Type               Bank
    ComboBox             Search People...            Loai Alarayedh
    PickList             Billing Country             Afghanistan
    ClickText            Save                        partial_match=False
    ${href_content1}=    GetUrl
    ClickText            Log out as Loai Alarayedh
    GoTo                 ${login_url}
    TypeText             Username                    ${username}
    TypeText             Password                    ${password}
    ClickText            Log In to Sandbox
    ClickText            Setup                       anchor=Salesforce Help
    ClickText            Opens in a new tab
    SwitchWindow         NEW
    SwitchWindow         2
    TypeText             Quick Find                  Profiles
    ClickText            profiles
    ClickText            PRMW Standard User
    ClickText            View Users
    ClickText            Callahan, Michael
    ClickText            Login
    ClickText            Accounts
    ClickText            Select a List View
    ClickText            All Accounts
    ${url1} =            Evaluate                    $href_content1.split("/")[6]
    ${fullID}=           Catenate                   ${URL}                 ${url1}
    GoTo                 ${fullID}
    ClickText            Edit
    TypeText             Account Name                test1
    ClickText            Save                        partial_match=False
    ClickText            RMs are not allowed to change Account name.
    ClickText            Cancel
