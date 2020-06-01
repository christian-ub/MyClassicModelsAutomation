*** Settings ***
Documentation  TestCase TC_03_01: Count of non queensland customers
Resource    ../../Resources/TC_03_Scripts/TC_03_01_SQL.robot

*** Keywords ***
Retrieve Data
    TC_03_01_SQL.Count of non queensland customers

Verify Retrieved Data
    TC_03_01_SQL.Verify Retrieved Data

Insert New Data
    TC_03_01_SQL.Save Current Row Count
    TC_03_01_SQL.Insert New Data
    TC_03_01_SQL.Verify New Data Added

Verify Insert Contains Correct Retrieved Data
    TC_03_01_SQL.Verify Last Input

Log Updated Table
    TC_03_01_SQL.Log All Rows