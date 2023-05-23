*** Settings ***
Resource                    ../resourcefolder/Comon.robot
Suite Setup                 Setup Browser
Suite Teardown              End suite
Library                     QMobile
Library                     SeleniumLibrary


*** Test Cases ***
UseCase1: 


    [Documentation]         Create Contract Record
    [tags]                  Contracts
    Appstate                Home
    ClickText               Contracts
    VerifyText              Recently Viewed             timeout=120s
    UseModal                On
    ClickText               New                         anchor=Import
    ComboBox                Search Accounts...          Growmore Acc
    PickList                Status                      Draft
    ClickText               Contract Start Date
    ClickText               Today
    TypeText                Contract Term (months)*     12
    TypeText                Scope/Milestone/Deliverables                            Test contract Scope
    TypeText                Billing Contact Email*      trupti@gmail.com
    TypeText                Billing Email List          trupti@gmail.com
    TypeText                Payment Terms*              Dollar
    ClickText               Customer Signed Date
    ClickText               Today
    ClickText               Save
    UseModal                Off
    Sleep                   2

    # record id of the contract

    ${contract_number} =    Get Text                    xpath:(//span[@class\="uiOutputText"])[6]
    Log                     ${contract_number}
    ${contract_number} =    Get Text                    ${emk}
    Log                     ${contract_number}

   # filling Opportunity contract id
    ClickText               Opportunities
    ClickText               Growmore-Opp
    ClickText               Details                     anchor=Activity
    UseModal                On
    ClickText               Edit                        anchor=Delete
    TypeText                Amount                      50000
    ComboBox                Search Contracts...         ${contract_number}
    ClickText               Save
    UseModal                Off
    Sleep                   2

    ClickText               Closed
    UseModal                On
    ClickText               Select Closed Stage
    PickList                Stage                       Closed Won
    ClickText               Save
    UseModal                On
    Sleep                   2

    ClickText               Project Growmore-Opp        anchor=Projects(1)
    VerifyField             Contract                    ${contract_number}

    # Create a Employee -->
    ClickText               Employees
    VerifyText              Recently Viewed             timeout=120s
    UseModal                On
    ClickText               New                         anchor=Import
    TypeText                Employee Name               myEmp
    ClickText               Save
    UseModal                On
    Sleep                   2

    #Create a Project resource record

    ClickText               Project Resources
    VerifyText              Recently Viewed             timeout=120s
    UseModal                On
    ClickText               New                         anchor=Import
    UseModal                On
    ComboBox                Search Projects...          Project Growmore-Opp
    ComboBox                Search Employee..           myEmp
    ClickText               Date Picker                 anchor=Start Date
    ClickText               Today
    ClickText               Date Picker                 anchor=End Date
    ClickText               20
    ClickText               Save
    UseModal                On
    Sleep                   2

    # Verify that the Project resource is active or not
    ClickText               Details                     anchor=Related

    VerifyField             Active                      Yes
UseCase2: As a user I should able to create a Contract created with different status and make sure the Project resources details adhere to the same contract.
    # Navigate to Contracts and fill all the fields and contract status should be draft and save    the record.
    [Documentation]        Craete Contract Record
    [tags]                 Contracts
    Appstate               Home
    ClickText              Contracts
    VerifyText             Recently Viewed             timeout=120s
    UseModal               On
    ClickText              New                         anchor=Import
    ComboBox               Search Accounts...          Growmore Acc
    PickList               Status                      Draft
    ClickText              Contract Start Date
    ClickText              Today
    TypeText               Contract Term (months)*     12
    TypeText               Scope/Milestone/Deliverables                            Test contract Scope
    TypeText               Billing Contact Email*      xyz@test.com
    TypeText               Billing Email List          xyz@test.com
    TypeText               Payment Terms*              Dollar
    ClickText              Customer Signed Date
    ClickText              Today
    ClickText              Save
    UseModal               Off
    Sleep                  2

    #Note the record id of the contract

    ${con_number}=     Get Text    (//span[@class\="uiOutputText"])[5]
      Log       ${con_number}

    VerifyField            Contract Number             ${con_number}

    # Add Contract id into Opportunity
    ClickText              Opportunities
    ClickText              Growmore-Opp
    ClickText              Details                     anchor=Activity
    UseModal               On
    ClickText              Edit                        anchor=Delete
    TypeText               Amount                      10000
    ComboBox               Search Contracts...         ${con_number}
    ClickText              Save
    UseModal               Off
    Sleep                  2

    ClickText              Closed                      anchor=Mark Stage as Complete
    UseModal               On
    ClickText              Select Closed Stage
    PickList               Stage                       Closed Won
    ClickText              Save
    UseModal               On
    Sleep                  2

    ClickText              Project Growmore-Opp        anchor=Projects(1)
    VerifyField            Contract                    ${con_number}

    # Create a Employee --> Search for custom object eployee and create a new record.
    ClickText              Employees
    VerifyText             Recently Viewed             timeout=120s
    UseModal               On
    ClickText              New                         anchor=Import
    TypeText               Employee Name               Emp101
    ClickText              Save
    UseModal               On
    Sleep                  2

    #Create a Project resource record and fill the Required fields

    ClickText              Project Resources
    VerifyText             Recently Viewed             timeout=120s
    UseModal               On
    ClickText              New                         anchor=Import
    UseModal               On
    ComboBox               Search Projects...          Project Growmore-Opp
    ComboBox               Search Employee..           Emp101
    ClickText              Date Picker                 anchor=Start Date
    ClickText              Today
    ClickText              Date Picker                 anchor=End Date
    ClickText              29
    ClickText              Save
    UseModal               On
    Sleep                  2

    # Verify that the Project resource is active or not
    ClickText              Details                     anchor=Related

    VerifyField            Active                      Yes

UseCase4: As a user I should be able to delete an employee after the Project resources are allocated.
    # Navigate to Contracts and fill all the fields and contract status should be draft and save    the record.
    [Documentation]        Craete Contract Record
    [tags]                 Contracts
    Appstate               Home
    ClickText              Contracts
    VerifyText             Recently Viewed             timeout=120s
    UseModal               On
    ClickText              New                         anchor=Import
    ComboBox               Search Accounts...          Growmore Acc
    PickList               Status                      Draft
    ClickText              Contract Start Date
    ClickText              Today
    TypeText               Contract Term (months)*     12
    TypeText               Scope/Milestone/Deliverables                            Test contract Scope
    TypeText               Billing Contact Email*      xyz@test.com
    TypeText               Billing Email List          xyz@test.com
    TypeText               Payment Terms*              Dollar
    ClickText              Customer Signed Date
    ClickText              Today
    ClickText              Save
    UseModal               Off
    Sleep                  2

    #Note the record id of the contract

    ${contract_num}=    Get Text           (//span[@class\="uiOutputText"])[5]
    Log                    ${contract_num}


    VerifyField            Contract Number             ${contract_num}

    # Add Contract id into Opportunity
    ClickText              Opportunities
    ClickText              Growmore-Opp
    ClickText              Details                     anchor=Activity
    UseModal               On
    ClickText              Edit                        anchor=Delete
    TypeText               Amount                      10000
    ComboBox               Search Contracts...         ${contract_num}
    ClickText              Save
    UseModal               Off
    Sleep                  2

    ClickText              Closed                      anchor=Mark Stage as Complete
    UseModal               On
    ClickText              Select Closed Stage
    PickList               Stage                       Closed Won
    ClickText              Save
    UseModal               On
    Sleep                  2

    ClickText              Project Growmore-Opp        anchor=Projects(1)
    VerifyField            Contract                    ${contract_num}

    # Create a Employee --> Search for custom object eployee and create a new record.
    ClickText              Employees
    VerifyText             Recently Viewed             timeout=120s
    UseModal               On
    ClickText              New                         anchor=Import
    TypeText               Employee Name               Emp101
    ClickText              Save
    UseModal               On
    Sleep                  2

    #Create a Project resource record and fill the Required fields

    ClickText              Project Resources
    VerifyText             Recently Viewed             timeout=120s
    UseModal               On
    ClickText              New                         anchor=Import
    UseModal               On
    ComboBox               Search Projects...          Project Growmore-Opp
    ComboBox               Search Employee..           Emp101
    ClickText              Date Picker                 anchor=Start Date
    ClickText              Today
    ClickText              Date Picker                 anchor=End Date
    ClickText              29
    ClickText              Save
    UseModal               On
    Sleep                  2

    # Verify that the Project resource is active or not
    ClickText              Details                     anchor=Related

    VerifyField            Active                      Yes

    #deleting an employee
    ClickText              Employees
    ClickText              Emp101
    ClickText              Delete                      anchor=Edit
    UseModal               On
    ClickText              Delete
    UseModal               Off
    Sleep                  2

UseCase5: As a user I should be able to delete the project from CRM once the project has been aborted or completed.
    # Navigate to Contracts and fill all the fields and contract status should be draft and save    the record.
    [Documentation]        Craete Contract Record
    [tags]                 Contracts
    Appstate               Home
    ClickText              Contracts
    VerifyText             Recently Viewed             timeout=120s
    UseModal               On
    ClickText              New                         anchor=Import
    ComboBox               Search Accounts...          Growmore Acc
    PickList               Status                      Draft
    ClickText              Contract Start Date
    ClickText              Today
    TypeText               Contract Term (months)*     12
    TypeText               Scope/Milestone/Deliverables                            Test contract Scope
    TypeText               Billing Contact Email*      xyz@test.com
    TypeText               Billing Email List          xyz@test.com
    TypeText               Payment Terms*              Dollar
    ClickText              Customer Signed Date
    ClickText              Today
    ClickText              Save
    UseModal               Off
    Sleep                  2

    #Note the record id of the contract

    ${con_num}=    Get Text                    (//span[@class\="uiOutputText"])[5]
    Log                    ${con_num}


    VerifyField            Contract Number             ${con_num}

    # Add Contract id into Opportunity
    ClickText              Opportunities
    ClickText              Growmore-Opp
    ClickText              Details                     anchor=Activity
    UseModal               On
    ClickText              Edit                        anchor=Delete
    TypeText               Amount                      10000
    ComboBox               Search Contracts...         ${contract_number}
    ClickText              Save
    UseModal               Off
    Sleep                  2

    ClickText              Closed                      anchor=Mark Stage as Complete
    UseModal               On
    ClickText              Select Closed Stage
    PickList               Stage                       Closed Won
    ClickText              Save
    UseModal               On
    Sleep                  2

    ClickText              Project Growmore-Opp        anchor=Projects(1)
    VerifyField            Contract                    ${con_num}

    # Create a Employee --> Search for custom object eployee and create a new record.
    ClickText              Employees
    VerifyText             Recently Viewed             timeout=120s
    UseModal               On
    ClickText              New                         anchor=Import
    TypeText               Employee Name               Emp101
    ClickText              Save
    UseModal               On
    Sleep                  2

    #Create a Project resource record and fill the Required fields

    ClickText              Project Resources
    VerifyText             Recently Viewed             timeout=120s
    UseModal               On
    ClickText              New                         anchor=Import
    UseModal               On
    ComboBox               Search Projects...          Project Growmore-Opp
    ComboBox               Search Employee..           Emp101
    ClickText              Date Picker                 anchor=Start Date
    ClickText              Today
    ClickText              Date Picker                 anchor=End Date
    ClickText              29
    ClickText              Save
    UseModal               On
    Sleep                  2

    # Verify that the Project resource is active or not
    ClickText              Details                     anchor=Related

    VerifyField            Active                      Yes

    #Navigate to recently created                      project and delete the Project
    ClickText              Projects
    VerifyText             Recently Viewed             timeout=120s
    ClickCell              r2c1
    ClickText              Delete                      anchor=Edit
    UseModal               On
    ClickText              Delete
    UseModal               Off
    Sleep                  2

UseCase6: As a user I should be able to remove an employee from Project resoruce.
    # Navigate to Contracts and fill all the fields and contract status should be draft and save    the record.
    [Documentation]        Craete Contract Record
    [tags]                 Contracts
    Appstate               Home
    ClickText              Contracts
    VerifyText             Recently Viewed             timeout=120s
    UseModal               On
    ClickText              New                         anchor=Import
    ComboBox               Search Accounts...          Growmore Acc
    PickList               Status                      Draft
    ClickText              Contract Start Date
    ClickText              Today
    TypeText               Contract Term (months)*     12
    TypeText               Scope/Milestone/Deliverables                            Test contract Scope
    TypeText               Billing Contact Email*      xyz@test.com
    TypeText               Billing Email List          xyz@test.com
    TypeText               Payment Terms*              Dollar
    ClickText              Customer Signed Date
    ClickText              Today
    ClickText              Save
    UseModal               Off
    Sleep                  2

    #Note the record id of the contract
    #${contract_number} = Get Text xpath://span[contains(@class\="field-label")]/../following-sibling::div[contains(@class\="form-element")][3]
    

    ${conNum}=    Get Text       xpath://span[@class\="uiOutputText"][1]
    Log                    ${conNum}

    VerifyField            Contract Number             ${conNum}

    # Add Contract id into Opportunity
    ClickText              Opportunities
    ClickText              Growmore-Opp
    ClickText              Details                     anchor=Activity
    UseModal               On
    ClickText              Edit                        anchor=Delete
    TypeText               Amount                      10000
    ComboBox               Search Contracts...         ${conNum}
    ClickText              Save
    UseModal               Off
    Sleep                  2

    ClickText              Closed                      anchor=Mark Stage as Complete
    UseModal               On
    ClickText              Select Closed Stage
    PickList               Stage                       Closed Won
    ClickText              Save
    UseModal               On
    Sleep                  2

    ClickText              Project Growmore-Opp        anchor=Projects(1)
    VerifyField            Contract                    ${contract_number}

    # Create a Employee --> Search for custom object eployee and create a new record.
    ClickText              Employees
    VerifyText             Recently Viewed             timeout=120s
    UseModal               On
    ClickText              New                         anchor=Import
    TypeText               Employee Name               Emp101
    ClickText              Save
    UseModal               On
    Sleep                  2

    #Create a Project resource record and fill the Required fields

    ClickText              Project Resources
    VerifyText             Recently Viewed             timeout=120s
    UseModal               On
    ClickText              New                         anchor=Import
    UseModal               On
    ComboBox               Search Projects...          Project Growmore-Opp
    ComboBox               Search Employee..           Emp101
    ClickText              Date Picker                 anchor=Start Date
    ClickText              Today
    ClickText              Date Picker                 anchor=End Date
    ClickText              29
    ClickText              Save
    UseModal               On
    Sleep                  2

    # Verify that the Project resource is active or not
    ClickText              Details                     anchor=Related

    VerifyField            Active                      Yes

    #Navigate to recently created Project resource and remove the employee from that record
    ClickText              Project Project Resources
    ClickCell              r2c1
    ClickText              Edit                        anchor=Delete
    ClickText              Employees


    ClickText              Edit                        partial_match=False
    UseModal               On
    ClickText              Clear Selection
    ClickText              Save
    UseModal               Off
    Sleep                  2







