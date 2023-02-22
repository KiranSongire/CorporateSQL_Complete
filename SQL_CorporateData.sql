-- select * from student
-- CREATE TABLE student(
-- student_id int PRIMARY KEY,
-- name varchar(20) NOT NULL,
-- major varchar(20) DEFAULT "Undecided"
-- );

-- alter table student ADD gpa decimal;
-- ALTER TABLE STUDENT DROP gpa;

-- INSERT INTO Student VALUES(4, 'Jack', 'Biology');
-- INSERT INTO Student VALUES(5, 'Mike', 'Computer Science');

-- UPDATE student 
-- SET name = 'Jack', major = 'Biology'
-- WHERE student_id = 1;

-- DELETE FROM student 
-- WHERE student_id = 1 AND major  = 'undecided';

-- SELECT *
-- FROM student
-- ORDER BY student_id ASC;

-- UPDATE student 
-- SET major = 'Chemistry'
-- WHERE student_id = 3;

-- SELECT *
-- FROM student
-- ORDER BY student_id DESC;

-- CREATE TABLE employee (
--   emp_id INT PRIMARY KEY,
--   first_name VARCHAR(40),
--   last_name VARCHAR(40),
--   birth_day DATE,
--   sex VARCHAR(1),
--   salary INT,
--   super_id INT,
--   branch_id INT
-- );
-- CREATE TABLE branch (
--   branch_id INT PRIMARY KEY,
--   branch_name VARCHAR(40),
--   mgr_id INT,
--   mgr_start_date DATE,
--   FOREIGN KEY(mgr_id) REFERENCES employee(emp_id) ON DELETE SET NULL
-- );

-- ALTER TABLE employee
-- ADD FOREIGN KEY(branch_id)
-- REFERENCES branch(branch_id)
-- ON DELETE SET NULL;

-- ALTER TABLE employee
-- ADD FOREIGN KEY(super_id)
-- REFERENCES employee(emp_id)
-- ON DELETE SET NULL;

-- CREATE TABLE client (
--   client_id INT PRIMARY KEY,
--   client_name VARCHAR(40),
--   branch_id INT,
--   FOREIGN KEY(branch_id) REFERENCES branch(branch_id) ON DELETE SET NULL
-- );

-- CREATE TABLE works_with (
--   emp_id INT,
--   client_id INT,
--   total_sales INT,
--   PRIMARY KEY(emp_id, client_id),
--   FOREIGN KEY(emp_id) REFERENCES employee(emp_id) ON DELETE CASCADE,
--   FOREIGN KEY(client_id) REFERENCES client(client_id) ON DELETE CASCADE
-- );

-- CREATE TABLE branch_supplier (
--   branch_id INT,
--   supplier_name VARCHAR(40),
--   supply_type VARCHAR(40),
--   PRIMARY KEY(branch_id, supplier_name),
--   FOREIGN KEY(branch_id) REFERENCES branch(branch_id) ON DELETE CASCADE
-- );

-- Corporate
-- INSERT INTO employee VALUES(100, 'David', 'Wallace', '1967-11-17', 'M', 250000, NULL, NULL);

-- INSERT INTO branch VALUES(1, 'Corporate', 100, '2006-02-09');

-- UPDATE employee
-- SET branch_id = 1
-- WHERE emp_id = 100;

-- INSERT INTO employee VALUES(101, 'Jan', 'Levinson', '1961-05-11', 'F', 110000, 100, 1);

----SCranton
-- INSERT INTO employee VALUES(102, 'Michael', 'Scott', '1964-03-15', 'M', 75000, 100, NULL);

-- INSERT INTO branch VALUES(2, 'Scranton', 102, '1992-04-06');

-- UPDATE employee
-- SET branch_id = 2
-- WHERE emp_id = 102;

-- INSERT INTO employee VALUES(103, 'Angela', 'Martin', '1971-06-25', 'F', 63000, 102, 2);
-- INSERT INTO employee VALUES(104, 'Kelly', 'Kapoor', '1980-02-05', 'F', 55000, 102, 2);
-- INSERT INTO employee VALUES(105, 'Stanley', 'Hudson', '1958-02-19', 'M', 69000, 102, 2);

-- Stamford
-- INSERT INTO employee VALUES(106, 'Josh', 'Porter', '1969-09-05', 'M', 78000, 100, NULL);

-- INSERT INTO branch VALUES(3, 'Stamford', 106, '1998-02-13');

-- UPDATE employee
-- SET branch_id = 3
-- WHERE emp_id = 106;

-- INSERT INTO employee VALUES(107, 'Andy', 'Bernard', '1973-07-22', 'M', 65000, 106, 3);
-- INSERT INTO employee VALUES(108, 'Jim', 'Halpert', '1978-10-01', 'M', 71000, 106, 3);

