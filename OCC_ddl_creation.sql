------------------------------------------------------------------------
-- Creates a new employee record.
------------------------------------------------------------------------
CREATE OR REPLACE PROCEDURE create_employee (p_emp_name IN VARCHAR2, 
                                             p_emp_job_title IN VARCHAR2, 
                                             p_emp_manager_name IN VARCHAR2, 
                                             p_emp_date_hired IN DATE, 
                                             p_emp_salary IN NUMBER, 
                                             p_dept_name IN VARCHAR2) IS 

   v_mgr_emp_id NUMBER;
   v_dept_id NUMBER;

BEGIN 
   
   SELECT emp_id INTO v_mgr_emp_id FROM employees WHERE UPPER(emp_name) = UPPER(p_emp_manager_name);
   SELECT dept_id INTO v_dept_id FROM departments WHERE UPPER(dept_name) = UPPER(p_dept_name);
   
   
   -- insert new employee record
   INSERT INTO employees (emp_name, emp_job_title, emp_manager_id, emp_date_hired, emp_salary, dept_id)
   VALUES (p_emp_name, 
		   p_emp_job_title, 
           v_mgr_emp_id, 
		   p_emp_date_hired, 
		   p_emp_salary,
		   v_dept_id);
    
END create_employee;
/


-----------------------------------------------------------------
-- Changes the salary of an employee by a percentage.
-----------------------------------------------------------------
CREATE OR REPLACE PROCEDURE change_employee_salary (p_emp_name IN VARCHAR2, p_percentage_change IN NUMBER) IS 

BEGIN 
   
   -- update empployees table with new salary
   UPDATE employees SET emp_salary = emp_salary + (emp_salary * p_percentage_change/100)
   WHERE  UPPER(emp_name) = UPPER(p_emp_name);
   
END change_employee_salary;
/

------------------------------------------------------------------
-- Changes an employee's department.
------------------------------------------------------------------
CREATE OR REPLACE PROCEDURE change_employee_dept (p_emp_name IN VARCHAR2, p_new_dept_name IN VARCHAR2) IS 

v_new_dept_id NUMBER;

BEGIN 
   
   SELECT dept_id INTO v_new_dept_id FROM departments WHERE UPPER(dept_name) = UPPER(p_new_dept_name);
   
   -- update employees table with new dept id
   UPDATE employees SET dept_id = v_new_dept_id
   WHERE  UPPER(emp_name) = UPPER(p_emp_name);
   
   EXCEPTION
   WHEN no_data_found THEN 
      dbms_output.put_line('New department not found');
	  
END change_employee_dept;
/

--------------------------------------------------------------------
-- Returns an employee's salary value
--------------------------------------------------------------------
CREATE OR REPLACE FUNCTION get_employee_salary (p_emp_name IN VARCHAR2) RETURN NUMBER IS 

v_emp_salary NUMBER;

BEGIN 
   
   SELECT emp_salary INTO v_emp_salary FROM employees 
   WHERE  UPPER(emp_name) = UPPER(p_emp_name);
   
   RETURN v_emp_salary;
    
END get_employee_salary;
/