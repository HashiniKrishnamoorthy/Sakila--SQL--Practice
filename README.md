# Sakila--SQL--Practice
SQL practice scripts using the Sakila sample database — DDL, DML, DQL, filtering, aggregation, and grouping queries for learning and practice
# Sakila SQL Practice Repository

This repository contains comprehensive SQL practice scripts using the Sakila sample database.  
It is designed for database learners, analysts, and developers to practice database creation, manipulation, querying, and aggregation in a professional context.

## Repository Structure

- `sql/01_Introduction to SQL.sql`  
  Database setup and DDL/DML: table creation, sample data, ALTER TABLE, constraints, DROP/TRUNCATE
  SELECT queries: DISTINCT, LIMIT, WHERE, AND, OR, NOT, LIKE, BETWEEN, ORDER BY

- `sql/02_Introduction to Sql part 2.sql`  
  SELECT queries: DISTINCT, LIMIT, WHERE, AND, OR, NOT, LIKE, BETWEEN, ORDER BY
  Aggregation queries: SUM, AVG, COUNT, MIN, MAX, GROUP BY, HAVING, SQL execution order
- `sql/03_String Inbulit Operations.sql`
  String manipulation functions: CONCAT, CONCAT_WS, LPAD, RPAD, LEFT, RIGHT, SUBSTRING, LENGTH, REPLACE, UPPER, LOWER, LCASE, TRIM, LTRIM, RTRIM
  Pattern matching using REGEXP
  Type conversion using CAST and CONVERT
  Practical examples using actor, customer, and film tables
- `sql/04_Numeric Inbuilt Operation.sql`
  Mathematical functions: POWER, MOD, RAND, CEIL, FLOOR, ROUND, TRUNCATE, SIGN, GREATEST, LEAST, ABS, SQRT
  Aggregate functions: SUM, AVG, MIN, MAX, COUNT
  Use cases for analytics, reporting, and financial calculations

## How to Use

1. Import the Sakila database: [Sakila Sample Database](https://dev.mysql.com/doc/sakila/en/)  
2. Open MySQL Workbench or your SQL client
3.  Execute scripts in order:

 - `source sql/01_Introduction to SQL.sql;`
 - `source sql/02_Introduction to Sql part2.sql;`
 - `sql/03_String Inbulit Operations.sql`
 - `sql/04_Numeric Inbuilt Operation.sql`
