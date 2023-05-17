*** Settings ***
Library                 QWeb
Library                 ExcelLibrary
Library                 String
Library                 ../libraries/GitOperations.py

*** Variables ***
${BROWSER}              chrome
${webshop}              https://qentinelqi.github.io/shop/
${listaccount}      ${CURDIR}/../data/accountexcel .xlsx

*** Keywords ***
Setup Browser
    Open Browser        about:blank     ${BROWSER}
    Evaluate            random.seed()    random    # initialize random generator

End Suite
    Close All Browsers

