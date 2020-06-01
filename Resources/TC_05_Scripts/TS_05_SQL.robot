*** Settings ***
Documentation    SQL scripts for TestScenarios TS_05: Define_average_item_count_per_transaction_within_top_3_offices
Library  DatabaseLibrary
Library  Dialogs

*** Variables ***

*** Keywords ***

Minimum item-quantity per transaction all offices
    ${QueryResults} =  Query  SELECT min(quantityOrdered) FROM orderdetails
    Log  ${QueryResults}
Maximum item-quantity per transaction all offices
    ${QueryResults} =  Query  SELECT max(quantityOrdered) FROM orderdetails
    Log  ${QueryResults}
Average item-quantity per transaction all offices
    ${QueryResults} =  Query  SELECT sum(quantityOrdered)/(count(orderNumber)) FROM orderdetails
    Log  ${QueryResults}
Check there are no duplicate item-number rows in orders
    ${QueryResults} =  Query  SELECT orderNumber, productCode, count(productCode) FROM orderdetails Group by orderNumber, productCode Having count(productCode) > 1
    Log  ${QueryResults}
Check there are no NULL item-number rows in orders
    ${QueryResults} =  Query  SELECT * FROM orderdetails WHERE productCode is NULL
    Log  ${QueryResults}
Check numerical value only in item-quantity field
    ${QueryResults} =  Query  SELECT quantityOrdered FROM orderdetails WHERE NOT quantityOrdered BETWEEN 0 and 2147483647
    Log  ${QueryResults}
Minimum item-quantity per transaction by office
    ${QueryResults} =  Query  SELECT min(quantityOrdered), offices.city FROM orderdetails JOIN orders ON orderDetails.orderNumber=orders.orderNumber JOIN customers ON orders.customerNumber=customers.customerNumber JOIN employees ON customers.salesRepEmployeeNumber=employees.employeeNumber JOIN offices ON employees.officeCode=offices.officeCode GROUP BY offices.officeCode ORDER BY min(quantityOrdered)
    Log  ${QueryResults}
Maximum item-quantity per transaction by office
    ${QueryResults} =  Query  SELECT max(quantityOrdered), offices.city FROM orderdetails JOIN orders ON orderDetails.orderNumber=orders.orderNumber JOIN customers ON orders.customerNumber=customers.customerNumber JOIN employees ON customers.salesRepEmployeeNumber=employees.employeeNumber JOIN offices ON employees.officeCode=offices.officeCode GROUP BY offices.officeCode ORDER BY min(quantityOrdered)
    Log  ${QueryResults}
Average item-quantity per transaction by office
    ${QueryResults} =  Query  SELECT sum(quantityOrdered)/(count(orderDetails.orderNumber)) FROM orderdetails JOIN orders ON orderDetails.orderNumber=orders.orderNumber JOIN customers ON orders.customerNumber=customers.customerNumber JOIN employees ON customers.salesRepEmployeeNumber=employees.employeeNumber JOIN offices ON employees.officeCode=offices.officeCode GROUP BY offices.officeCode ORDER BY min(quantityOrdered)
    Log  ${QueryResults}
Count of distinct item-number by office
    ${QueryResults} =  Query  SELECT count(distinct(productCode)) FROM orderdetails
    Log  ${QueryResults}