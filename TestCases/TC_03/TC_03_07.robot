*** Settings ***
Documentation  TestCase TC_03_07: Count of orders over $100 and from queensland
Resource    ../../Resources/TC_03_Scripts/TC_03_07_SQL.robot

*** Keywords ***
Retrieve Data
    TC_03_07_SQL.Count of orders over $100 and from queensland

Verify Retrieved Data
    TC_03_07_SQL.Verify Retrieved Data

Insert New Data
    TC_03_07_SQL.Save Current Row Count
    TC_03_07_SQL.Insert New Data
    TC_03_07_SQL.Verify New Data Added

Verify Insert Contains Correct Retrieved Data
    TC_03_07_SQL.Verify Last Input

Log Updated Table
    TC_03_07_SQL.Log All Rows