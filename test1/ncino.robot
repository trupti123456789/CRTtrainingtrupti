*** Settings ***
Resource                  ../Resources/Common.robot
Suite Setup               Setup Browser
Suite Teardown            End suite



*** Test Cases ***
Ncino Test Cases
    #Create a relationship
    #Fields may vary from one organisation to another, please make sure whether the fields are matching
    [tags]                Regression
    Appstate              Home
    ClickText             Relationships
    ClickText             New                         anchor=Import
    UseModal              On
    ClickText             Household
    ClickText             Next
    TypeText              Legal Name                  Meta Household1
    Picklist              Customer Type               Household
    ClickText             Save                        partial_match=False
    Sleep                 4
    ClickText             Relationships               partial_match=False
    ClickText             New                         anchor=Import
    Sleep                 4
    UseModal              On
    ClickText             Business
    Sleep                 2
    ClickText             Next
    TypeText              Legal Name                  Facebook
    Picklist              Customer Type               Co-Operative
    ClickText             Save                        partial_match=False
    ClickText             Relationships               anchor=Loans
    ClickText             New                         anchor=Import
    Sleep                 4
    UseModal              On
    #Fill all the details in the modal pop-up window.
    ClickText             Individual
    Sleep                 2
    ClickText             Next
    Picklist              Salutation                  Mr.
    TypeText              Last Name                   Mark
    Picklist              Customer Type               Individual
    ClickText             Save                        partial_match=False

    #Creating Connection
    ClickText             Relationships
    ClickText             Meta Household
    ClickText             Related
    ClickText             Connections
    ClickText             Connections(0)
    UseModal              On
    ClickText             New
    UseTable              Connected Relationship
    ClickCell             r1c1
    TypeText              Connected Relationship      Facebook
    DropDown              Role                        Household Member
    ClickText             Save
    Sleep                 2
    ClickText             Connections
    Clicktext             Connections(0)
    UseModal              On
    ClickText             New
    UseTable              Connected Relationship
    ClickCell             r1c1
    TypeText              Connected Relationship      Mark
    DropDown              Role                        Household Member
    ClickText             Save
    ClickText             Relationships
    ClickText             Facebook
    ClickText             Related
    ClickText             Connections
    Clicktext             Connections(1)
    UseModal              On
    ClickText             New
    UseTable              Connected Relationship
    ClickCell             r1c1
    TypeText              Connected Relationship      Mark
    DropDown              Role                        Company Director
    ClickText             Save



Generate Template   
    [tags]                Regression1
    ClickText             More
    ClickText             Product Packages
    ClickText             New                         Anchor=Import
    UseModal              On
    TypeText              Product Package Name        Facebook p
    ClickText             Save                        partial_match=False
    UseModal              Off
    ClickElement          //*[@id\='tools-actions']
    sleep                 2
    ClickText             Generate Forms
    ClickText             Manage Templates
    DropDown              View Templates for          Product Package
    UseTable              Document Name
    VerifyText            Product Package Full Credit Memo
    ClickCell             r1c1
    VerifyText            Document Name
    VerifyText            Primary Object
    VerifyText            Form Purpose
    ClickText             Configure Template
    ClickText             More
    ClickText             Product Packages
    ClickText             Facebook pp
    ClickElement          //*[@id\='tools-actions']
    ClickText             Generate Credit Memo
    VerifyText            Product Package Full Credit Memo


