-- 1. Find all the current employees with the same hire date as employee 101010 using a sub-query.
select * 
from employees as emp
join dept_emp as demp on emp.emp_no = demp.emp_no
where emp.hire_date = (select hire_date from employees where emp_no = 101010)
	and demp.to_date > now()
;

-- 2. Find all the titles ever held by all current employees with the first name Aamod.
select emp_no from employees where first_name = 'Aamod';

select
		*
from titles
where emp_no in (select emp_no from employees where first_name = 'Aamod')
;

-- 3. How many people in the employees table are no longer working for the company? Give the answer in a comment in your code.
select emp_no from salaries where to_date < now(); -- old salaries
select emp_no from salaries where to_date > now(); -- new salaries

select count(*)
from salaries
where emp_no in (select emp_no from salaries where to_date < now())
	and emp_no not in (select emp_no from salaries where to_date > now())
;
-- 319310

-- 4. Find all the current department managers that are female. List their names in a comment in your code.
select 
	emp.first_name,
    emp.last_name
from 
	dept_manager as dm
	join employees as emp on dm.emp_no = emp.emp_no
where
	emp.gender = 'F'
    and dm.to_date > now()
;
/*
Isamu	Legleitner
Karsten	Sigstam
Leon	DasSarma
Hilary	Kambil
*/

-- 5. Find all the employees who currently have a higher salary than the companies overall, historical average salary.
select avg(salary) from salaries; -- historical avg salary (63810.7448)

select * 
from salaries
where
	salary > (select avg(salary) from salaries)
    and to_date > now()
    ;

-- 6. How many current salaries are within 1 standard deviation of the current highest salary? (Hint: you can use a built in function to calculate the standard deviation.) What percentage of all salaries is this?
-- Hint You will likely use multiple subqueries in a variety of ways
-- Hint It's a good practice to write out all of the small queries that you can. Add a comment above the query showing the number of rows returned. You will use this number (or the query that produced it) in other, larger queries.
select stddev(salary) from salaries;

-- BONUS

-- 1. Find all the department names that currently have female managers.

select
	distinct(dept_name)
from
	departments as dep
    join dept_manager as dm on dep.dept_no = dm.dept_no
    join employees as emp on dm.emp_no = emp.emp_no
where
	emp.gender = 'F'
    and dm.to_date > now()
;


-- 2. Find the first and last name of the employee with the highest salary.
select
	emp.first_name,
    emp.last_name
from
	salaries as sal
    join employees as emp on sal.emp_no = emp.emp_no
where
	salary = (select max(salary) from salaries)
;
-- 3. Find the department name that the employee with the highest salary works in.

SELECT 
    dep.dept_name
FROM
    dept_emp AS demp
        JOIN
    departments AS dep ON dep.dept_no = demp.dept_no
WHERE
    emp_no = 	(SELECT 
					emp.emp_no
				FROM
					salaries AS sal
						JOIN
					employees AS emp ON sal.emp_no = emp.emp_no
				WHERE
					salary = (SELECT 
							MAX(salary)
						FROM
							salaries))
    
;