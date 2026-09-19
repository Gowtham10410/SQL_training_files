SHOW DATABASES;

USE datamites;

SHOW TABLES;
SELECT * FROM students;

DESCRIBE students;

RENAME TABLE students TO student1;

SHOW TABLES;

DROP TABLE student1;

CREATE TABLE students(
s_id INT PRIMARY KEY,
student_name VARCHAR(45),
course VARCHAR(20)
);
DESCRIBE students;

INSERT INTO students VALUES (1,"Gowtham","CDE"),(2,"Manashesh","AI ENGINEERING"),(3,"Janane","CDS"),(4,"Siva","NA");

SELECT * FROM  students;

ALTER TABLE students ADD COLUMN attendance VARCHAR(40);

UPDATE students
SET  course="DA"
WHERE s_id=4; 

ALTER TABLE students DROP COLUMN attendance;

DELETE FROM students
WHERE s_id = 4;

TRUNCATE students;


SELECT * FROM students 
WHERE s_id = 1;


SHOW DATABASES;

USE company_db;

SHOW TABLES;

SELECT * FROM projects;

SELECT * FROM employees;

SELECT * FROM employees
WHERE salary > 80000;

SELECT designation, COUNT(emp_id) AS no_of_associates FROM employees
GROUP BY designation
HAVING COUNT(emp_id) > 1;

SELECT * FROM employees
LIMIT 5;

SELECT DISTINCT designation FROM employees;

DESCRIBE employees;

ALTER TABLE employees MODIFY COLUMN last_name VARCHAR(65);


USE datamites;
SELECT * FROM students;

ALTER TABLE students RENAME COLUMN course TO enrolled_course;
ALTER TABLE students MODIFY COLUMN enrolled_course VARCHAR(55) DEFAULT 'CDS';
USE company_db;

SELECT * FROM employees;

DESCRIBE students;

INSERT INTO students (s_id,student_name)VALUES (5,"Jasmine");

SELECT NOW();

SELECT * FROM students;

DESCRIBE students;

ALTER TABLE students MODIFY enrolled_course VARCHAR(30) DEFAULT 'CDA';

SELECT * FROM students;

UPDATE students
SET student_name = "Jasminuu"
WHERE s_id = 5;

DELETE FROM students 
WHERE s_id = 5;

USE company_db;

SELECT * FROM employees;

SELECT * FROM employees
ORDER BY SALARY DESC;


USE datamites;

describe STUDENTS;

ALTER TABLE students MODIFY COLUMN student_name VARCHAR(60) NOT NULL; 

ALTER TABLE  students ALTER student_name SET DEFAULT 'Unassigned';

INSERT INTO students(s_id) VALUES (6);

SELECT  * FROM students;

UPDATE students
SET enrolled_course="CDS"
WHERE s_id=4;

SELECT enrolled_course, COUNT(s_id) FROM students
GROUP BY enrolled_course;

SELECT * FROM students 
WHERE enrolled_course = "CDE";

SELECT * FROM students 
WHERE enrolled_course = "CDS";

UPDATE students
SET student_name = "Jasmine"
WHERE s_id = 6;

DESCRIBE students;

ALTER TABLE students ALTER student_name DROP DEFAULT;

ALTER TABLE students MODIFY COLUMN student_name VARCHAR(51) DEFAULT 'unassigned';

ALTER TABLE students MODIFY COLUMN student_name VARCHAR(50);

ALTER TABLE students ALTER student_name SET DEFAULT 'unassigned';

ALTER TABLE students MODIFY student_name VARCHAR(55) DEFAULT 'UnAssigned';

USE company_db;

SELECT * FROM EMPLOYEES;

use datamites;
SHOW TABLES;
DESCRIBE students;

ALTER TABLE students MODIFY COLUMN s_id INT;

SHOW TABLES;

CREATE TABLE branch(
branch_id INT PRIMARY KEY AUTO_INCREMENT,
br_name VARCHAR(20) NOT NULL,
address VARCHAR(50)
);

SHOW TABLES;

CREATE TABLE employees(
emp_id INT PRIMARY KEY AUTO_INCREMENT,
ename VARCHAR(50) NOT NULL,
job_desc VARCHAR(40),
salary INT,
branch_id INT,
CONSTRAINT fk_branch_id FOREIGN KEY(branch_id) REFERENCES branch(branch_id)
);