Generate Route,Sub Route,screen,screen Section
    [tags]                Regression3
    LaunchApp             Groups-UI
    ClickText             New                         anchor=IMPO
    UseModal              On
    TypeText              Group Name                  Demo Group
    TypeText              App                         Demo-UI
    ClickText             Save                        partial_match=False
    Sleep                 4
    UseModal              Off
    LaunchApp             Routes
    ClickText             Recently Viewed | Routes
    UseModal              On
    ClickText             Account Structure & Roles
    ClickText             Related
    ClickText             New                         anchor=Child Route Groups
    UseModal              On
    ComboBox              Search Routes...            Account Structure & Roles
    Combobox              Search Groups-UI...         Demo Group
    ComboBox              Search Groups-UI...         Demo Group
    TypeText              Order                       5
    ClickText             Save                        partial_match=False
    UseModal              Off
    Sleep                 4
    LaunchApp             Screens
    ClickText             New
    UseModal              On
    TypeText              Screen Name                 Loan detail Route
    ClickText             Save                        partial_match=False
    ClickText             Related
    ClickText             New                         anchor=Screen Sections
    UseModal              On
    TypeText              Screen Section Name         loan detail ss
    PickList              sObject Type                Account
    PickList              Section Resource            SObjectScreenResource
    TypeText              Display Order               4
    ClickText             Save                        partial_match=False
    UseModal              Off
    ClickText             loan detail ss
    ClickText             Build Section
    ClickText             Configure this tier
    DropDown              layoutSelection1.01         Two Column Grid
    ClickText             Choose Field Set
    ClickText             Generate
    ClickText             Save
    ClickText             loan detail ss
    ClickText             Edit                        partial_match=False
    UseModal              On
    Clicktext             Default Editable
    ClickText             Is Editable
    ClickText             Save                        partial_match=False
    UseModal              Off
    ClickText             loan detail ss1             | Screen Section
    ClickText             Related
    ClickText             SC-000017861
    Sleep                 2
    LaunchApp             Routes
    ClickText             Select a List View: Routes
    ClickText             Default
    ClickText             Loan Details
    ClickText             Clone                       anchor=Delete
    UseModal              On
    TypeText              Route Name                  Balance Details1
    TypeText              App                         Balance-detail-demo
    ClickText             Save                        partial_match=False
    UseModal              Off
    ClickText             Related
    ClickText             New                         anchor=Route Groups
    UseModal              On
    ComboBox              Search Groups-UI...         Demo Group
    TypeText              Group                       Demo Group
    TypeText              Order                       4
    ClickText             Save                        partial_match=False
    UseModal              Off

Verify Loan and Loan related Details
    LaunchApp             Loans
    ClickText             Loans
    ClickText             Auto REG Company-Business Loan-$95000
    ClickText             Details                     partial_match=False
    ClickText             Loan Dashboard
    VerifyText            Loan Details
    VerifyText            Stage                       anchor=Proposal
    VerifyText            Owner ID
    VerifyText            Facility Limit
    VerifyText            Status
    VerifyText            Primary Borrower
    VerifyText            Product Line
    VerifyText            Product Type
    VerifyText            Product                     partial_match=False
    Clicktext             Borrowing Structure
    ClickText             Add Entity Involvement
    ClickText             Add New Relationship
    DropDown              relationshipType-select     Aggregator
    TypeText              Primary City                Hyderabad
    TypeText              Primary State/Province      TG
    TypeText              Relationship Name           Loan1 Facebook
    ClickText             Save Relationship
    Sleep                 4
    ClickText             Borrower Type
    ClickText             Guarantor
    ClickText             Save Entity Involvement
    VerifyText            Loan1 Facebook
    ClickText             Loan Information
    Clicktext             Edit
    DropDown              Judo Loan Purpose           New
    TypeText              Proposed Settlement Date    21/07/2023
    Clicktext             Save
    Sleep                 2
    ClickText             Pricing
    Verifytext            Facility Limit
    Clicktext             Save
    Sleep                 2
    ClickText             Collateral
    VerifyText            Gross Collateral Value
    Clicktext             Add Collateral
    VerifyText            Gross Collateral Value
    ClickText             Add                         Collateral
    ClickText             Add New Collateral
    DropDown              Type                        Mortgage
    DropDown              Sub-Type                    Fee Simple - Residential
    ClickText             Select Entities
    ClickText             Loan1 Facebook
    TypeText              OWNERSHIP PERCENTAGE        70
    ClickText             Save Collateral
    Sleep                 4
    Clicktext             Cancel
    VerifyText            Financial Assistance
    Sleep                 2
    ClickText             Fees
    VerifyText            Fee Type
    VerifyText            Calculation Type

Field Configuration
    LaunchApp             Routes
    Clicktext             Balance Details
    Clicktext             Details
    Verifytext            Screen
    Clicktext             Loan Details
    Clicktext             Related
    Clicktext             Field Configuration Route(0)
    Clicktext             New
    UseModal              On
    Typetext              Field Name                  LLC_BI_Stage__c
    Typetext              sObject Name                LLC_BI_Loan__c
    Clicktext             Is Read Only
    Clicktext             Save
    ClickText             Cancel
    #read only field

