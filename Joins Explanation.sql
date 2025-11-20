-- CREATE DATABASE
CREATE DATABASE joins_practice;
USE joins_practice;
-- CREATE TABLES
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50)
);

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_amount DECIMAL(6,2),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);
-- INSERT SAMPLE CUSTOMER DATA
INSERT INTO customers (customer_id, first_name, last_name)
VALUES
(1, 'John', 'Doe'),
(2, 'Anna', 'Smith'),
(3, 'Mike', 'Brown'),
(4, 'Sara', 'Lee'),
(5, 'David', 'King');
-- INSERT SAMPLE ORDER DATA
INSERT INTO orders (order_id, customer_id, order_amount)
VALUES
(101, 1, 50.00),
(102, 2, 75.00),
(103, 1, 30.00),
(104, 4, 120.00),
(105, NULL, 90.00);   -- Order without customer

select * from customers;
select * from orders;
-- left join--------------------------------------------------------------
 SELECT c.customer_id, CONCAT(c.first_name,' ',c.last_name) as customer_name,
 o.order_id, o.order_amount
 FROM customers c 
 LEFT JOIN orders o
 ON c.customer_id = o.customer_id;
 
 -- left outer join ---------------------------------------------
 SELECT c.customer_id, CONCAT(c.first_name,' ',c.last_name) as customer_name,
 o.order_id, o.order_amount
 FROM customers c 
 LEFT JOIN orders o
 ON c.customer_id = o.customer_id
 WHERE o.customer_id is null;
 
 -- RIGHT JOIN  ----------------------------------------------
 SELECT c.customer_id, CONCAT(c.first_name,' ',c.last_name) as customer_name,
 o.order_id, o.order_amount
 FROM customers c 
 RIGHT JOIN orders o
 ON c.customer_id = o.customer_id;

-- Right outer join  -----------------------------------------
 SELECT c.customer_id, CONCAT(c.first_name,' ',c.last_name) as customer_name,
 o.order_id, o.order_amount
 FROM customers c 
 RIGHT JOIN orders o
 ON c.customer_id = o.customer_id
 WHERE c.customer_id is null ;
 
 -- INNER JOIN ---------------------------------------------------------------
 --   Here one thing to be noted that the JOIN or INNER JOIN works as same 
 SELECT c.customer_id, CONCAT(c.first_name,' ',c.last_name) as customer_name,
 o.order_id, o.order_amount
 FROM customers c 
 INNER JOIN orders o --  join performs same as inner 
 ON c.customer_id = o.customer_id;
 
 -- CROSS/Cartesian Join ------------------------------------------
 
 SELECT c.customer_id, CONCAT(c.first_name,' ',c.last_name) as customer_name,
 o.order_id, o.order_amount
 FROM customers c  CROSS JOIN orders o;
 
 -- UNION --------------------------------------
 
SELECT c.customer_id, CONCAT(c.first_name,' ',c.last_name) as customer_name,
 o.order_id, o.order_amount
 FROM customers c 
 LEFT JOIN orders o
 ON c.customer_id = o.customer_id
 UNION 
 SELECT c.customer_id, CONCAT(c.first_name,' ',c.last_name) as customer_name,
 o.order_id, o.order_amount
 FROM customers c 
 RIGHT JOIN orders o
 ON c.customer_id = o.customer_id;
