
--List FN,LN, Gender and salary of all employees
select e.emp_no,e.last_name,first_name,gender, s.salary
from employees e
left join salaries s on s.emp_no = e.emp_no

--List all employees hired in 1986
select * from employees
where date_part('year', hire_date) = '1986'  

--List Manager details
select m.dept_no as DeptNo,dp.dept_name as DeptName,
m.emp_no as ManagerEmpNo, e.first_name as FirstName, e.last_name as LastName ,
m.from_date as StartDate, m.to_date as EndDate
from dept_manager m
inner join employees e on e.emp_no = m.emp_no
inner join departments dp on dp.dept_no = m.dept_no

--List the department of each employee
select e.emp_no as EmpNo, e.first_name as FirstName, e.last_name as LastName,dp.dept_name as Department
from employees e
inner join dept_emp d on d.emp_no = e.emp_no
inner join departments dp on dp.dept_no = d.dept_no

--List all employees whose first name is "Hercules" and last names begin with "B."
select * from employees
where first_name = 'Hercules' and last_name like 'B%'

--List all employees in the Sales department, including their employee number, last name, first name, and department name.

select e.emp_no as EmpNo, e.first_name as FirstName, e.last_name as LastName,dp.dept_name as Department
from employees e
inner join dept_emp d on d.emp_no = e.emp_no
inner join departments dp on dp.dept_no = d.dept_no
where dp.dept_name ='Sales'

--List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.

select e.emp_no as EmpNo, e.first_name as FirstName, e.last_name as LastName,dp.dept_name as Department
from employees e
inner join dept_emp d on d.emp_no = e.emp_no
inner join departments dp on dp.dept_no = d.dept_no
where (dp.dept_name ='Sales' or dept_name = 'Development')


--In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
select last_name,count(1) from employees
group by last_name

