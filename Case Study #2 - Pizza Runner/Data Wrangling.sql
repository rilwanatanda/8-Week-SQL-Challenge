 -- =============================================================================================================================
-- DATA WRANGLING
-- =============================================================================================================================

-- The first step is to visually assess the tables to look for Data Quality 
    SELECT * FROM customer_orders;
  SELECT * FROM pizza_names;
  SELECT * FROM pizza_recipes;
  SELECT * FROM pizza_toppings;
  SELECT * FROM runner_orders;
  SELECT * FROM runners;
  
  -- After Assessing the data, the "runners" table, the "pizza_names" table and the "pizza toppings" table are quality
