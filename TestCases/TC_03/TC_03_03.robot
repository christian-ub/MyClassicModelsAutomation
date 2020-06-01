*** Settings ***
Documentation  TestCase TC_03_03: Sum of sales in Queensland
Resource    ../../Resources/TC_03_Scripts/TC_03_03_SQL.robot

*** Keywords ***
Retrieve Data
    TC_03_03_SQL.Sum of sales in Queensland

Verify Retrieved Data
    TC_03_03_SQL.Verify Retrieved Data

Insert New Data
    TC_03_03_SQL.Save Current Row Count
    TC_03_03_SQL.Insert New Data
    TC_03_03_SQL.Verify New Data Added

Verify Insert Contains Correct Retrieved Data
    TC_03_03_SQL.Verify Last Input

Log Updated Table
    TC_03_03_SQL.Log All Rows