*** Settings ***
Documentation  TestCase TC_03_08: Check if any sales are 0
Resource    ../../Resources/TC_03_Scripts/TC_03_08_SQL.robot

*** Keywords ***
Retrieve Data
    TC_03_08_SQL.Check if any sales are 0

Verify Retrieved Data
    TC_03_08_SQL.Verify Retrieved Data

Insert New Data
    TC_03_08_SQL.Save Current Row Count
    TC_03_08_SQL.Insert New Data
    TC_03_08_SQL.Verify New Data Added

Verify Insert Contains Correct Retrieved Data
    TC_03_08_SQL.Verify Last Input

Log Updated Table
    TC_03_08_SQL.Log All Rows