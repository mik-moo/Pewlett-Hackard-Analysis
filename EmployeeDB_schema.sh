Departments
-
dept_no varchar pk
dept_name varchar

Dept_Emp
-
emp_no int pk fk -< employees.emp_no
dept_no varchar fk -< Departments.dept_no
birth_date date
first_name varchar
last_name varchar
gender varchar
hire_date date

Dept_manager
-
dept_no varchar pk fk - Departments.dept_no
emp_no int pk fk - employees.emp_no
from_date date
to_date date

employees
-
emp_no int pk
birth_date date
first_name varchar
last_name varchar
gender varchar
hire_date date

salaries
-
emp_no int pk fk - employees.emp_no
salary int
from_date date
to_date date

titles
-
emp_no int pk fk -< employees.emp_no
title varchar
from_date date
to_date date