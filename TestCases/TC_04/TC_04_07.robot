*** Settings ***
Documentation  TestCase 04 07: Top 3 offices ranked by sales
Resource    ../../Resources/TC_04_Scripts/TC_04_07_SQL.robot

*** Keywords ***
Set Variables
    TC_04_07_SQL.Set Variables

Retrieve Data
    TC_04_07_SQL.Top 3 offices ranked by sales

Verify Retrieved Data
    TC_04_07_SQL.Verify Retrieved Data

Insert New Data
    TC_04_07_SQL.Save Current Row Count
    TC_04_07_SQL.Insert New Data
    TC_04_07_SQL.Verify New Data Added

Verify Insert Contains Correct Retrieved Data
    run keyword and continue on failure    TC_04_07_SQL.Verify Last Input

Update Newly Inserted Data
    TC_04_07_SQL.Update Newly Inserted Data

Log Updated Table
    TC_04_07_SQL.Log All Rows
