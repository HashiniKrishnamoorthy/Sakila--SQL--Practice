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
- `sql/05_Subquery EXplanation.sql`
  1. Subqueries in the WHERE Clause                                                         
      Subqueries in the WHERE clause are used to filter rows based on results from another query.                              
     Purpose:                                                                     
       Compare rows against aggregated values,    
       Filter based on lists returned by another query,     
       Check for existence or non-existence of related data
  2. Subqueries in the SELECT Clause                                                        
     A subquery in the SELECT clause returns a single value (scalar subquery) that appears as a column in the output.                         
     Purpose:                                    
     Add computed values without performing joins,        
     Display aggregated values for each row,  
     Provide counts, sums, or averages alongside regular columns
  3. Subqueries in the FROM Clause                                                                   
     Subqueries in the FROM clause act as a temporary table (also known as a derived table or inline view).
- ` sql/07_Joins Explanation.sql`                                                                                                                                           
   Topics Covered
   INNER JOIN
   Returns rows where matching values exist in both tables.
   Example: List all customers with their corresponding address details.

   LEFT JOIN (LEFT OUTER JOIN)
   Returns all rows from the left table and matched rows from the right.
   Example: List all films and the categories they belong to (including films without categories).

  RIGHT JOIN (RIGHT OUTER JOIN)
  Returns all rows from the right table and matched rows from the left.
  Example: List all categories with the films assigned to each.

  FULL OUTER JOIN (simulated using UNION)
  MySQL does not support FULL JOIN, but it can be simulated with UNION.
  Example: Retrieve all customers and all rental records, even if no match exists.

  CROSS JOIN
  Produces a Cartesian product of two tables.
  Example: Combine all store IDs with all staff IDs.

  SELF JOIN
  A table joined with itself.
  Example: Identify customers living in the same city.

## How to Use

1. Import the Sakila database: [Sakila Sample Database](https://dev.mysql.com/doc/sakila/en/)  
2. Open MySQL Workbench or your SQL client
3.  Execute scripts in order:

 - `source sql/01_Introduction to SQL.sql;`
 - `source sql/02_Introduction to Sql part2.sql;`
 - `sql/03_String Inbulit Operations.sql`
 - `sql/04_Numeric Inbuilt Operation.sql`
 - `sql/05_Subquery Explanation.sql`
 - `sql/07_Joins Explanation.sql`
