SHOW DATABASES;

CREATE DATABASE growforgeai;
USE growforgeai;
SHOW TABLES;


CREATE TABLE employees(
emp_id INT PRIMARY KEY,
emp_name VARCHAR(50),
salary VARCHAR(50)
);

DESCRIBE employees;

TRUNCATE employees;

DROP TABLE employees;

ALTER TABLE employees ADD COLUMN department VARCHAR(40);

ALTER TABLE employees DROP COLUMN department;

ALTER TABLE employees ADD COLUMN designation VARCHAR(40);


INSERT INTO employees VALUES(1,"Tanishq khandar","60000","CEO");

SELECT * FROM employees;

INSERT INTO employees VALUES(2,"Gowtham","12000","Full Stack Developer"),(3,"Sanjay","20000","Senior Full Stack Developer");

INSERT INTO employees(emp_id, emp_name) VALUES(4,"Madhan");

SELECT emp_id, emp_name FROM employees;


-- where clause

SELECT emp_name FROM employees
WHERE emp_id = 1;

SELECT * FROM employees;

UPDATE employees SET salary = "30000" WHERE emp_id = 4;
UPDATE employees SET designation = "Sales Head" WHERE emp_id = 4;

INSERT INTO employees VALUES (5,"Teesha","10000","Software development Trainee"),(6,"Anu","12000","Software development Traineer 2");

UPDATE employees SET designation = "Software development Trainee" WHERE emp_id = 6;

SELECT * FROM employees
WHERE emp_id = 5;

SELECT * FROM employees
WHERE emp_name <> "Gowtham";

SELECT * FROM employees
WHERE emp_name = "Gowtham";

SELECT * FROM employees 
WHERE salary < "12000";

SELECT * FROM employees 
WHERE salary > 15000 AND designation = "CEO";

SELECT * FROM employees 
WHERE designation = "Software development Trainee" OR designation = "CEO";


SELECT * FROM employees
WHERE designation NOT IN ("CEO", "Sales Head");


SELECT * FROM employees
WHERE salary BETWEEN 20000 AND 40000;


SELECT * FROM employees
LIMIT 3;

SELECT * FROM employees
WHERE emp_name LIKE '__ni%';

SELECT * FROM employees;


INSERT INTO employees VALUES (7,"Yugesh","25000","data scientist");

DELETE FROM employees WHERE emp_id = 7;


SELECT DISTINCT designation FROM employees; 


SELECT * FROM employees
ORDER BY salary , emp_name;

SELECT * FROM employees
WHERE designation = "Software development Trainee"
ORDER BY salary;


-- FUNCTIONS

SELECT COUNT(*) FROM employees;

SELECT COUNT(*) AS total_records FROM employees;

SELECT COUNT(*) FROM employees 
WHERE designation = "Software development Trainee";

SELECT AVG(salary) FROM employees
WHERE designation = "Software development Trainee";


SELECT SUM(salary) FROM employees
WHERE designation = "Software development Trainee";

SELECT MAX(salary) AS fund_spent_max FROM employees;

SELECT MIN(salary) AS fund_spent_min FROM employees;

SELECT * FROM employees
WHERE salary = 10000;

SELECT ucase(emp_name) AS EMP_NAME , salary FROM employees;

SELECT lcase(emp_name) as emp_name, salary FROM employees;

SELECT char_length(emp_name) as name_length, emp_name FROM employees;

SELECT emp_name, concat('Rs.',salary) AS Salary FROM employees;

SELECT emp_name, FORMAT(salary,2) FROM employees;

SELECT emp_name, left(designation,5) FROM employees;

SELECT emp_name , right(designation,9) FROM employees;

SELECT * FROM employees;

ALTER TABLE employees ADD COLUMN hire_date DATE;

UPDATE employees
SET hire_date = '2026-04-13'
WHERE emp_id = 3;

SELECT NOW();

SELECT DATE(NOW());

SELECT CURDATE();

SELECT DATE_FORMAT(CURDATE(), '%d/%m/%y') AS today;


SELECT datediff(CURDATE(), '2002/11/21');


SELECT current_timestamp();

SELECT curdate();

SELECT date_format(now(), '%d/%m/%y') AS date_;

SELECT date_add(CURDATE(), INTERVAL 1 DAY) AS after_a_day;
SELECT date_add(curdate(), interval 1 WEEK) AS after_a_week;
SELECT date_add(CURDATE(), INTERVAL 1 MONTH) AS after_a_month;


SELECT * FROM employees;

USE growforgeai;

SELECT designation , SUM(salary) FROM employees
GROUP BY designation;


SELECT UCASE(designation) , COUNT(emp_id) FROM employees
GROUP BY designation
HAVING COUNT(emp_id) > 1;

SELECT * FROM employees;

SELECT designation, COUNT(emp_id) FROM employees
GROUP BY designation
ORDER BY designation DESC;


SELECT designation , COUNT(emp_id) FROM employees
GROUP BY designation
HAVING COUNT(emp_id) > 1;


SHOW TABLES;

CREATE TABLE employees2 (
id INT PRIMARY KEY AUTO_INCREMENT,
ename VARCHAR(40) NOT NULL,
salary VARCHAR(40) DEFAULT '10000',
emp_role VARCHAR(40),
pan VARCHAR(40) UNIQUE
);

DESCRIBE employees2;

INSERT INTO employees2 (ename,emp_role) VALUES ("Gowtham", "Data engineer");

SELECT * FROM employees2;

SELECT * FROM employees;

DESCRIBE employees;

ALTER TABLE employees MODIFY emp_name VARCHAR(40) NOT NULL;

ALTER TABLE employees MODIFY emp_name VARCHAR(70);



SELECT * FROM employees2;

UPDATE employees2
SET pan = "GJRPM45478E"
WHERE id = 1;

DESCRIBE employees2;

DESCRIBE employees;

ALTER TABLE employees2 ALTER emp_role SET DEFAULT 'unassigned';

ALTER TABLE employees2 ALTER emp_role DROP DEFAULT;

ALTER TABLE employees2 MODIFY salary VARCHAR(30) DEFAULT '12000';

ALTER TABLE employees2 MODIFY salary VARCHAR(30) DEFAULT '15000';





