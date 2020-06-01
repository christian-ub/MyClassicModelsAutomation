*** Settings ***
Documentation  Test Suite for Test Scenario 04: Define top 3 offices by highest total sales
Resource    ../TestCases/TC_04/TC_04_01.robot
Resource    ../TestCases/TC_04/TC_04_02.robot
Resource    ../TestCases/TC_04/TC_04_03.robot
Resource    ../TestCases/TC_04/TC_04_04.robot
Resource    ../TestCases/TC_04/TC_04_05.robot
Resource    ../TestCases/TC_04/TC_04_06.robot
Resource    ../TestCases/TC_04/TC_04_07.robot
Resource    ../TestCases/TC_04/TC_04_08.robot
Resource    ../TestCases/TC_04/TC_04_09.robot
Resource    ../TestCases/TC_04/TC_04_10.robot
Resource    ../Resources/DB_Connection/DB_Connection.robot
Test Setup  DB_Connection.Connect
Test Teardown  DB_Connection.Disconnect

#  robot -d results TestSuites/Test_Scenario_04.robot

*** Test Cases ***
TC_04_01: Sum of sales all offices
    [Tags]  TestCase_04_01: Sum of sales all offices
    TC_04_01.Set Variables
    TC_04_01.Retrieve Data
    TC_04_01.Verify Retrieved Data
    TC_04_01.Insert New Data
    TC_04_01.Verify Insert Contains Correct Retrieved Data
    TC_04_01.Update Newly Inserted Data
    TC_04_01.Log Updated Table
TC_04_02: Count of sales all offices
    [Tags]  TestCase_04_02: Count of sales all offices
    TC_04_02.Set Variables
    TC_04_02.Retrieve Data
    TC_04_02.Verify Retrieved Data
    TC_04_02.Insert New Data
    TC_04_02.Verify Insert Contains Correct Retrieved Data
    TC_04_02.Update Newly Inserted Data
    TC_04_02.Log Updated Table
TC_04_03: Average sum of sales all offices
    [Tags]  TestCase_04_03: Average sum of sales all offices
    TC_04_03.Set Variables
    TC_04_03.Retrieve Data
    TC_04_03.Verify Retrieved Data
    TC_04_03.Insert New Data
    TC_04_03.Verify Insert Contains Correct Retrieved Data
    TC_04_03.Update Newly Inserted Data
    TC_04_03.Log Updated Table
TC_04_04: Average count of sales all offices
    [Tags]  TestCase_04_04: Average count of sales all offices
    TC_04_04.Set Variables
    TC_04_04.Retrieve Data
    TC_04_04.Verify Retrieved Data
    TC_04_04.Insert New Data
    TC_04_04.Verify Insert Contains Correct Retrieved Data
    TC_04_04.Update Newly Inserted Data
    TC_04_04.Log Updated Table
TC_04_05: Count of sales where office is NULL
    [Tags]  TestCase_04_05: Count of sales where office is NULL
    TC_04_05.Set Variables
    TC_04_05.Retrieve Data
    TC_04_05.Verify Retrieved Data
    TC_04_05.Insert New Data
    TC_04_05.Verify Insert Contains Correct Retrieved Data
    TC_04_05.Update Newly Inserted Data
    TC_04_05.Log Updated Table
TC_04_06: Count of offices with no sales
    [Tags]  TestCase_04_06: Count of offices with no sales
    TC_04_06.Set Variables
    TC_04_06.Retrieve Data
    TC_04_06.Verify Retrieved Data
    TC_04_06.Insert New Data
    TC_04_06.Verify Insert Contains Correct Retrieved Data
    TC_04_06.Update Newly Inserted Data
    TC_04_06.Log Updated Table
TC_04_07: Top_3 offices ranked by sales
    [Tags]  TestCase_04_07: Top 3 offices ranked by sales
    TC_04_07.Set Variables
    TC_04_07.Retrieve Data
    TC_04_07.Verify Retrieved Data
    TC_04_07.Insert New Data
    TC_04_07.Verify Insert Contains Correct Retrieved Data
    TC_04_07.Update Newly Inserted Data
    TC_04_07.Log Updated Table
TC_04_08: Check there are no duplicate order-numbers
    [Tags]  TestCase_04_08: Check there are no duplicate order-numbers
    TC_04_08.Set Variables
    TC_04_08.Retrieve Data
    TC_04_08.Verify Retrieved Data
    TC_04_08.Insert New Data
    TC_04_08.Verify Insert Contains Correct Retrieved Data
    TC_04_08.Update Newly Inserted Data
    TC_04_08.Log Updated Table
TC_04_09: Check there are no NULL order-numbers
    [Tags]  TestCase_04_09: Check there are no NULL order-numbers
    TC_04_09.Set Variables
    TC_04_09.Retrieve Data
    TC_04_09.Verify Retrieved Data
    TC_04_09.Insert New Data
    TC_04_09.Verify Insert Contains Correct Retrieved Data
    TC_04_09.Update Newly Inserted Data
    TC_04_09.Log Updated Table
TC_04_10: Check alphabetical value only in office field
    [Tags]  TestCase_04_10: Check alphabetical value only in office field
    TC_04_10.Set Variables
    TC_04_10.Retrieve Data
    TC_04_10.Verify Retrieved Data
    TC_04_10.Insert New Data
    TC_04_10.Verify Insert Contains Correct Retrieved Data
    TC_04_10.Update Newly Inserted Data
    TC_04_10.Log Updated Table