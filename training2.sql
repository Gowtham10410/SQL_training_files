SHOW DATABASES;

USE company_db;

SHOW TABLES;

DESCRIBE departments;
DESCRIBE employees;
SELECT * FROM departments;
SELECT * FROM employees;

INSERT INTO employees VALUES (9, "Pavithra", "rajasekaran", "pavi02@gmail.com", "2022-11-02", "51250", 1, "Blog writer", "Non-technical support");

DELETE FROM employees
WHERE emp_id = 9;

UPDATE employees 
SET first_name = "Gowthama"
WHERE emp_id = 7;

SHOW DATABASES;

USE datamites;
SHOW TABLES;

SELECT * FROM students;

CREATE TABLE staff (
staff_id INT PRIMARY KEY,
staff_name VARCHAR(40),
staff_subject VARCHAR(40)
);

DESCRIBE staff;

INSERT INTO staff VALUES (1, "Sujatha", "social");

SELECT * FROM staff;

SELECT staff_name FROM staff
WHERE staff_id = 3;



INSERT INTO staff VALUES(2,"Lalitha", "Chemistry"),(3,"Nagalingam", "Maths");


TRUNCATE staff;

DROP TABLE staff;
SHOW TABLES;

SELECT * FROM students;



ALTER TABLE students ADD COLUMN remarks VARCHAR(40);

UPDATE students
SET remarks = "Good"
WHERE stud_id = 1;

DESCRIBE students;

ALTER TABLE students MODIFY COLUMN s_name VARCHAR(55);

ALTER TABLE students DROP COLUMN remarks;

INSERT INTO students VALUES (2,"Gothy", "52467", "50", "B section");

UPDATE students
SET class = "A section"
WHERE stud_id = 1;


SELECT * FROM students;

DELETE FROM students 
WHERE stud_id = 2;

USE company_db;

SHOW TABLES;

SELECT * FROM employees;

SELECT avg(salary) FROM employees;

SELECT MAX(salary) FROM employees;

SELECT min(salary) FROM employees;

SELECT designation , SUM(salary) AS budget FROM employees
GROUP BY designation
ORDER BY SUM(salary) DESC;

SELECT * FROM employees 
WHERE salary BETWEEN 50000 AND 80000;


USE datamites;

SHOW TABLES;

SELECT * FROM students;

ALTER TABLE students ADD COLUMN section VARCHAR(50);

ALTER TABLE students DROP column section;

DESCRIBE students;

ALTER TABLE students MODIFY COLUMN s_name VARCHAR(30);

SELECT * FROM students;

DROP TABLE students;

DESCRIBE students;

CREATE TABLE students(
s_name VARCHAR(40),
roll_no INT
);

INSERT INTO students VALUES ("Gothy", 212003214);

TRUNCATE students;

DESCRIBE students;

ALTER TABLE students ALTER roll_no  SET DEFAULT '0';

ALTER TABLE students MODIFY roll_no INT DEFAULT '10';

ALTER TABLE students RENAME COLUMN s_name TO student_name;

SELECT * FROM students;

RENAME TABLE students TO stud;

SHOW TABLES;

RENAME TABLE stud TO students;

USE company_db;

SHOW TABLES;

SELECT * FROM EMPLOYEES;

SELECT designation, COUNT(emp_id) FROM employees
GROUP BY designation 
HAVING COUNT(emp_id) > 1
ORDER BY designation;

SELECT * FROM employees
WHERE first_name = "tanishq";

SELECT DISTINCT designation FROM employees
ORDER BY designation;

SELECT first_name, designation FROM employees 
WHERE salary >= 85000;

SELECT MAX(salary) FROM employees;


SELECT current_timestamp();

SELECT curdate();
SELECT NOW();

SELECT datediff(2026-09-09, NOW());

SELECT DATE_ADD(NOW(),INTERVAL 5 DAY);

SELECT * FROM employees;

SELECT salary, CONCAT('RS. ',salary) as  INR_rupees FROM employees;


SELECT UCASE(first_name) FROM employees;

DESCRIBE employees;


use datamites;

SELECT * FROM students;

describe students;

ALTER TABLE students MODIFY roll_no VARCHAR(50) PRIMARY KEY;


ALTER TABLE students DROP COLUMN roll_no;

DESCRIBE students;

ALTER TABLE students ADD COLUMN roll_no INT;

SELECT * FROM students;

DESCRIBE students;

ALTER TABLE students ALTER COLUMN roll_no SET DEFAULT '0';

ALTER TABLE students ALTER COLUMN roll_no DROP DEFAULT;

ALTER TABLE students MODIFY COLUMN roll_no INT PRIMARY KEY;

ALTER TABLE students MODIFY COLUMN student_name VARCHAR(45) NOT NULL;

ALTER TABLE students MODIFY COLUMN student_name VARCHAR(40) NULL;

ALTER TABLE students RENAME COLUMN student_name TO s_name;


USE company_db;

SHOW TABLES;

SELECT * FROM employees;

INSERT INTO employees VALUES (9,"jessica", "prasath", "jsjw27@gmail.com", "2026-09-09", "90000", 1, "Financial Analyst", "Fintech");

DELETE FROM employees 
WHERE emp_id = 9;

UPDATE employees
SET first_name = "Tanishq"
WHERE emp_id = 8;



SELECT * FROM employees
LIMIT 5;

SELECT * FROM employees
WHERE salary > 80000;

DESCRIBE students;
USE company_db;

SELECT * FROM employees;

DESCRIBE employees;
SELECT * FROM departments;
SELECT * FROM employees;

USE datamites;

SHOW TABLES;

SELECT * FROM students;

DESCRIBE students;


