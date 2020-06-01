*** Settings ***
Documentation   SQL scripts for TC_04_07: Top 3 offices ranked by sales
Library  DatabaseLibrary
Library  Dialogs

*** Variables ***
${TestCase}
${TestStatus}
${RANKEDTABLE}
${Test_Column_1}
${Test_Column_2}
${Test_Column_3}
@{TestValue_Column_n}
${PREVIOUS_ROW_COUNT}
${Insert_DateStamp}

*** Keywords ***
Set Variables    # Manual insert of TestCase and Test_Columns
    set test variable    ${TestCase}    TC_04_07
    @{TestColumnNames} =     create list     Top_3_Office_Rank    Top_3_Offices    Top_3_Office_Sale_Sum
    FOR    ${TestColumnNames}    IN    @{TestColumnNames}
        set test variable    ${Test_Column_1}    ${1 + 1}
        set test variable    ${TestColumnName} =    catenate    SEPARATOR=_    "Test_Column"    1
    END

    #set test variable    ${Test_Column_1}    Top_3_Office_Rank
    #set test variable    ${Test_Column_2}    Top_3_Offices
    #set test variable    ${Test_Column_3}    Top_3_Office_Sale_Sum
    #@{Test_Column_n} =     create list     Top_3_Office_Rank    Top_3_Offices    Top_3_Office_Sale_Sum
    set test variable    ${TestStatus}    Pending

Top 3 offices ranked by sales    # Manual insert of SQL query and handling of variables
    ${QueryResults} =  Query    SELECT RANK() OVER (PARTITION BY NULL ORDER BY TotalSales DESC ) AS `Rnk`, city AS 'City', TotalSales FROM ( SELECT sum(amount) AS 'TotalSales', offices.city FROM payments JOIN customers ON payments.customerNumber=customers.customerNumber JOIN employees ON customers.salesRepEmployeeNumber=employees.employeeNumber JOIN offices ON employees.officeCode=offices.officeCode GROUP BY offices.city ORDER BY sum(amount) desc LIMIT 3 ) AS RANKEDTABLE
    Set test Variable  ${RANKEDTABLE}  ${QueryResults}
    Log Many  ${QueryResults}
    set test variable    ${TestStatus}   'Data retrieved'

Verify Retrieved Data    # Manual insert of verification rules for correctness, partially automated once lists in place
    Should be True      '${RANKEDTABLE[0][2]}'
    Should be True      '${RANKEDTABLE[1][2]}'
    Should be True      '${RANKEDTABLE[2][2]}'
    evaluate    ${RANKEDTABLE[0][2]} > ${RANKEDTABLE[1][2]} > ${RANKEDTABLE[2][2]}
    set test variable    ${TestStatus}   'Retrieved Data Verified'

Save Current Row Count    # Automated
    ${current_row_count} =  Row Count   SELECT * FROM TestScenario_04 WHERE TestCase = '${TestCase}'
    Set test Variable  ${PREVIOUS_ROW_COUNT}  ${current_row_count}
    Log  ${PREVIOUS_ROW_COUNT}

Insert New Data    # Manual insert of Test_Columns and TestValue_Columns, Automated once lists in place
    ${Get_DateStamp} =    Query    SELECT cast(current_timestamp() as char)
    Set test Variable  ${Insert_DateStamp}  ${Get_DateStamp[0][0]}
    Execute SQL String  INSERT INTO TestScenario_04 (TestCase, DateStamp, Test_Status, ${Test_Column_1}, ${Test_Column_2}, ${Test_Column_3}) VALUES ('${TestCase}', '${Insert_DateStamp}', 'PENDING', ${RANKEDTABLE[0][0]}, '${RANKEDTABLE[0][1]}', ${RANKEDTABLE[0][2]}), ('${TestCase}', '${Insert_DateStamp}', 'PENDING', ${RANKEDTABLE[1][0]}, '${RANKEDTABLE[1][1]}', ${RANKEDTABLE[1][2]}), ('${TestCase}', '${Insert_DateStamp}', 'PENDING', ${RANKEDTABLE[2][0]}, '${RANKEDTABLE[2][1]}', ${RANKEDTABLE[2][2]})

Verify New Data Added    # Automated
    ${new_row_count} =  Row Count  SELECT * FROM TestScenario_04 WHERE TestCase = '${TestCase}'
    Log  ${NEW_ROW_COUNT}
    Should be Equal as Numbers  ${NEW_ROW_COUNT}  ${PREVIOUS_ROW_COUNT + 3}
    set test variable    ${TestStatus}   'Unverified Insert Data'

Verify Last Input    # Manual insert of Test_Columns and TestValue_Columns and verification rules for correctness, partially automated once lists in place
    ${QueryResults} =  Query    SELECT TestCase, DateStamp, ${Test_Column_1}, ${Test_Column_2}, ${Test_Column_3} FROM TestScenario_04 WHERE TestCase = '${TestCase}' ORDER BY DateStamp DESC, ${Test_Column_1} LIMIT 3
    run keyword unless    '${QueryResults[0][0]}' =='${TestCase}'
    ...    set test variable    ${TestStatus}   'Corrupt Insert Data'
    run keyword unless    '${QueryResults[1][0]}' =='${TestCase}'
    ...    set test variable    ${TestStatus}   'Corrupt Insert Data'
    run keyword unless    '${QueryResults[2][0]}' =='${TestCase}'
    ...    set test variable    ${TestStatus}   'Corrupt Insert Data'
    run keyword unless    '${QueryResults[0][3]}' == '${RANKEDTABLE[0][1]}'
    ...    set test variable    ${TestStatus}   'Corrupt Insert Data'
    run keyword unless    '${QueryResults[1][3]}' == '${RANKEDTABLE[1][1]}'
    ...    set test variable    ${TestStatus}   'Corrupt Insert Data'
    run keyword unless    '${QueryResults[2][3]}' == '${RANKEDTABLE[2][1]}'
    ...    set test variable    ${TestStatus}   'Corrupt Insert Data'
    run keyword unless    ${TestStatus} == 'Corrupt Insert Data'
    ...    set test variable    ${TestStatus}   'Verified Insert Data'

Update Newly Inserted Data    # Automated once lists in place
    Log    ${TestStatus}
    run keyword and return if    ${TestStatus} == 'Verified Insert Data'
    ...    Execute SQL String  UPDATE TestScenario_04 SET Test_Status = 'PASSED' WHERE TestCase = '${TestCase}' AND DateStamp = '${Insert_DateStamp}'
    run keyword if    ${TestStatus} != 'Verified Insert Data'
    ...    Execute SQL String  UPDATE TestScenario_04 SET ${Test_Column_1} = NULL, ${Test_Column_2} = NULL, ${Test_Column_3} = NULL, Test_Status = 'FAILED' WHERE TestCase = '${TestCase}' AND DateStamp = '${Insert_DateStamp}'
    fail    Corrupt Insert Data

Log All Rows    # Automated
    Log    ${TestStatus}
    ${QueryResults} =  Query  SELECT * FROM TestScenario_04 WHERE TestCase = '${TestCase}' ORDER BY DateStamp DESC, ${Test_Column_1}
    Log Many  ${QueryResults}
