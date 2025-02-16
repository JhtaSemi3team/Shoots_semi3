Select * from inquiry;

delete table inquiry cascade;

CREATE TABLE inquiry(
    inquiry_id NUMBER(10) PRIMARY KEY, --문의글 번호 : primary 키
    inquiry_type char(1) CHECK (inquiry_type IN ('A', 'B')), -- A : 회원, B : 기업
    inquiry_ref_idx NUMBER(10) not null, --문의자 식별번호
    title varchar2(100) NOT NULL, --문의 제목
    content clob NOT NULL, --문의 내용
    inquiry_file varchar2(50), --첨부파일
    register_date timestamp DEFAULT current_timestamp --글 등록일
);

CREATE SEQUENCE inquiry_seq
START WITH 1
INCREMENT BY 1
NOCACHE;


insert into INQUIRY
values (inquiry_seq.nextval, 'A', 1, '참조용 제목', '그래서 이게 작동한다고?', null, current_timestamp);

insert into INQUIRY
values (inquiry_seq.nextval, 'B', 1, '기업 데이터용', '암튼 테스트', null, current_timestamp);

select * from INQUIRY
order by INQUIRY_id desc;


--1. 문의글을 쓴 글쓴이들의 식별번호 (ref_idx) = 개인회원들의 고유번호 idx 를 join해서 문의글들의 내용을 모두 뽑아오는 커리문.
-- 즉,개인 회원들중 문의글을 쓴 적 있는 사람들의 문의글들의 정보와 그 개인회원의 user_id를 모두 조회하라는 커리문.
select i.*, r.user_id 
from inquiry i 
join regular_user r 
on i.inquiry_ref_idx = r.idx;


--위의 join 커리문과 페이지네이션 (rownum)을 합쳐서 만든 커리문. 위의 커리문 조건에 맞는 문의글들을 해당 페이지에 맞춰서 데이터를 들고옴.
select * from (
SELECT ROWNUM rnum, inquiry_id, inquiry_type, inquiry_ref_idx, title, content, inquiry_file, register_date, user_id
FROM(
	select i.*, r.user_id 
	from inquiry i 
	join regular_user r 
	on i.inquiry_ref_idx = r.idx
	order by inquiry_id desc
	)
where rownum <= 10  -- 1번째 ? 자리. startrow 값 = 읽기 시작할 첫번째 페이지 값( 10페이지씩 보기시 1, 11, 21 ...)
) where rnum >= 1 -- 2번째 ? 자리. endrow 값 = 읽을 마지막 페이지 값 (10페이지 보기 로 선택시 10번째 페이지 10 20 30 40..)


-- 1. 을 다시 들고와서 문의글 쓴 유저들의 정보 (서브커리)를 뽑아 온 뒤 그 중 특정 문의글 (inquiry_id)을 찾아내는 커리문.
select * from(
			select i.*, r.user_id 
			from inquiry i 
			join regular_user r 
			on i.inquiry_ref_idx = r.idx
			order by inquiry_id desc
			)
where inquiry_id = 32;  --DAO 메서드에서 ? 부분. 특정 문의글 번호.



--2. 댓글이 달린 문의글들을 찾고 그 문의글들에 달린 댓글이 몇개인지 세는 커리문
select i.inquiry_id, count(ic.i_comment_id)
from INQUIRY i
inner join INQUIRY_COMMENT ic
on i.inquiry_id = ic.inquiry_id
group by i.inquiry_id;


--3. 개인 회원, 기업회원 다 합쳐서 문의글을 쓴 적 있는 사람들의 문의글들의 정보와 그 개인회원의 user_id를 모두 조회하라는 커리문.
--타입 a면 개인, b면 기업. 질문글 쓴 사람이 있는 사람(inquiry_ref_idx) = 각 회원의 식별번호 (idx / b.idx) 인 데이터의 inquiry 정보들을 조회하게 함.
SELECT i.*, 
       CASE WHEN i.inquiry_type = 'A' THEN r.user_id 
            WHEN i.inquiry_type = 'B' THEN b.business_id 
       END AS user_id, business_id
FROM inquiry i 
LEFT JOIN regular_user r ON i.inquiry_type = 'A' AND i.inquiry_ref_idx = r.idx
LEFT JOIN business_user b ON i.inquiry_type = 'B' AND i.inquiry_ref_idx = b.business_idx
ORDER BY i.inquiry_id DESC;


-- 3-2 : 3에서 where절을 추가해 타입에 따라 개인 / 회원 유형의 글만 뽑은뒤 다시 and 절로 특정 회원이 쓴 글 (회원 식별번호 idx)만 뽑아오는 커리문
SELECT i.*, 
       CASE WHEN i.inquiry_type = 'A' THEN r.user_id 
            WHEN i.inquiry_type = 'B' THEN b.business_id 
       END AS user_id
FROM inquiry i 
LEFT JOIN regular_user r ON i.inquiry_type = 'A' AND i.inquiry_ref_idx = r.idx
LEFT JOIN business_user b ON i.inquiry_type = 'B' AND i.inquiry_ref_idx = b.business_idx
where i.inquiry_type = 'A'  --이 부분이 A면 개인, B면 기업
and i.inquiry_ref_idx = 1  --이 부분이 회원 식별번호. inquiry_ref_idx = 개인은 idx, 기업은 business_idx 값이 여기. 세션에선 모두 idx임.
ORDER BY i.inquiry_id DESC;

--3-3 : 위의 3-2에다가 페이지네이션을 더한 커리문
select *
from (select rownum rnum, j.*
		from (	SELECT i.*, 
			       CASE WHEN i.inquiry_type = 'A' THEN r.user_id 
			            WHEN i.inquiry_type = 'B' THEN b.business_id 
			       END AS user_id, business_id
				FROM inquiry i 
				LEFT JOIN regular_user r ON i.inquiry_type = 'A' AND i.inquiry_ref_idx = r.idx
				LEFT JOIN business_user b ON i.inquiry_type = 'B' AND i.inquiry_ref_idx = b.business_idx
				where i.inquiry_type = 'B' --로그인 회원의 유형 (개인/기업)
				and i.inquiry_ref_idx = 3 --회원의 식별 번호
				ORDER BY i.inquiry_id DESC
				) j
		where rownum <= 10) --한번에 볼 글의 개수
where rnum >= 1 and rnum <= 10  --최소 페이지부터 최대 페이지까지. 1페이지~10페이지 까지 나오게 한단 소리.
