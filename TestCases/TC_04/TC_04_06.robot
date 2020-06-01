*** Settings ***
Documentation  TestCase 04 06: Count of offices with no sales
Resource    ../../Resources/TC_04_Scripts/TC_04_06_SQL.robot

*** Keywords ***
Set Variables
    TC_04_06_SQL.Set Variables

Retrieve Data
    TC_04_06_SQL.Count of offices with no sales

Verify Retrieved Data
    TC_04_06_SQL.Verify Retrieved Data

Insert New Data
    TC_04_06_SQL.Save Current Row Count
    TC_04_06_SQL.Insert New Data
    TC_04_06_SQL.Verify New Data Added

Verify Insert Contains Correct Retrieved Data
    run keyword and continue on failure    TC_04_06_SQL.Verify Last Input

Update Newly Inserted Data
    TC_04_06_SQL.Update Newly Inserted Data

Log Updated Table
    TC_04_06_SQL.Log All Rows