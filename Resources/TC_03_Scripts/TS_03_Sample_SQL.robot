*** Settings ***
Documentation    SQL scripts for TestScenarios TS_03: Validate that no order has been shipped before payment has been made
Library  DatabaseLibrary
Library  Dialogs

*** Variables ***
${COUNT_OF_CUSTOMERS}
${PREVIOUS_ROW_COUNT}
*** Keywords ***

Count of Queensland Customers
    ${QueryResults[0][0]} =  Row Count  SELECT distinct(customerNumber) FROM customers where state = "Queensland"
    Set Suite Variable  ${COUNT_OF_CUSTOMERS}  ${QueryResults[0][0]}
    Log  ${QueryResults[0][0]}

Verify Count is not NULL or 0
    Should be True    ${COUNT_OF_CUSTOMERS}

Save Current Row Count
    ${current_row_count} =  Row Count   SELECT * FROM AutomationDemo
    Set Suite Variable  ${PREVIOUS_ROW_COUNT}  ${current_row_count}
    Log  ${current_row_count}

Insert Record
    Execute SQL String  INSERT INTO AutomationDemo (Datestamp, QueenslandCustomers) VALUES (cast(current_timestamp() as char), '${COUNT_OF_CUSTOMERS}')

Verify New Record Added
    ${new_row_count} =  Row Count  SELECT * FROM AutomationDemo
    Log  ${new_row_count}
    Should be Equal as Numbers  ${new_row_count}  ${PREVIOUS_ROW_COUNT + 1}

Verify Last Record
    ${QueryResults} =  Query  SELECT * FROM AutomationDemo ORDER BY ItemID DESC LIMIT 1
    Should be Equal as Numbers  ${QueryResults[0][2]}  ${COUNT_OF_CUSTOMERS}
    Log  ${QueryResults[0][2]}

Log All Rows
    ${QueryResults} =  Query  SELECT * FROM AutomationDemo ORDER BY ItemID
    Log Many  ${QueryResults}