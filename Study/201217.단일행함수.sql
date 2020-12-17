--단일행 함수 

--문자함수 - initcap(컬럼명)
select  email,
        initcap(email), -- 첫 글자만 대문자 
        department_id
from employees
where department_id = 100;

--문자함수 – LOWER(컬럼명) / UPPER(컬럼명)
select  first_name,
        lower(first_name), --전부 소문자
        upper(first_name) --전부 대문자 
from employees
where department_id = 100;

--문자함수 – SUBSTR(컬럼명, 시작위치, 글자수)
select  first_name,
        substr(first_name, 2, 6), --2번째 글자부터 6개
        substr(first_name,  -3, 2) --뒤에서 3번째 글자부터 2개
from employees
where department_id = 100;

--문자함수 – LPAD(컬럼명, 자리수, ‘채울문자’) /  RPAD(컬럼명, 자리수, ‘채울문자’)
select  first_name,
        lpad(first_name, 10, '*'),--10개로 만들어라(부족한건 '*'로 채워라)
        rpad(first_name, 10, '*') --뒤에다가 '*'를 채움
from employees;

--문자함수 – REPLACE (컬럼명, 문자1, 문자2)
select  first_name,
        replace(first_name, 'a', '*'), -- 'a'를 전부 '*'로 바꾼다
        department_id 
from employees
where department_id = 100;

--함수 조합
select  first_name,
        replace(first_name, 'a', '*'),
        substr(first_name, 2, 3),
        replace(first_name, substr(first_name, 2, 4), '****')
from employees
where department_id = 100;

--숫자함수 – ROUND(숫자, 출력을 원하는 자리수) 
select  round(123.456, 2) r2, --소수점 2자리만 표현 (뒤 숫자는 반올림)
        round(123.656, 2) r0,
        round(123.456, -1) "r-1"
from dual; 

select  salary,
        round(salary, -3) "sR2"
from employees;

--숫자함수 – TRUNC(숫자, 출력을 원하는 자리수) 
select  trunc(123.456, 2) as r2, --n번째 까지 출력하고 나머진 버림
        trunc(123.456, 0) as r0,
        trunc(123.456, -1) as "r-1"
from dual;

--날짜함수 – SYSDATE
select sysdate --()없음
from dual;

select  sysdate,
        first_name
from employees;

--단일함수>날짜함수 – MONTH_BETWEEN(d1, d2) 

select  sysdate,
        hire_date,
        months_between(sysdate, hire_date) as "workMonth",
        trunc(months_between(sysdate, hire_date), 0)"근무개월"
from employees
where department_id = 100;

--날짜함수 – LAST_DAY(d1)
select  LAST_DAY('20/02/06'),
        last_day(sysdate) 이번달
from dual;

--변환함수
--TO_CHAR(숫자, ‘출력모양’)  숫자형문자형으로 변환하기
select  first_name,
        salary,
        salary*12,
        to_char(salary*12, '$999,999,999.00'),
        to_char(salary*12, '999,999,999.00'),
        to_char(salary*12, '999,999,999'),
        to_char(salary*12, '099,999'), --(맨 앞자리를 0으로 표기)
        to_char(salary*12, '99999') --자리수 정해짐(넘어가면 #으로 표현)
from employees
where department_id = 100;

--변환함수>TO_CHAR(날짜, ‘출력모양’)  날짜문자형으로 변환하기
select  sysdate,
        to_char(sysdate,'YYYY')YYYY,
        to_char(sysdate,'YY')YY,
        to_char(sysdate,'MM')MM,
        to_char(sysdate,'MONTH')MONTH,--한글로 표기해줌
        to_char(sysdate,'DD')DD,
        to_char(sysdate,'DAY')DAY,--한글로 표기해줌
        to_char(sysdate,'HH') HH,
        to_char(sysdate,'HH24') HH,
        to_char(sysdate,'MI') MI,
        to_char(sysdate,'SS') SS
from dual;

--년월일 시분초
select  sysdate,
        to_char(sysdate, 'YYYY-MM-DD HH24:MI:SS')
from dual;

select  first_name,
        hire_date,
        to_char(hire_date, 'YY-MM-DD HH24:MI:SS')
from employees;

--일반함수>NVL(컬럼명, null일때값)/NVL2(컬럼명, null아닐때값, null일때 값)
select  first_name,
        commission_pct,
        NVL(commission_pct, 0),
        NVL2(commission_pct, 100, 0)
from employees;