-- BRANCH SUPPLIER
-- INSERT INTO branch_supplier VALUES(2, 'Hammer Mill', 'Paper');
-- INSERT INTO branch_supplier VALUES(2, 'Uni-ball', 'Writing Utensils');
-- INSERT INTO branch_supplier VALUES(3, 'Patriot Paper', 'Paper');
-- INSERT INTO branch_supplier VALUES(2, 'J.T. Forms & Labels', 'Custom Forms');
-- INSERT INTO branch_supplier VALUES(3, 'Uni-ball', 'Writing Utensils');
-- INSERT INTO branch_supplier VALUES(3, 'Hammer Mill', 'Paper');
-- INSERT INTO branch_supplier VALUES(3, 'Stamford Lables', 'Custom Forms');

-- -- CLIENT
-- INSERT INTO client VALUES(400, 'Dunmore Highschool', 2);
-- INSERT INTO client VALUES(401, 'Lackawana Country', 2);
-- INSERT INTO client VALUES(402, 'FedEx', 3);
-- INSERT INTO client VALUES(403, 'John Daly Law, LLC', 3);
-- INSERT INTO client VALUES(404, 'Scranton Whitepages', 2);
-- INSERT INTO client VALUES(405, 'Times Newspaper', 3);
-- INSERT INTO client VALUES(406, 'FedEx', 2);

-- WORKS_WITH
-- INSERT INTO works_with VALUES(105, 400, 55000);
-- INSERT INTO works_with VALUES(102, 401, 267000);
-- INSERT INTO works_with VALUES(108, 402, 22500);
-- INSERT INTO works_with VALUES(107, 403, 5000);
-- INSERT INTO works_with VALUES(108, 403, 12000);
-- INSERT INTO works_with VALUES(105, 404, 33000);
-- INSERT INTO works_with VALUES(107, 405, 26000);
-- INSERT INTO works_with VALUES(102, 406, 15000);
-- INSERT INTO works_with VALUES(105, 406, 130000);
select * from works_with;
select * from client;
select * from branch_supplier;
select * from employee
ORDER BY sex, first_name, last_name;
-------Find first 5 employee of table
select first_name AS f_name,
last_name AS l_name
FROM employee
LIMIT 5;

SELECT DISTINCT branch_id
FROM employee;

SELECT * FROM employee;

SELECT COUNT(emp_id), first_name, last_name
FROM employee
WHERE sex = 'F' AND birth_day > '1971-01-01'
GROUP BY first_name, last_name;

SELECT SUM(salary)
FROM employee
WHERE sex = 'M';

-- Select count m and f in employee
SELECT COUNT(emp_id)
FROM employee
WHERE sex = 'F' AND birth_day > '1971-01-01'

SELECT SUM(total_sales), client_id
FROM works_with
GROUP BY client_id

-- Wild card
---FIND ANY clients who are in LLc
-- %, _ (ANYNUM charach, only one)
-- SELECT *
-- FROM client
-- WHERE client_name LIKE '%LLC';
-- find any branch suppliers who are in label business

SELECT * 
FROM branch_supplier
WHERE supplier_name LIKE '% Labels%';

-- Find any clients who are schools
SELECT * 
FROM client
WHERE client_name LIKE '%school%';


-- UNIONS in SQL

-- FInd a list of employee and branch name
-- (TAKEAWAY:  should have same number of columns)

SELECT first_name AS Company_Name
FROM employee
UNION
SELECT branch_name
FROM branch;


-- JOINS---
INSERT INTO branch VALUES (4, 'Buffalo', NULL, NULL)
Select * from branch



SELECT employee.emp_id, employee.first_name, branch.branch_name
FROM employee
JOIN branch    -- LEFT JOIN, RIGHT JOIN
ON employee.emp_id = branch.mgr_id;

-- Find names of all employees who have sold over  more than 30,000 to  single client
SELECT employee.first_name, employee.last_name
FROM employee
WHERE employee.emp_id IN(
	SELECT works_with.emp_id
	FROM works_with
	WHERE works_with.total_Sales > 30000
)


-- Find all clients who are handles by the branch that Michael Scott manages
-- Assume you know Michael's ID
SELECT client_name 
FROM client
WHERE client.branch_id IN (
	SELECT branch.branch_id
	FROM branch
	WHERE branch.mgr_id = 102
	LIMIT 1
);

--  ON DELETE SET NULL, CASCADE
DELETE FROM employee
WHERE emp_id = 102;

SELECT * FROM branch;


-- TRIGGER---
CREATE TABLE trigger_test (
     message VARCHAR(100)
);

-- mysql -u root -p


DELIMITER $$
CREATE
    TRIGGER my_trigger BEFORE INSERT
    ON employee
    FOR EACH ROW BEGIN
        INSERT INTO trigger_test VALUES('added new employee');
    END$$
DELIMITER ;









