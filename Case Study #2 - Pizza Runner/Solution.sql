## Case Study Questions

### 1. What is the total amount each customer spent at the restaurant?

````sql
SELECT 
  s.customer_id,
  SUM (m.price)
FROM menu m JOIN sales s ON m.product_id = s.product_id 
GROUP BY customer_id
ORDER BY s.customer_id 
````

|customer_id |price| SUM (m.price)|
|----------- | ---- | ----------- |
|A           |  10|         76|
|B           |  10|         74|
|C           |  12|         36|

#### Answer: 
Customer A: $76

Customer B: $74

Customer C: $36

_______________________________________________________________________________________________________________________________________________________


### 2. How many days has each customer visited the restaurant?
