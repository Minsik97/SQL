/****
rownum
****/

--급여를 가장 많이 받는 5명의 직원의 이름을 출력하시오.

--rownum이 order by 보다 먼저 생겨서 번호가 섞인다.
select  rownum,
        employee_id,
        first_name,
        salary
from employees
order by salary desc;

--정렬하고 
select  rownum,
        o.employee_id,
        o.first_name,
        o.salary
from (select  emp.employee_id,
              emp.first_name,
              emp.salary
      from employees emp
      order by salary desc) o -- salary 로 정렬되어 있는 테이블 사용
where rownum >= 11
and rownum <=54;

--일렬번호(rownum)를 주고 바로 조건을 판단해서 생기는 문제
select  ro.rnum,
        ro.employee_id,
        ro.first_name,
        ro.salary
from (select  rownum rnum,
              o.employee_id,
              o.first_name,
              o.salary
      from (select  emp.employee_id,
                    emp.first_name,
                    emp.salary
            from employees emp
            order by salary desc) o
     ) ro
where rnum >= 5
and rnum <=10; 

--예제)
--07년에 입사한 직원중 급여가 많은 직원중 3에서 7등의 이름 급여 입사일은?
select  hire_date,
        salary,
        max(salary)
from employees
group by hire_date, salary;

select  
        ms.hire_date,
        ms.salary,
        ms.msal
from (select  hire_date,
              salary,
              max(salary) msal
      from employees
      group by hire_date, salary)ms
where ms.hire_date <= '07/12/31'
and ms.hire_date >= '07/01/01'
order by ms.salary desc;

select  rr,
        rr.hire_date,
        rr.salary,
        rr.msa
from (select  rownum rr,
              ms.hire_date,
              ms.salary,
              ms.msa
      from (select  hire_date,
                    salary,
                    max(salary) msa
            from employees
            group by hire_date, salary)ms
      where ms.hire_date <= '07/12/31'
      and ms.hire_date >= '07/01/01'
      order by ms.salary desc
      )rnum
where rr >= 3
and rr <= 7;

--따라해보기
select  *
from (select  rr,
        rr.hire_date,
        rr.salary,
        rr.msa
from (select  rownum rr,
              ms.hire_date,
              ms.salary,
              ms.msa
      from (select  hire_date,
                    salary,
                    max(salary) msa
            from employees
            group by hire_date, salary)ms
      where ms.hire_date <= '07/12/31'
      and ms.hire_date >= '07/01/01'
      order by ms.salary desc
      )rnum
where rr >= 3
and rr <= 7;

--따라해보기
select  rn,
        ro.employee_id,
        ro.first_name,
        ro.salary,
        ro.hire_date
from (select  rownum rn,
              o.employee_id,
              o.first_name,
              o.salary,
              o.hire_date   --*은 테스트용(귀찮더라도 하나하나 다 넣어줘야 한다)
      from (select  employee_id,
                    first_name,
                    salary,
                    hire_date
            from employees
            where hire_date >= '07/01/01'
            and hire_date <= '07/12/31'
            order by salary desc)o
     )ro
where ro.rn >=3
and ro.rn <=7;
