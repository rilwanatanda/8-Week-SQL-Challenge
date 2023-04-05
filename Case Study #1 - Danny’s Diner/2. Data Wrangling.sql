-- =============================================================================================================================
-- DATA WRANGLING
-- =============================================================================================================================

-- Firstly, it is best practice to go through the data (access it) to discover the data quality issues and abnormalities in the data.
-- Since the data is not a big data, Visual Assessment works just fine for the data.

-- The first step is to visually Assess the tables to look for Data Quality 
SELECT * FROM sales;
SELECT * FROM menu;
SELECT * FROM members;

-- After Assessing the data, the "runners" table, the "pizza_names" table, the "pizza_recipes" table and the "pizza toppings" table have no issues.
-- But the "customer_orders" table and the "runner_orders" table have quality issues.
