*** Settings ***
Resource                 ../resourcefolder/commonaccountexcel.robot
Suite Setup              Setup Browser
Suite Teardown           End suite
Test Teardown            Close All Excel Documents
*** Test Cases ***
read all the Account fields from excel sheet.
    Appstate             Home
    ClickText            Account
    # Open existing workbook
    ${document} =        Open Excel Document         ${Accountexcel_worksheet12}              Account
    ${Account Name} =    Read Excel Column           col_num=1                   max_num=1    row_offset=1
    ClickText            ${Account Name}
    ClickText            Details
    # Start reading values from the second row, max number needs to be provided with offset
    ${Last Name} =       Read Excel Column           col_num=1                   max_num=1    row_offset=1    sheet_name=Sheet1
    ${company} =         Read Excel Column           col_num=2                   max_num=1    row_offset=1    sheet_name=Sheet1
    ${Lead Status} =     Read Excel Column           col_num=3                   max_num=1    row_offset=1    sheet_name=Sheet1
    ${Currency} =        Read Excel Column           col_num=5                   max_num=1    row_offset=1    sheet_name=Sheet1