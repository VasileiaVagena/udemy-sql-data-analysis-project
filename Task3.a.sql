
SELECT 
    e.gender,
    d.dept_name,
    ROUND(AVG(s.salary), 2) AS avg_salary,
    CASE
        WHEN de.from_date < '1998-01-01' THEN 'before'
        ELSE 'on or after'
    END AS jan_1_1998
FROM
    t_salaries AS s
        JOIN
    t_employees e ON e.emp_no = s.emp_no
        JOIN
    t_dept_emp de ON de.emp_no = e.emp_no
        JOIN
    t_departments d ON d.dept_no = de.dept_no
WHERE
    s.from_date > '1999-01-01'
GROUP BY d.dept_no , e.gender , jan_1_1998
ORDER BY d.dept_no;
