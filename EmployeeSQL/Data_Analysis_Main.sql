--Question #1
--List the employee number, last name, first name, sex, and salary of each employee

--SELECT * from employees
--get emp_no, first_name, last_name, and sex from employees table
--get salary from salaries table

SELECT e.emp_no, e.first_name, e.last_name, e.sex, s.salary
from employees as e
join salaries as s
on (e.emp_no = s.emp_no);


--Question #2
--List the first name, last name, and hire date for the employees who were hired in 1986.

select first_name, last_name, hire_date
from employees
where hire_date between '1986-01-01' and '1986-12-31';


--Question #3
--List all department managers first name, last name, department number, department name, and employee number.

--select * from dept_manager
--get dept_no, emp_no
--select * from departments
--get dept_no, dept_name
--select * from employees
--get emp_no, first_name, last_name

select m.emp_no, d.dept_no, d.dept_name, e.first_name, e.last_name
from departments as d
join dept_manager as m
on d.dept_no = m.dept_no
join employees as e
on m.emp_no = e.emp_no;


--Question #4
--List all employees department number, employee number, last name, first name, and department name.

--select * from dept_emp
--get dept_no, emp_no
--select * from departments
--get dept_no, dept_name
--select * from employees
--get emp_no, first_name, last_name

select emp.emp_no, d.dept_no, d.dept_name, e.first_name, e.last_name
from departments as d
join dept_emp as emp
on d.dept_no = emp.dept_no
join employees as e
on emp.emp_no = e.emp_no;


--Question #5
--List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.

select first_name, last_name, sex
from employees
where first_name = 'Hercules'
AND last_name like 'B%';


--Question #6
--List each employee in the Sales department, including their employee number, last name, and first name.

--select * from departments
--get dept_name, dept_no
--select * from dept_emp
--get emp_no, dept_no
--select * from employees
--get first_name, last_name, emp_no


select emp_no, first_name, last_name
from employees
where emp_no in
	(select emp_no
	from dept_emp
	where dept_no in
		(select dept_no
		from departments
		where dept_name = 'Sales'
		)
	);


--Question #7
--List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.

select emp_no, first_name, last_name
from employees
where emp_no in
	(select emp_no
	from dept_emp
	where dept_no in
		(select dept_no
		from departments
		where dept_name = 'Sales' OR dept_name = 'Development'
		)
	);


--Question #8
--List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).

Select last_name, COUNT(last_name) as "Last_name_count"
From employees
group by last_name
order by "Last_name_count" DESC;
