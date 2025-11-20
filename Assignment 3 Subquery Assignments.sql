USE sakila;

-- 1. display all customer details who have made more than 5 payments.

SELECT customer_id,first_name,last_name
FROM customer
WHERE customer_id IN (
    SELECT customer_id
    FROM payment
    GROUP BY customer_id
    HAVING COUNT(payment_id) > 5
);

-- 2. Find the names of actors who have acted in more than 10 films.
SELECT * FROM actor;
SELECT * FROM film_actor;

SELECT actor_id, CONCAT(first_name,' ',last_name) as customer_name 
FROM actor 
WHERE actor_id IN ( SELECT actor_id  FROM film_actor 
					GROUP BY actor_id
                    HAVING COUNT(film_id > 10) );

-- 3. Find the names of customers who never made a payment.
SELECT customer_id,CONCAT(first_name,' ',last_name) as customer_name
FROM customer
WHERE customer_id NOT IN (
    SELECT DISTINCT customer_id
    FROM payment
);

-- 4. List all films whose rental rate is higher than the average rental rate of all films.
SELECT * FROM film; SELECT AVG(rental_rate) FROM film;

SELECT film_id, title 
FROM film
WHERE rental_rate > (SELECT avg(rental_rate) FROM film);

-- *** 5. List the titles of films that were never rented.
SELECT * FROM film; SELECT * FROM rental; SELECT * FROM inventory;

SELECT film.film_id, film.title
FROM film LEFT join inventory ON film.film_id = inventory.film_id 
LEFT JOIN rental on inventory.inventory_id = rental.inventory_id 
WHERE rental.rental_id is null;

-- 6. Display the customers who rented films in the same month as customer with ID 5.
 select* from customer; select * from rental;
 -- one of the lesson here is in sql IN and LIMIT will not be accepted in a 
 -- statement in subquery be causicious
 SELECT distinct c.customer_id,CONCAT(c.first_name,' ', c.last_name) as customer_name
 From customer c JOIN rental r ON c.customer_id = r.customer_id
 WHERE month(rental_date) = (SELECT month(rental_date) FROM rental 
	where customer_id = 5 
    LIMIT 1)
 AND 
 YEAR(rental_date)  =( SELECT YEAR(rental_date) 
   from rental 
    where customer_id = 5
		limit 1)
AND 
c.customer_id <> 5; -- bascially we are selecting customer apart from id 5 so not equal is used
 
 -- 7. Find all staff members who handled a payment greater than the average payment amount.
select * from payment;
 SELECT distinct s.staff_id, CONCAT(s.first_name,' ',s.last_name) as staff_name
 FROM staff s RIGHT JOIN payment p 
 ON s.staff_id = p.staff_id 
 WHERE p.amount > ( SELECT avg(amount) 
                      from payment );
                      
-- 8. Show the title and rental duration of films whose rental duration is greater than the average.
SELECT * FROM film;
SELECT title, rental_duration 
FROM film
WHERE rental_duration > (SELECT avg(rental_duration) FROM film);

-- 9. Find all customers who have the same address as customer with ID 1.
select * from customer; select * from address;

SELECT CONCAT(first_name,' ',last_name) as customer_name 
from customer 
where address_id = (SELECT address_id from customer where customer_id = 1);

-- 10. List all payments that are greater than the average of all payments.
SELECT * from payment;
SELECT DISTINCT * FROM payment
WHERE amount > (SELECT avg(amount) from payment);

