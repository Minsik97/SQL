--문제1
select  avg(salary)
from employees;

select  count(salary)
from employees
where salary < (select  avg(salary)
                from employees);

--문제2
select  avg(salary)
from employees;

select  salary
from employees
where salary > (select  avg(salary)
                 from employees);
                 
--문제3
select  first_name,
        last_name
from employees
where first_name = 'Steven'
and last_name = 'King';

select  dep.location_id,
        loc.street_address,
        loc.postal_code,
        loc.city,
        loc.state_province,
        loc.country_id
from departments dep, locations loc, (select  department_id
                                      from employees
                                      where first_name = 'Steven'
                                      and last_name = 'King')emp
where dep.department_id = emp.department_id
and dep.location_id = loc.location_id;

--문제4
select  *
from employees
where job_id = 'ST_MAN';

select  employee_id,
        first_name,
        salary
from employees
where salary <any (select  salary
                 from employees
                 where job_id = 'ST_MAN')
order by salary desc;

--문제5.

