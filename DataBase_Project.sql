create user C##cs identified by 1234
DEFAULT TABLESPACE users
  TEMPORARY TABLESPACE temp;

grant connect, resource, create session, create view to C##cs;

--회원 테이블
create table Customer정보(
    cid varchar2(20) not null primary key,
    address varchar2(80) not null,
    pw varchar2(20) not null,
    names varchar2(10) not null,
    nickname varchar2(20) not null
    );
    
    
insert into Customer정보 values('aaa123','대구 북구 노원동','1111','조유성','유성');
insert into Customer정보 values('bbb123','부산 진구 양정동','2222','이춘복','춘복');
insert into Customer정보 values('ccc123','경기도 구리시 동구동','3333','김현석','현석');
insert into Customer정보 values('ddd123','인천광역시 게양구 작전동','4444','최강빈','강빈');
insert into Customer정보 values('eee123','전북 전주시 덕진구','5555','박지우','지우');
insert into Customer정보 values('fff123','경기 화성시 우정읍','6666','윤민재','민재');
insert into Customer정보 values('ggg123','충청남도 보령시 명천동','7777','강만식','만식');





--관리자 테이블
create table Manager정보 (
     mid varchar2(10) not null primary key,
     address varchar2(80) not null,
     pw varchar2(20) not null,
     names varchar2(10) not null,
     nickname varchar2(20) not null
     );
insert into Manager정보 values('qwe111','경상남도 양산시 소주동','111111','김남준','관리자1');
insert into Manager정보 values('qwe222','경기도 하남시 초이동','222222','이성욱','관리자2');  







--판매게시글 테이블
create table Sell(
    sno varchar2(5) not null primary key,
    nickname varchar2(20) not null,
    sdate varchar2(20) not null,
    title varchar2(30) not null,
    detail varchar2(200) not null,
    price number(20) not null
    );
insert into Sell values('S1','유성','2019/11/12','에어팟 프로','택배비 포함입니다.','1500000');
insert into Sell values('S2','춘복','2019/11/20','데쌍트 패딩','거의 새옷입니다.','50000');
insert into Sell values('S3','지우','2019/12/05','책상','하자없습니다.택배비 포함','20000');




--리뷰글 테이블
create table Review(
    rno varchar2(6) not null primary key,
    stars number(4) not null,
    title varchar2(30) not null,
    detail varchar2(50) not null,
    seller varchar2(10) not null,
    buyer varchar2(10) not null,
    sno varchar2(10),
    foreign key(sno) references Sell(sno)
    
     );
insert into Review values('R1','5','좋네요','잘쓸게요','유성','강빈','S1');
insert into Review values('R2','1','책상 하자 있네요','못 쓸 정도 입니다','지우','현석','S3');







--공지글 테이블
create table announce(
    ano varchar2(5) not null primary key,
    writer varchar2(20) not null,
    title varchar2(50) not null,
    detail varchar2(300) not null
    );
    
insert into announce values('A1','관리자1','사이트 오픈 했습니다','이용 규칙 잘 준수해주시기 바랍니다');
insert into announce values('A2','관리자2','운영정책','욕설,비속어,인격모독 등 비매너 행위 적발시 무통보 제재');






--메시지 테이블
create table message(
     mno varchar2(4) not null primary key,
     detail varchar2(100) not null,
     send varchar2(20) not null,
     geted varchar2(20) not null
     );
insert into message values('M1','에어팟 상태 좋나요?','강빈','유성');    
insert into message values('M2','패딩 사진좀 보여주세요','현석','춘복');  
insert into message values('M3','택배비 별도 인가요?','춘복','만식');






--신고게시글 테이블
create table reportt(
     rpno varchar2(4) not null primary key,
     writer varchar2(10) not null,
     rdate varchar2(20) not null,
     title varchar2(30) not null,
     detail varchar2(50) not null
     
     );
insert into reportt values('RP1','춘복','2019/12/15','만식 사기꾼 입니다','선 입금후에 물건을 안보냅니다.');




