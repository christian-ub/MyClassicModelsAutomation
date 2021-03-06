*** Settings ***
Documentation  TestCase 04 10: Check alphabetical value only in office field
Resource    ../../Resources/TC_04_Scripts/TC_04_10_SQL.robot

*** Keywords ***
Set Variables
    TC_04_10_SQL.Set Variables

Retrieve Data
    TC_04_10_SQL.Check alphabetical value only in office field

Verify Retrieved Data
    TC_04_10_SQL.Verify Retrieved Data

Insert New Data
    TC_04_10_SQL.Save Current Row Count
    TC_04_10_SQL.Insert New Data
    TC_04_10_SQL.Verify New Data Added

Verify Insert Contains Correct Retrieved Data
    run keyword and continue on failure    TC_04_10_SQL.Verify Last Input

Update Newly Inserted Data
    TC_04_10_SQL.Update Newly Inserted Data

Log Updated Table
    TC_04_10_SQL.Log All Rows