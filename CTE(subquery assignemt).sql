-- CTE (subquery assignment questions)
USE sakila;
-- 1. display all customer details who have made more than 5 payments.
select * from payment;
WITH customer_details as(
select c.customer_id, CONCAT(c.first_name, ' ' ,c.last_name) as customer_name,
p.payment_id , p.amount ,p.payment_date 
from customer c join payment p
on c.customer_id = p.customer_id )
select customer_id,customer_name from customer_details
GROUP BY customer_id 
HAVING COUNT(payment_id) > 5;

-- 2. Find the names of actors who have acted in more than 10 films.
select * from actor; select * from film_actor;

WITH actor_information as(
SELECT a.actor_id, CONCAT(a.first_name,' ',a.last_name) as actor_name ,
fa.film_id , f.title from actor a
join film_actor fa on a.actor_id = fa.actor_id
join film  f on fa.film_id = f.film_id)
select actor_id , actor_name from actor_information
GROUP BY actor_id 
HAVING count(film_id) > 10;

-- 3. Find the names of customers who never made a payment.

WITH customer_payment as(
select c.customer_id , c.first_name as customer_name ,
p.payment_id, p.amount 
from customer c join payment p
on c.customer_id = p.customer_id)
select * from customer_payment
WHERE payment_id is null;

-- -- 4. List all films whose rental rate is higher than the average rental rate of all films.

WITH film_title as(
select film_id, title, rental_rate, (select avg(rental_rate) from film limit 1) as average
from film )
select * from film_title
where rental_rate > average;

-- 5. List the titles of films that were never rented.

WITH film_rentals as(
SELECT film.film_id, film.title, rental.rental_id
FROM film LEFT join inventory ON film.film_id = inventory.film_id 
LEFT JOIN rental on inventory.inventory_id = rental.inventory_id )
select * from film_rentals 
where rental_id is null;

-- 6.Display the customers who rented films in the same month as customer with ID 5.

WITH cust5_rental AS (
    SELECT 
        MONTH(rental_date) AS rent_month,
        YEAR(rental_date) AS rent_year
    FROM rental
    WHERE customer_id = 5
    ORDER BY rental_date
    LIMIT 1
)
SELECT DISTINCT 
    c.customer_id,
    CONCAT(c.first_name, ' ', c.last_name) AS customer_name
FROM customer c
JOIN rental r 
    ON c.customer_id = r.customer_id
 JOIN cust5_rental cr
WHERE MONTH(r.rental_date) = cr.rent_month
  AND YEAR(r.rental_date) = cr.rent_year
  AND c.customer_id <> 5
  order by c.customer_id;


 -- 7. Find all staff members who handled a payment greater than the average payment amount.
 
 WITH staff_members as (
 SELECT distinct s.staff_id, CONCAT(s.first_name,' ',s.last_name) as staff_name,
 p.amount, (select avg(amount) as average_amount from payment) as average_amount
 FROM staff s RIGHT JOIN payment p 
 ON s.staff_id = p.staff_id)
 select distinct staff_id, staff_name from staff_members
 where amount > average_amount;
 
-- 8. Show the title and rental duration of films whose rental duration is greater than the average.

WITH rental_information as(
select rental_duration, title, 
(select avg(rental_duration) from film limit 1) as average from
film)
select title from rental_information
where average < rental_duration;

--   9. Find all customers who have the same address as customer with ID 1.

WITH customer_name as(
select customer_id, address_id , first_name , last_name 
from customer)
select * from customer_name 
where address_id = (select address_id from customer_name where customer_id = 1) ;


-- 10.List all payments that are greater than the average of all payments.

WITH payment_details as(
select payment_id, amount, (select avg(amount) from payment) as average 
from payment)
select * from payment_details
where amount > average;

