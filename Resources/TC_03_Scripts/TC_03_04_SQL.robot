*** Settings ***
Documentation   SQL scripts for TestCase TC_03_04: Sum of sales in Queensland over $100
Library  DatabaseLibrary
Library  Dialogs

*** Variables ***
${SUMALLOFFICESALES}
${PREVIOUS_ROW_COUNT}
*** Keywords ***
Sum of sales in Queensland over $100
    ${QueryResults} =  Query    SELECT sum(amount) FROM payments p left join customers c on p.customerNumber = c.customerNumber where state = "Queensland" and amount > 100
    Set Suite Variable  ${SUMALLOFFICESALES}  ${QueryResults[0][0]}
    Log  ${QueryResults}

Verify Retrieved Data
    should be true    ${SUMALLOFFICESALES}

Save Current Row Count
    ${current_row_count} =  Row Count   SELECT * FROM TestScenario_03 WHERE TestCase = 'TC_03_04'
    Set Suite Variable  ${PREVIOUS_ROW_COUNT}  ${current_row_count}
    Log  ${current_row_count}

Insert New Data
    Execute SQL String  INSERT INTO TestScenario_03 (TestCase, DateStamp, Sum_All_Office_Sales) VALUES ('TC_03_04', cast(current_timestamp() as char), ${SUMALLOFFICESALES})

Verify New Data Added
    ${new_row_count} =  Row Count  SELECT * FROM TestScenario_03 WHERE TestCase = 'TC_03_04'
    Log  ${new_row_count}
    Should be Equal as Numbers  ${new_row_count}  ${PREVIOUS_ROW_COUNT + 1}

Verify Last Input
    ${QueryResults} =  Query  SELECT TestCase, DateStamp, Sum_All_Office_Sales FROM TestScenario_03 WHERE TestCase = 'TC_03_04' ORDER BY DateStamp DESC LIMIT 1
    should be equal as strings    ${QueryResults[0][0]}  TC_03_04
    should be equal as numbers    ${QueryResults[0][2]}  ${SUMALLOFFICESALES}
    Log  ${QueryResults}

Log All Rows
    ${QueryResults} =  Query  SELECT * FROM TestScenario_03 WHERE TestCase = 'TC_03_04' ORDER BY DateStamp DESC
    Log Many  ${QueryResults}