--3.공지글의 정보를 검색하시오.
select * from announce;

--1.회원의 정보를 검색하시오.
select * from customer정보;

--2.관리자의 정보를 검색하시오.
select * from manager정보;

--4.회원들간에 주고받은 메시지의 내역을 검색하시오.
select * from message;

--6.리뷰글의 정보를 검색하시오.
select * from review;

--5.판매글의 정보를 검색하시오.
select * from sell;

--7.신고게시글의 정보를 검색하시오.
select * from reportt;

--8.회원들의 주소,이름을 검색하시오.
select address,names from Customer정보;

--9.관리자들의 주소,이름,닉네임을 검색하시오
select address,names,nickname from Manager정보;

--10.거주지가 대구 북구 노원동인 회원의 아이디와 닉네임을 검색하시오.
select cid,nickname from Customer정보
where address = '대구 북구 노원동';

--11.이름이 김남준인 관리자의 거주지와 닉네임을 검색하시오.
select address,nickname from Manager정보
where names= '김남준';

--12. 보낸이의 닉네임이 '강빈'인 메시지의 내역을 검색하시오.
select * from message
where send='강빈';

--13.작성자의 닉네임이 '춘복'인 판매글의 제목과 내용,가격을 검색하시오.
select title,detail,price from Sell
where nickname='춘복';

--14.작성자의 닉네임이 '관리자2'인 공지글의 제목과 내용을 검색하시오.
select title,detail from announce
where writer='관리자2';

--15.구매자의 닉네임이 '강빈'인 리뷰글의 별점,제목,내용을 검색하시오.
select stars,title,detail from Review
where buyer='강빈';

--16.작성자가 '춘복'인 신고게시글의 날짜,제목,내용을 검색하시오.
select title,detail  from reportt 
where writer='춘복';

--17.이씨 성을 가진 회원들의 정보를 검색하시오.
select * from Customer정보
where names LIKE '이%';

--18.판매가격이 30000원 이상 60000원 이하인 판매글의 정보를 검색하시오.
select * from Sell
where price between 30000 and 60000;

--19.별점이 5점이 아닌 리뷰글의 정보를 검색하시오.
select * from Review
where stars <> '5';

--20.회원의 정보를 이름순으로 정렬하시오.
select * from Customer정보
order by names ASC;

--21."이춘복"회원의 주소를 '부산 광역시 사하구'로 바꾸고 닉네임을 '원빈'으로 수정하시오.
update Customer정보
set address=' 부산 광역시 사하구', nickname='원빈'
where names='이춘복';

--22.닉네임이 '관리자1'인 관리자의 주소를 '충청남도 서산'으로 바꾸고 닉네임을 '운영자'로 수정하시오.
update Manager정보
set address='충청남도 서산', nickname='운영자'
where nickname='관리자1';


--23.회원정보에 '이정수'라는 이름의 회원을 새로 추가하시오.
insert into Customer정보 values('hhh123','부산진구 동평로','8888','이정수','정수')

--24.관리자 정보에 '김현민'이라는 이름의 관리자를 새로 추가하시오.
insert into Manager정보 values('qwe333','연제구 중앙대로','333333','김현민','관리자3')

--25.회원정보에 '박지우'라는 이름의 회원을 삭제하시오.
delete from Customer정보 where names='박지우';

--26.관리자정보에 '김남준'이라는 이름의 관리자를 삭제하시오.
delete from Manager정보 where names='김남준';

--27.전북에 거주하고 있는 회원들을 검색하시오.
select * from Customer정보
where address LIKE '부산%';

--28.경기도에 거주하고 있는 관리자들을 검색하시오.
select * from Manager정보
where address LIKE '경기도%';

--29.관리자들의 정보를 이름순으로 나열하시오.
select * from Manager정보
order by names ASC;

--30.김씨 성을 가진 관리자를 검색하시오.
select * from Manager정보
where names LIKE '김%';

 

     





    
    


    











