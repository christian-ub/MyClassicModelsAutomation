*** Settings ***
Documentation  TestCase TC_03_02: Count of Queensland Customers
Resource    ../../Resources/TC_03_Scripts/TC_03_02_SQL.robot

*** Keywords ***
Retrieve Data
    TC_03_02_SQL.Count of Queensland Customers

Verify Retrieved Data
    TC_03_02_SQL.Verify Retrieved Data

Insert New Data
    TC_03_02_SQL.Save Current Row Count
    TC_03_02_SQL.Insert New Data
    TC_03_02_SQL.Verify New Data Added

Verify Insert Contains Correct Retrieved Data
    TC_03_02_SQL.Verify Last Input

Log Updated Table
    TC_03_02_SQL.Log All Rows