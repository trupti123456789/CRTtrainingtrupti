*** Settings ***
Resource             ../resourcefolder/commonaccountexcel.robot
Suite Setup          Setup Browser
Suite Teardown       End suite
Test Teardown           Close All Excel Documents
*** Test Cases ***
read all the Account fields from excel sheet.
    Appstate         Home
    ClickText        Account
    ClickText        Dipti1
    ClickText        Details
     # Open existing workbook
    ${document}=        Open Excel Document    ${Accountexcel_worksheet}     products

    # Start reading values from the second row, max number needs to be provided with offset
    ${product_names}=   Read Excel Column    col_num=1    max_num=1    row_offset=1    sheet_name=Sheet1