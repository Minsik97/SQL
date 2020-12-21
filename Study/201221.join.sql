/****
join
****/

select  first_name,
        de.department_name,
        em.department_id
from employees em, departments de
where em.department_id = de.department_id;

select  e.first_name,
        j.job_title,
        d.department_name,
        e.job_id,
        j.job_id,
        e.department_id,
        d.department_id
from employees e, departments d, jobs j
where e.job_id = j.job_id
and e.department_id = d.department_id;

--left조인
select  em.department_id,
        em.first_name,
        de.department_name
from employees em left outer join departments de
on em.department_id = de.department_id;

--right조인
select em.department_id,
        em.first_name,
        de.department_name
from employees em right outer join departments de
on em.department_id = de.department_id;

--right조인 --> left조인
select em.department_id,
        em.first_name,
        de.department_name
from departments de left outer join employees em
on de.department_id = em.department_id;

select em.department_id,
        em.first_name,
        de.department_name
from employees em, departments de
where em.department_id=de.department_id(+);

select em.department_id,
        em.first_name,
        de.department_name,
        de.department_id
from employees em, departments de
where de.department_id(+)=em.department_id;

select em.employee_id,
        em.first_name,
        de.department_name
from employees em, departments de
where em.department_id(+)=de.department_id;

select em.employee_id,
        em.first_name,
        de.department_name,
        de.department_id
from employees em, departments de
where de.department_id = em.department_id(+);

--full outer join
select  em.department_id,
        em.first_name,
        de.department_name,
        de.department_id
from employees em full outer join  departments de
on em.department_id = de.department_id;

--alias
select  em.department_id,
        em.first_name,
        de.department_name,
        de.department_id
from employees em, departments de
where  em.department_id = de.department_id
order by em.department_id desc;

--joun 실행순서 체크
select  em.department_id,
        em.first_name,
        de.department_name,
        de.department_id
from employees em, departments de
where  em.department_id = de.department_id
order by em.department_id desc;

--잘못된 사용 예
select  em.salary,
        lo.location_id
from employees em, locations lo
where em.salary = lo.location_id