DROP TABLE branch;
DROP TABLE employees;

ALTER TABLE employees DROP FOREIGN KEY fk_branch_id;

DESCRIBE employees;

USE company_db;

SHOW TABLES;

SELECT * FROM employees;

SELECT * FROM departments;

SELECT * FROM employees
WHERE dept_id = 1;

DESCRIBE employees;

SHOW TABLES;

SELECT * FROM projects;

DESCRIBE projects;

select * from employees;

 SHOW INDEX FROM employees;
 
 USE company_db;
 
SHOW INDEX FROM employees;

SHOW TABLES;

DESCRIBE employees;

ALTER TABLE employees ADD COLUMN PAN VARCHAR(40) UNIQUE;

SHOW INDEX FROM employees;

SELECT * FROM employees;

CREATE INDEX name_index ON employees(ename);

ALTER TABLE employees DROP INDEX name_index;

ALTER TABLE employees ADD INDEX(ename);

ALTER TABLE employees DROP INDEX ename;

SHOW INDEX FROM employees;

ALTER TABLE employees ADD INDEX(ename);
ALTER TABLE employees DROP INDEX ename;

CREATE INDEX name_index ON employees(ename);

ALTER TABLE employees DROP INDEX name_index;

SHOW TABLES;

DROP TABLE employees;

DROP TABLE branch;

CREATE TABLE branch(
branch_id INT PRIMARY KEY AUTO_INCREMENT,
br_name VARCHAR(20) NOT NULL,
address VARCHAR(50)
);


CREATE TABLE employees(
emp_id INT PRIMARY KEY AUTO_INCREMENT,
ename VARCHAR(50) NOT NULL,
job_desc VARCHAR(40),
salary INT,
branch_id INT,
CONSTRAINT fk_branch_id FOREIGN KEY(branch_id) REFERENCES branch(branch_id) ON DELETE SET NULL
);

SELECT * from employees;
USE datamites;
SHOW TABLES;
SELECT * FROM branch;

INSERT INTO branch VALUES (1, "CHENNAI", "annanagar,floor 2 shanthi colony");
INSERT into branch VALUES (2, "banglore", "koramangala floor 2 ");

SELECT * FROM branch;

SELECT * FROM employees;

INSERT INTO employees VALUES (1,"Tanishq","Data science teacher", "60000", "1");
INSERT INTO employees VALUES (2,"SNEHA", "Data analyst teacher", "30000", "2");


SELECT * FROM branch;

DELETE FROM branch
WHERE branch_id = 2;

UPDATE employees
SET branch_id = 2
WHERE emp_id = 2;


SHOW TABLES;

USE company_db;
SHOW TABLES;

SELECT * FROM employees;
SELECT  * FROM departments;


-- sub queries


SELECT * FROM employees
WHERE dept_id=(SELECT dept_id FROM departments WHERE dept_name = "Engineering");

SELECT * FROM employees
WHERE dept_id = (SELECT dept_id FROM departments WHERE dept_name = "Sales");


-- employee details with minimum salary

SELECT * FROM employees
WHERE salary = (SELECT MIN(salary) FROM employees);

SELECT MIN(salary) FROM employees;



-- joins

SHOW TABLES;
SELECT * FROM employees;
SELECT * FROM departments;

SELECT emp_id, first_name,  branch, dept_name FROM employees INNER JOIN departments 
ON employees.dept_id = departments.dept_id;

SELECT * FROM employees LEFT JOIN departments
ON employees.dept_id = departments.dept_id;

SELECT * FROM employees INNER JOIN departments
ON employees.dept_id = departments.dept_id;


-- revision

SHOW TABLES;
SHOW DATABASES;
USE company_db;
SHOW TABLES;



SELECT emp_id , first_name, salary, designation, branch, location FROM employees INNER JOIN departments
ON employees.dept_id = departments.dept_id;

SELECT * FROM employees INNER JOIN departments 
ON employees.dept_id = departments.dept_id;

SELECT * FROM employees LEFT JOIN departments
ON employees.dept_id = departments.dept_id;

SELECT * FROM employees RIGHT JOIN departments
ON employees.dept_id = departments.dept_id;




-- WHERE EXISTS USED WITH SUBQUERY

