-- Report showing all employees in a department
ACCEPT department_name CHAR PROMPT 'Enter the name of the department: '
SELECT emp_1.emp_id "Employee ID", 
	   emp_1.emp_name "Employee Name", 
	   emp_1.emp_job_title "Job Title",
	   emp_2.emp_name "Manager" FROM   employees emp_1 LEFT JOIN employees emp_2 ON (emp_1.emp_manager_id = emp_2.emp_id) 
WHERE  emp_1.dept_id = (SELECT dept_id FROM departments WHERE dept_name = '&department_name');