*** Settings ***
Documentation  TestCase TC_03_06: Count of orders over $100
Resource    ../../Resources/TC_03_Scripts/TC_03_06_SQL.robot

*** Keywords ***
Retrieve Data
    TC_03_06_SQL.Count of orders over $100

Verify Retrieved Data
    TC_03_06_SQL.Verify Retrieved Data

Insert New Data
    TC_03_06_SQL.Save Current Row Count
    TC_03_06_SQL.Insert New Data
    TC_03_06_SQL.Verify New Data Added

Verify Insert Contains Correct Retrieved Data
    TC_03_06_SQL.Verify Last Input

Log Updated Table
    TC_03_06_SQL.Log All Rows