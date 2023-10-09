*** Settings ***
Library                 QWeb
Library                 ExcelLibrary
Library                 String
Library                 ../libraries/GitOperations.py
Suite Setup             Setup Browser
Suite Teardown          End Suite

*** Variables ***
${BROWSER}              chrome
${webshop}              https://qentinelqi.github.io/shop/
${excel_worksheet}      ${CURDIR}/../data/products_worksheet (13).xlsx
${git_branch}           main

*** Keywords ***
Setup Browser
    Open Browser        about:blank     ${BROWSER}
    Evaluate            random.seed()    random    # initialize random generator

End Suite
    Close All Browsers
