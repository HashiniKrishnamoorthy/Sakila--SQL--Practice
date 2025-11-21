USE sakila;
-- 1. Identify if there are duplicates in Customer table. Don't use customer id to check the duplicates
SELECT first_name, last_name,email,
COUNT(*) as Duplicate_members
FROM customer
GROUP BY first_name, last_name,email
HAVING COUNT(*) > 1;

-- ** 2. Number of times letter 'a' is repeated in film descriptions
SELECT * FROM film;

SELECT description,
length(description) - LENGTH(REPLACE(description, 'a', ''))
from film;

-- 3.*** Number of times each vowel is repeated in film descriptions 
select sum(length(description) - length(replace(lower(description),'a',''))) as a_count,
sum(length(description) - length(replace(lower(description),'e',''))) as e_count,
sum(length(description) - length(replace(lower(description),'i',''))) as i_count,
sum(length(description) - length(replace(lower(description),'o',''))) as o_count,
sum(length(description) - length(replace(lower(description),'u',''))) as u_count
 from sakila.film;

-- 4. Display the payments made by each customer 1. Month wise, 2. Year wise, 3. Week wise
SELECT * FROM customer; SELECT * FROM PAYMENT;

SELECT CONCAT(c.first_name,' ', c.last_name), p.customer_id,MONTHNAME(p.payment_date), sum(amount)
FROM payment as p 
JOIN customer as c
ON p.customer_id = c.customer_id
GROUP BY p.customer_id, MONTHNAME(payment_date); 
-- YEAR WISE--

SELECT CONCAT(c.first_name,' ', c.last_name) AS customer_name, p.customer_id,
YEAR(p.payment_date), sum(amount)
FROM payment as p 
JOIN customer as c
ON p.customer_id = c.customer_id
GROUP BY p.customer_id, YEAR(payment_date); 

-- WEEK WISE--

SELECT payment_id, customer_id, WEEK(payment_date) from payment;

SELECT CONCAT(c.first_name,' ', c.last_name) AS customer_name, 
p.customer_id, WEEK(p.payment_date),MONTH(payment_date), sum(amount)
FROM payment as p 
JOIN customer as c
ON p.customer_id = c.customer_id
GROUP BY p.customer_id, WEEK(payment_date),MONTH(payment_date); 

-- -------------------------------------------------------------

-- 5.*** Check if any given year is a leap year or not. You need not consider any table from sakila database. Write within the select query with hardcoded date
SELECT
CASE 
WHEN DAY(LAST_DAY(2023-02-01)) = 29
THEN 'LEAP YEAR'
ELSE 'NOT A LEAP YEAR'
END AS LEAP_YEAR_STATUS; 

-- ----------------------------------------------------
-- 6. Display number of days remaining in the current year from today.
SELECT DATEDIFF('2025-12-31', CURDATE()) AS days_remaining;

SELECT DATEDIFF('2025-12-31', now()) AS days_remaining;

-- ----------------------------------------------------------------
-- 7. Display quarter number(Q1,Q2,Q3,Q4) for the payment dates from payment table.
-- Q1- (1,2,3), Q2-(4,5,6), Q3-(7,8,9), Q4-(10,11,12)
SELECT * FROM payment; 

SELECT payment_id, payment_date,
CONCAT('Q',quarter(payment_date)) from payment;
-- ---------------------------------------------------------

-- 8. Display the age in year, months, days based on your date of birth. 
   -- For example: 21 years, 4 months, 12 days
   
   
SELECT 
    CONCAT(
        TIMESTAMPDIFF(YEAR, '2003-06-15', CURDATE()), ' years, ',
        TIMESTAMPDIFF(MONTH, '2003-06-15', CURDATE())  - TIMESTAMPDIFF(YEAR, '2003-06-15', CURDATE()) * 12, 
        ' months, ',
        TIMESTAMPDIFF(
            DAY,
            DATE_ADD(
                '2003-06-15',
                INTERVAL TIMESTAMPDIFF(MONTH, '2003-06-15', CURDATE()) MONTH), CURDATE() ), ' days'
    ) AS exact_age;
