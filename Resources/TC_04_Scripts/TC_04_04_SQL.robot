*** Settings ***
Documentation   SQL scripts for TC_04_04: Average Count of sales all offices
Library  DatabaseLibrary
Library  Dialogs

*** Variables ***
${TestCase}
${TestStatus}
${Test_Column_1}
${TestValue_Column_1}
${PREVIOUS_ROW_COUNT}
${Insert_DateStamp}

*** Keywords ***
Set Variables    # Manual insert of TestCase and Test_Columns
    set test variable    ${TestCase}    TC_04_04
    set test variable    ${Test_Column_1}    Avg_Count_All_Office_Sales
    set test variable    ${TestStatus}    Pending

Average count of sales all offices    # Manual insert of SQL query and handling of variables
    ${CountOfAllSales} =  Row count    SELECT orderNumber FROM orders
    ${CountOfOffices} =  Row count  SELECT City FROM offices
    ${AverageSalesCount} =  evaluate    ${CountOfAllSales}/${CountOfOffices}
    ${AverageSalesCount} =  Convert to Number    ${AverageSalesCount}    8
    Set test Variable  ${TestValue_Column_1}  ${AverageSalesCount}
    Log  ${TestValue_Column_1}
    set test variable    ${TestStatus}   'Data retrieved'

Verify Retrieved Data    # Manual insert of verification rules for correctness
    should be true    ${TestValue_Column_1}
    set test variable    ${TestStatus}   'Retrieved Data Verified'

Save Current Row Count    # Automated
    ${current_row_count} =  Row Count   SELECT * FROM TestScenario_04 WHERE TestCase = '${TestCase}'
    Set test Variable  ${PREVIOUS_ROW_COUNT}  ${current_row_count}
    Log  ${PREVIOUS_ROW_COUNT}

Insert New Data    # Automated for one value of Test_Column and TestValue_Column, manual insert for multiple columns until list in place
    ${Get_DateStamp} =    Query    SELECT cast(current_timestamp() as char)
    Set test Variable  ${Insert_DateStamp}  ${Get_DateStamp[0][0]}
    Execute SQL String  INSERT INTO TestScenario_04 (TestCase, DateStamp, Test_Status, ${Test_Column_1}) VALUES ('${TestCase}', '${Insert_DateStamp}', 'PENDING', ${TestValue_Column_1})

Verify New Data Added    # Automated
    ${new_row_count} =  Row Count  SELECT * FROM TestScenario_04 WHERE TestCase = '${TestCase}'
    Log  ${NEW_ROW_COUNT}
    Should be Equal as Numbers  ${NEW_ROW_COUNT}  ${PREVIOUS_ROW_COUNT + 1}
    set test variable    ${TestStatus}   'Unverified Insert Data'

Verify Last Input    # Manual insert of Test_Columns and TestValue_Columns and verification rules for correctness, Automated once list in place
    ${QueryResults} =  Query  SELECT TestCase, DateStamp, ${Test_Column_1} FROM TestScenario_04 WHERE TestCase = '${TestCase}' ORDER BY DateStamp DESC LIMIT 1
    run keyword unless    '${QueryResults[0][0]}'=='${TestCase}'
    ...    set test variable    ${TestStatus}   'Corrupt Insert Data'
    log many    ${QueryResults[0][0]}    ${TestCase}
    run keyword unless    ${QueryResults[0][2]}==${TestValue_Column_1}
    ...    set test variable    ${TestStatus}   'Corrupt Insert Data'
    log many    ${QueryResults[0][2]}    ${TestValue_Column_1}
    run keyword unless    ${TestStatus}== 'Corrupt Insert Data'
    ...    set test variable    ${TestStatus}   'Verified Insert Data'

Update Newly Inserted Data    # Automated for one value, manual insert for multiple columns until list in place
    Log    ${TestStatus}
    run keyword and return if    ${TestStatus}== 'Verified Insert Data'
    ...    Execute SQL String  UPDATE TestScenario_04 SET Test_Status = 'PASSED' WHERE TestCase = '${TestCase}' AND DateStamp = '${Insert_DateStamp}'
    run keyword if    ${TestStatus}!= 'Verified Insert Data'
    ...    Execute SQL String  UPDATE TestScenario_04 SET ${Test_Column_1} = NULL, Test_Status = 'FAILED' WHERE TestCase = '${TestCase}' AND DateStamp = '${Insert_DateStamp}'
    fail    Corrupt Insert Data

Log All Rows    # Automated
    Log    ${TestStatus}
    ${QueryResults} =  Query  SELECT * FROM TestScenario_04 WHERE TestCase = '${TestCase}' ORDER BY DateStamp DESC
    Log Many  ${QueryResults}