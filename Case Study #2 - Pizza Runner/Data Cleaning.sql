-- =============================================================================================================================
-- DATA CLEANING PROCESS
-- =============================================================================================================================
/*
Before we start the cleaning process, it is best practice to go through the data (access it) to discover the data quality issues and abnormalities in the data.
Since the data is not a big data, Visual Assessment works just fine for the data.

After identifying the issues with the tables, this is the stage where the data quality issues are dealt with
*/

-- =============================================================================================================================
-- 1. On the `customer_order`s table, 
-- Replace `null` strings and NULL values with blank space ('') in exclusions and extras column.
-- =============================================================================================================================
-- for the null and blank values in the extrusions column
UPDATE customer_orders
SET exclusions = CASE 
                  WHEN exclusions = '' THEN NULL 
                  WHEN exclusions = 'null' THEN NULL 
                  ELSE exclusions
                 END;

-- for the null and blank values in the extras column
UPDATE customer_orders
SET extras = CASE 
              WHEN extras = '' THEN NULL 
              WHEN extras = 'null' THEN NULL 
              ELSE extras
             END;


--To Check if the code works
SELECT * FROM customer_orders;


-- =============================================================================================================================
-- 2. On the `runner_orders` table
--    Replace `null` strings and NULL values with blank space ('').
--    In distance column, remove “km” and replace “null” string with blank space “ ”.
--    In duration column, remove “mins”, “minute”, “minutes”, and “null” strings then replace it with blank space ('').
--    Modify the data type of pickup_time to DATETIME, distance to FLOAT, and duration to INT.
-- =============================================================================================================================

For the runner_orders table: Data Quality issues observed are

the pickup_time column has ‘null’ values
--  In the distance colum has the appearance of ‘km’, ‘null’ values and ‘ km’
the duration column has the appearance of ‘minutes’, ‘null’, ‘mins’, ‘minute’
the cancellation column has the appearance of ‘null’ and ‘ ‘
Change the data types of the corrected columns
The Code that would take care of these quality issues

-- In pickup_time column, remove 'null' string and replace with blank space ('').
UPDATE runner_orders
SET pickup_time = CASE
                    WHEN pickup_time = 'null' THEN NULL 
                    ELSE pickup_time
                  END;
 
-- In distance column, remove 'null' string, 'km' and ' km' and replace with blank space ('').
UPDATE runner_orders
SET distance = CASE 
                  WHEN distance = 'null' THEN NULL 
                  WHEN distance LIKE '%km' THEN TRIM(REPLACE(distance, 'km', '')) 
                  ELSE distance
                END;

-- In duration column, remove 'null' string, 'minutes', 'mins', 'minute' and replace with blank space ('').
UPDATE runner_orders
SET duration = CASE
                WHEN duration LIKE '%min%' THEN LEFT(duration, 2) 
                WHEN duration = 'null' THEN NULL 
                ELSE duration
              END ;
 
 -- In cancellation column, replace 'null' string ith blank space ('').
UPDATE runner_orders
SET cancellation = CASE 
                    WHEN cancellation IN ('null', '') THEN NULL 
                    ELSE cancellation
                   END;

-- =============================================================================================================================
-- 3.  Modify the data type of pickup_time to DATETIME, distance to FLOAT, and duration to INT.
-- =============================================================================================================================
-- Next step is to check the data type of the column
DESCRIBE runner_orders;

-- To change the datatype of the columns
ALTER TABLE runner_orders
MODIFY COLUMN pickup_time DATETIME;

ALTER TABLE runner_orders
MODIFY COLUMN distance INT;

ALTER TABLE runner_orders
MODIFY COLUMN duration INT;


-- =============================================================================================================================
-- This Wraps up all the data cleaning requirements for the challenge.
-- =============================================================================================================================
