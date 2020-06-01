*** Settings ***
Documentation    SQL scripts for TS_02 Test Cases: Validate that no order has been shipped before payment has been made
Library  DatabaseLibrary
Library  Dialogs

*** Keywords ***
Count of orders shipped
    ${QueryResults} =  Query  SELECT count(orderNumber) FROM orders where shippedDate is not null and shippedDate >= 01/01/1962 and ((GETDATE() - shippedDate) >7)
    Log  ${QueryResults}
Count of orders that have not yet been shipped
    ${QueryResults} =  Query  SELECT count(orderNumber) FROM orders where shippedDate is null and shippedDate >= 01/01/1962 and ((GETDATE() - shippedDate) >7)
    Log  ${QueryResults}
Count of orders shipped after payment received
    ${QueryResults} =  Query  SELECT count(orderNumber) FROM orders o left join payments p on o.customerNumber = p.customerNumber where shippedDate > paymentDate and shippedDate is not null and shippedDate >= 01/01/1962 and ((GETDATE() - shippedDate) >7)
     Log  ${QueryResults}
Count of orders not shipped as payment not received
    ${QueryResults} =  Query  SELECT count(orderNumber) FROM orders o left join payments p on o.customerNumber = p.customerNumber where paymentDate is null and shippedDate is null
     Log  ${QueryResults}
Count of orders shipped before payment has been received
    ${QueryResults} =  Query  SELECT count(orderNumber) FROM orders o left join payments p on o.customerNumber = p.customerNumber where shippedDate < paymentDate and shippedDate is not null and shippedDate >= 01/01/1962
    Log  ${QueryResults}
Sum of orders shipped before payment has been received
    ${QueryResults} =  Query  SELECT sum(amount) FROM orders o left join payments p on o.customerNumber = p.customerNumber where shippedDate < paymentDate and shippedDate is not null and shippedDate >= 01/01/1962
    Log  ${QueryResults}
Count of orders that do not have a shipped date or payment date
    ${QueryResults} =  Query  SELECT count(orderNumber) FROM orders o left join payments p on o.customerNumber = p.customerNumber where (shippedDate is null or paymentDate is null) and shippedDate >= 01/01/1962
    Log  ${QueryResults}
Check that all shipped dates match date format
    ${QueryResults} =  Query  SELECT count(orderNumber) FROM orders o left join payments p on o.customerNumber = p.customerNumber where shippedDate is null or shippedDate < 01/01/1962 or shippedDate > GETDATE()
    Log  ${QueryResults}
Check tha all payment dates match date format
    ${QueryResults} =  Query  SELECT count(orderNumber) FROM orders o left join payments p on o.customerNumber = p.customerNumber where paymentDate is null or paymentDate < 01/01/1962 or paymentDate > GETDATE()
    Log  ${QueryResults}
Count of orders that were shipped before order date
    ${QueryResults} =  Query  SELECT count(orderNumber) FROM orders where shippedDate < orderDate and shippedDate is not null and shippedDate >= 01/01/1962
    Log  ${QueryResults}
