SHOW DATABASES;
USE company_db;
SHOW TABLES;

SELECT * FROM employees;

SELECT * FROM employees
WHERE salary > 70000;

SELECT * FROM high_sal;

DROP TABLE high_sal;
SHOW TABLES;


CREATE VIEW high_sal AS
SELECT * FROM employees
WHERE salary > 70000;

SELECT * FROM high_sal;
SHOW TABLES;

-- CTE common table expressions
WITH low_sal_cte AS (
	SELECT emp_id,first_name, salary FROM employees
	WHERE salary < 30000
)
SELECT * FROM low_sal_cte;


SHOW TABLES;


CREATE TEMPORARY TABLE low_sal AS SELECT * FROM eployees
WHERE salary < 30000;

USE company_db;

SHOW TABLES;

CREATE TEMPORARY TABLE lowsal AS
SELECT emp_id, first_name, salary FROM employees 
WHERE salary < 30000;

SELECT * FROM lowsal;

SHOW TABLES;


CREATE TABLE lowsal AS 
SELECT emp_id, first_name, salary FROM employees 
WHERE salary < 30000;

SHOW TABLES;

WITH highest_sal_cte AS (SELECT * FROM employees WHERE salary > 81000)
SELECT * FROM highest_sal_cte;

SELECT * FROM highest_sal_cte;


WITH low_sal_cte AS (
    SELECT emp_id, first_name, salary
    FROM employees
    WHERE salary < 30000
)
SELECT *
FROM low_sal_cte;



CREATE TABLE high_sal1 AS 
SELECT * FROM employees  
WHERE salary > 83000;

SELECT * FROM high_sal1;

UPDATE employees
SET email = "tanishqnotyourjewellers@gmail.com"
WHERE emp_id = 8;

SELECT * FROM employees
WHERE emp_id = 8;

SELECT * FROM high_sal1;

SHOW TABLES;
DROP TABLE high_sal;

DROP VIEW high_sal;

DROP TABLE lowsal;

WITH low_sal AS (
SELECT * FROM employees
WHERE salary < 30000
)
SELECT * FROM low_sal;

SHOW TABLES;

ALTER TABLE employees ADD COLUMN dummy VARCHAR(40);

SELECT * FROM employees;
ALTER TABLE employees DROP COLUMN dummy;

RENAME TABLE employees TO emp;
SHOW TABLES;
RENAME TABLE emp TO employees;
USE datamites;
SHOW TABLES;

SELECT * FROM branch;
DESCRIBE branch;
ALTER TABLE branch RENAME COLUMN address TO addr;

USE company_db;
SELECT * FROM employees;

ALTER TABLE branch MODIFY COLUMN br_name VARCHAR(30) DEFAULT 'chennai';
describe branch;


ALTER TABLE branch ALTER COLUMN br_name DROP DEFAULT;


USE company_db;

SELECT * FROM employees
WHERE salary > 75000 AND dept_id = 1;


SHOW DATABASES;

USE company_db;
SHOW TABLES;

SELECT * FROM employees;

CREATE TABLE high_sal AS SELECT emp_id, first_name, salary FROM employees 
WHERE salary > 60000;

SELECT * FROM high_sal;
DROP TABLE high_sal;

CREATE VIEW high_salary_employees AS 
SELECT * FROM employees
WHERE salary > 60000;

SHOW TABLES;

SELECT * FROM high_salary_employees;

DROP TABLE high_salary_employees;
DROP VIEW high_salary_employees;

WITH high_salary_cte AS (SELECT * FROM employees 
WHERE salary > 75000)
SELECT * FROM high_salary_cte;

CREATE TEMPORARY TABLE low_Sal AS SELECT * FROM employees
WHERE salary < 25000;
SELECT * FROM low_sal;

SHOW DATABASES;
USE de_project;

USE datamites;

SELECT * FROM employees;

SELECT * FROM datamites.employees
WHERE emp_id = 1;

USE company_db;

SELECT * FROM company_db.employees
WHERE salary > 80000;

SELECT * FROM company_db.employees
WHERE salary > 80000 AND emp_id = 8
ORDER BY salary; 

SELECT * FROM employees;

-- constraints

CREATE TABLE rides(
ride_id INT PRIMARY KEY,
driver_id INT NOT NULL,
rider_id INT NOT NULL,
pickup_location VARCHAR(100) NOT NULL,
dropoff_location VARCHAR(100) NOT NULL,
ride_date DATETIME NOT NULL,
fare DECIMAL(10,2) NOT NULL
);

INSERT INTO rides VALUES (1, 10, 15, "chennai", "Ponneri", "2026-09-24", "450");

SELECT * FROM datamites.rides;

DROP TABLE rides;
CREATE TABLE rides(
ride_id INT ,
driver_id INT NOT NULL,
rider_id INT NOT NULL,
pickup_location VARCHAR(100) NOT NULL,
dropoff_location VARCHAR(100) NOT NULL,
ride_date DATETIME NOT NULL,
fare DECIMAL(10,2) NOT NULL,
PRIMARY KEY (ride_id,rider_id)
);

SELECT * FROM rides;

DESCRIBE rides;


