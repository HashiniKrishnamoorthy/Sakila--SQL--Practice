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
- `sql/Subquery EXplanation.sql`
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
- ` sql/Joins Explanation.sql`                                                                                                                                           
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

  Stored Procedures – Overview

  This document provides a structured explanation of stored procedures used in MySQL, including input/output parameters, dynamic SQL, cursor-based procedures, and key         concepts such as natural vs. surrogate keys.

  ## CTEs, Temporary Tables, and Views
  ####  CTE (Common Table Expression)

  A CTE is a temporary result set created inside a query using WITH.      
  It helps make queries easier to read and avoids repeating subqueries.       
  It exists only for that one query.             

  Syntax:

  - ` WITH cte_name AS (       
      SELECT ...          
    )         
   SELECT * FROM cte_name; `

  #### Temporary Tables

    A temporary table is like a normal table but exists only for the current session.    
   It is useful for storing intermediate results and using them multiple times.      

    Syntax:

   ` CREATE TEMPORARY TABLE temp_table AS                   
     SELECT ...            `

  #### Views

    A View is a virtual table.     
    It does not store data physically — it runs the query behind it every time you use it.     
    Views help simplify complex queries.     

    Syntax:

     ` CREATE VIEW view_name AS
       SELECT ... `

  ##  What Are Stored Procedures?
  - ` sql/Stored Procedures.sql`
  
  Stored procedures are precompiled SQL programs stored in the database. They allow:

  Reuse of complex queries

  Reduced code duplication

  Improved performance

  Centralized business logic

  ####  Input Parameter Stored Procedure

  A stored procedure that accepts an input parameter and executes logic based on the provided value.

  Use Case:
  Retrieve the total payment made by a customer using their Customer ID.
  #### Output Parameter Stored Procedure

  A stored procedure that returns a value via an output parameter.

   Use Case:
   Return the number of films associated with a specific Actor ID.
   #### Stored Procedure Using SELECT ... INTO

    SELECT ... INTO assigns query results into variables inside the procedure.

    Important:
    When using INTO, only one row and its columns can be assigned. You cannot select multiple columns and multiple rows.

    Use Case:
    Fetch an actor’s full name and the count of films they acted in.

   ### Dynamic Stored Procedures

   Dynamic SQL allows SQL statements to be built during runtime.

   Typical components:

   SET @query = '...'

   PREPARE stmt FROM @query

   EXECUTE stmt

   DEALLOCATE PREPARE stmt

   Use Case:
   Generate a SELECT * query dynamically for any table name passed to the procedure.

   #### Dynamic Procedures for Entire Database (Using Cursors)

   A cursor-based stored procedure that:

   Loops through all table names in a database

   Builds a dynamic SELECT query for each table

   Stores each query in a temporary table instead of executing it

   Use Case:
   Create documentation of all SELECT statements for every table in the database.

   ## Natural Key vs Surrogate Key
    #### Natural Key

    A meaningful real-world identifier that uniquely identifies a record.      
    Already exists in real data          
    Suitable for domains like HR, banking, identity systems

    Example:
    SSN used as the primary key in an Employees table.

    #### Surrogate Key

     A key automatically generated by the system, usually numeric and incrementing.
     Simple, consistent, compact
     Best for large-scale relational databases

     Example:
     student_id INT AUTO_INCREMENT PRIMARY KEY in a Students table.

## How to Use

1. Import the Sakila database: [Sakila Sample Database](https://dev.mysql.com/doc/sakila/en/)  
2. Open MySQL Workbench or your SQL client
3.  Execute scripts in order:

 - `source sql/01_Introduction to SQL.sql;`
 - `source sql/02_Introduction to Sql part2.sql;`
 - `sql/03_String Inbulit Operations.sql`
 - `sql/04_Numeric Inbuilt Operation.sql`
 - `sql/Subquery Explanation.sql`
 - `sql/Joins Explanation.sql`
 -  `sql/CTE,Temporary Tables,Views.sql`
 -   `sql/Stored Procedures.sql`
