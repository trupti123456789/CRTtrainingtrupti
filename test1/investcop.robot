*** Settings ***
Resource                   ../resourcefolder/comon.robot
Suite Setup                Setup Browser
Suite Teardown             End suite

*** Test Cases ***
Create some Test data records for 'PE Team Member' object             
    [tags]                 Account                     Git Repo Exercise
    Appstate               Home
    ClickText              PE Team Members
    ClickText              New                         anchor=Import
    PickList               Team Member                 Benjamin Marino
    PickList               Group                       Benelux
    PickList               Default                     Yes
    ClickText              Save                        partial_match=False
    ClickText              PE Team Members
    ClickText              New                         anchor=Import
    PickList               Team Member                 Gustav Granryd
    PickList               Group                       Benelux
    PickList               Default                     No
    ClickText              Save                        partial_match=False
    ClickText              PE Team Members
    ClickText              New                         anchor=Import
    PickList               Team Member                 Owen Li
    PickList               Group                       Benelux
    PickList               Default                     No
    ClickText              Save                        partial_match=False
 Login as 'SSO - PE Europe Platform User' profile user 

    VerifyItem             utility:setup               tag=lightning-icon
    ClickText              Setup                       anchor=Salesforce Help
    ClickText              Setup for current app
    SwitchWindow           NEW
    VerifyText             Setup Home

    ClickText              Setup                       anchor=
    ClickText              Opens in a new tab
    SwitchWindow           NEW
    SwitchWindow           2
    TypeText               Quick Find                  Profile
    ClickText              profile
    ClickText              SSO - PE Europe Platform
    ClickText              View Users
    ClickText              Bersch, Tim
    ClickText              Login
 Create 'CI Account'& 'CIE Contact' records
    ClickText              Accounts
    ClickText              New                         anchor= Discover Companies
    UseModal               On
    TypeText               Account Name                PE_Account1
    ComboBox               Search Accounts...          PEAccountTC
    MultiPickList          Geography                   North America
    ClickText              Move selection to Chosen    anchor=Available
    MultiPickList          Relationship                AD
    ClickText              Move selection to Chosen    anchor=Available
    ClickText              Save                        partial_match=False
    ClickText              Contacts
    ClickText              New                         anchor=Import
    TypeText               First Name                  PE_contact
    TypeText               Last Name                   TC
    ComboBox               Search Accounts...          PE_Account1
    ClickText              Save                        partial_match=False
Create CIE Meeting as Email Recipients field populated.
    ClickText              PE_contact TC
    ClickText              New Meeting                 anchor=Delete
    UseModal               On
    PickList               Type                        Call
    PickList               Group                       CIE
    MultiPickList          Email Recipients            Benjamin Marino
    ClickText              Move selection to Chosen    anchor=Available
    MultiPickList          Email Recipients            Gustav Granryd
    ClickText              Move selection to Chosen    anchor=Available
    MultiPickList          Email Recipients            Jose Pfeifer
    ClickText              Move selection to Chosen    anchor=Available
    ClickText              Save
    UseModal               Off
Create CIE Meeting as Email Recipients field blank
    ClickText              New Meeting                 anchor=Delete
    UseModal               On
    PickList               Type                        Call
    PickList               Group                       CIE
    ClickText              Save
    UseModal               Off
2 record for 'HF Account' Account                                          
    ClickText              Account
    ClickText              New                         Benelux= anchor= Discover Companies
    UseModal               On
    ClickText              HF AccountHF Account User
    ClickText              Next
    UseModal               On
    TypeText               Account Name                HF_Account2
    ComboBox               Search People...            Chris Mason
    PickList               Investor Type               Bank
    PickList               Billing Country             Armenia
    ClickText              Save                        partial_match=False
    UseModal               Off
record for 'HF Contact' Contact
    ClickText              Contacts
    ClickText              New
    UseModal               On
    ClickText              HF Contact
    ClickText              Next
    ComboBox               Search Accounts...          HF_Account2
    TypeText               First Name                  HF
    TypeText               Last Name                   Contact-2
    TypeText               Email                       trupti2@investcorp.com
    ClickText              Save                        partial_match=False
    UseModal               Off
Test Account with 'CI Account' Record Type
    ClickText              Accounts
    ClickText              New
    UseModal               On
    ClickText              CI AccountCI Account
    ClickText              Next
    TypeText               Account Name                Investcorp [M]
    MultiPickList          Geography                   North America
    ClickText              Move selection to Chosen    anchor=Available
    MultiPickList          Relationship                AD
    ClickText              Move selection to Chosen    anchor=Available
    ClickText              Save                        partial_match=False
    ClickText              Investcorp [M]
     ${href_content}=       GetUrl
    ${url}=                Evaluate                    $href_content.split("/")[6]
     
    UseModal               Off
Contact on 'Investcorp Employee' Contact Record Type 
    ClickText              Contacts
    ClickText              New
    UseModal               On
    ClickText              Investcorp Employee
    ClickText              Next
    TypeText               Last Name                   InvestcopEmp1
    ComboBox               Search Accounts...          Investcorp [M]
    ClickCheckbox          Investment Team             on
    TypeText               Email                       trupti2@investcorp.com
    ClickText              Save                        partial_match=False
    ClickText              Clone                       anchor=Delete
    TypeText               Email                       trupti3@investcorp.com
    ClickCheckbox          Investment Team             off
    ClickText              Save                        partial_match=False
    ClickText              Clone
    UseModal               On
    TypeText               Email                       trupti4@investcorp.com
    ClickCheckbox          Investment Team             off
    ClickText              Save                        partial_match=False
    UseModal               Off
    ClickText              Setup                       anchor=Salesforce Help
    ClickText              Opens in a new tab
    SwitchWindow           NEW
    SwitchWindow           2
    TypeText               Quick Find                  Custom Labels
    ClickText              Custom Labels
    ClickText              InvestCorp_account_Id
    ClickText              Edit
    ClickText              Value
    TypeText               Value                       ${url}
    ClickText              Save
Login as 'PRMW standard User' profile 
    ClickText              Setup                       anchor=Salesforce Help
    ClickText              Opens in a new tab
    SwitchWindow           NEW
    TypeText               Quick Find                  profile
    ClickText              Profile
    ClickText              P                           partial_match=False
    ClickText              PRMW standard User
    ClickText              View Users
    clicktext              Alarayedh, Loai
    ClickText              Edit
    ClickText              login
create Call Note on account record with Investcorp Attendee 
    ClickText              Accounts
    ClickText              Select a List View
    ClickText              All Accounts
    ClickText              HF_Account1
    ClickText              Call Note
    PickList               Type                        Meeting
    TypeText               Summary General Meeting Notes                           First Meeting
    DropDown               Client Attendee             Contact2 Contact2
    DropDown               Investcorp Attendee
    clicktext              Date
    ClickText              Today
    TypeText               Summary General Meeting Notes                           First Meeting
    ClickText              Save
edit Call Note on account record without Investcorp Attendee 
    ClickText              HF_Account1
    ClickText              Edit Call Note
    PickList               Type                        Meeting
    TypeText               Summary General Meeting Notes                           First Meeting
    DropDown               Client Attendee             Contact2 Contact2
    clicktext              Date
    ClickText              Today
    TypeText               Summary General Meeting Notes                           First Meeting
    ClickText              Save
Edit Call Note' button Remove all B on Call Note Screen 
    ###############


   