Configure Document Manager
    LaunchApp             nCino Administration
    Clicktext             nCino Administration
    ClickText             Document Manager
    Clicktext             Loans
    ClickText             Continue
    ClickText             Configure Custom Checklist
    UseModal              On
    DropDown              FIRST choose an object      LLC_BI_Loan__c
    DropDown              IF this field               LLC_BI_product__c
    DropDown              Is                          Euals
    TypeText              This value                  Line of Credit
    TypeText              ALWAYS display the documents in this category           Line of Credit
    ClickText             +Placeholders in another category
    ClickText             Loans
    ClickText             Document Manager
    VerifyText            Line of Credit Doc

Configure Form Generation  
    Appstate              Home
    LaunchApp             Forms Manager
    ClickText             Create New Template
    TypeText              Document Name               Change in repayment Commitment Letters
    TypeText              Document Description        It is a lender promiss
    DropDown              Form Purpose                General
    DropDown              Output Type                 PDF
    ClickText             Save
    ClickText             Loans
    Clicktext             ESIT.REG1.B34Company-Business Loan-$95000
    Clicktext             Loan Information
    Sleep                 4
    ClickElement          //*[@id\='tools-actions']
    ClickText             Generate Forms
    ClickText             Generate                    anchor= Change in Repayment Confirmation Letter
    Sleep                 4
    #genate form in pdf format

Configure Smart Checklist 
    LaunchApp             nCino Administration
    ClickText             Smart Checklist Configuration
    ClickText             Add Requirement
    UseModal              On
    Sleep                 2
    TypeText              Name                        Test Requirement1
    PickList              Assigned Party              Credit Underwrite
    ClickText             Hard Stop
    ClickText             Save
    ComboBox              Select an Option            Credit Underwriter
    ClickText             Select an Option
    ClickText             Required Stage
    ClickText             Application
    ClickText             Assigned Party
    ClickText             Analyst
    ClickText             Feature Management
    VerifyText            Smart Checklist
    ClickText             Loans
    ClickText             Facebook - Equipment
    ClickText             Smart Checklist

Field Map
    Appstate               Home
    Clicktext             More
    ClickText             Field Maps
    ClickText             New
    UseModal              On
    TypeText              Field Map Name              CAS.CollateralData:mostly
    TypeText              lookupKey                   732C2512_96B6_4DB4_BCEF_A3EFA8D3C6B1
    TypeText              Originating Obj             CAS.CollateralData
    TypeText              Target Obj                  LLC_BI__Collateral__c
    TypeText              Originating Obj Field       mostly
    TypeText              Target Obj Field            LLC_BI__Make__c
    ClickText             Save                        partial_match=False


Delete Test Records of Relationships and Connections
    #Navigate to Relationships
    LaunchApp             Relationships
    Clicktext             Meta Household
    ClickText             Connections
    UseTable              Choose a RowSelect All
    ClickCell             r1c7
    #Selecting and delting the appropriate relationship.
    ClickText             Delete
    UseModal              On
    ClickText             Delete
    UseModal              Off
    ClickCell             r1c7
    ClickText             Delete
    UseModal              On
    ClickText             Delete
    UseModal              Off
    ClickText             Relationships
    ClickText             Meta Household
    #Deleting the connections 
    ClickText             Connections
    ClickText             Relationships
    ClickText             Facebook
    ClickText             Connections
    ClickCell             r1c7
    ClickText             Delete
    UseModal              On
    ClickText             Delete
    UseModal              Off
    ClickText             Relationships
    UseTable              Item Number
    #Delete all 3 connections established which are created in previous test case
    ClickCell             r1c9
    ClickText             Delete
    UseModal              On
    ClickText             Delete
    UseModal              Off
    ClickCell             r1c9
    ClickText             Delete
    UseModal              On
    ClickText             Delete
    UseModal              Off
    ClickCell             r1c9
    ClickText             Delete
    UseModal              On
    ClickText             Delete
    UseModal              Off

Delete Test Record of Route ,Sub-Route Screen,screen section
    LaunchApp             Route Groups
    ClickCell             r1c9
    ClickText             Delete
    UseModal              On
    ClickText             Delete
    UseModal              Off
    LaunchApp             Groups-UI
    Clicktext             Demo Group
    ClickText             Delete
    UseModal              On
    ClickText             Delete
    UseModal              Off
    #Delete Screens and Screen sections
    LaunchApp             Screens
    ClickText             Loan detail Route
    ClickText             Delete
    Usemodal              On
    ClickText             Delete
    Launchapp             Screen Sections
    Clicktext             Loan Details
    ClickText             Delete
    UseModal              On
    ClickText             Delete
    UseModal              Off