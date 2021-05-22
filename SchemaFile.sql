-- Creating tables for 6 CSV files

-- Departments table; "dept_no","dept_name"

CREATE TABLE Departments(   
	dept_no varchar not null,
	dept_name varchar not null,
	primary key(dept_no)
);

SELECT * 
FROM Departments;

-- Titles table; title_id,title

CREATE TABLE Titles (   
	title_id varchar not null,
	title varchar not null,
	primary key(title_id)
);

SELECT * 
FROM titles;

-- Employees table; emp_no,emp_title_id,birth_date,first_name,last_name,sex,hire_date
-- Foreign key is a column in this table that exists in another table as well
--https://www.postgresqltutorial.com/postgresql-foreign-key/ 

CREATE TABLE Employees (   
	emp_no int not null,
	emp_title_id varchar not null,
	birth_date date not null,
	first_name varchar not null,
	last_name varchar not null,
	sex varchar,
	hire_date date not null,
	primary key(emp_no),
	foreign key(emp_title_id) references titles(title_id)
);

SELECT * 
FROM Employees;

-- Department Manager table dept_no,emp_no
CREATE TABLE DepartmentManager  (   
	dept_no varchar not null,
	emp_no int not null,
	primary key(dept_no, emp_no),
	foreign key(dept_no) references Departments(dept_no),
	foreign key(emp_no) references Employees(emp_no)
);

SELECT * 
FROM DepartmentManager;

-- Salaries table emp_no,salary

CREATE TABLE Salaries  (   
	emp_no int not null,
	salary int not null,
	primary key(emp_no, salary),
	foreign key(emp_no) references Employees(emp_no)
);

SELECT * 
FROM Salaries;

-- Salaries table emp_no,salary
DROP TABLE dept_employees
CREATE TABLE dept_employees (   
	emp_no int not null,
	dept_no varchar not null,
	primary key(emp_no, dept_no),
	foreign key(emp_no) references Employees(emp_no),
	foreign key(dept_no) references departments (dept_no)
);

SELECT * 
FROM dept_employees;
