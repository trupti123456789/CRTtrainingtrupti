#How to fetch the data from MSSQL/SQL/ANY database?
#Whether CRT is able to connect with SQL/MSSQL/any database to retrieve the data? In order to proceed the test execution with the fetched values?

*** Settings ***
Documentation      Sample MySQL tests.
Library            DatabaseLibrary
# Database connection and disconnect done in setup and teardown. Can be also in a custom keyword
# or in the test case itself.
Suite Setup        Connect To Database    ${dbapimodule}  ${dbname}  ${dbuser}  ${dbpass}  ${dbhost}  ${dbport}
Suite Teardown     Disconnect From Database


*** Variables ***
# dbname, dbuser, dbpass and dbhost should be set in suite/robot variables
${dbapimodule}     pymysql
${dbname}          name
${dbuser}          user
${dbpass}          pass
${dbhost}          host
${dbport}          3306    # default port for MySQL protocol


*** Test Cases ***
Create person table
    [Tags]            db    create_table
    ${output}=        Execute SQL String
    ...               CREATE TABLE person (id integer unique,first_name varchar(20),last_name varchar(20));
    Log               ${output}
    Should Be Equal As Strings    ${output}    None

Execute SQL Script - Insert Data person table
    [Tags]            db    sql_script    insert
    Comment           ${output} =    Execute SQL Script    ${CURDIR}/../resources/insert_data.sql
    ${output}=        Execute SQL Script    ${CURDIR}/../resources/insert_data.sql
    Log               ${output}
    Should Be Equal As Strings    ${output}    None

Verify Query - Get results as a list of dictionaries
    [Tags]            db    query
    ${output}=        Query    SELECT * FROM person;    \    True
    Log               ${output}
    Should Be Equal As Strings    ${output[0]}[first_name]    Franz Allan
    Should Be Equal As Strings    ${output[1]}[first_name]    Jerry

Drop person and foobar tables
    [Tags]            db    drop_table
    ${output}=        Execute SQL String    DROP TABLE IF EXISTS person,foobar;
    Log               ${output}
    Should Be Equal As Strings    ${output}    None
    
    
    
    
    
    #Resource File:
    INSERT INTO person VALUES(1,'Franz Allan','See');
INSERT INTO person VALUES(2,'Jerry','Schneider');
