create table titles(title_id  varchar(8)  primary key,
				   title  varchar(20))

insert into titles(title_id, title)
values ('s0001','Staff'),
		('s0002','Senior Staff'),
		('e0001','Assistant Engieer'),
		('e0002','Engineer'),
		('e0003','Senior Engineer'),
		('e0004','Technique Leader'),
		('m0001','Manager');

create table employees(emp_no integer primary key,
					  emp_title_id varchar,
					   FOREIGN KEY (emp_title_id) REFERENCES titles(title_id),
					  birth_date varchar(10),
					  first_name varchar(30),
					  last_name varchar(30),
					  sex varchar(1),
					  hire_date varchar(10));
					  
copy employees
from 'D:\Rutgers bootcamp\Homework Assignments\09-SQL\sql-challenge\data\employees.csv'
DELIMITER ','
CSV HEADER



Create table Salaries (emp_no integer primary key,
					  salary float,
					  Foreign Key(emp_no) References employees(emp_no));

copy Salaries
from 'D:\Rutgers bootcamp\Homework Assignments\09-SQL\sql-challenge\data\salaries.csv'
DELIMITER ','
CSV HEADER

Create table departments (dept_no varchar(8) PRIMARY KEY ,
					  dept_name varchar(30));
copy departments
from 'D:\Rutgers bootcamp\Homework Assignments\09-SQL\sql-challenge\data\departments.csv'
DELIMITER ','
CSV HEADER

Create table dept_managers (emp_no integer,
					  dept_no varchar(8),
					  Primary Key (emp_no, dept_no),
					  Foreign Key(emp_no) References employees(emp_no),
					  Foreign Key(dept_no) References departments(dept_no));
copy dept_managers (dept_no, emp_no)
from 'D:\Rutgers bootcamp\Homework Assignments\09-SQL\sql-challenge\data\dept_manager.csv'
DELIMITER ','
CSV HEADER

Create table dept_emp (emp_no integer ,
					  dept_no varchar(8),
					  Primary Key (emp_no, dept_no),
					  Foreign Key(emp_no) References employees(emp_no),
					  Foreign Key(dept_no) References departments(dept_no));
copy dept_emp 
from 'D:\Rutgers bootcamp\Homework Assignments\09-SQL\sql-challenge\data\dept_emp.csv'
DELIMITER ','
CSV HEADER

Select * from dept_emp
				