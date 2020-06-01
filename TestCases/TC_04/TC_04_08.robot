*** Settings ***
Documentation  TestCase 04 08: Check there are no duplicate order numbers
Resource    ../../Resources/TC_04_Scripts/TC_04_08_SQL.robot

*** Keywords ***
Set Variables
    TC_04_08_SQL.Set Variables

Retrieve Data
    TC_04_08_SQL.Check there are no duplicate order numbers

Verify Retrieved Data
    TC_04_08_SQL.Verify Retrieved Data

Insert New Data
    TC_04_08_SQL.Save Current Row Count
    TC_04_08_SQL.Insert New Data
    TC_04_08_SQL.Verify New Data Added

Verify Insert Contains Correct Retrieved Data
    run keyword and continue on failure    TC_04_08_SQL.Verify Last Input

Update Newly Inserted Data
    TC_04_08_SQL.Update Newly Inserted Data

Log Updated Table
    TC_04_08_SQL.Log All Rows