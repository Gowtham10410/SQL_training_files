SHOW DATABASES;
USE gopal_db;
SHOW TABLES;
SELECT * FROM members;

CREATE TABLE staffs(
sid INT PRIMARY KEY,
sname VARCHAR(40),
sub VARCHAR(40)
);

SELECT * FROM staffs;

INSERT INTO staffs VALUES (1,"tanishq","Data Science","60000"),(2,"Sneha","Data Science","35000"),(3,"Giridhar","Data Analytics","45000");

ALTER TABLE staffs MODIFY COLUMN salary VARCHAR(40) DEFAULT '25000';

DESCRIBE staffs;
SELECT * FROM staffs;

DROP TABLE staffs;

TRUNCATE staffs;
INSERT INTO staffs(sid,sname,sub) VALUES(4,"Sham","Data engineering");

SELECT * FROM staffs;


SELECT * FROM members;

DROP TABLE members;

SELECT * FROM staffs;

ALTER TABLE staffs DROP COLUMN salary;

UPDATE staffs 
SET sub = "AI/ML"
WHERE sid = "2";

DELETE FROM staffs
WHERE sid = "4";

SELECT * FROM staffs;

INSERT INTO staffs VALUES ("4","Kareem","Data Engineering");

UPDATE staffs
SET sname = "Kareem abdulla"
WHERE sid = "4";

DESCRIBE STAFFS;

SELECT * FROM staffs
WHERE sid = 2;

SHOW DATABASES;

USE company_db;

SHOW TABLES;

SELECT * FROM employees;

SELECT distinct designation,COUNT(salary) FROM EMPLOYEES
GROUP BY designation;

SELECT * FROM employees
LIMIT 1;

SELECT DISTINCT designation, COUNT(emp_id) FROM employees
GROUP BY designation
HAVING COUNT(emp_id) > 1;

USE gopal_db;

SHOW TABLES;
SELECT * FROM staffs;


ALTER TABLE staffs RENAME COLUMN sub TO subjects;

RENAME TABLE staffs TO staff;

SELECT * FROM staff;

RENAME TABLE staff TO staffs;
select * from STAFFS;

DESCRIBE STAFFS;

ALTER TABLE staffs MODIFY COLUMN sname VARCHAR(55);

ALTER TABLE staffs MODIFY COLUMN subjects VARCHAR(56) DEFAULT 'DATA SCIENCE';

ALTER TABLE staffs RENAME COLUMN subjects TO sub;

ALTER TABLE staffs ALTER sub SET DEFAULT 'CDS';

ALTER TABLE staffs MODIFY COLUMN sname VARCHAR(56) NOT NULL;

ALTER TABLE staffs ALTER sub DROP DEFAULT;


USE company_db;

SELECT * FROM employees;

SELECT first_name,salary FROM employees
ORDER BY salary DESC;

USE gopal_db;
SELECT * FROM staffs;

SELECT COUNT(sid) FROM staffs;

USE company_db;
SELECT * FROM employees;

SELECT SUM(salary) FROM employees;
SELECT COUNT(emp_id) FROM employees;
SELECT MIN(salary) FROM employees;

SELECT * FROM employees
WHERE salary =  (SELECT MAX(salary)FROM employees);

USE gopal_db;

SELECT * FROM staffs;

ALTER TABLE staffs ADD COLUMN branch_id VARCHAR(50);

CREATE TABLE branch(
branch_id VARCHAR(50) PRIMARY KEY,
branch_name VARCHAR(50)
);

ALTER TABLE staffs ADD CONSTRAINT fk_foreign_key FOREIGN KEY(branch_id) REFERENCES branch(branch_id);

DESCRIBE staffs;

DROP TABLE branch;

ALTER TABLE staffs DROP CONSTRAINT fk_foreign_key;

DROP table branch;

SHOW TABLES;

SELECT * FROM staffs;
DESCRIBE staffs;

SHOW INDEX FROM staffs;

ALTER TABLE staffs DROP INDEX fk_foreign_key;

ALTER TABLE staffs DROP FOREIGN KEY fk_foreign_key;

CREATE INDEX name_index ON staffs(sname);

ALTER TABLE staffs DROP INDEX name_index;

ALTER TABLE staffs ADD INDEX(sname);
ALTER TABLE staffs DROP INDEX sname;
SHOW TABLES;

DROP TABLE branch;

SELECT * FROM staffs;


USE company_db;

SHOW TABLES;
SELECT * FROM employees;

-- subquery

SELECT * FROM employees 
WHERE salary = (SELECT MIN(salary) FROM employees);

SELECT * FROM employees;

SELECT * FROM departments;
-- joins
SELECT * FROM employees INNER JOIN departments
ON employees.dept_id = departments.dept_id;

SELECT * FROM employees LEFT JOIN departments
ON employees.dept_id = departments.dept_id;

SELECT * FROM employees RIGHT JOIN departments
ON employees.dept_id = departments.dept_id;

SELECT * FROM departments;

-- WHERE EXIST

SELECT * FROM employees
WHERE EXISTS (
SELECT * FROM departments
WHERE dept_name = "Engineering" AND employees.dept_id = departments.dept_id
);

-- ALL
SELECT * FROM employees
WHERE dept_id <> ALL(
SELECT dept_id FROM departments
WHERE dept_name IN ('Engineering', 'Sales')
);

-- ANY
SELECT * FROM employees
WHERE dept_id = ANY(
SELECT dept_id FROM departments
WHERE budget > 400000
);


-- views 
CREATE VIEW high_sal AS 
SELECT MAX(salary) FROM employees;

SELECT * FROM high_sal;

CREATE OR REPLACE VIEW high_sal AS
SELECT * From employees
WHERE emp_id = 8;

SELECT * FROM high_sal;

DROP VIEW high_sal;


USE gopal_db;

SHOW TABLES;
SELECT * FROM staffs;

SET AUTOCOMMIT = OFF;

INSERT INTO staffs(sid,sname,sub) VALUES ("5","Shreesha","data engineering");

SELECT * FROM staffs;

DELETE FROM staffs
WHERE sid = 5;

SELECT * FROM staffs;

ROLLBACK;

COMMIT;

ROLLBACK;


