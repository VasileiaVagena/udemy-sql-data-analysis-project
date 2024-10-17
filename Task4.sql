/*
Create an SQL stored procedure that will allow you to obtain the average male and female salary per department within a certain salary range. 
Let this range be defined by two values the user can insert when calling the procedure.

Finally, visualize the obtained result-set in Tableau as a double bar chart. 
*/

DELIMITER $$
CREATE PROCEDURE average_salary_dep (IN p_min_salary float, IN p_max_salary float)
BEGIN
SELECT 
    e.gender, d.dept_name, AVG(s.salary) AS avg_salary
FROM
    t_salaries AS s
        JOIN
    t_employees AS e ON e.emp_no = s.emp_no
        JOIN
    t_dept_emp AS de ON de.emp_no = e.emp_no
        JOIN
    t_departments AS d ON d.dept_no = de.dept_no
WHERE
    s.salary BETWEEN p_min_salary AND p_max_salary
GROUP BY e.gender , d.dept_no;

END $$

DELIMITER ;
