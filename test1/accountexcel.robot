*** Settings ***
Resource                 ../resourcefolder/commonaccountexcel.robot
Suite Setup              Setup Browser
Suite Teardown           End suite
Test Teardown            Close All Excel Documents
*** Test Cases ***
read all the Account fields from excel sheet.
    Appstate             Home
    ClickText            Account
    ClickText             ${Account Name} 
    ClickText            Details
    # Open existing workbook
    ${document} =        Open Excel Document         ${Accountexcel_worksheet}                Account

    # Start reading values from the second row, max number needs to be provided with offset
    ${Account Name} =    Read Excel Column           col_num=1                   max_num=1    row_offset=1    sheet_name=Sheet1
    ${Sales Owner} =     Read Excel Column           col_num=2                   max_num=1    row_offset=1    sheet_name=Sheet1
    ${Phone} =           Read Excel Column           col_num=3                   max_num=1    row_offset=1    sheet_name=Sheet1
    ${Industry} =        Read Excel Column           col_num=5                   max_num=1    row_offset=1    sheet_name=Sheet1