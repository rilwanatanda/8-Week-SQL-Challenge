## Case Study Questions

### 1. What is the total amount each customer spent at the restaurant?

````sql
SELECT 
    customer_id,
    SUM(price) AS 'total_amount_spent'
FROM sales s LEFT JOIN menu m ON s.product_id = m.product_id
GROUP BY customer_id
ORDER BY customer_id;
````

|customer_id |total_amount_spent|
|----------- | ---------------- |
|A           |               76|
|B           |              74|
|C           |              36|

_______________________________________________________________________________________________________________________________________________________


### 2. How many days has each customer visited the restaurant?
