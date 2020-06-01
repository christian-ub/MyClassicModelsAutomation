*** Settings ***
Documentation  TestCase 04 01: Sum of sales all offices
Resource    ../../Resources/TC_04_Scripts/TC_04_01_SQL.robot

*** Keywords ***
Set Variables
    TC_04_01_SQL.Set Variables

Retrieve Data
    TC_04_01_SQL.Sum of sales all offices

Verify Retrieved Data
    TC_04_01_SQL.Verify Retrieved Data

Insert New Data
    TC_04_01_SQL.Save Current Row Count
    TC_04_01_SQL.Insert New Data
    TC_04_01_SQL.Verify New Data Added

Verify Insert Contains Correct Retrieved Data
    run keyword and continue on failure    TC_04_01_SQL.Verify Last Input

Update Newly Inserted Data
    TC_04_01_SQL.Update Newly Inserted Data

Log Updated Table
    TC_04_01_SQL.Log All Rows