CREATE TABLE users(
user_id INT PRIMARY KEY,
email VARCHAR(40) UNIQUE
);


SHOW TABLES;

SELECT * FROM students;

CREATE DATABASE uber;

USE uber;

CREATE TABLE rides(
ride_id INT ,
driver_id INT NOT NULL,
rider_id INT NOT NULL,
pickup_location VARCHAR(100) NOT NULL,
dropoff_location VARCHAR(100) NOT NULL,
ride_date DATETIME NOT NULL,
fare DECIMAL(10,2) NOT NULL,
PRIMARY KEY (ride_id,rider_id)
);


USE datamites;
SHOW TABLES;

DROP TABLE rides, users;

USE uber;

SHOW TABLES;

DESCRIBE users;

INSERT INTO uber.users VALUES (1,"Gothy@gmail.com");

SELECT * FROM uber.users;

INSERT INTO uber.users VALUES(2, "Sanjay@gmail.com");

INSERT INTO uber.users VALUES(3,NULL);

INSERT INTO uber.users VALUES (4, "Sanjay@gmail.com");


SELECT * FROM uber.rides;

DESCRIBE uber.rides;
ALTER TABLE uber.rides MODIFY COLUMN rider_id INT;
ALTER TABLE uber.rides DROP PRIMARY KEY;
ALTER TABLE uber.rides MODIFY COLUMN ride_id INT PRIMARY KEY;

ALTER TABLE uber.rides MODIFY COLUMN rider_id INT NULL;

SELECT * FROM uber.rides;

INSERT INTO uber.rides(ride_id, driver_id, pickup_location, dropoff_location, ride_date, fare) VALUES (4,15,"Tambaram", "Korattur", "2026-09-23", "-350");

ALTER TABLE uber.rides ADD CONSTRAINT fare_check CHECK (fare > 0);

ALTER TABLE uber.rides DROP CONSTRAINT fare_check;

DELETE FROM uber.rides
WHERE ride_id = 3;

SELECT * FROM uber.rides;

UPDATE uber.rides
SET pickup_location = "villivakkam"
WHERE ride_id = 2;


SHOW TABLES;


SELECT * FROM uber.rides;
describe uber.rides;

CREATE TABLE uber.drivers (
driver_id INT PRIMARY KEY,
driver_name VARCHAR(50),
license_number VARCHAR(60) UNIQUE
);

TRUNCATE TABLE rides;

ALTER TABLE uber.rides ADD CONSTRAINT fk_constraint FOREIGN KEY (driver_id) REFERENCES uber.drivers(driver_id);

CREATE TABLE dummy(sno INT);

DROP TABLE if exists dummy;
SHOW TABLES;

DESCRIBE rides;

INSERT INTO drivers VALUES (101, "Rahul", "hkehghjokrq090875"), (102, "Vishal", "gjrpm4357e");

SELECT * FROM drivers;
SELECT * FROM uber.drivers;

SELECT * FROM rides;
INSERT INTO uber.rides VALUES (1,101,85, "Manali", "Porur", "2024-05-30", "259");

SELECT * FROM rides INNER JOIN drivers
ON rides.driver_id = drivers.driver_id;

SELECT driver_name, fare, dropoff_location FROM rides INNER JOIN drivers
ON rides.driver_id = drivers.driver_id;

SELECT * FROM rides;
INSERT INTO uber.rides VALUES (2,102,89,"Korattur", "Thirumullaivoyal", "2026-09-24", "190");

INSERT INTO uber.rides VALUES (3,102,89,"Avadi", "Thirumullaivoyal", "2026-09-24", "500");
SELECT * FROM rides;

DELETE FROM rides
WHERE driver_id = 102;

ALTER TABLE rides drop constraint fk_constraint;

ALTER TABLE uber.rides ADD CONSTRAINT fk_constraint FOREIGN KEY (driver_id) REFERENCES uber.drivers(driver_id)ON DELETE CASCADE;

SELECT * FROM rides;


-- soft delete

-- o = false 
-- 1 = true

ALTER TABLE rides ADD COLUMN is_delete boolean DEFAULT FALSE;

UPDATE rides
SET is_delete=true
WHERE driver_id = 101;

SELECT * FROM rides WHERE is_delete=true;


SELECT * FROM rides;

CREATE TABLE demo1 (
sno INT ,
sname VARCHAR(50),
country VARCHAR(50) DEFAULT 'USA'
);

SELECT * FROM demo1;

INSERT INTO demo1 (sno,sname)VALUES(1,"Gothy");

SELECT * FROM demo1;

INSERT INTO demo1 VALUES (2,"Yugesh","AUS");

DROP TABLE demo1;

SELECT * FROM demo1;



SHOW TABLES;
SHOW DATABASES;
USE company_db;

SHOW TABLES;
SELECT * FROM employees;

SELECT * FROM employees
WHERE designation IN ('data engineer');

SELECT SUM(salary) AS total_spent FROM employees
WHERE designation = 'data engineer';

SELECT * FROM employees
WHERE salary IN (SELECT MAX(salary) FROM employees);


SELECT designation, COUNT(emp_id) FROM employees
GROUP BY designation;

