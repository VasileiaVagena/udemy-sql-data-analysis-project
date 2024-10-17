/*
Apply the column names suggested. In order from left to right, they refer to the employees, departments, salaries, 
and dept_emp tables, respectively. 
Please note that the third column contains only average salary values rounded to the nearest cent. The last column should 
contain 'before' or 'on or after' depending on whether the employee's start date (stored in the dept_emp's from_date column)
is before or on or after January 1, 1998.

Group by the department number dept_no, employee's gender, and jan_1_1998 columns. Retrieve only data about contracts signed
in 1990 or later. 
Sort the obtained results by department number in ascending order.
*/


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
