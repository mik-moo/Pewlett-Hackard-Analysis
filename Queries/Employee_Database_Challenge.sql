--Employee_Database_Challenge
--DELIVERABLE 1: The Number of Retiring Employees by Title 
--Create table for number of retiring employees
SELECT e.emp_no,
e.first_name,
e.last_name,
ti.title,
ti.from_date,
ti.to_date
INTO retirement_titles
FROM employees as e
LEFT JOIN titles AS ti
ON (e.emp_no = ti.emp_no)
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY emp_no;

-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (emp_no) emp_no,
first_name,
last_name,
title
INTO unique_titles
FROM retirement_titles
WHERE to_date = '9999-01-01'
ORDER BY emp_no, to_date DESC;

--retrieve number of employees, titles about to retire
SELECT COUNT (title), title
INTO retiring_titles
FROM unique_titles
GROUP BY title
ORDER BY count DESC;


--Deliverable 2: The Employees Eligible for the Mentorship Program
--employees eligible for the mentorship program
SELECT DISTINCT ON (e.emp_no)
	e.emp_no,
	e.first_name,
	e.last_name,
	e.birth_date,
	de.from_date,
	de.to_date,
	t.title
INTO mentor_elig
FROM employees as e
INNER JOIN dept_emp as de
ON (e.emp_no = de.emp_no)
INNER JOIN titles as t
ON (e.emp_no = t.emp_no)
WHERE (de.to_date = '9999-01-01') AND (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
ORDER BY e.emp_no;




--Additional Queries
--retrieve number of employees, titles for mentorship program
SELECT COUNT (title), title AS "mentor title"
INTO mentoring_titles
FROM mentor_elig
GROUP BY title
ORDER BY count DESC;

-- --Younger employees eligible for the manager mentorship program (none returned)
-- SELECT DISTINCT ON (e.emp_no)
-- 	e.emp_no,
-- 	e.first_name,
-- 	e.last_name,
-- 	e.birth_date,
-- 	de.from_date,
-- 	de.to_date,
-- 	t.title
-- --INTO younger_mentor_elig
-- FROM employees as e
-- INNER JOIN dept_emp as de
-- ON (e.emp_no = de.emp_no)
-- INNER JOIN titles as t
-- ON (e.emp_no = t.emp_no)
-- WHERE (de.to_date = '9999-01-01') AND (e.birth_date BETWEEN '1966-01-01' AND '1966-12-31') AND (t.title = 'Manager')
-- ORDER BY e.emp_no;

--Older employees eligible for the manager mentorship program
SELECT DISTINCT ON (e.emp_no)
	e.emp_no,
	e.first_name,
	e.last_name,
	e.birth_date,
	de.from_date,
	de.to_date,
	t.title
INTO mgmt_mentor_elig_64
FROM employees as e
INNER JOIN dept_emp as de
ON (e.emp_no = de.emp_no)
INNER JOIN titles as t
ON (e.emp_no = t.emp_no)
WHERE (de.to_date = '9999-01-01') AND (e.birth_date BETWEEN '1964-01-01' AND '1964-12-31') AND (t.title = 'Manager')
ORDER BY e.emp_no;

-- Increase age/birth date range for mentor program from '56-'65
SELECT DISTINCT ON (e.emp_no)
	e.emp_no,
	e.first_name,
	e.last_name,
	e.birth_date,
	de.from_date,
	de.to_date,
	t.title
INTO mgmt_mentor_elig_56_65
FROM employees as e
INNER JOIN dept_emp as de
ON (e.emp_no = de.emp_no)
INNER JOIN titles as t
ON (e.emp_no = t.emp_no)
WHERE (de.to_date = '9999-01-01') AND (e.birth_date BETWEEN '1956-01-01' AND '1964-12-31') AND (t.title = 'Manager')
ORDER BY e.emp_no;


-- --employees eligible for the mentorship program 66-70--none identified
-- SELECT DISTINCT ON (e.emp_no)
-- 	e.emp_no,
-- 	e.first_name,
-- 	e.last_name,
-- 	e.birth_date,
-- 	de.from_date,
-- 	de.to_date,
-- 	t.title
-- --INTO mentor_elig
-- FROM employees as e
-- INNER JOIN dept_emp as de
-- ON (e.emp_no = de.emp_no)
-- INNER JOIN titles as t
-- ON (e.emp_no = t.emp_no)
-- WHERE (de.to_date = '9999-01-01') AND (e.birth_date BETWEEN '1966-01-01' AND '1970-12-31') AND (t.title = 'Manager')
-- ORDER BY e.emp_no;