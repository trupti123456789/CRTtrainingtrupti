*** Settings ***
Resource             ../resourcefolder/commonaccountexcel.robot
Suite Setup          Setup Browser
Suite Teardown       End suite


*** Test Cases ***
read all the Account fields from excel sheet.
    Appstate         Home