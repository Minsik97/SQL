--그룹함수

--오류발생 (avg는 한개만 나타내고, first-name은 모두를 나타내기때문에 충돌)
select  avg(salary),
        first_name  
from employees;

--그룹함수 avg()
select avg(salary)
from employees;

--그룹함수 avg()
select  count(*) --null 포함
from employees;

select  count(commission_pct) --컬럼의 null은 포함하지 않음
from employees;

select  count(*) --조건절 추가
from employees
where salary >16000;

--그룹함수 sum()
select  sum(salary)
from employees;

--그룹함수끼리 사용 가능
select  sum(manager_id), count(salary) 
from employees;

--그룹함수 avg() null일 때 0으로 변환
select  count(*), 
        sum(salary), 
        avg(salary)
from employees;

select  count(*), 
        sum(salary), 
        avg(nvl(salary, 0))
from employees;

--그룹함수 - max() / min()
select max(salary) 
from employees;

select  min(salary)
from employees;

--정렬이 필요한 경우 많은 연산을 수행해야 한다.
select  max(salary),
        min(salary),
        count(salary)
from employees;


/*****
group by 절
*****/

select  department_id, 
        salary
from employees
order by department_id asc;

select  department_id,
        avg(salary)
from employees
group by department_id
order by department_id asc;

--GROUP BY 절 – 자주하는 오류
select  department_id,
        count(*),
        sum(salary)
from employees
group by department_id;

select  department_id,
        count(*),
        sum(salary),
        job_id  --단일함수이기 때문에 오류
from employees
group by department_id;

select  department_id,
        job_id,
        count(*),
        sum(salary),
        avg(salary)
from employees
group by department_id, job_id
order by department_id asc;


/*예제
연봉(salary)의 합계가 20000 이상인 부서의 부서 번호와,
인원수, 급여합계를 출력하세요
*/
select  department_id,
        count(department_id),
        sum(salary)
from employees
group by department_id
--where sum(salary) >= 20000 그룹함수는 where 절을 쓰지 못한다.
order by department_id;


--having절
select  department_id,
        count(department_id),
        sum(salary)
from employees
group by department_id
having sum(salary) >= 20000 --group절에서 where을 대신해서 사용함
order by department_id;


/****
case  ~ end
****/
select  employee_id,
        salary,
        job_id,
        case when job_id = 'AC ACCOUNT' then salary*0.1
             when job_id = 'SA_REP'then salary*0.2
             when job_id = 'ST_CLERK' then salary*0.3
             else salary*0
        end bonus
from employees;

--decode문 ( =(같다) 밖에 못 쓴다.)
select  employee_id,
        salary,
        job_id,
        decode(
            job_id, 'AC ACCOUNT', salary*0.1, 
                    'SA_REP', salary*0.2, 
                    'ST_CLERK', salary*0.3, 
                     salary*0
            )as bonus
from employees;

/*예제
직원의 이름, 부서, 팀을 출력하세요팀은 코드로 결정하며 부서코드가 10~50 이면
‘A-TEAM’60~100이면 ‘B-TEAM’  110~150이면 ‘C-TEAM’ 나머지는 ‘팀없음’ 으로
출력하세요.
*/

select  first_name,
        department_id,
        job_id,
        case when department_id >= 10 and department_id <= 50 then 'A-TEAM'
             when department_id >= 60 and department_id <= 100 then 'B-TEAM'
             when department_id >= 110 and department_id <= 150 then 'C-TEAM'
             else '팀없음'
        end team
from employees;

select  *
from employees;