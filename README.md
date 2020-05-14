# occ
Oracle Coding Challenge

Build Instructions (Windows):
-- Download the 5 repository files to a directory on your Windows machine.

-- Launch Command Prompt 
-- Enter the command below to navigate to the directory/path that contains the files.
cd <path>

-- Enter the command below to connect as user (username) to database (connect_identifier) using SQL*Plus.
sqlplus username@connect_identifier

-- Enter the password when prompted.

-- Run the script OCC_table_creation.sql using the command below to create the database tables.
@OCC_table_creation.sql

-- Run the script OCC_ddl_creation.sql using the command below to create and compile the database subprograms.
@OCC_ddl_creation.sql

-- Run the script OCC_data_insert.sql using the command below to insert the existing data.
@OCC_data_insert.sql

Run Instructions (Windows):
-- Note: Varchar2 parameters should be entered WITH quotes.
--       Number parameters should be entered WITHOUT quotes.
--       Date parameters should be entered as per example below:
--       To entered 1st of January 2020, use: TO_DATE('01/01/2020', 'DD/MM/YYYY')

-- To create a new employee, enter the command below.
-- <employee_name>, <employee_title>, <manager_name> and <department> are varchar2 parameters.
-- <employment_date> is a date parameter.
-- <employee_salary> is a number parameter.
EXECUTE create_employee(<employee_name>, <employee_title>, <manager_name>, <employment_date>, <employee_salary>, <department>);

-- To change an employee's salary, enter the command below.
-- <employee_name> is a character parameter.
-- <percentage_change> is a number parameter that allows positive and negative values for salary increase and decrease respectively.
EXECUTE change_employee_salary (<employee_name>, <percentage_change>);

-- To change an employee's department, enter the command below.
-- <employee_name> and <new_department> are varchar2 parameters.
EXECUTE change_employee_dept (<employee_name>, <new_department>);

-- To get an employee's salary, enter the command below.
-- <employee_name> is a varchar2 parameter.
SELECT get_employee_salary (<employee_name>) FROM DUAL;

-- To view report showing all employees for a given department,
-- enter the command below and enter the department name at the prompt.
@OCC_report_1.sql

-- To view report showing the total of employee salary for a given department, 
-- enter the command below and enter the department name at the prompt.
@OCC_report_2.sql
