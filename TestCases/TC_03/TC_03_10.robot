*** Settings ***
Documentation  TestCase TC_03_10: Ensure only numerical figures are in the sales amount field
Resource    ../../Resources/TC_03_Scripts/TC_03_10_SQL.robot

*** Keywords ***
Retrieve Data
    TC_03_10_SQL.Ensure only numerical figures are in the sales amount field

Verify Retrieved Data
    TC_03_10_SQL.Verify Retrieved Data

Insert New Data
    TC_03_10_SQL.Save Current Row Count
    TC_03_10_SQL.Insert New Data
    TC_03_10_SQL.Verify New Data Added

Verify Insert Contains Correct Retrieved Data
    TC_03_10_SQL.Verify Last Input

Log Updated Table
    TC_03_10_SQL.Log All Rows