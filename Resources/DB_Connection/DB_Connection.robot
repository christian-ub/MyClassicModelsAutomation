*** Settings ***
Library  DatabaseLibrary
Library  Dialogs

*** Variables ***
${DB_NAME}              classicmodels
${DB_USER_NAME}         root
${DB_USER_PASSWORD}     Christian54
${DB_HOST}              localhost
${DB_PORT}              3306

*** Keywords ***
Connect
    Connect to Database  pymysql  ${DB_NAME}  ${DB_USER_NAME}  ${DB_USER_PASSWORD}  ${DB_HOST}  ${DB_PORT}

Disconnect
    Disconnect From Database
