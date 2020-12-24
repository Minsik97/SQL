CREATE TABLE author (
  author_id	NUMBER(10),
  author_name	VARCHAR2(100) 	NOT NULL,
  author_desc	VARCHAR2(500),
  PRIMARY 	KEY(author_id)	
);

--테이블에 데이터값 넣기
--방법1(묵시적)
insert into author 
values(1, '박경리', '토지 작가');

/*묵시적 방법 오류상황
insert into author
values(2, '이문열', );
*/

--방법3(빈칸이 필요할 때)
--명시적
insert into author(author_id, author_name)
values(2, '이문열');

--명시적 방법 오류상황
insert into author(author_id, author_desc)
values(3, '나혼자 산다 출연');

--데이터 수정
update author
set author_name = '기안84',
    author_desc = '나혼자 산다 출연 웹툰작가'
where author_id = 2;

update author
set author_name = '이문열'
where author_id = 1;

--데이터 삭제
delete from author
where author_id = 4;

insert into author
values(seq_author_id.nextval,'이문열','경북 영양');

insert into author
values(seq_author_id.nextval,'박경리','경북 통영');

insert into author
values(seq_author_id.nextval,'유시민','17대 국회의원');

insert into author
values(seq_author_id.nextval,'기안84','나혼자산다');



--번호표 기계 --시퀀스
--시퀀스 만들기
create sequence seq_author_id  --(이름)
increment by 1
start with 1;

--시퀀스 삭제
drop sequence seq_author_id;

--시퀀스 조회
select  *
from user_sequences;

--현재 번호
select seq_author_id.currval
from dual;

--다음 번호 꺼내는 명령어 -->번호 1 증가함
select seq_author_id.nextval
from dual;


select  *
from author;