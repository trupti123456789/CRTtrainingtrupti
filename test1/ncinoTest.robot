# NOTE: readme.txt contains important information you need to take into account
# before running this suite.

*** Settings ***
Resource                  ../resourcefolder/commonncino.robot
Suite Setup               Setup Browser
Suite Teardown            End suite

*** Variables ***
${borrower}               Test Robot
${guarantor}              Mike Fake
#${username}              # SHOULD BE GIVEN IN CRT VARIABLES SECTION
#${login_url}             # SHOULD BE GIVEN IN CRT VARIABLES SECTION
#${password}              # SHOULD BE GIVEN IN CRT SENSITIVE VARIABLES SECTION


*** Test Cases ***
Add relationship - Borrower
    [tags]                Relationships
    # Navigate to nCino / Relationships
    Appstate              Relationships

    # Create new relationship
    ClickText             New
    VerifyText            New Relationship
    UseModal              On                          # Only find fields from open modal dialog
    ClickText             Individual
    ClickText             Next

    # New view
    # Filling few fields, note that fields may differ in your environment
    VerifyText            New Relationship: Individual
    TypeText              Relationship Name           ${borrower}
    Picklist              Is this a Test              Yes
    TypeText              Description                 This is just a test

    ClickText             Save                        partial_match=False
    UseModal              Off
    Sleep                 1

    # Verify given information after save
    ClickText             Details
    VerifyField           Relationship Name           ${borrower}
    VerifyField           Relationship Type           Individual
    VerifyField           Is this a Test?             Yes


Create a contact for relationship
    [tags]                Relationships
    # Navigate to nCino / Relationships
    Appstate              Relationships
    ClickText             ${borrower}
    VerifyText            Products & Services
    ClickText             Contacts                    anchor=Connections
    VerifyAll             Details,Connections,Covenants
    ClickText             New                         partial_match=False
    VerifyText            New Contact

    # Split borrower full name to first and last name
    ${borrower_first}     ${borrower_last}=           Split String                ${borrower}                 ${space}
    TypeText              First Name                  ${borrower_first}
    TypeText              Last Name                   ${borrower_last}
    ClickText             Save                        partial_match=False
    # make variables available for other tests
    Set Suite Variable    ${borrower_first}
    Set Suite Variable    ${borrower_last}


Add another Relationship and connection via Onbording
    [tags]                Relationships
    # Navigate to nCino / Relationships
    Appstate              Relationships

    # Create second relationship using "Onboard New Customer"
    # We will use this later as guarantor
    ClickText             Onboard New Customer
    VerifyText            Relationship Type & Product Line
    Dropdown              Relationship Type           Individual

    # Split the guarantor variable (full name) to first name & last name
    # notice how a splitted list values can be directly saved to two variables
    ${first}              ${last}=                    Split String                ${guarantor}                ${space}
    TypeText              First Name                  ${first}
    TypeText              Last Name                   ${last}
    ClickText             Search
    # Wait for search to finalize
    VerifyText            0 Result(s)
    ClickText             Create new customer

    # Verify multiple texts at once from the next expected view
    VerifyAll             Verifications,Primary Relationship,Connected Relationships
    TypeText              SS#                         444140989
    TypeText              Home Street                 Makebelieve Avenue
    TypeText              Home City                   Oklahoma City
    Dropdown              Home State                  OK
    TypeText              Home ZIP Code               12345
    TypeText              Birthdate                   11/29/1973
    Dropdown              US Citizen                  Yes

    # ID verification
    Dropdown              ID Verification             US Permanent Resident Card
    TypeText              Date                        1/1/2020
    ClickText             Save

    # Wait until dialog is dismissed (Save disappears)
    VerifyNoText          Save
    ClickText             Continue

    # Fill in Questionnaire
    Dropdown              How often do you send money out of the country?         0-3 a year
    Dropdown              How do you typically make your deposits?                ATM
    Dropdown              Do you typically make cash deposits?                    No
    Dropdown              May I ask you a few more questions to better understand your needs?                 Yes

    Dropdown              What type of automatic payments do you have coming out of your accounts?            Loans
    Dropdown              How do you typically pay for purchases?                 Credit Card
    Dropdown              How do you typically pay your monthly bills?            Online Bill Pay
    Dropdown              How do you prefer to monitor your account activity?     Mobile banking
    Dropdown              In the next year, do you plan to move locally or relocate?                          No
    Dropdown              In the next year, do you plan to buy or sell any real estate?                       No
    Dropdown              In the next year, do you plan reevaluate how you are planning for your retirement?              No
    ClickText             Continue

    # Skip the documents part
    VerifyText            Upload Files
    ClickText             Continue

    # Create a connection between contacts
    VerifyText            Would you like to add a connected relationship?
    ClickText             Yes, add a connected relationship
    VerifyText            Which option best describes this customer?
    ClickText             Individual

    Dropdown              Relationship Type           Individual
    # split borrower full name into parts
    TypeText              First Name                  ${borrower_first}
    TypeText              Last Name                   ${borrower_last}
    ClickText             Search

    # Wait for search to finalize
    VerifyText            1 Result(s)
    ClickText             Select

    # Fill in rest of the fields
    VerifyText            How is ${borrower} connected to ${guarantor}?
    Dropdown              Connection Role             Owner
    TypeText              SS#                         551210909
    TypeText              Home Street                 Home street
    TypeText              Home City                   Oklahoma City
    Dropdown              Home State                  OK
    TypeText              Home ZIP Code               12345
    TypeText              Birthdate                   7/24/1976
    Dropdown              US Citizen                  Yes
    Dropdown              ID Verification             US Permanent Resident Card
    TypeText              Date                        1/3/2019
    ClickText             Save
    VerifyNoText          Save
    ClickText             Continue

    # Skip the documents part
    VerifyText            Upload Files
    ClickText             Continue

    # Verify relationship details view
    VerifyText            Let's make sure all of the information was entered accurately
    ClickText             Continue

    # Completion message
    VerifyText            Success! Customer Onboarding is now complete.
    ClickText             Finish                      anchor=Success! Customer Onboarding is now complete.

    # Edit to set "Is this a Test" on
    VerifyText            Details
    ClickText             Edit                        anchor=Follow
    VerifyText            Edit ${guarantor}
    PickList              Is this a Test?             Yes
    ClickText             Save                        partial_match=False

    # Check that connection is visible under "Connections"
    # and change role to "Friend"
    VerifyNoText          Edit ${guarantor}
    ClickText             Connections
    UseTable              Number
    # Click 5th cell which has the ui popup
    # just an example, this could be done in multiple ways
    ClickCell             r1c5
    ClickText             Edit                        anchor=Delete

    VerifyText            Connecting From
    Dropdown              Role                        Friend
    TypeText              Description                 Guarantor
    ClickText             Save

    VerifyText            Details

