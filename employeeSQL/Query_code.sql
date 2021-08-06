--employee number, last name, first name, sex, and salary

SELECT Employees.emp_no, Employees.first_name, Employees.last_name, Employees.sex, Salaries.salary
FROM Employees INNER JOIN Salaries ON Employees.emp_no = Salaries.emp_no;
------------------------------------------------------------------------------------------------------
--first name, last name, and hire date for employees who were hired in 1986
SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date like '%1986';
------------------------------------------------------------------------------------------------------
--manager of each department with the following information:
--department number, department name, the manager's employee number, last name, first name

SELECT departments.dept_no, departments.dept_name, dept_managers.emp_no, employees.first_name, employees.last_name
FROM (departments INNER JOIN dept_managers ON departments.dept_no = dept_managers.dept_no)
INNER JOIN employees ON dept_managers.emp_no = employees.emp_no;


---------------------------------------------------------------------------------------------------------
--department of each employee with the following information: employee number, last name, first name, and department name
SELECT employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM (employees INNER JOIN dept_emp ON employees.emp_no = dept_emp.emp_no)
INNER JOIN departments ON dept_emp.dept_no = departments.dept_no;

----------------------------------------------------------------------------------------------------------
--first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
SELECT first_name, last_name, sex
FROM employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';

-----------------------------------------------------------------------------------------------------------
--all employees in the Sales department, including their employee number, last name, first name, and department name

SELECT employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM (employees
INNER JOIN dept_emp ON employees.emp_no = dept_emp.emp_no)
INNER JOIN departments ON dept_emp.dept_no = departments.dept_no 
WHERE employees.emp_no IN
	(
	SELECT dept_emp.emp_no
	FROM dept_emp INNER JOIN departments ON dept_emp.dept_no = departments.dept_no
	WHERE departments.dept_name = 'Sales');


		

-------------------------------
-- Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM (employees
INNER JOIN dept_emp ON employees.emp_no = dept_emp.emp_no)
INNER JOIN departments ON dept_emp.dept_no = departments.dept_no 
WHERE employees.emp_no IN
	(
	SELECT dept_emp.emp_no
	FROM dept_emp INNER JOIN departments ON dept_emp.dept_no = departments.dept_no
	WHERE departments.dept_name = 'Sales'
	OR departments.dept_name = 'Development');


		
----------------------------------------------------------
--list the frequency count of employee last names, i.e., how many employees share each last name.
		
SELECT last_name, count(emp_no)
FROM employees
GROUP BY last_name
ORDER BY count(emp_no) desc;

	