-- Report showing the total of employee salary for a department
ACCEPT department_name CHAR PROMPT 'Enter the name of the department: '
SELECT dept.dept_name "Department", 
       SUM(emp.emp_salary) "Sum of Salaries"
FROM   employees emp JOIN departments dept ON (emp.dept_id = dept.dept_id) 
WHERE  dept.dept_id = (SELECT dept_id FROM departments WHERE dept_name = '&department_name')
GROUP BY dept.dept_name;