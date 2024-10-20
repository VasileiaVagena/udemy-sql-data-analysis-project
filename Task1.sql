/*
Task 1: Create a visualization that provides a breakdown between the male and female employees working in the company each year,
starting from 1990. 
*/

SELECT 
    YEAR(t_dept.from_date) AS calender_year,
    t_emp.gender,
    COUNT(t_emp.emp_no) AS num_of_employees
FROM
    t_employees AS t_emp
        JOIN
    t_dept_emp AS t_dept ON t_dept.emp_no = t_emp.emp_no
GROUP BY YEAR(t_dept.from_date) , t_emp.gender
HAVING calender_year >= '1990'
ORDER BY YEAR(t_dept.from_date) ASC;
