-- Task 1.a: Count of male and female employees with contracts signed before 1998

SELECT 
    CASE
        WHEN d.from_date < '1998-01-01' THEN 'before'
        ELSE 'on_or_after'
    END AS first_jan_1998,
    e.gender,
    COUNT(e.emp_no) AS num_of_employees
FROM
    t_employees AS e
        JOIN
    t_dept_emp AS d ON d.emp_no = e.emp_no
WHERE
    d.from_date < '1998-01-01'
        OR d.from_date >= '1998-01-01'
GROUP BY first_jan_1998 , e.gender
ORDER BY first_jan_1998;
