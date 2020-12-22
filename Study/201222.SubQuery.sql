--from절 where절 표현방법, (+)<--오라클만 쓰임
--left/right/full outer join ~on

--inner join --> null 은 제외
 --inner join ~ on

--outer join --> 기준이 되는 쪽은 포함,비교되는 쪽은 null

select  em.first_name,
        em.department_id,
        de.department_name,
        de.department_id
from employees em inner join departments de
on em.department_id = de.department_id;

/****
Sub Query 문
****/

 -->10000 보다 급여가 많은 사라믜 이름과 급여는?
 select  employee_id,
         first_name, 
         salary
 from employees
 where salary > 11000;
 
 --'Den’ 보다 급여가 많은 사람의 이름과 급여는?
 --1. 'Den' 의 급여
 select  employee_id,
         first_name, 
         salary
 from employees
 where first_name = 'Den'; --->11000
 
 --2.'Den' 보다 급여 높은 사람
 select  employee_id,
         first_name, 
         salary
 from employees
 where salary > 11000;
 
 --1개의 질문으로 해결
 select  employee_id,
         first_name, 
         salary
 from employees
 where salary > (select  salary
                 from employees
                 where first_name = 'Den');
                 
--예제)
--급여를 가장 적게 받는 사람의 이름, 급여, 사원번호는?
--1. 가장 적은 급여 액수 2100
--2. 2100을 받는 직원의 이름, 급여, 사원번호는?
--3. 질문 조합

--1. 가장 적은 급여 액수 2100
select  min(salary)
from employees;

--2. 2100을 받는 직원의 이름, 급여, 사원번호는?
select  first_name,
        salary,
        employee_id
from employees
where salary = 2100;

--3. 질문 조합
select  first_name,
        salary,
        employee_id
from employees
where salary = (select  min(salary)
                from employees);
                
--예제)
--평균 급여보다 적게 받는 사람의 이름, 급여를 출력하세요?
select  first_name,
        salary
from employees
where salary < (select  avg(salary)
                from employees);

--예제)
--부서번호가 110인 직원의 급여와 같은 모든 직원의 
--사번, 이름, 급여를 출력하세요
--1. 부서번호 110인 직원의 이름,급여 리스트
select  department_id,
        first_name,
        salary
from employees
where department_id = 110;

--2. 전체직원 중 급여가 12008, 8300 인 직원
select  employee_id,
        first_name,
        salary
from employees
where salary in (select  salary
                 from employees
                 where department_id = 110);

--예제)
--각 부서별로 최고급여를 받는 사원을 출력하세요
select  first_name,
        employee_id,
        salary,
        department_id
from employees
where (department_id, salary) in (select  department_id,
                                          max(salary)
                                  from employees 
                                  group by department_id);

--예제)
--부서번호가 110인 직원의 급여 보다 큰 모든 직원의 
--사번, 이름, 급여를 출력하세요.(or연산--> 8300보다 큰)

--부서번호 110인 직원의 급여 리스트
select  *
from employees
where department_id = 110; --12008, 8300

select  *
from employees
where salary > 12008;

select  employee_id,
        first_name,
        salary
from employees
where salary > any (select  salary
                  from employees
                  where department_id = 110);  --12008, 8300
                  
 select  employee_id,
        first_name,
        salary
from employees
where salary > all (select  salary
                  from employees
                  where department_id = 110);  --12008, 8300                 
                  
--Sub Query로 테이블 자리 --> join으로 사용
--각 부서별로 최고급여를 받는 사원을 출력하세요
--1. 각 부서별로 최고 급여 테이블
select  department_id,
        max(salary)
from employees
group by department_id;

--2. 직원테이블 하고 (1)테이블을 join한다.
select  e.employee_id,
        e.first_name,
        e.salary es, 
        e.department_id ed_id,
        s.department_id sd_id,
        s.salary ss
from employees e,(select  department_id,
                            max(salary) as salary
                    from employees
                    group by department_id)s
where e.department_id = s.department_id
and e.salary = s.salary;





