--1
select	first_name 'First Name', last_name 'Last Name' 
from employees
--2
select distinct department_id
from employees
--3
select * 
from employees order by first_name desc
--4
select first_name,last_name,salary,0.15 *salary PF
from employees
--5
select employee_id,first_name, last_name,salary
from employees order by salary
--6
select sum(salary) 'total Salaries'
from employees
--7
select min(salary) minium, max(salary) maximum 
from employees
--8
select avg(salary) avg_salaries, count(*) 'number of employees'
from employees
--9
select count(job_id) 'number of employees'
from employees
--10
select count(distinct(job_id)) total_jobs
from employees					 
--11
select upper(first_name)  first_name
from employees
--12
select left(first_name,3)  'First 3 characters'
from employees
--13
select trim(first_name) 'first_name'
from employees
--14
select length(first_name)+length(last_name)  total_charcters
from employees
--15
select first_name 
from employees WHERE first_name REGEXP '[0-9]'
--16
select first_name,last_name,salary
from employees where salary  not between 10000 and 15000
--17
select concat(first_name,' ',last_name) as 'name' ,department_id
from employees where department_id in(30,100) order by'name',department_id
--18
select concat(first_name,' ',last_name) as 'name',salary, department_id
from employees where department_id in(30,100) and salary not between 10000 and 15000
--19
select concat(first_name,' ',last_name) as 'name',hire_date
from employees where year(hire_date)=1987
 --20
 select first_name 
 from employees where first_name like'%b%' and first_name like'%c%'
 --21
 select last_name,salary,job_title 
 from employees join jobs where job_title in ('Shipping Clerk','Programmer') and salary not in (4500,10000,15000)
 --22
 select last_name
 from employees where length(last_name) = 6
 --23
 select last_name
 from employees where last_name like '__e%' 
 --24
 select job_id,group_concat(employee_id) 'list of employee ids' 
 from employees group by job_id
 --25
 select replace(phone_number,'124','999') as 'phonenumber'
from employees
--26
select * 
from employees where length(first_name)>=8
--27
select concat(email,'@example.com')
from employees
--28
select right(phone_number,4) as 'last 4 characters of phone number'
from employees
--29
select substring_index(street_address,' ',-1) 'last word'
from locations
--30
SELECT * FROM locations
WHERE LENGTH(street_address) = (SELECT  MIN(LENGTH(street_address)) 
FROM locations)
--31
select substring_index(job_title,' ',1)
from jobs where job_title like '% %'
--32
select length(first_name )
from employees where last_name like '_c%'
--33
select first_name ,length(first_name) as total_char
from employees where first_name like 'A%' or first_name like'J%' or first_name like 'M%' order by first_name
--34
select first_name,lpad(salary,10,' $') as 'SALARY'
from employees
--35
select left(first_name,8),salary,lpad('$',salary/1000,'$')
from employees order by salary DESC
--36
select employee_id,first_name,last_name,hire_date
from employees where day(hire_date)=7 or month(hire_date)=7