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