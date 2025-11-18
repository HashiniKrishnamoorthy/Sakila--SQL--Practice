-- String inbuilt Operations
USE sakila;
-- 1)PADDING -> LPAD AND RPAD

SELECT 
    actor_id,
    first_name,
    LPAD(first_name, 10, '*') AS padded_name
FROM actor LIMIT 5;

SELECT 
    actor_id,
    RPAD(last_name, 10, '#') AS padded_last_name
FROM actor LIMIT 5;

-- COMBINATION OF LPAD AND RPAD
SELECT 
    actor_id,
    first_name,
    LPAD(RPAD(first_name, 10, ' '), 15, ' ') AS padded_name
FROM actor limit 5;

-- 2) CONCAT OPERATION 
SELECT 
    CONCAT(first_name, ' ', last_name) AS full_name
FROM actor;

-- 3) REVERSE OPERATION
SELECT 
    first_name,
    REVERSE(first_name) AS reversed_name
FROM actor;

-- 4)LENGTH OPERATON
SELECT 
    CONCAT(first_name, ' ', last_name),
    LENGTH(first_name) + LENGTH(last_name) as total_length
FROM actor;

-- 5) SUBSTRING and along with LOCATE AND SUBSTRING_INDEX 

SELECT 
    title,
    SUBSTRING(title, 1, 5) AS first_five_letters
FROM film;

-- WHAT DOES LOCATE WITH DO?
SELECT 
    title,
    LOCATE('THE', title) AS position_of_the
FROM film;     -- [Finds where the word “THE” appears in the film title.]
-- SUBSTRING WITH LOCATE
SELECT 
    title,
    SUBSTRING(title, LOCATE('E', title)+1) AS from_first_A
FROM film;

SELECT 
    title,
    SUBSTRING(title, LOCATE('E', title)-1) AS from_first_A
FROM film;

-- SUNSTRING_INDEX 
SELECT 
    email,
    SUBSTRING_INDEX(email, '@', 1) AS username
FROM customer;

SELECT 
    email,
    SUBSTRING_INDEX(email, '@', -1) AS username
FROM customer;

--   SUBSTRING WITH SUBSTRING AND LOCATE 

SELECT 
    email,
    SUBSTRING(
        email,
        LOCATE('@', email) + 1,
        LENGTH(email)
    ) AS domain
FROM customer;

-- UPPER AND LOWER CONVERTING THE CHARATERS 

SELECT 
    first_name,last_name,
    UPPER(first_name) AS upper_name,
    LOWER(last_name) AS lower_name
FROM actor;

-- REPLACE OPERATION

SELECT 
    title,
    REPLACE(title, 'THE', 'A') AS replaced_title
FROM film;

-- GETTING letters from left and right
SELECT 
    title,
    LEFT(title, 5) AS left_part,
     RIGHT(title, 5) AS right_part
FROM film;

-- CAST OPERATION CONVERTING THE DATATYPES
SELECT 
    film_id,
    CAST(rental_duration AS DECIMAL(10,2)) AS duration_number
FROM film;

SELECT 
    film_id,
    CAST(film_id AS CHAR) AS film_id_text
FROM film;

-- ** COVERT SAME AS CAST
SELECT 
    CONVERT('5678', UNSIGNED) AS number_value;
-- ** REGEXP [MATCH PATTERN WITH REGULAR EXPERSSIONS] ^-STARTS; $ ENDING; 
 --  Find titles starting with “A”
SELECT 
    title
FROM film
WHERE title REGEXP '^A';

--  Find titles ending with “N”
SELECT 
    title
FROM film
WHERE title REGEXP 'N$';

-- Find titles containing a number
SELECT 
    title
FROM film
WHERE title REGEXP '[0-9]';

-- Find customers whose last name starts with “S” or “T”
SELECT 
    first_name, last_name
FROM customer
WHERE last_name REGEXP '^[ST]';

-- Find titles with the word “LOVE” (case-insensitive)

SELECT 
    title
FROM film
WHERE title REGEXP 'LOVE';

-- Remaining String function which we didn't discussed in class

-- 1. POSITION(substring IN string)

--  What does: Finds the starting position (index) of a substring inside another string.
--  Where to use : You want to know where a word or letter occurs in text.
SELECT 
    title,
    POSITION('P' IN title) AS position_of_A
FROM film
LIMIT 5;

-- 2. RTRIM(string) AND LTRIM SAME, TRIM
--  Meaning: Removes trailing spaces (spaces on the right side) from a string.
--  Use when: You have messy data or fixed-width text with extra right-side spaces.
SELECT 
    first_name,RTRIM(CONCAT(first_name, '    ')) AS cleaned_name
FROM actor
LIMIT 5;

-- 3.LCASE(string) (same as LOWER())

-- What does: Converts all characters to lowercase.
-- Where need: You need consistent case (for search, sorting, or data cleaning).
SELECT 
    first_name,
    LCASE(first_name) AS lower_name
FROM actor
LIMIT 5;

-- 4.CONCAT_WS(separator, string1, string2, …)
-- What does: Concatenates (joins) strings with a separator between them.
-- Where need: You want to merge multiple columns with a custom delimiter like comma, dash, or space.
SELECT first_name, last_name,
    CONCAT_WS(' ', first_name, last_name) AS full_name
FROM actor
LIMIT 5;
