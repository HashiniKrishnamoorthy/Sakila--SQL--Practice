-- MATH operations on NUMERIC DATA

-- 1) POWER FUNCTION
   SELECT 
    film_id,
    POWER(rental_duration, 2) AS duration_squared
FROM film;

-- 2) CAST
SELECT 
   rental_rate, CAST(rental_rate AS CHAR) AS rate_as_text
FROM film;

-- 3)RANDOM 
SELECT 
    RAND() AS random_number;
SELECT 
    film_id,
    title,
    ROUND(RAND() * 100, 2) AS random_value
FROM film
LIMIT 10;

-- 4)MODULUS 
SELECT 
    rental_rate,
    MOD(rental_rate, 2) AS remainder
FROM film;

-- 5)CEIL It's gives the number rounded to maximum value
SELECT  
    amount,
    CEIL(amount) AS rounded_up
FROM payment;

-- 6)FLOOR  it rounds the number to the extact value
SELECT 
    amount,
    FLOOR(amount) AS rounded_down
FROM payment;

-- 7)ROUND  it rounds up the value to the decimal we mention
SELECT 
    amount,
    ROUND(amount, 1) AS rounded_to_one_decimal
FROM payment;


-- The opertion which we aren't discussed in the class

-- 1. TRUNCATE(number or column_name, decimals)
--     What it does: Cuts off digits after the specified decimal places — without rounding.
--    When to use: When you need to chop off decimals instead of rounding them up/down.
SELECT 
    amount,
    TRUNCATE(amount, 1) AS truncated_amount
FROM payment;

-- 2. SIGN(number)
--  What it does: Returns 1 for positive numbers, -1 for negative, and 0 for zero.
-- When to use: To check whether a value is positive, negative, or zero.
SELECT 
    amount,
    SIGN(amount - 5) AS sign_value
FROM payment;

-- 3. GREATEST(value1, value2, ...) AND SAME WITH LEAST(value1, value2, ...) gives least values
--  What it does: Returns the largest value from a list or columns.
-- When to use: To compare multiple numeric columns or computed values.
SELECT 
    film_id,
    rental_duration,
    rental_rate,
    GREATEST(rental_duration, rental_rate) AS max_value
FROM film;

-- 4. ABS() — Absolute Value
-- Removes the negative sign from a number.
SELECT 
    amount,
    ABS(amount - 5) AS abs_difference
FROM payment;

-- 5.SQRT() — Square Root
-- Returns the square root of a numeric value.
SELECT 
    film_id,
    rental_duration,
    SQRT(rental_duration) AS sqrt_duration
FROM film;

-- 6. TRIM() — Remove extra spaces (string cleanup)
-- Removes spaces (or chosen characters) from both sides of a string.

SELECT 
    first_name,
    TRIM('   ' FROM CONCAT('   ', first_name, '   ')) AS trimmed_name
FROM actor;

-- COMBINATION OF ALL THIS
SELECT 
    SUM(amount)  AS total_amount,
    AVG(amount)  AS avg_amount,
    MIN(amount)  AS min_amount,
    MAX(amount)  AS max_amount,
    COUNT(payment_id) AS total_payments,
    SQRT(SUM(amount)) AS sqrt_total,
    ABS(AVG(amount) - 5) AS abs_diff_from_5
FROM payment;

