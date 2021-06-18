-- 회원 테이블 users
CREATE TABLE users (
    user_id VARCHAR2(20) PRIMARY KEY, -- 아이디
    user_pw VARCHAR2(200) NOT NULL, -- 비밀번호
    user_email VARCHAR2(30) NOT NULL, -- 이메일
    user_nickname VARCHAR2(20) NOT NULL, -- 닉네임
    user_address VARCHAR2(50) NOT NULL, -- 지역
    user_auth VARCHAR2(20) DEFAULT 'USER', -- 권한
    user_created_date DATE DEFAULT SYSDATE, -- 생성일자
    user_session_id VARCHAR2(200) DEFAULT 'none', -- 세션 아이디
    user_limit_time DATE -- 자동 로그인 기간
);

-- 알람 테이블 push_alarm
CREATE SEQUENCE push_alarm_seq; -- 알람 seq

CREATE TABLE push_alarm(
    push_alarm_no NUMBER(5) PRIMARY KEY, -- 알람 번호
    push_alarm_date DATE DEFAULT SYSDATE, -- 알람 일자
    push_alarm_category VARCHAR2(20) NOT NULL, -- 알람 카테고리
    push_alarm_read_type NUMBER(1) DEFAULT 0 NOT NULL, -- 알람 읽음 여부 (0 = 읽지않음 , 1 = 읽음)
    push_alarm_content VARCHAR2(1000) NOT NULL, -- 알람 내용
    send_user_id VARCHAR2(20) NOT NULL, -- 수신회원 아이디
    send_user_nickname VARCHAR2(20) NOT NULL, -- 수신회원 닉네임
    receive_user_id VARCHAR2(20) NOT NULL, -- 발신회원 아이디
    receive_user_nickname VARCHAR2(20) NOT NULL -- 발신회 닉원네임
);


-- 상품 테이블 goods
CREATE SEQUENCE goods_seq; -- 상품 seq

CREATE TABLE goods (
    goods_no NUMBER(5) PRIMARY KEY, -- 상품번호
    sell_user_id VARCHAR2(20) NOT NULL, -- 판매자 아이디
    sell_user_nickname VARCHAR2(20) NOT NULL, -- 판매자 닉네임
    buy_user_id VARCHAR2(20), -- 구매자 아이디
    buy_user_nickname VARCHAR2(20), -- 구매자 닉네임
    goods_category VARCHAR2(10) NOT NULL, -- 상품 카테고리
    sales_area VARCHAR2(100), -- 판매지역
    goods_title VARCHAR2(100) NOT NULL, -- 상품 제목
    goods_status VARCHAR2(20) DEFAULT 'SALE' , -- 상품 판매 상태
    goods_content VARCHAR2(2000) NOT NULL, -- 상품 내용
    goods_price NUMBER(10) NOT NULL, -- 판매금액
    goods_view_cnt NUMBER(5), -- 조회수
    goods_created_date DATE DEFAULT SYSDATE -- 생성일자
);

-- 관심상품 테이블 wishlist
CREATE SEQUENCE wishlist_seq; -- 관심상품 seq

CREATE TABLE wishlist (
    wishlist_no NUMBER(5) PRIMARY KEY,
    user_id VARCHAR2(20) NOT NULL, -- 아이디
    user_nickname VARCHAR2(20) NOT NULL, -- 닉네임
    goods_no NUMBER(5) NOT NULL, -- 상품번호
    goods_tile VARCHAR2(100),
    wishlist_created_date DATE DEFAULT SYSDATE
);

-- 첨부파일 files
CREATE SEQUENCE files_seq; -- 첨부파일 seq

CREATE TABLE files (
    goods_no NUMBER(5) PRIMARY KEY, -- 상품 번호
    file_type VARCHAR2(100) NOT NULL,-- 파일 타입
    file_origin_name VARCHAR2(1000) NOT NULL, -- 파일 이름
    file_name VARCHAR2(1000) NOT NULL, -- 파일 이름
    file_created_date DATE DEFAULT SYSDATE,-- 생성일자
    user_id VARCHAR2(20) NOT NULL, -- 아이디
    user_nickname VARCHAR2(20) NOT NULL, -- 닉네임
    file_path VARCHAR2(1000) NOT NULL
);

-- 채팅방 chat_room
CREATE SEQUENCE chat_room_seq; -- 채팅방seq