SELECT emp_id,first_name, salary FROM employees
WHERE EXISTS ( 
SELECT * FROM departments
WHERE dept_name = "Engineering" AND employees.dept_id = departments.dept_id
);

SELECT * FROM employees INNER JOIN departments
ON employees.dept_id = departments.dept_id;


SELECT * FROM employees 
WHERE EXISTS(
SELECT * FROM departments 
WHERE dept_name = "HR" AND employees.dept_id = departments.dept_id
);

-- WHERE ANY SUBQUERY

SELECT * FROM employees
WHERE dept_id = ANY(
SELECT dept_id FROM departments
WHERE budget < 300000
);

-- ALL subquery

SELECT * FROM employees
WHERE dept_id <> ALL(                                 -- Not equal to ALL of these (enginering , sales)
SELECT dept_id FROM departments 
WHERE dept_name IN ('Engineering', 'Sales')
);


SELECT * FROM employees
WHERE designation IN ("data engineer", "AI engineer");

SELECT * FROM employees
WHERE designation = "data engineer" 
OR designation = "AI engineer";



SELECT * FROM employees
WHERE EXISTS(
SELECT * FROM departments
WHERE dept_name = "HR" AND employees.dept_id = departments.dept_id
);

-- views                                 ----its basically like a functions in py

CREATE VIEW high_sal
AS 
SELECT * FROM employees
WHERE salary > 70000;

SELECT * FROM high_sal;

SELECT * FROM high_sal
WHERE branch = "computer science";

CREATE OR REPLACE VIEW high_sal
AS 
SELECT * FROM employees
WHERE salary > 70000
ORDER BY emp_id desc;

SELECT * FROM high_sal;

DROP VIEW high_sal;



-- SELECT firstname,lastname,city,state FROM person LEFT JOIN address
-- ON person.personid = address.personid;                                      --leetcode problem to join person and address table 

-- second highest salary leet code problem   ---- use OFFSET 

SELECT DISTINCT salary FROM employees
ORDER BY salary DESC
LIMIT 1 OFFSET 1;



SELECT designation , COUNT(emp_id) FROM employees
GROUP BY designation
HAVING COUNT(emp_id) > 1;


-- training

SELECT * FROM employees INNER JOIN departments 
ON employees.dept_id = departments.dept_id;

SELECT * FROM employees
WHERE EXISTS (
SELECT * FROM departments
WHERE dept_name = "Sales" AND employees.dept_id = departments.dept_id
);

SELECT * FROM employees
WHERE dept_id <> ALL(
SELECT dept_id FROM departments
WHERE dept_name IN ("Engineering","Sales")
);

SELECT * FROM employees
WHERE dept_id = ANY(
SELECT dept_id FROM departments
WHERE dept_name = "Engineering"
);

CREATE VIEW high_salary AS
SELECT * FROM employees
WHERE salary > 71000;

SELECT * FROM high_salary;

CREATE OR REPLACE VIEW high_salary AS
SELECT * FROM employees
WHERE salary >= 80000;

SELECT * FROM high_salary;

DROP VIEW high_salary;

SELECT * FROM high_salary;




-- TCL commands


SHOW DATABASES;

USE gopal_db;
SHOW TABLES;

SELECT * FROM members;
DESCRIBE members;

ALTER TABLE members MODIFY COLUMN id VARCHAR(50) PRIMARY KEY;

INSERT INTO members VALUES (1,"Gowtham","50000"),(2,"Jasmine","25000");

SELECT * FROM members;

SET AUTOCOMMIT=OFF;
INSERT INTO members VALUES(3,"Madan","50000");
COMMIT;

select * FROM members;

DELETE FROM members
WHERE id="3";

ROLLBACK;

ALTER TABLE members MODIFY COLUMN id VARCHAR(40);

INSERT INTO members VALUES("4","Sanjay","12000");

COMMIT;

DELETE FROM members
WHERE id = "4";

ROLLBACK;

SELECT * FROM members;

SET AUTOCOMMIT = ON;

SELECT * FROM members;

DELETE FROM members
WHERE id = "4";

select * FROM members;
ROLLBACK;

SET AUTOCOMMIT = OFF;

INSERT INTO members VALUES ("4","Teesha","58000");
SELECT * FROM members;

COMMIT;
SELECT * FROM members;

DELETE FROM members
WHERE id = "4";

SELECT * FROM members;
ROLLBACK;

