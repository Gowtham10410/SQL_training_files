SHOW DATABASES;
USE company_db;
SHOW TABLES;
DESCRIBE departments;

SELECT * FROM departments;

SELECT * FROM employees;

SHOW DATABASES;

CREATE DATABASE test;
USE test;

CREATE TABLE employees(
emp_id INT PRIMARY KEY AUTO_INCREMENT,
ename VARCHAR(50),
salary VARCHAR(50)
);

SHOW TABLES;

DESCRIBE employees;

INSERT INTO employees VALUES (1, "gowtham", "50000");

INSERT INTO employees (ename,salary) VALUES ("prema", "65000");

SELECT * FROM employees;

ALTER TABLE employees ADD COLUMN age VARCHAR(20);

ALTER TABLE employees DROP COLUMN age;

ALTER TABLE employees RENAME COLUMN salary TO sal;

RENAME TABLE employees TO emp;

SHOW TABLES;
RENAME TABLE emp TO employees;
SELECT * FROM employees;
DESCRIBE employees;
ALTER TABLE employees MODIFY COLUMN sal VARCHAR(70) DEFAULT '30000';

ALTER TABLE employees RENAME COLUMN sal TO salary;

ALTER TABLE employees ALTER salary SET DEFAULT '25000';

ALTER TABLE employees ALTER salary DROP DEFAULT;

ALTER TABLE employees MODIFY COLUMN salary VARCHAR(40);


RENAME TABLE emp TO employees;
SHOW TABLES;

SELECT * FROM employees;

ALTER TABLE employees ADD COLUMN age INT;

DESCRIBE employees;

ALTER TABLE employees MODIFY COLUMN age VARCHAR(50) DEFAULT '50000';

ALTER TABLE employees ALTER age DROP DEFAULT;

ALTER TABLE employees DROP COLUMN age;

TRUNCATE TABLE employees;

DROP TABLE employees;

SHOW TABLES;

SHOW DATABASES;

USE datamites;

SHOW TABLES;

SELECT * FROM employees;

UPDATE employees 
SET ename = "Sneha"
WHERE emp_id = 2;

DELETE FROM employees
WHERE emp_id = 3;

INSERT INTO employees VALUES (3,"Surya", "Data Engineer", "35000", "1", "24");

SELECT * FROM employees;

UPDATE employees
SET age = 23
WHERE emp_id = 1;

USE company_db;

SELECT * FROM employees;

SELECT * FROM employees 
WHERE salary = 75000;

SELECT DISTINCT designation FROM employees;

SELECT * FROM employees
LIMIT  1;

SELECT * FROM employees
ORDER by salary DESC;

SELECT * FROM employees
ORDER BY salary ASC;

SELECT * FROM employees 
ORDER BY salary DESC
LIMIT 1 OFFSET 2;

SELECT * FROM employees;

SELECT designation , sum(salary) AS budget FROM employees
GROUP BY designation;

SHOW DATABASES;
USE datamites;
SHOW TABLES;
SELECT * FROM students;

SHOW INDEX FROM students;

USE company_db;


ALTER TABLE students ADD INDEX students(student_name);
ALTER TABLE students DROP INDEX students;


SELECT * FROM employees;

SELECT designation, sum(salary) as budget FROM employees
GROUP BY designation
HAVING budget > 90000;

SHOW DATABASES;
USE growforgeai;

SHOW TABLES;
SELECT * FROM employees;

SET AUTOCOMMIT = OFF;

INSERT INTO employees VALUES (7,"mithra", "8000", "Associate trainee", "2026-05-11");
COMMIT;

DELETE FROM employees
WHERE emp_id = 7;

ROLLBACK;

SHOW TABLES;
SELECT * FROM employees;


USE company_db;

SELECT * FROM employees;
SELECT * FROM departments;

SELECT * FROM employees INNER JOIN departments
ON employees.dept_id = departments.dept_id;


SELECT first_name, designation, branch, dept_name , location, budget FROM employees INNER JOIN departments
ON employees.dept_id = departments.dept_id;


SELECT * FROM departments;

SELECT * FROM employees
WHERE dept_id = (SELECT dept_id FROM departments WHERE dept_name = "HR");


SELECT MIN(salary) FROM employees;

SELECT * FROM employees
WHERE salary = (SELECT MIN(salary) FROM employees);

SELECT * FROM employees
WHERE salary = (SELECT MAX(salary) FROM employees);

SELECT * FROM employees
WHERE dept_id = (SELECT dept_id FROM departments WHERE dept_name = "Engineering");


SELECT * FROM employees INNER JOIN departments
ON employees.dept_id = departments.dept_id;

SELECT * FROM employees
WHERE EXISTS (SELECT * FROM departments WHERE dept_name = "Engineering" AND employees.dept_id = departments.dept_id);


SELECT * FROM employees
WHERE dept_id <> ALL (SELECT dept_id FROM departments WHERE dept_name = "Engineering");

SELECT * FROM employees
WHERE dept_id = ANY(SELECT dept_id FROM departments WHERE dept_name = "Engineering");













