-- 1.Collect all rows List the following details of each employee: 
-- employee number, last name, first name, gender, and salary.
SELECT *
FROM employees;

SELECT emp_no, last_name, first_name, gender
FROM employees;

SELECT salary
FROM salaries;

SELECT emp_no, last_name, first_name, gender
FROM employees;

SELECT Employees.emp_no, 
	Employees.last_name, 
	Employees.first_name, 
	Employees.gender, 
	Salaries.salary
from Employees
inner join Salaries on
Employees.emp_no = Salaries.emp_no;

--2. List employees who were hired in 1986.
SELECT employees.emp_no, employees.first_name, employees.last_name,
	EXTRACT (YEAR FROM hire_date) AS YEAR
from employees
where hire_date > '12/31/1985' and hire_date < '01/01/1987';

--3.List the manager of each department with the following information: 
--department number, department name, the manager's employee number, last name, first name, 
--and start and end employment dates.
SELECT departments.dept_no, departments.dept_name, dept_manager.emp_no, employees.last_name, 
employees.first_name, dept_manager.from_date, dept_manager.to_date
from dept_manager
inner join departments on
dept_manager.dept_no = departments.dept_no
inner join employees on
employees.emp_no = dept_manager.emp_no;


--4.List the department of each employee with the following information: 
--employee number, last name, first name, and department name.
SELECT employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
from employees
inner join dept_emp on
employees.emp_no = dept_emp.emp_no
inner join departments on
departments.dept_no = dept_emp.dept_no;

--5.List all employees whose first name is "Hercules" and last names begin with "B."
SELECT employees.first_name, employees.last_name
from employees
where first_name= 'Hercules' and last_name like 'B%';

--6.List all employees in the Sales department, including their employee number, 
--last name, first name, and department name.
select t1.emp_no, t1.last_name, t1.first_name, t3.dept_name
from employees as t1
join dept_emp as t2
on t1.emp_no = t2.emp_no
join departments as t3
on t3.dept_no = t2.dept_no
where t3.dept_name = 'Sales';


--7.List all employees in the Sales and Development departments, 
--including their employee number, last name, first name, and department name.
select t1.emp_no, t1.last_name, t1.first_name, t3.dept_name
from employees as t1
join dept_emp as t2
on t1.emp_no = t2.emp_no
join departments as t3
on t3.dept_no = t2.dept_no
where t3.dept_name = 'Sales' or t3.dept_name = 'Development';
--8.In descending order, list the frequency count of employee last names, 
--i.e., how many employees share each last name.
select last_name, count (last_name) as name_cnt
from employees
group by last_name
order by name_cnt desc;


