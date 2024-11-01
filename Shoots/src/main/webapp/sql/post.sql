CREATE TABLE post (
    post_id NUMBER(10) PRIMARY KEY, --게시글 식별 번호
    writer NUMBER(10) NOT NULL, --작성자
    category char(1) CHECK (category IN ('A', 'B')), --글 종류
    title VARCHAR2(100) NOT NULL, --제목
    content clob NOT NULL, --내용
    post_file VARCHAR2(50), --첨부파일
    price NUMBER(10), --가격
    register_date DATE DEFAULT SYSDATE --등록일 
);

CREATE SEQUENCE post_seq
START WITH 1
INCREMENT BY 1
NOCACHE;

ALTER TABLE post
ADD readcount number; --조회수


select * from post;



-- 게시판 글 리스트 조회 쿼리 (글번호 제목 글쓴이 작성일 조회수) --> 포다오 getPostList 쿼리문에 넣을거

select *
from post
order by register_date desc;


-- 게시글 없어서 postlist 페이지 확인하려고 넣어둔거
insert into POST
(post_id, writer, category, title, content)
values (1, 2, 'A', 4, 5);


