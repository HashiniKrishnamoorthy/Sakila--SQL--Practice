-- INTRODUCTION TO SUBQUERY AND THEIR TYPES
 -- Subquery is a query inside a query, it has so many advantages as well as disadvantages

-- Create a two tables with customers and orders
CREATE database Practice;
use Practice;
CREATE TABLE customer
(customer_id int, first_name char(100) , last_name char(100), order_id int);
CREATE TABLE orders
(order_id int,customer_id int, order_status char(100) ); 

-- INSERT DATA INTO BOTH THE TABLE
INSERT INTO customer
(customer_id,first_name,last_name,order_id)
VALUES 
(1, 'hasi','reddy', 1) ,
(2,'chandu', 'chowdary', 1),
(3,'bob', 'daniel', 2),
(4,'alice', 'jon', 4),
(5, 'jonny','don', NULL),
(6,'kushi', 'kapoor', NULL);
SELECT * FROM customer;

INSERT INTO orders
(order_id, customer_id,order_status)
VALUES
(1, 1, 'Deliverd'),
(1, 2, 'Shipped'),
(2, 3, 'Shipped'),
(2,2,'ordered'),
(3, NULL , NULL),
(4, 4, 'Processed'),
(5, NULL, NULL);

SELECT * FROM customer;
SELECT * FROM orders;

-- PERFORMING SUBSQUERY ON THIS TABLE 
-- SUBSQUERY is basicallu query inside a query to get results from two tables
-- ------ TYPE 1 -------------------
-- USING SUBQUERY FOR FILTERING PURPOSE (BASICALLY IN WHERE CLAUSE)
-- Find all customers whose order status is 'Shipped'.
SELECT * FROM orders;
SELECT * FROM customer
WHERE customer_id IN 
(SELECT customer_id FROM orders
WHERE order_status = 'Shipped');

-- ------------TYPE 2----------------------------
-- USING SUBQUERY IN SELECT STATEMENT 
-- For each customer, display the order_id and the total customers linked to that order.
SELECT *,
(select
 count(*) as total_customers
FROM orders 
where orders.customer_id = customer.customer_id) as total_customers_linked
-- Here the subquery is also a correlated subquery because the 
--       outer table column is reffered to get the result.
FROM customer;

-- one more example for both correlated and select statement types
-- Display each customer along with the total number of orders they have made
SELECT customer_id , concat(first_name ,' ',last_name) as customer_name,
(select count(*) FROM orders
WHERE orders.customer_id = customer.customer_id) as tatal_number_customers
FROM customer;

-- --------------TYPE 3 ------------------------
-- SELECT STATEMENT IS USED TO GET THE DERIVED TABLES 
-- Using a subquery in FROM, list all customers whose order_id occurs more than once.
SELECT first_name, last_name
from customer c
JOIN ( select order_id
          from customer
          group by order_id
          having count(*) > 1) as repeated_orders
on c.order_id  = repeated_orders.order_id;
-- validate it 
SELECT * FROM customer;
DROP DATABASE practice;
-- the drawback for the subquery 
--    1. the scope of the subquery is limited to query only and the results also limited to that level itself
--    2. subquery takes alot of time to get result because the query should go row by row to
--          according to order of execution ,  top overcome their where alot of them where came 