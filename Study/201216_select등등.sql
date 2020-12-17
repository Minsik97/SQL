--셀렉트 문
/*
주석
주석
주석
*/
select * from employees;

--원하는 컬럼 조회하기
select employee_id, first_name, last_name from employees;

select  employee_id, 
        first_name, 
        last_name 
from employees;

--사원의 이름(fisrt_name)과 전화번호 입사일 연봉을 출력하세요
select  first_name,
        phone_number,
        hire_date,
        salary
from employees;

--사원의 이름(first_name)과 성(last_name) 급여, 전화번호, 이메일, 입사일을 출력하세요

select  salary,
        hire_date,
        first_name,
        last_name,
        phone_number,
        email
from employees;

--출력할 때 컬럼에 별명 사용하기
select  employee_id as empNo, --as를 써서 컬럼 명 변경 가능, as 생략 가능
        first_name "f Name", --별명에 대소문자 구분, 공백, 특수문자 등이 필요한 경우 " "(쌍 따옴표)로 감싸줌
        salary "연봉" --한글은 ""쓰는게 안전
from employees;

--사원의 이름,전화번호,입사일,급여
select  first_name "이름",
        phone_number "전화번호",
        hire_date "입사일",
        salary "급여"
from employees;

--사원 이름, 성, 급여, 전화번호, 이메일, 입사일
select  employee_id "사원번호",
        first_name "이름",
        last_name "성",
        salary "급여",
        phone_number "전화번호",
        email "이메일",
        hire_date "입사일"
from employees;

--연결 연산자로 컬럼들 붙이기
select first_name || last_name
from employees;

select first_name || '  ' || last_name as name
from employees;

select first_name || '  ''hire date is''  ' || hire_date --따음표 '' '' 두개씩 넣기
from employees;

--산술 연산자 사용하기
select first_name, salary
from employees;

select  first_name,
        salary,
        salary*12
from employees;

select  first_name,
        salary,
        salary*12 연봉,
        (salary+300)*12 
from employees;

--문자열은 산술연산 되지 않음
select job_id*12
from employees;

select  first_name ||   ' - '  || last_name 성명,
        salary 급여,
        salary*12 연봉,
        (salary*12+5000) 연봉2,
        phone_number
from employees;

--select문 의 where절
select first_name
from employees
where department_id = 10;

--연봉이 15000 이상인 사원들의 이름과 연봉을 출력하세요
select  first_name,
        salary
from employees
where salary >= 15000;

--07/01/01 일 이후에 입사한 사원들의 이름과 입사일을 출력하세요
select  first_name,
        hire_date
from employees
where hire_date >= '07/01/01';

--이름이 Lex인 직원의 연봉을 출력하세요
select salary
from employees
where  first_name = 'Lex';


select  first_name,
        salary
from employees
where salary >= 14000
and salary <=17000;

--연봉이 14000 이하이거나 17000 이상인 사원의 이름과 연봉을 출력하세요
select  first_name,
        salary
from employees
where salary <= 14000
or salary >= 17000;

--입사일이 04/01/01 에서 05/12/31 사이의 사원의 이름과 입사일을 출력하세요
select  first_name,
        hire_date
from employees
where hire_date >= '04/01/01'
and hire_date <= '05/12/31';

--연봉이 14000 이상 17000이하인
--사원의 이름과 연봉을 구하시오
--between문법
select  first_name,
        salary
from employees
where salary between 14000 and 17000;

--between and 같은표현
select  first_name,
        salary
from employees
where salary >= 14000 
and salary  <=17000;

--in문법
select first_name, last_name, salary
from employees
where first_name in ('Neena','Lex','John');

--in 같은표현
select first_name, last_name, salary
from employees
where first_name = 'Neena'
and first_name = 'Lex'
or first_name = 'john';

--연봉이 2100, 3100, 4100, 5100 인 사원의 이름과 연봉
select first_name, salary
from employees
where salary in (2100, 3100, 4100, 5100);

--like연산자
select  first_name,
        last_name,
        salary
from employees
where first_name like 'L%';

select  first_name,
        last_name,
        salary
from employees
where first_name like 'A%';

select  first_name,
        last_name,
        salary
from employees
where first_name like '%a';

select  first_name,
        last_name,
        salary
from employees
where first_name like '%am%';

select  first_name,
        last_name,
        salary
from employees
where first_name like '_a___';

select  first_name,
        last_name,
        salary
from employees
where first_name like '____a';
--_L

--이름에 am 을 포함한 사원의 이름과 연봉을 출력하세요
select  first_name,
        last_name,
        salary
from employees
where first_name like '%am%';

--이름의 두번째 글자가 a 인 사원의 이름과 연봉을 출력하세요
select  first_name,
        last_name,
        salary
from employees
where first_name like '_a%';

--이름의 네번째 글자가 a 인 사원의 이름을 출력하세요
select  first_name,
        last_name,
        salary
from employees
where first_name like '___a%';

--이름이 4글자인 사원중 끝에서 두번째 글자가 a인 사원의 이름을 출력하세요
select  first_name,
        last_name,
        salary
from employees
where first_name like '__a_';

--null
--직원테이블에서 급여가 13000에서 15000사이인 
--직원의 이름, 급여, 커미션%, 급여*커미션을 출력하세요
select  first_name,
        salary,
        commission_pct,
        salary*commission_pct
from employees
where salary between 13000 and 15000;

--is와 not
select *
from employees
where commission_pct is not null;

--커미션비율이 있는 사원의 이름과 연봉 커미션비율을 출력하세요
select  first_name,
        salary,
        commission_pct
from employees
where commission_pct is not null;

--담당매니저가 없고 커미션비율이 없는 직원의 이름을 출력하세요
select  first_name,
        commission_pct,
        manager_id
from employees
where commission_pct is null
and manager_id is null;

select email, employee_id
from employees 
where employee_id = 110;

/*
select 문
    select 절
    from 절
    where 절 
    order by 절 (정렬)
*/
--order by 절
select *
from employees
order by salary desc; --큰쪽부터 작은쪽으로

select  first_name,
        salary
from employees
where salary >= 9000
order by salary asc; --작은쪽부터 큰쪽으로

--부서번호를 오름차순으로 정렬하고 부서번호, 급여, 이름을 출력하세요
select  department_id,
        salary,
        first_name
from employees
order by department_id asc;

--급여가 1000 이상인 직원의 이름 급여를 급여가 큰직원부터 출력하세요
select  first_name,
        salary
from employees
where salary >= 10000
order by salary desc;

--부서번호를 오름차순으로 정렬하고 부서번호가 같으면
--급여가 높은 사람부터 부서번호 급여 이름을 출력하세요
select  first_name,
        salary,
        department_id
from employees
order by department_id asc, salary asc;















