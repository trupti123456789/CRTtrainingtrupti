*** Settings ***
Resource                 ../resourcefolder/listaccountexl.robot
Suite Setup              Setup Browser
Suite Teardown           End suite
Test Teardown            Close All Excel Documents
*** Test Cases ***
read all the Account fields from excel sheet.
    Appstate             Home
    ClickText            Account
   
    # Open existing workbook
    ${document} =        Open Excel Document         ${listaccount}                Account

    # Start reading values from the second row, max number needs to be provided with offset
    ${Account Name} =    Read Excel Column           col_num=1                   max_num=3    row_offset=1    sheet_name=Sheet1
    
    ${Sales Owner} =     Read Excel Column           col_num=2                   max_num=3    row_offset=1    sheet_name=Sheet1
    ${Phone} =           Read Excel Column           col_num=3                   max_num=3    row_offset=1    sheet_name=Sheet1
    ${Industry} =        Read Excel Column           col_num=5                   max_num=3    row_offset=1    sheet_name=Sheet1
  
    $[i] =3

    FOR        $[i]   IN     @{Account_Name}
        VerifyText    
    END






     FOR    ${item}    IN    @{Account Name} 
        TypeText       Account Name                  ${Account Name}
    END
     FOR    ${item}    IN    @{Phone} 
        VerifyText           ${item}
    END