Add a loan
    [tags]                Loan
    Appstate              Relationships
    ClickItem             Select a List View
    Clicktext             All Relationships
    TypeText              Search this list...         ${borrower}\n               # \n presses "ENTER" after typing

    ClickText             Test Robot

    ClickText             Products & Services
    VerifyText            No Loan Products added

    # New loan
    ClickText             New Loan Product
    VerifyText            Add New Loan
    # Dropdowns / Picklists in this view are standard dropdowns,
    # not Salesforce customized picklists.
    TypeText              New Loan Name               Robot Test Loan
    Dropdown              Borrower Type               Borrower
    Dropdown              Product Line                Commercial
    Dropdown              Product Type                Non-Real Estate
    Dropdown              Product                     Line Of Credit
    ClickText             Create New Loan

    # Wait for new view to open
    # Note that multiple texts can be verified in one line
    # if separated by comma.
    # We also use longer timeout here, since loading sometimes takes long.
    VerifyAll             Loan Information,Loan Team                              timeout=45

    ClickText             Loan Information
    VerifyText            Loan Details
    TypeText              Loan Number                 Robot-1234567

    # Verify, that Loan name is correctly pre-filled
    VerifyInputValue      Loan Name                   Robot Test Loan
    Dropdown              Loan Type                   Credit card
    TypeText              Loan Amount                 15000
    ClickCheckbox         Is Review Ready             On
    # Move on by clicking Continue
    ClickText             Continue
    VerifyText            Pricing Fields Required
    TypeText              Loan Term (Months)          72
    TypeText              First Payment Date          1/1/2024
    # Move on by clicking Continue
    ClickText             Continue

    # Verify, that a message of non-filled mandatory fields appears
    VerifyText            Rate and Payment Structures
    VerifyText            To access Rate & Payment Structures information, you must complete the following field

    # Go back and fill in missing mandatory fields
    ClickText             Pricing-Required Fields
    TypeText              Projected Close Date        12/31/2030
    ClickText             Continue

    # Verify info from the last view
    VerifyText            Rate and Payment Structures
    # We use a custom keyword to verify this custom component
    Verify nCino Value    Loan Amount                 $15,000.00
    Verify nCino Value    First Payment Date          1/1/2024


Add a guarantor to Loan
    [tags]                Test data
    Appstate              Relationships
    ClickText             ${borrower}
    ClickText             Products & Services
    ClickText             ${borrower} - Line of Credit
    VerifyAll             Loan Information,Loan Team                              timeout=45

    # Go to Borrowing structure
    ClickText             Borrowing Structure
    VerifyText            Relationship Name
    ClickText             Add Entity Involvement
    VerifyText            SUGGESTED RELATIONSHIPS

    # Switch Focust to table
    UseTable              Relationship Name
    # Find row with guarantor name and check checkbox on in column 1 of that row
    ClickCheckbox         r?${guarantor}/c1           On
    ClickText             Add Selected Relationships

    # Here we have elements that look like standard dropdowns
    # or Salesforce Picklists, but they are completely custom
    # We will use custom keyword for this
    nCino Dropdown        Borrower Type               Guarantor
    nCino Dropdown        Contingent Type             Assign Specific
    TypeText              Contingent Amount           4500
    ClickText             Save Entity Involvement

    # Let's veirfy that another person was added to load
    UseTable              Relationship Name
    VerifyTable           r2c1                        Mike Fake


Move loan through stages until "Final Review"
    [tags]                Test data
    Appstate              Loans
    ClickText             ${borrower} - Line of Credit
    
    # Stage should be "Qualification"
    VerifyStage           Qualification
    ClickText             Mark Stage as Complete
    
    # Stage should be "Proposal"
    VerifyStage           Proposal
    ClickText             Mark Stage as Complete
    
    # Stage should be "Credit Underwriting"
    VerifyStage           Credit Underwriting
    ClickText             Mark Stage as Complete

    # Stage should be "Final Review"
    VerifyStage           Final Review


Delete Test Data
    [tags]                Test data
    Appstate              Relationships
    # First remove the connection
    ClickText             ${guarantor}
    ClickText             Connections
    ClickText             Show Actions
    ClickText             Delete
    VerifyText            Delete Connection
    ClickText             Delete                      anchor=Cancel
    VerifyText            Connections(0)

    # Remove relationships
    ClickText             Relationships
    Set Suite Variable    ${data}                     ${borrower}
    RunBlock              NoData                      timeout=180s                exp_handler=DeleteRelationship
    Set Suite Variable    ${data}                     ${guarantor}
    RunBlock              NoData                      timeout=180s                exp_handler=DeleteRelationship



