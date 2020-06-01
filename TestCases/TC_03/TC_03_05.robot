*** Settings ***
Documentation  TestCase TC_03_05: No sales from before 1962
Resource    ../../Resources/TC_03_Scripts/TC_03_05_SQL.robot

*** Keywords ***
Retrieve Data
    TC_03_05_SQL.No sales from before 1962

Verify Retrieved Data
    TC_03_05_SQL.Verify Retrieved Data

Insert New Data
    TC_03_05_SQL.Save Current Row Count
    TC_03_05_SQL.Insert New Data
    TC_03_05_SQL.Verify New Data Added

Verify Insert Contains Correct Retrieved Data
    TC_03_05_SQL.Verify Last Input

Log Updated Table
    TC_03_05_SQL.Log All Rows