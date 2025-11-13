-- DQL(DATA QUERY LANGUAGE)
-- SOME MORE INTO SQL 
USE sakila;
-- 1) SELECT AND SELECT DISTINCT

-- View all records from actor table
SELECT * FROM actor;

-- Select specific columns
SELECT first_name, last_name 
FROM actor;

-- DISTINCT → unique values
SELECT DISTINCT rating 
FROM film;

-- 2)LIMIT
-- Show only first 10 films
SELECT film_id, title, release_year 
FROM film LIMIT 10;

-- 3) COUNT
-- Count total films
SELECT COUNT(*) AS total_films 
FROM film;

-- Count distinct ratings
SELECT COUNT(DISTINCT rating) AS unique_ratings 
FROM film;

-- 4) WHERE WITH AND,OR,NOT
-- Films released in 2006
SELECT title, release_year 
FROM film 
WHERE release_year = 2006;

-- Films rated 'PG' and longer than 100 minutes
SELECT title, rating, length
FROM film
WHERE rating = 'PG' AND length > 100;

-- Films rated 'R' or 'PG-13'
SELECT title, rating 
FROM film 
WHERE rating = 'R' OR rating = 'PG-13';

-- NOT example
SELECT title, rating 
FROM film
 WHERE NOT rating = 'G';

-- 5)LIKE OPERATOR WITH WILDCARDS(%,_)
-- Titles starting with 'A'
SELECT title 
FROM film 
WHERE title LIKE 'A%';

-- Titles ending with 'N'
SELECT title 
FROM film 
WHERE title LIKE '%N';

-- Titles containing 'LOVE'
SELECT title 
FROM film 
WHERE title LIKE '%LOVE%';

-- Second letter is 'A'
SELECT title
 FROM film 
 WHERE title LIKE '_A%';

-- 6)BETWEEN
-- Films with length between 80 and 100 mins
SELECT title, length 
FROM film 
WHERE length BETWEEN 80 AND 100;

-- Payments made between specific dates
SELECT payment_id, amount, payment_date
FROM payment
WHERE payment_date BETWEEN '2005-07-01' AND '2005-07-15';

-- 7)ORDER BY(SORTING)
-- Sort actors alphabetically, by default ORDER BY does in ascending order
SELECT first_name, last_name 
FROM actor 
ORDER BY last_name; 

-- Sort films by length descending
SELECT title, length 
FROM film 
ORDER BY length DESC;

-- Sort by rating ascending, then by title
SELECT title, rating 
FROM film ORDER BY rating ASC, title ASC;

-- 8)Aggregate Functions – SUM(), AVG(), MIN(), MAX(), COUNT()
-- Total and average rental duration
SELECT
    SUM(rental_duration) AS total_days,
    AVG(rental_duration) AS avg_days
FROM film;

-- Minimum and maximum film length
SELECT MIN(length) AS shortest, MAX(length) AS longest 
FROM film;

-- Count how many films for each rating
SELECT rating, COUNT(*) AS total_films
FROM film
GROUP BY rating;

-- 9) GROUP BY AND HAVING
-- Group by rating to get average length per rating
SELECT rating, AVG(length) AS avg_length
FROM film
GROUP BY rating;
-- Only show ratings where average length > 110 mins
SELECT rating, AVG(length) AS avg_length
FROM film
GROUP BY rating
HAVING AVG(length) > 110;

-- 10) DIFFERENCE BETWEEN WHERE AND HAVING
-- WHERE: filters individual rows
SELECT * FROM film WHERE length > 100;

-- HAVING: filters grouped results
SELECT rating, AVG(length) AS avg_length
FROM film
GROUP BY rating
HAVING avg_length > 100;

-- *** 11) ORDER OF EXECUTION
-- 1. FROM (tables + joins) -> WHERE (row filtering) -> GROUP BY (grouping) -> HAVING (group filtering)
   -- |->SELECT (column selection) -> ORDER BY (sorting) -> LIMIT (final trimming)

