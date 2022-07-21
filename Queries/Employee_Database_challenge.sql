--Deliverable 1
SELECT em.emp_no, 
       em.first_name, 
       em.last_name, 
       tl.title, 
       tl.from_date, 
       tl.to_date
INTO RETIRING_EMPLOYEES_BY_TITLE
FROM employees as em
INNER JOIN title as tl
ON em.emp_no = tl.emp_no
WHERE (em.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY em.emp_no ASC

SELECT DISTINCT ON (emp_no) emp_no, first_name, last_name, title
INTO unique_titles
FROM RETIRING_EMPLOYEES_BY_TITLE
WHERE to_date = ('9999-01-01')
ORDER BY emp_no ASC, to_date desc;

SELECT COUNT(title), title 
INTO Retiring_Titles
FROM unique_titles
GROUP BY title
ORDER BY COUNT DESC;

--Deliverable 2
SELECT DISTINCT ON (em.emp_no)em.emp_no,
       em.first_name, 
       em.last_name, 
       em.birth_date,
       dpe.from_date, 
       dpe.to_date,
       tl.title
INTO mentorship_eligibilty
FROM employees AS em
JOIN dept_emp AS dpe
ON em.emp_no = dpe.emp_no
JOIN title AS tl
ON em.emp_no = tl.emp_no
WHERE dpe.to_date = ('9999-01-01') AND (birth_date BETWEEN '1965-01-01' AND '1965-12-31')
ORDER BY em.emp_no ASC;

select * from mentorship_eligibilty;

