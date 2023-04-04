## Case Study Questions

#### 1. What is the total amount each customer spent at the restaurant?

````sql
--  1. What is the total amount each customer spent at the restaurant?
SELECT 
    customer_id,
    SUM(price) AS 'total_amount_spent'
FROM sales s LEFT JOIN menu m ON s.product_id = m.product_id
GROUP BY customer_id
ORDER BY customer_id;
````

|customer_id|total_amount|
|:----|:----|
|A|76|
|B|74|
|C|36|

_______________________________________________________________________________________________________________________________________________________


#### 2. How many days has each customer visited the restaurant?

````sql
-- 2. How many days has each customer visited the restaurant?
SELECT 
    customer_id,
    COUNT(DISTINCT order_date) AS 'freq_visit'
FROM sales
GROUP BY customer_id
ORDER BY 2 DESC;
````
|customer_id|freq_visit|
|:----|:----|
|B|6|
|A|4|
|C|2|
_______________________________________________________________________________________________________________________________________________________

