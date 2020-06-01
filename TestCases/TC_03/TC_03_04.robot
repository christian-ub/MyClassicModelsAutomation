*** Settings ***
Documentation  TestCase TC_03_04: Sum of sales in Queensland over $100
Resource    ../../Resources/TC_03_Scripts/TC_03_04_SQL.robot

*** Keywords ***
Retrieve Data
    TC_03_04_SQL.Sum of sales in Queensland over $100

Verify Retrieved Data
    TC_03_04_SQL.Verify Retrieved Data

Insert New Data
    TC_03_04_SQL.Save Current Row Count
    TC_03_04_SQL.Insert New Data
    TC_03_04_SQL.Verify New Data Added

Verify Insert Contains Correct Retrieved Data
    TC_03_04_SQL.Verify Last Input

Log Updated Table
    TC_03_04_SQL.Log All Rows