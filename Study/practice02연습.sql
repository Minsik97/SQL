--5
select  job_id,
        avg(salary),
        round(max(salary),0),
        min(salary)
from employees
group by job_id
order by min(salary) desc, avg(salary) asc;

--6
select  to_char(min(hire_date), 'yyyy-mm-dd DAY')
from employees;

--7
select  department_id,
        round(avg(salary),0),
        min(salary),
        round(avg(salary),0)-min(salary)
from employees
group by department_id
order by round(avg(salary),0)-min(salary) desc;

--8
select  job_id,
        max(salary)-min(salary)
from employees
group by job_id
order by max(salary)-min(salary) desc;

--9
select  hire_date,
        round(avg(salary),1),
        max(salary),
        min(salary)
from employees
group by hire_date
having hire_date >= '2005/12/31'
and avg(salary) >= 5000
order by avg(salary) desc;

--10
select  hire_date,
        case 
        when hire_date <= '02/12/31' then '창립맴버'
        when hire_date <= '03/12/31' then '03년입사'
        when hire_date <= '04/12/31' then '04년입사'
        else '상장이후입사'
        end optDate
from employees
order by hire_date asc;