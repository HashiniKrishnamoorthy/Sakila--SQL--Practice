--   INTRODUCTION TO SQL

-- DATABASE → Organized collection of data in the form of table with rows ans columns
-- DBMS → Software that manages databases (MySQL, Oracle, etc.)
-- SQL → Structured Query Language (to interact with DB)
-- SCHEMA → Logical structure of database (tables, views, constraints, etc.)

-- SQL COMMAND TYPES:
-- DDL - Data Definition Language (CREATE, ALTER, DROP, TRUNCATE)
-- DML - Data Manipulation Language (INSERT, UPDATE, DELETE)
-- DQL - Data Query Language (SELECT)
-- DCL - Data Control Language (GRANT, REVOKE)
-- TCL - Transaction Control Language (COMMIT, ROLLBACK, SAVEPOINT)

-- CREATE DATABASE
CREATE DATABASE  office_db;
USE office_db;

-- CREATE TABLE (DDL) WITH PRIMARY KEY

CREATE TABLE employees (
    emp_id INT NOT NULL UNIQUE,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100),
    age INT CHECK (age >= 18),
    department VARCHAR(100) DEFAULT 'General', -- USING DEFAULT KEY TO MAKE IT DEFAULT IF NOT ENTERTED
    PRIMARY KEY (emp_id)
);

SELECT * FROM employees;

-- INSERT DATA (DML)

INSERT INTO employees (emp_id, first_name, last_name, age, department)
VALUES
(1, 'Alice', 'Johnson', 28, 'HR'),
(2, 'Bob', 'Smith', 35, 'Finance'),
(3, 'Charlie', 'Brown', 24, NULL),
(4, 'Diana', 'Miller', 29, 'IT');

SELECT * FROM employees;

-- ALTER TABLE (DDL)

ALTER TABLE employees
ADD email VARCHAR(255);

ALTER TABLE employees
RENAME COLUMN email TO email_id;

-- FOREIGN KEY EXAMPLE BY CREATING ANOTHER TABLE BY REFEREING TO PRIMARY KEY

CREATE TABLE departments (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(100) UNIQUE
);

INSERT INTO departments (dept_id, dept_name)
VALUES (101, 'HR'), (102, 'Finance'), (103, 'IT');

CREATE TABLE employee_details (
    detail_id INT PRIMARY KEY,
    emp_id INT,
    salary DECIMAL(10,2),
    dept_id INT,
    FOREIGN KEY (emp_id) REFERENCES employees(emp_id)
        ON DELETE RESTRICT
        ON UPDATE CASCADE,
    FOREIGN KEY (dept_id) REFERENCES departments(dept_id)
);

-- Insert valid records
INSERT INTO employee_details (detail_id, emp_id, salary, dept_id)
VALUES (1, 1, 55000.00, 101),
       (2, 2, 62000.00, 102),
       (3, 4, 58000.00, 103);

SELECT * FROM employee_details;

-- CHECK and DEFAULT EXAMPLES

CREATE TABLE projects (
    project_id INT PRIMARY KEY,
    project_name VARCHAR(255) NOT NULL,
    budget INT CHECK (budget > 1000),
    city VARCHAR(100) DEFAULT 'New York'
);

INSERT INTO projects (project_id, project_name, budget, city)
VALUES (10, 'Website Upgrade', 20000, 'Boston'),
       (11, 'Security Enhancement', 15000, DEFAULT);

SELECT * FROM projects;

--     DELETE vs DROP vs TRUNCATE


-- DELETE → removes rows, keeps structure
DELETE FROM employees WHERE emp_id = 3;

-- TRUNCATE → removes all rows, keeps table structure
TRUNCATE TABLE projects;

-- DROP → removes the entire table (structure + data)
DROP TABLE IF EXISTS projects;

-- VIEW CONSTRAINTS INFO

SELECT CONSTRAINT_NAME, CONSTRAINT_TYPE, TABLE_NAME
FROM information_schema.TABLE_CONSTRAINTS
WHERE TABLE_SCHEMA = 'office_db';

-- CLEANUP

DROP TABLE  employee_details;
DROP TABLE employees;
DROP TABLE  departments;
DROP DATABASE  office_db;
