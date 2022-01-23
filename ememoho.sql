create database ememoho;

use ememoho;

# memo table
create table board(
bno int not null auto_increment,
title char(50) not null,
link text not null,
errorcontent text not null,
content text not null,
date date,
time time,
bookmark int default 0,
viewcnt int default 0,
primary key(bno)
);

# user table
create table myMember(
userId char(20) not null,
userPass char(100) not null,
regDate date
);

show tables;
drop table mymember;
select * from mymember;
set sql_safe_updates=0;
delete from mymember where userId="tester";
delete from mymember;
select count(userId) from myMember where userId="tester";

insert into mymember
values
('tester', '1234', NOW());

alter table board add column language char(20) not null;
alter table board drop column language;
desc board;

insert into board(title, link, errorcontent, content, date, time) values ('404error', 'https://www.naver.com', '404에러났었음', '이렇게 해결함!', now(), now()); 
insert into board(title, link, errorcontent, content, date, time) values ('500error', 'https://www.naverwewe.com', '500에러났었음', '이렇게 해결함!22', now(), now()); 
insert into board(title, link, errorcontent, content, date, time) values ('200ok', 'https://www.naverasdasd.com', '200ok??', 'good!!', now(), now()); 
insert into board(title, link, errorcontent, content, date, time) values ('301에러', 'https://www.naverasdasd.com.asdasdqwe.com', '301????', '??????', now(), now()); 

select * from board;

select * from board order by bno, title, errorcontent asc;

# 내림차순 정렬 날짜, 시간
select bno, title, errorcontent from board order by date desc, time desc;

select title, errorcontent from board;
select bno, title, link, errorcontent, content, date, time
        from board where bno = 1;
desc board;

update board SET bno = 1, title ='수정입니다.', link = '수정업데이트test', errorcontent = '에러내용 수정', content = '콘텐트 수정' WHERE bno = 1;

select bno, title, errorcontent, time from board order by bno desc;

select bno, title, errorcontent from board order by bno desc limit 0, 10;

#insert select문 (테이블에 담겨있는 데이터를 그대로 재입력하는 쿼리)
insert into board(title, link, errorcontent, content) select title, link, errorcontent, content from board;

select count(bno) from board;

select * from board;

#페이징
select bno,title,errorcontent from board order by bno desc limit 0, 10;

#검색
select title, content, errorcontent from board where title like '%200%';
select title, content, errorcontent, link from board where link like '%naver%';

select title, content, errorcontent, link from board where errorcontent || title || content like concat('%', '테스트', '%');

select title, content, errorcontent from board where title like '%200%' 
or content like '%200%' or errorcontent like '%테스트%';

select title, content, errorcontent from board where title like concat('%','200','%') 
or content like '%200%' or errorcontent like '%테스트%' order by bno desc limit 0,10 ;

select count(bno) from board where title like '%수정%';

select count(bno) from board where title like concat('%', '', '%');


select bno, title, errorcontent, date from board  
where title like concat('%', '301', '%');

 
select count(bno) from board;
select count(bno) from board
where title like concat('%', '에러', '%');

select * from board where title like '%301%';
select * from board;

select count(bno) from board where title like '%404%' or content like '%404%'; 

update board set viewcnt = viewcnt + 1 where bno = 62;
select bookmark from board where bno=10;

select * from board order by viewcnt desc limit 0, 1;