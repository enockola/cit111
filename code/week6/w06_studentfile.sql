-- *********************************
-- W06 STUDENT SQL WORKBOOK
-- *********************************

-- *********************************
-- CRUD - DDL / DML
-- C = Create the Database (FORWARD ENGINEER / INSERT)
-- R = Read the Data (SELECT)
-- U = Update the Database (ALTER / UPDATE)
-- D = Delete Data or Database (DROP / DELETE)
-- *********************************

-- ***
-- C
-- ***
/*
    List the column names in the INSERT statement so you know
    which columns you are inserting into. We do not need to 
    list the primary key column as it is auto-incrementing
    
    Here is an example template:
    
    INSERT INTO tablename
    ( column_1
    , column_2
    , etc)
    VALUES
    ( 'String value'
    , 12
    , '2024-01-31' );

    For more than one record, replace the ; with a comma then
    repeat the same structure as the previous tuple.
*/

-- 1. Open and run the church_insert.sql file

-- 2. Write an INSERT statement for all parent tables
-- 3. Write an INSERT statement for all child tables
-- 4. Write an INSERT statement for all linking tables



-- ***
-- R
-- ***

-- 5. Switch system to use the 'church' database

/* 6.
 Click on the table icon next to each table in the Schema list
 to auto generate a SELECT all statement
*/



-- ***
-- U
-- ***

/*
  Here is an example template for the UPDATE statement:
  UPDATE tablename
  SET    column_name = 'string value'
  WHERE  table_primary_key = 1;
*/

 -- 7. Update the calling of Doris to Relief Society President

-- ***
-- D
-- ***

/*
  Here is an example template for the DELETE statement:
  DELETE FROM tablename
  WHERE  table_primary_key = 1;
*/
-- 8. Delete the records of Jared MacWilliamns and Doris Garcia


