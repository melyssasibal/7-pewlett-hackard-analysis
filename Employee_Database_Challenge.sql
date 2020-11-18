-- DELIVERABLE 1
SELECT e.emp_no,
    e.first_name,
    e.last_name,
    t.title,
    t.from_date,
    t.to_date
INTO retirement_titles
FROM employees as e 
LEFT JOIN titles as t
ON (e.emp_no = t.emp_no)
WHERE e.birth_date BETWEEN '1952-01-01' AND '1955-12-31'
ORDER BY emp_no ASC;

-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (rt.emp_no) rt.emp_no,
rt.first_name,
rt.last_name,
rt.title
INTO unique_titles
FROM retirement_titles as rt
ORDER BY emp_no, to_date DESC;

SELECT COUNT(ut.title), ut.title
INTO retiring_titles
FROM unique_titles as ut
GROUP BY ut.title
ORDER BY COUNT DESC;

-- DELIVERABLE 2
SELECT DISTINCT ON (e.emp_no) e.emp_no,
    e.first_name,
    e.last_name,
    e.birth_date,
    de.from_date,
    de.to_date,
    t.title
INTO mentorship_eligibility
FROM employees as e 
LEFT JOIN dept_emp as de
ON (e.emp_no = de.emp_no)
LEFT JOIN titles as t
ON (e.emp_no = t.emp_no)
WHERE (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
AND (de.to_date = '9999-01-01');
ORDER BY emp_no ASC;


-- OTHER 
-- Get table with department information 
--retirement_departments
SELECT rt.emp_no,
    rt.first_name,
    rt.last_name,
    rt.title,
	de.dept_no,
	d.dept_name,
    rt.from_date,
    rt.to_date
INTO retirement_departments
FROM retirement_titles as rt 
LEFT JOIN dept_emp as de
ON (rt.emp_no = de.emp_no)
LEFT JOIN departments as d
ON (de.dept_no = d.dept_no)
ORDER BY emp_no ASC;

--unique_departments
SELECT DISTINCT ON (rd.emp_no) rd.emp_no,
rd.first_name,
rd.last_name,
rd.title,
rd.dept_name
INTO unique_departments
FROM retirement_departments as rd
ORDER BY emp_no, to_date DESC;

--retiring_departments 
SELECT COUNT(ud.dept_name), ud.dept_name, ud.title
INTO retiring_departments
FROM unique_departments as ud
GROUP BY ud.dept_name, ud.title
ORDER BY dept_name ASC, title ASC;

--mentorship_eligibility_count 
SELECT me.emp_no,
    me.first_name,
    me.last_name,
    me.title,
	de.dept_no,
	d.dept_name
INTO mentorship_eligibility_dept
FROM mentorship_eligibility as me 
LEFT JOIN dept_emp as de
ON (me.emp_no = de.emp_no)
LEFT JOIN departments as d
ON (de.dept_no = d.dept_no)
ORDER BY emp_no ASC;
