*** Settings ***
Documentation  Test Cases for TS_05: Define_average_item_count_per_transaction_within_top_3_offices
Resource    ../Resources/TS_05_SQL.robot
Resource    ../Resources/DB_Connection.robot
Test Setup  DB_Connection.Connect
Test Teardown  DB_Connection.Disconnect

#  robot -d results TestSuites/TS_05_Tests.robot

*** Test Cases ***
Minimum item-quantity per transaction all offices
    #[Tags]
    TS_05_SQL.Minimum item-quantity per transaction all offices
Maximum item-quantity per transaction all offices
    #[Tags]
    TS_05_SQL.Maximum item-quantity per transaction all offices
Average item-quantity per transaction all offices
    #[Tags]
    TS_05_SQL.Average item-quantity per transaction all offices
Check there are no duplicate item-number rows in orders
    #[Tags]
    TS_05_SQL.Check there are no duplicate item-number rows in orders
Check there are no NULL item-number rows in orders
    #[Tags]
    TS_05_SQL.Check there are no NULL item-number rows in orders
Check numerical value only in item-quantity field
    #[Tags]
    TS_05_SQL.Check numerical value only in item-quantity field
Minimum item-quantity per transaction by office
    #[Tags]
    TS_05_SQL.Minimum item-quantity per transaction by office
Maximum item-quantity per transaction by office
    #[Tags]
    TS_05_SQL.Maximum item-quantity per transaction by office
Average item-quantity per transaction by office
    #[Tags]
    TS_05_SQL.Average item-quantity per transaction by office
Count of distinct item-number by office
    #[Tags]
    TS_05_SQL.Count of distinct item-number by office
