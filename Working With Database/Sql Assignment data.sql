

use pp;

select*from customer;
select* from orders;
select * from salesman;
select * from emp_details;
select * from item_mast;
select * from regions;
select * from countries;
select * from locations;
select * from departments;
select * from jobs;
select * from employees;
select * from job_history;

    
    
    select * from customer
    where city ="New York" or grade <=100 or grade is null;
    
    
    
    
    select * from customer
    where city = "New York" and grade >100;
    
    
    select 
    sum(purch_amt) as Total_purchase_amount
    from orders;
    
    
    
    select
    customer_id,
    max(purch_amt) as Maximum_Purchase
    from orders
    group by customer_id
    order by Maximum_Purchase desc;
    
    
    
    select
    avg(pro_price) as Average_Product_Price
    from item_mast;
    
    
    
    
    select * from emp_details
    where emp_department = 57;
    
    
    
    select
    employees.first_name,
    employees.last_name,
    employees.employee_id,
    employees.job_id
    from employees
   join departments
   on employees.department_id = departments.department_id
   join locations
   on departments.location_id = locations.location_id
   where locations.city = "Toronto";
    
    
    select
    employees.employee_id,
    employees.first_name,
    employees.last_name,
    employees.job_id
    from employees
    join jobs
    on employees.job_id = jobs.job_id
    where 
    salary <(
    select jobs.max_salary
    from jobs
    where jobs.job_id="MK_MAN")
    AND jobs.job_id <> "MK_MAN";
    
    
    SELECT
    employees.employee_id,
    employees.first_name,
    employees.last_name,
    employees.job_id
FROM 
    employees
WHERE 
    employees.salary < (
        SELECT MAX(salary)
        FROM employees
        WHERE job_id = 'MK_MAN'
    )
        AND employees.job_id <> 'MK_MAN';
        
        
        
        select
        employees.first_name,
        employees.last_name,
        departments.department_name,
        departments.department_id
        from employees
        left join departments
        on employees.department_id = departments.department_id
        where 
        employees.department_id in (40,80);
        


select
departments.department_name,
avg(employees.salary) as Average_salary,
count(employees.commission_pct) as Total_number_of_Emp
from departments
join employees
on departments.department_id = employees.department_id
and 
employees.commission_pct > 0
group by departments.department_name;





/*write a SQL query to find out which employees have the same designation as the
employee whose ID is 169. Return first name, last name, department ID and job ID.*/


select
employees.first_name,
employees.last_name,
employees.department_id,
employees.job_id
from employees
where job_id =(
 select job_id 
 from employees
 where employee_id = 169
);


select
employee_id,
first_Name,
last_Name
from employees
where salary >(
select avg(salary)
from employees
);

select
employees.department_id,
employees.first_name,
employees.job_id,
departments.department_name
from employees
left join departments
on employees.department_id = departments.department_id
 where departments.department_name = "Finance";
 
 
 
 /*From the following table, write a SQL query to find the employees who earn less than the employee of ID 182. Return first name, last name and salary.*/
 
 
select
employees.first_name,
employees.last_name,
employees.salary
from employees
where salary <(
select salary 
from employees
where employee_id = 182
);


select 
departments.department_name,
count(employees.employee_id) as Total_emp
from employees
left join departments
on employees.department_id = departments.department_id
group by departments.department_name
order by Total_emp desc;

DELIMITER $$
create procedure Add_New_Emp(
in  p_first_name varchar(50),
in	p_last_name varchar(50),
in	p_email varchar(50),
in	p_phone_number varchar(50),
in	p_hire_date date,
in	p_job_id varchar(50),
in	p_salary decimal(10,2),
in	p_commission_pct decimal(10,2),
in	p_manager_id int,
in	p_department_id int
)

begin
insert into employees (
	employee_id,
	first_name,
	last_name,
	email,
	phone_number,
	hire_date,
	job_id,
	salary,
	commission_pct,
	manager_id,
	department_id
	)

   values(
    p_employee_id,
	p_first_name,
	p_last_name,
	p_email,
	p_phone_number,
	p_hire_date,
	p_job_id,
	p_salary,
	p_commission_pct,
	p_manager_id,
	p_department_id);
end $$
DELIMITER ;








