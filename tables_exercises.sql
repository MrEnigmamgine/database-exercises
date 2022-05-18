-- 3. Use the employees database. Write the SQL code necessary to do this.
use employees;

-- 4. List all the tables in the database. Write the SQL code necessary to accomplish this.
show databases;

-- 5. Explore the employees table. What different data types are present on this table?
-- int, date, varchar, enum (number, string, date)
describe employees.employees;

-- explore to answer later questions
show tables;
describe departments;
describe dept_emp;
describe dept_manager;
describe employees;
describe salaries;
describe titles;

-- Which table(s) do you think contain a numeric type column?
-- employees, dept_emp, dept_manager, salaries, titles

-- Which table(s) do you think contain a string type column?
-- departments, dept_emp, dept_manager, employees, titles

-- Which table(s) do you think contain a date type column?
-- titles, salaries, employees, dept_manager, dept_emp,

-- What is the relationship between the employees and the departments tables?
-- dept_emp joins on employees.emp_no and departments.dept_no to describe when an employee was a member of that department

-- Show the SQL that created the dept_manager table.
SHOW CREATE TABLE employees.dept_manager;
-- 'CREATE TABLE `dept_manager` (
--   `emp_no` int NOT NULL,
--   `dept_no` char(4) NOT NULL,
--   `from_date` date NOT NULL,
--   `to_date` date NOT NULL,
--   PRIMARY KEY (`emp_no`,`dept_no`),
--   KEY `dept_no` (`dept_no`),
--   CONSTRAINT `dept_manager_ibfk_1` FOREIGN KEY (`emp_no`) REFERENCES `employees` (`emp_no`) ON DELETE CASCADE ON UPDATE RESTRICT,
--   CONSTRAINT `dept_manager_ibfk_2` FOREIGN KEY (`dept_no`) REFERENCES `departments` (`dept_no`) ON DELETE CASCADE ON UPDATE RESTRICT
-- ) ENGINE=InnoDB DEFAULT CHARSET=latin1'