*** Settings ***
Documentation  Test Suite for Test Scenario 03: Define how many people living in QLD are buying from Vendor A where payment amount is more than $100
Resource    ../TestCases/TC_03/TC_03_01.robot
Resource    ../TestCases/TC_03/TC_03_02.robot
Resource    ../TestCases/TC_03/TC_03_03.robot
Resource    ../TestCases/TC_03/TC_03_04.robot
Resource    ../TestCases/TC_03/TC_03_05.robot
Resource    ../TestCases/TC_03/TC_03_06.robot
Resource    ../TestCases/TC_03/TC_03_07.robot
Resource    ../TestCases/TC_03/TC_03_08.robot
Resource    ../TestCases/TC_03/TC_03_09.robot
Resource    ../TestCases/TC_03/TC_03_10.robot
Resource    ../Resources/DB_Connection/DB_Connection.robot
Test Setup  DB_Connection.Connect
Test Teardown  DB_Connection.Disconnect

#  robot -d results TestSuites/Test_Scenario_03.robot

*** Test Cases ***
TC_03_01: Count of non queensland customers
    [Tags]  TestCase TC_03_01: Count of non queensland customers
    TC_03_01.Retrieve Data
    TC_03_01.Verify Retrieved Data
    TC_03_01.Insert New Data
    TC_03_01.Verify Insert Contains Correct Retrieved Data
    TC_03_01.Log Updated Table
TC_03_02: Count of Queensland Customers
    [Tags]  TestCase TC_03_02: Count of Queensland Customers
    TC_03_02.Retrieve Data
    TC_03_02.Verify Retrieved Data
    TC_03_02.Insert New Data
    TC_03_02.Verify Insert Contains Correct Retrieved Data
    TC_03_02.Log Updated Table
TC_03_03: Sum of sales in Queensland
    [Tags]  TestCase TC_03_03: Sum of sales in Queensland
    TC_03_03.Retrieve Data
    TC_03_03.Verify Retrieved Data
    TC_03_03.Insert New Data
    TC_03_03.Verify Insert Contains Correct Retrieved Data
    TC_03_03.Log Updated Table
TC_03_04: Sum of sales in Queensland over $100
    [Tags]  TestCase TC_03_04: Sum of sales in Queensland over $100
    TC_03_04.Retrieve Data
    TC_03_04.Verify Retrieved Data
    TC_03_04.Insert New Data
    TC_03_04.Verify Insert Contains Correct Retrieved Data
    TC_03_04.Log Updated Table
TC_03_05: No sales from before 1962
    [Tags]  TestCase TC_03_05: No sales from before 1962
    TC_03_05.Retrieve Data
    TC_03_05.Verify Retrieved Data
    TC_03_05.Insert New Data
    TC_03_05.Verify Insert Contains Correct Retrieved Data
    TC_03_05.Log Updated Table
TC_03_06: Count of orders over $100
    [Tags]  TestCase TC_03_06: Count of orders over $100
    TC_03_06.Retrieve Data
    TC_03_06.Verify Retrieved Data
    TC_03_06.Insert New Data
    TC_03_06.Verify Insert Contains Correct Retrieved Data
    TC_03_06.Log Updated Table
TC_03_07: Count of orders over $100 and from queensland
    [Tags]  TestCase TC_03_07: Count of orders over $100 and from queensland
    TC_03_07.Retrieve Data
    TC_03_07.Verify Retrieved Data
    TC_03_07.Insert New Data
    TC_03_07.Verify Insert Contains Correct Retrieved Data
    TC_03_07.Log Updated Table
TC_03_08: Check if any sales are 0
    [Tags]  TestCase TC_03_08: Check if any sales are 0
    TC_03_08.Retrieve Data
    TC_03_08.Verify Retrieved Data
    TC_03_08.Insert New Data
    TC_03_08.Verify Insert Contains Correct Retrieved Data
    TC_03_08.Log Updated Table
TC_03_09: Check if any sales are negative
    [Tags]  TestCase TC_03_09: Check if any sales are negative
    TC_03_09.Retrieve Data
    TC_03_09.Verify Retrieved Data
    TC_03_09.Insert New Data
    TC_03_09.Verify Insert Contains Correct Retrieved Data
    TC_03_09.Log Updated Table
TC_03_10: Ensure only numerical figures are in the sales amount field
    [Tags]  TestCase TC_03_10: Ensure only numerical figures are in the sales amount field
    TC_03_10.Retrieve Data
    TC_03_10.Verify Retrieved Data
    TC_03_10.Insert New Data
    TC_03_10.Verify Insert Contains Correct Retrieved Data
    TC_03_10.Log Updated Table
