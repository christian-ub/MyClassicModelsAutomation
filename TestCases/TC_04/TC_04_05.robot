*** Settings ***
Documentation  TestCase 04 05: Count of sales where office is NULL
Resource    ../../Resources/TC_04_Scripts/TC_04_05_SQL.robot

*** Keywords ***
Set Variables
    TC_04_05_SQL.Set Variables

Retrieve Data
    TC_04_05_SQL.Count of sales where office is NULL

Verify Retrieved Data
    TC_04_05_SQL.Verify Retrieved Data

Insert New Data
    TC_04_05_SQL.Save Current Row Count
    TC_04_05_SQL.Insert New Data
    TC_04_05_SQL.Verify New Data Added

Verify Insert Contains Correct Retrieved Data
    run keyword and continue on failure    TC_04_05_SQL.Verify Last Input

Update Newly Inserted Data
    TC_04_05_SQL.Update Newly Inserted Data

Log Updated Table
    TC_04_05_SQL.Log All Rows