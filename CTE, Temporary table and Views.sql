-- CTE's , Temporary Tables anmd Views
-- CTE Common Table Expression , create to overcome the subquery limitations
-- reuasable, reabaility and complexity is reduced, but the scope is also quer level
use sakila;

select * from actor; select * from film;
with actor_movie_information as(
SELECT a.actor_id, CONCAT(a.first_name,' ',a.last_name) as actor_name ,
fa.film_id , f.title from actor a
join film_actor fa on a.actor_id = fa.actor_id
join film  f on fa.film_id = f.film_id)
select actor_name, title from actor_movie_information;

select * from customer; select *  from address;
with customer_details as(
select c.customer_id, concat(c.first_name,' ',c.last_name) as customer_name,
c.email, a.address from customer as c 
join address a
on c.address_id = a.address_id)
select customer_name, address from customer_details;

select * from customer_details;
-- Temporary Table 
-- the table exist only for the session  or until it ends , used to store intermediate results

CREATE TEMPORARY TABLE actor_movie_information AS
SELECT a.actor_id, CONCAT(a.first_name,' ',a.last_name) as actor_name ,
fa.film_id , f.title from actor a
join film_actor fa on a.actor_id = fa.actor_id
join film  f on fa.film_id = f.film_id;

-- Here the scope is out of the query we can use the table outside the query also and through out the session
SELECT * FROM actor_movie_information;


CREATE TEMPORARY TABLE store_employer_details as
select st.store_id, s.staff_id, CONCAT(s.first_name ,' ',s.last_name) as staff_name
from store st join staff s 
on st.store_id = s.store_id ;

select * from store_employer_details;

-- VIEWS (Virutal Table)
-- Where the data is not physically stored , each and every time when a table is quered it runs the query behind the table
-- helps with data abtraction and simplifying complex queries

CREATE VIEW Store_location as
select s.store_id, a.address_id, a.address as store_address
from store s join address a 
on s.address_id = a.address_id;