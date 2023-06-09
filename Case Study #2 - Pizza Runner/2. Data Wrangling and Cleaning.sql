-- =============================================================================================================================
-- DATA WRANGLING
-- =============================================================================================================================

-- Firstly, it is best practice to go through the data (access it) to discover the data quality issues and abnormalities in the data.
-- Since the data is not a big data, Visual Assessment works just fine for the data.

-- The first step is to visually Assess the tables to look for Data Quality 
SELECT * FROM customer_orders;
SELECT * FROM pizza_names;
SELECT * FROM pizza_recipes;
SELECT * FROM pizza_toppings;
SELECT * FROM runner_orders;
SELECT * FROM runners;

-- After Assessing the data, the "runners" table, the "pizza_names" table, the "pizza_recipes" table and the "pizza toppings" table have no issues.
-- But the "customer_orders" table and the "runner_orders" table have quality issues.
  

-- =============================================================================================================================
-- DATA CLEANING
-- =============================================================================================================================
-- After identifying the issues with the tables, this is the stage where the data quality issues are dealt with


-- ==================================================================================================
-- 1. On the `customer_order`s table, 
-- Replace `null` strings and NULL values with blank space ('') in exclusions and extras column.
-- ==================================================================================================

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
--    In distance column, remove “km” and replace “null” string with blank space ('').
--    In duration column, remove “mins”, “minute”, “minutes”, and “null” strings then replace it with blank space ('').
--    Modify the data type of pickup_time to DATETIME, distance to FLOAT, and duration to INT.
-- =============================================================================================================================

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
EXEC sp_columns runner_orders;


-- To change the datatype of the columns
ALTER TABLE runner_orders
ALTER COLUMN pickup_time DATETIME;

ALTER TABLE runner_orders
ALTER COLUMN distance INT;

ALTER TABLE runner_orders
ALTER COLUMN duration INT;


-- *****************************************************************************************************************************
-- This Wraps up all the data cleaning requirements for the challenge.
-- *****************************************************************************************************************************
