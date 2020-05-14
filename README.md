# occ
Oracle Coding Challenge

Build Instructions (Windows):

-- Download the 5 repository files to a directory on your Windows machine.

-- Launch Command Prompt and navigate to the directory containing the files using the cd <directory_path> command.

-- Enter the command below to connect as user (username) to database (connect_identifier) using SQL*Plus.

sqlplus username@connect_identifier

-- Enter the password when prompted.

-- Enter the commands below (in the same order) to run the scripts to create tables, create subprograms and to insert existing data.

@OCC_table_creation.sql

@OCC_ddl_creation.sql

@OCC_data_insert.sql




Run Instructions (Windows):

-- Note: Varchar2 parameters should be entered WITH quotes.

--       Number parameters should be entered WITHOUT quotes.

--       Date parameters should be entered as per example below:

--       To enter 1st of January 2020, use: TO_DATE('01/01/2020', 'DD/MM/YYYY')

-- To create a new employee, enter the command below.

-- <emp_name>, <emp_title>, <mgr_name> and <emp_dept> are varchar2 parameters.

-- <employment_date> is a date parameter.

-- <emp_salary> is a number parameter.

EXECUTE create_employee(<emp_name>, <emp_title>, <mgr_name>, <employment_date>,  <emp_salary>, <emp_dept>);
COMMIT;


-- To change an employee's salary, enter the command below.

-- <employee_name> is a character parameter.

-- <percentage_change> is a number parameter.
-- It allows positive and negative values for salary increase and decrease respectively.


EXECUTE change_employee_salary (<employee_name>, <percentage_change>);
COMMIT;


-- To change an employee's department, enter the commands below.

-- <employee_name> and <new_department> are varchar2 parameters.

EXECUTE change_employee_dept (<employee_name>, <new_department>);
COMMIT;


-- To get an employee's salary, enter the command below.

-- <employee_name> is a varchar2 parameter.


SELECT get_employee_salary (<employee_name>) FROM DUAL;



-- To view report showing all employees for a given department,

-- enter the command below and enter the department name at the prompt.


@OCC_report_1.sql


-- To view report showing the total of employee salary for a given department, 

-- enter the command below and enter the department name at the prompt.


@OCC_report_2.sql

