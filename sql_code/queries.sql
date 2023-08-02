--Finding employee number, last name, first name sex and salary--

select e.emp_no, e.last_name, e.first_name, e.sex, s.salary 
From employees e join salaries s on (e.emp_no = s.emp_no);

--Finding first and last name and hire date for employees hired in 1986--

select first_name, last_name, hire_date
from employees
where DATE_PART('YEAR', hire_date) = 1986 

--Finding the manager of each department along with their department number, 
--department name, employee number, last name, and first name--

select d.emp_no,e.first_name,e.last_name,d.dept_no, dep.dept_name
from dept_manager d 
join departments dep on (d.dept_no=dep.dept_no)
join employees e on (d.emp_no=e.emp_no)

--List the department number for each employee along with that employee’s employee number,
--last name, first name, and department name--

select e.emp_no, e.last_name, e.first_name, d.dept_no, dep.dept_name
from employees e 
join dept_emp d on (e.emp_no=d.emp_no)
join departments dep on (d.dept_no=dep.dept_no)

--Finding first name, last name, and sex of each employee whose first name is Hercules 
--and whose last name begins with the letter B 

select first_name, last_name, sex 
from employees
where first_name = 'Hercules' and last_name like 'B%'

--Finding each employee in the Sales department, including their employee number, 
--last name, and first name

select e.emp_no, e.first_name, e.last_name
from employees e
where e.emp_no in(
	select d.emp_no
	from dept_emp d
	where d.dept_no in(
		select dep.dept_no
		from departments dep
		where dep.dept_name = 'Sales'
	)
);

--Finding each employee in the Sales and Development departments, including their employee number, 
--last name, first name, and department name.

select e.emp_no, e.first_name, e.last_name, dep.dept_name
from employees e
join dept_emp d on (e.emp_no=d.emp_no)
join departments dep on (d.dept_no=dep.dept_no)
where dep.dept_no in(
	select dept_no
	from departments 
	where dept_name in ('Development', 'Sales')
)

--List the frequency counts, in descending order, of all the employee last names
--(that is, how many employees share each last name) 

select last_name, count(last_name) 
from employees
group by last_name
order by count(last_name) desc

