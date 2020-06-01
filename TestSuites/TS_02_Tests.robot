*** Settings ***
Documentation  Test Cases for TS_02: Validate that no order has been shipped before payment has been made
Resource    ../Resources/TS_02_SQL.robot
Resource    ../Resources/DB_Connection.robot
Test Setup  DB_Connection.Connect
Test Teardown  DB_Connection.Disconnect

#  robot -d results TestSuites/TS_02_Tests.robot

*** Test Cases ***
Count of orders shipped
    TS_02_SQL.Count of orders shipped
Count of orders that have not yet been shipped
    TS_02_SQL.Count of orders that have not yet been shipped
Count of orders shipped after payment received
    TS_02_SQL.Count of orders shipped after payment received
Count of orders not shipped as payment not received
    TS_02_SQL.Count of orders not shipped as payment not received
Count of orders shipped before payment has been received
    TS_02_SQL.Count of orders shipped before payment has been received
Sum of orders shipped before payment has been received
    TS_02_SQL.Sum of orders shipped before payment has been received
Count of orders that do not have a shipped date or payment date
    TS_02_SQL.Count of orders that do not have a shipped date or payment date
Check that all shipped dates match date format
Check tha all payment dates match date format
Count of orders that were shipped before order date
    TS_02_SQL.Count of orders that were shipped before order date
