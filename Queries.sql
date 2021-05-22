-- Queries 1- 8

--1. List the following details of each employee: employee number, last name, first name, sex, and salary.
--Creatig a view
CREATE VIEW question1 as 
SELECT e.emp_no, e.last_name, e.first_name, e.sex, s.salary
FROM employees as e
	INNER JOIN salaries as s
		ON (e.emp_no = s.emp_no)
ORDER BY s.salary DESC;

--2. List first name, last name, and hire date for employees who were hired in 1986.
CREATE VIEW Question2 AS
SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date BETWEEN '1986-01-01'AND '1986-12-31';

-- 3. List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.
CREATE VIEW Question3 AS
SELECT d.dept_no, d.dept_name, e.first_name, e.last_name, e.emp_no
FROM departmentmanager AS dm
	INNER JOIN departments AS d
		ON(dm.dept_no = d.dept_no)
	INNER JOIN employees AS e
		ON(e.emp_no = dm.emp_no);
		
-- 4.List the department of each employee with the following information: employee number, last name, first name, and department name.
CREATE VIEW Question4 As
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees AS e
	INNER JOIN dept_employees AS de
		ON(e.emp_no = de.emp_no)
	INNER JOIN departments AS d
		ON(d.dept_no = de.dept_no)
ORDER BY e.emp_no, e.first_name, e.last_name, d.dept_name;
SELECT * FROM Question4;

-- 5.List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
CREATE VIEW Question5 As
SELECT first_name, last_name, sex 
FROM employees
WHERE first_name = 'Hercules'
AND last_name LIKE 'B%';

-- 6. List all employees in the Sales department, including their employee number, last name, first name, and department name.
CREATE VIEW Question6 As
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees AS e
	INNER JOIN dept_employees AS de
		ON(e.emp_no = de.emp_no)
	INNER JOIN departments AS d
		ON(d.dept_no = de.dept_no)
WHERE d.dept_name = 'Sales';

-- 7.List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
CREATE VIEW Question7 As
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees AS e
	INNER JOIN dept_employees AS de
		ON(e.emp_no = de.emp_no)
	INNER JOIN departments AS d
		ON(d.dept_no = de.dept_no)
WHERE d.dept_name IN ('Sales', 'Development');

-- 8.In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
CREATE VIEW Question8 As
SELECT last_name, COUNT(last_name) 
FROM employees
GROUP BY last_name
ORDER BY COUNT(last_name) DESC

