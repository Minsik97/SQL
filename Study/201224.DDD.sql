create table book(
    book_id number(5),
    title varchar2(50),
    author varchar2(10),
    pub_date date
);
--컬럼추가
alter table book add (pubs varchar2(50));

select  *
from book;

--컬럼 수정
alter table book modify(title varchar2(100));
alter table book rename column title to subject;

--컬럼 삭제
alter table book drop (author);

--테이블 명 삭제
rename book to article;

--테이블 삭제
drop table article;