SELECT designation, COUNT(*) FROM employees
GROUP BY designation
HAVING COUNT(*) > 1;


SHOW DATABASES;

USE de_project;
SHOW TABLES;

USE datamites;
SHOW TABLES;

USE company_db;
SELECT * FROM employees;

SELECT * FROM employees
WHERE salary IN(SELECT MAX(salary) FROM employees);



SELECT COUNT(*) FROM employees WHERE designation = "data scientist" and salary > 79000;

SELECT * FROM employees;

SELECT SUM(salary) AS budget FROM employees;

SELECT sum(salary) AS total_budget, designation FROM employees
GROUP BY designation
HAVING designation IN ('software developer', 'data engineer')
ORDER BY total_budget DESC;



-- when case 
SELECT emp_id, first_name,
CASE 
     WHEN salary > 55000 THEN 'Tier one' 
     WHEN salary <= 25000 THEN 'Tier three' 
     ELSE 'Tire two'
END AS sal_tier
FROM employees;


SELECT first_name, emp_id,
CASE
WHEN salary < 30000 THEN 'POOR'
WHEN salary > 80000 THEN 'ELITE'
ELSE 'BROKE'
END as financial_status
FROM employees;

USE datamites;
SHOW TABLES;



-- NULL VALUES HANDLING
SELECT * FROM employees;

ALTER TABLE employees ADD COLUMN age VARCHAR(20);

UPDATE employees
SET age = 20
WHERE emp_id = 2;

INSERT INTO employees VALUES(3,"ram", "Associate", "55000",2,NULL);


SELECT * FROM employees
WHERE age IS  null;

SELECT * FROM employees
WHERE age IS NOT NULL;

SELECT COUNT(*) FROM employees
WHERE age is NULL;



-- -COALESCE

SELECT emp_id, ename , coalesce (age,0.00)AS age FROM employees;

SELECT * FROM employees;

SELECT emp_id, ename, IFNULL(age,0.00) FROM employees;


-- STRING HANDLING-- 

USE company_db;
SELECT * FROM employees;
SELECT CONCAT(first_name, ' ', last_name) AS full_name, concat(designation,' / ',branch) AS work_stream FROM employees;

SELECT ucase(first_name) , lcase(last_name) FROM employees;

SELECT * FROM employees
LIMIT 5;

SELECT CONCAT(first_name, ' - ',designation, ' - ', 'TN') AS name_designation_location FROM employees;

SELECT * FROM employees;

SELECT lpad(first_name,10, '*') FROM employees;

SELECT RPAD(first_name, 10, "*") FROM employees;

SELECT trim(first_name) FROM employees;

SELECT substring(first_name,1,5) FROM employees;

USE datamites;
SELECT * FROM employees;

UPDATE employees
SET ename = "tanishq khandar"
WHERE emp_id = 1;

SELECT REPLACE(ename," ", "_") FROM employees;

SELECT instr(ename, 'a')as position_of_a FROM employees;

SELECT LEFT(ename, 5) FROM employees;

SELECT RIGHT(ename, 5) FROM employees;

SELECT reverse(ename) FROM employees;

use COMPANY_DB;
SHOW TABLES;


SELECT UCASE(CONCAT(first_name,' ',last_name))AS full_name FROM employees;
SELECT length(UCASE(CONCAT(first_name,' ',last_name)))AS full_name FROM employees;


-- subquery 
SELECT * FROM EMPLOYEES
WHERE salary IN (
SELECT salary FROM employees
WHERE designation = "data engineer");



SELECT * FROM employees 
WHERE salary IN (
SELECT MAX(salary) FROM employees);

SELECT * FROM employees
WHERE salary IN (
SELECT MIN(salary) FROM employees);


SELECT * FROM departments;

SELECT * FROM employees
WHERE dept_id = (SELECT dept_id from departments
WHERE dept_name = "sales");

SHOW TABLES;

CREATE VIEW high_sal AS 
SELECT * from employees
WHERE salary > 80000;

SELECT * FROM high_sal;

show tables;
CREATE OR REPLACE VIEW high_sal AS 
SELECT * FROM employees
WHERE salary > 8000
LIMIT 1;

DROP VIEW high_sal;

SELECT * FROM high_sal;
SHOW TABLES;


SELECT * FROM employees;
SELECT * FROM departments;


-- JOINS

SELECT * FROM employees e INNER JOIN departments d
ON e.dept_id = d.dept_id;

SELECT e.first_name,d.budget,e.email FROM employees e
INNER JOIN departments d on e.dept_id = d.dept_id;

USE datamites;

SHOW TABLES;

SELECT * FROM employees;

CREATE TABLE employee(
id INT PRIMARY KEY,
name_ VARCHAR(40),
manager_id VARCHAR(40) NULL
);

INSERT INTO employee VALUES(1,'alice', "3"),(2,"Bobby", "3"),(3,"sham", NULL),(4,'danny',"3");

SELECT * FROM employee;



-- SELF JOIN

SELECT 
e.name_ as employee_name,
m.name_ as manager_name
FROM employee e
LEFT JOIN employee m
ON e.manager_id = m.id;

