CREATE TABLE chat_room (
    chat_room_no NUMBER(5) PRIMARY KEY, -- 채팅방 번호
    goods_no NUMBER(5) NOT NULL, -- 상품 번호
    buy_user_id VARCHAR2(20) NOT NULL, -- 아이디
    buy_user_nickname VARCHAR2(20) NOT NULL, -- 닉네임
    chat_room_created_date DATE DEFAULT SYSDATE -- 생성일자
);

-- 채팅메시지 chat_msg
CREATE SEQUENCE chat_msg_seq; -- 채팅메시지  seq

CREATE TABLE chat_msg (
    chat_msg_no NUMBER(5) PRIMARY KEY, -- 채팅 메시지 번호
    chat_room_no NUMBER(5) NOT NULL, -- 채팅방 번호
    send_user_id VARCHAR2(20) NOT NULL, -- 아이디
    send_user_nickname VARCHAR2(20) NOT NULL, -- 닉네임
    chat_msg_content VARCHAR2(1000) NOT NULL, -- 채팅메시지 내용
    chat_read_or_not NUMBER(1) DEFAULT 0 NOT NULL, -- 채팅메시지 읽음여부 (0 = 읽지않음 , 1 = 읽음)
    chat_created_date DATE DEFAULT SYSDATE -- 생성일자
);




-- 게시판(동네생활)
CREATE SEQUENCE seq_nboard; --nboard 시퀀스

CREATE TABLE nboard (
    board_no NUMBER(5), -- 게시글 번호
    user_id VARCHAR2(50) NOT NULL, -- 작성자 아이디
    user_nickname VARCHAR2(50) NOT NULL, -- 작성자 닉네임
    title VARCHAR2(100) NOT NULL, -- 게시글 제목
    content VARCHAR2(2000) NOT NULL, -- 게시글 내용
    views NUMBER(5) DEFAULT 0, -- 게시글 조회 수
    recommend NUMBER(5) DEFAULT 0, -- 게시글 추천 수
    post_date DATE DEFAULT SYSDATE, -- 게시글 작성일
    category VARCHAR2(20) NOT NULL, -- 카테고리
    CONSTRAINT pk_nboard PRIMARY KEY (board_no)
);


-- 댓글 테이블 comments
CREATE SEQUENCE comments_seq; -- 댓글 seq

CREATE TABLE comments(
    comment_no NUMBER(5) PRIMARY KEY, -- 댓글 번호
    comment_content VARCHAR2(2000) NOT NULL, -- 댓글 내용
    comment_created_date DATE DEFAULT SYSDATE, -- 댓글 작성시간
    board_no NUMBER(5) NOT NULL, -- 게시판 번호
    user_id VARCHAR2(20) NOT NULL, -- 아이디
    user_nickname VARCHAR2(20) NOT NULL -- 닉네임
);


-- 공지사항 테이블 notice
CREATE SEQUENCE notice_seq; -- 공지사항 seq

CREATE TABLE notice (
    notice_no NUMBER(5) PRIMARY KEY, -- 공지번호
    user_id VARCHAR2(20) NOT NULL, -- 아이디
    user_nickname VARCHAR2(20) NOT NULL, -- 닉네임
    notice_title VARCHAR2(100) NOT NULL, -- 공지제목
    notice_content VARCHAR2(2000) NOT NULL, -- 공지내용
    notice_date DATE DEFAULT SYSDATE -- 작성일
);

COMMIT;


-- 테이블 시퀀스 삭제

DROP TABLE notice;
DROP SEQUENCE notice_seq;

DROP TABLE comments;
DROP SEQUENCE comments_seq;

DROP TABLE nboard;
DROP SEQUENCE seq_nboard;


DROP TABLE chat_msg;
DROP SEQUENCE chat_msg_seq;

DROP TABLE chat_room;
DROP SEQUENCE chat_room_seq;

DROP TABLE files;
DROP SEQUENCE files_seq;

DROP TABLE wishlist;
DROP SEQUENCE push_alarm_seq;

DROP TABLE goods;
DROP SEQUENCE goods_seq;

DROP TABLE push_alarm;
DROP SEQUENCE wishlist_seq;


DROP TABLE users;

COMMIT;

SELECT
    *
FROM users;

SELECT
    *
FROM goods;

SELECT
    *
FROM files;

SELECT
    *
FROM users;

