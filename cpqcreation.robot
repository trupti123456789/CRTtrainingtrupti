*** Settings ***
Resource            ../Resources/Common.robot
Suite Setup         Setup Browser
Suite Teardown      End suite


*** Test Cases ***
Entering A Opportunity create quote for apple product.
    [tags]          Opportunity                 Git Repo Exercise
    Appstate        Home
    LaunchApp       Sales

    ClickText       Opportunities
    VerifyText      Recently Viewed             timeout=120s
    ClickText       New                         anchor=Import
    ClickText       CloudFulcrum
    ClickText       Next
    VerifyText      Opportunity Information
    UseModal        On                          # Only find fields from open modal dialog
    TypeText        Opportunity Name            OppCPQ1
    ComboBox        Search Accounts...          Account for CRT
    PickList        *Business Unit              Cloudfulcrum
    PickList        *Sales Owner                Anil Reddy
    ClickText       *Close Date
    ClickText       10
    PickList        *Stage                      Prospecting
    ClickText       Save                        partial_match=False

    ClickText       Details
    VerifyText      OppCPQ1
    VerifyText      Account for CRT
    VerifyText      Cloudfulcrum
    VerifyText      Anil Reddy
    VerifyText      4/10/2023
    VerifyText      Prospecting


    ClickText       Related
    ClickText       Show actions for Products                               anchor=Products(0)
    ClickText       Choose Price Book
    UseModal        On

    ClickText       Apple products
    ClickText       Save
    UseModal        Off
    ClickText       Show more actions           anchor=Products(0)
    ClickText       Add Products
    UseModal        On
    UseTable        Select 5 items
    ClickCell       r1c2
    ClickCell       r2c2
    ClickCell       r3c2
    ClickText       Next                        partial_match=False

    UseTable        Item Number
    ClickCell       r1c2
    TypeText        Quantity*                   1.00
    ClickCell       r2c2
    TypeText        Quantity*                   1.00
    ClickCell       r3c2
    TypeText        Quantity*                   1.00
    ClickText       Save
    UseModal        Off


    ClickText       Enterprise Subscription
    VerifyText      Enterprise Subscription
    ClickText       $399.00
    VerifyText      Mac book pro 19
    ClickText       $100,000.00
    ClickText       Show actions for Quotes
    ClickText       New Quote
    UseModal        On
    TypeText        Quote Name*                 Quote for OppCPQ1
    ClickText       Save                        partial_match=False
    UseModal        Off
    ClickText       Quote for OppCPQ1           anchor=00000004
    SwitchWindow    NEW
    SwitchWindow    2
    VerifyText      Quote\nQuote for OppCPQ1
    VerifyText      Apple earpods
    VerifyText      Enterprise Sub
    VerifyText      Mac book pro 19

Entering A Opportunity create quote for Oppo product.
    [tags]          Opportunity                 Git Repo Exercise
    Appstate        Home
    LaunchApp       Sales

    ClickText       Opportunities
    VerifyText      Recently Viewed             timeout=120s
    ClickText       New                         anchor=Import
    ClickText       CloudFulcrum
    ClickText       Next
    VerifyText      Opportunity Information
    UseModal        On                          # Only find fields from open modal dialog
    TypeText        Opportunity Name            OppCPQ2
    ComboBox        Search Accounts...          Account for CRT
    PickList        *Business Unit              Cloudfulcrum
    PickList        *Sales Owner                Anil Reddy
    ClickText       *Close Date
    ClickText       10
    PickList        *Stage                      Prospecting
    ClickText       Save                        partial_match=False

    ClickText       Details
    VerifyText      OppCPQ2
    VerifyText      Account for CRT
    VerifyText      Cloudfulcrum
    VerifyText      Anil Reddy
    VerifyText      4/10/2023
    VerifyText      Prospecting

    ClickText       Related
    ClickText       Show actions for Products                               anchor=Products(0)
    ClickText       Choose Price Book
    UseModal        On
    PickList        Price Book                  Oppo Products
    ClickText       Save
    UseModal        Off

    ClickText       Show more actions           anchor=Products(0)
    ClickText       Add Products
    UseModal        On
    UseTable        Select 1 item
    ClickCell       r1c2
    ClickText       Next                        partial_match=False

    UseTable        Item Number
    ClickCell       r1c2
    ClickText       Save
    UseModal        Off

