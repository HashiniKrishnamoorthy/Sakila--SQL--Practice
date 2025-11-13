# Sakila--SQL--Practice
SQL practice scripts using the Sakila sample database — DDL, DML, DQL, filtering, aggregation, and grouping queries for learning and practice
# Sakila SQL Practice Repository

This repository contains comprehensive SQL practice scripts using the Sakila sample database.  
It is designed for database learners, analysts, and developers to practice database creation, manipulation, querying, and aggregation in a professional context.

## Repository Structure

- `sql/01_sakila_setup.sql`  
  Database setup and DDL/DML: table creation, sample data, ALTER TABLE, constraints, DROP/TRUNCATE

- `sql/02_sakila_queries.sql`  
  SELECT queries: DISTINCT, LIMIT, WHERE, AND, OR, NOT, LIKE, BETWEEN, ORDER BY

- `sql/03_sakila_aggregation.sql`  
  Aggregation queries: SUM, AVG, COUNT, MIN, MAX, GROUP BY, HAVING, SQL execution order

## How to Use

1. Import the Sakila database: [Sakila Sample Database](https://dev.mysql.com/doc/sakila/en/)  
2. Open MySQL Workbench or your SQL client  
3. Execute scripts in order:

```sql
source sql/01_sakila_setup.sql;
source sql/02_sakila_queries.sql;
source sql/03_sakila_aggregation.sql;
