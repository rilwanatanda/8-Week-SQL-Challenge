-- #################################################################
-- Case Study #1 - Danny's Diner
-- #################################################################

--Creating Database
DROP DATABASE IF EXISTS dannys_diner;
CREATE DATABASE dannys_diner;

USE dannys_diner;

-- Creating `sales` table
CREATE TABLE sales (
  "customer_id"     CHAR(1),
  "order_date"      DATE,
  "product_id"      INTEGER
);

-- Inserting data into `sales` table
INSERT INTO sales VALUES
  ('A', '2021-01-01', '1'),
  ('A', '2021-01-01', '2'),
  ('A', '2021-01-07', '2'),
  ('A', '2021-01-10', '3'),
  ('A', '2021-01-11', '3'),
  ('A', '2021-01-11', '3'),
  ('B', '2021-01-01', '2'),
  ('B', '2021-01-02', '2'),
  ('B', '2021-01-04', '1'),
  ('B', '2021-01-11', '1'),
  ('B', '2021-01-16', '3'),
  ('B', '2021-02-01', '3'),
  ('C', '2021-01-01', '3'),
  ('C', '2021-01-01', '3'),
  ('C', '2021-01-07', '3');
 
-- Creating `menu` table
CREATE TABLE menu (
  "product_id"      INTEGER,
  "product_name"    VARCHAR(5),
  "price"           INTEGER
);

-- Inserting data into `menu` table
INSERT INTO menu VALUES
  ('1', 'sushi', '10'),
  ('2', 'curry', '15'),
  ('3', 'ramen', '12');
  
-- Creating `members` table
CREATE TABLE members (
  "customer_id"     CHAR(1),
  "join_date"       DATE
);

-- Inserting data into `members` table
INSERT INTO members VALUES
  ('A', '2021-01-07'),
  ('B', '2021-01-09');
