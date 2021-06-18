-- 회원 테이블 users
CREATE TABLE users (
    user_id VARCHAR2(20) PRIMARY KEY, -- 아이디
    user_pw VARCHAR2(20) NOT NULL, -- 비밀번호
    user_email VARCHAR2(30) NOT NULL, -- 이메일
    user_nickname VARCHAR2(20) NOT NULL, -- 닉네임
    user_rating_score VARCHAR2(20) NOT NULL, -- 평가점수
    user_role VARCHAR2(20) NOT NULL, -- 권한
    user_created_date DATE DEFAULT SYSDATE, -- 생성일자
    user_session_id VARCHAR2(30), -- 세션 아이디
    user_limit_time DATE -- 자동 로그인 기간
);

ALTER TABLE users ADD CONSTRAINT uni_user_nickname UNIQUE (user_nickname); -- 회원 닉네임 unique key 설정

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
    receive_user_nickname VARCHAR2(20) NOT NULL, -- 발신회 닉원네임
    CONSTRAINT fk_push_alarm_send_id FOREIGN KEY(send_user_id) REFERENCES users(user_id),
    CONSTRAINT fk_push_alarm_send_nickname FOREIGN KEY(send_user_nickname) REFERENCES users(user_nickname),
    CONSTRAINT fk_push_alarm_receive_id FOREIGN KEY(receive_user_id) REFERENCES users(user_id),
    CONSTRAINT fk_push_alarm_receive_nickname FOREIGN KEY(receive_user_nickname) REFERENCES users(user_nickname)
);


-- 상품 테이블 goods
CREATE SEQUENCE goods_seq; -- 상품 seq

CREATE TABLE goods (
    goods_no NUMBER(5) PRIMARY KEY, -- 상품번호
    sell_user_id VARCHAR2(20) NOT NULL, -- 판매자 아이디
    sell_user_nickname VARCHAR2(20) NOT NULL, -- 판매자 닉네임
    buy_user_id VARCHAR2(20) NOT NULL, -- 구매자 아이디
    buy_user_nickname VARCHAR2(20) NOT NULL, -- 구매자 닉네임
    goods_category VARCHAR2(10) NOT NULL, -- 상품 카테고리
    sales_area_number NUMBER(5) NOT NULL, -- 판매지역 번호
    goods_title VARCHAR2(100) NOT NULL, -- 상품 제목
    goods_status VARCHAR2(20) NOT NULL, -- 상품 판매 상태
    goods_content VARCHAR2(2000) NOT NULL, -- 상품 내용
    goods_price NUMBER(10) NOT NULL, -- 판매금액
    goods_view_cnt NUMBER(5), -- 조회수
    goods_created_date DATE DEFAULT SYSDATE, -- 생성일자
    CONSTRAINT fk_goods_sell_id FOREIGN KEY(sell_user_id) REFERENCES users(user_id),
    CONSTRAINT fk_goods_sell_nickname FOREIGN KEY(sell_user_nickname) REFERENCES users(user_nickname),
    CONSTRAINT fk_goods_buy_id FOREIGN KEY(buy_user_id) REFERENCES users(user_id),
    CONSTRAINT fk_goods_buy_nickname FOREIGN KEY(buy_user_nickname) REFERENCES users(user_nickname)
);

-- 관심상품 테이블 wishlist
CREATE SEQUENCE wishlist_seq; -- 관심상품 seq

CREATE TABLE wishlist (
    wishlist_no NUMBER(5) PRIMARY KEY,
    user_id VARCHAR2(20) NOT NULL, -- 아이디
    user_nickname VARCHAR2(20) NOT NULL, -- 닉네임
    goods_no NUMBER(5) NOT NULL, -- 상품번호
    wishlist_created_date DATE DEFAULT SYSDATE,
    CONSTRAINT fk_wishlist_user_id FOREIGN KEY(user_id) REFERENCES users(user_id),
    CONSTRAINT fk_wishlist_user_nickname FOREIGN KEY(user_nickname) REFERENCES users(user_nickname),
    CONSTRAINT fk_wishlist_goods_no FOREIGN KEY(goods_no) REFERENCES goods(goods_no)
);

-- 첨부파일 files
CREATE SEQUENCE files_seq; -- 첨부파일 seq

CREATE TABLE files (
    file_no NUMBER(5) PRIMARY KEY, -- 파일 번호
    file_type VARCHAR2(100) NOT NULL,-- 파일 타입
    file_name VARCHAR2(1000) NOT NULL, -- 파일 이름
    file_created_date DATE DEFAULT SYSDATE,-- 생성일자
    goods_no NUMBER(5) NOT NULL, -- 상품 번호
    user_id VARCHAR2(20) NOT NULL, -- 아이디
    user_nickname VARCHAR2(20) NOT NULL, -- 닉네임
    CONSTRAINT fk_files_user_id FOREIGN KEY(user_id) REFERENCES users(user_id),
    CONSTRAINT fk_files_user_nickname FOREIGN KEY(user_nickname) REFERENCES users(user_nickname),
    CONSTRAINT fk_files_goods_no FOREIGN KEY(goods_no) REFERENCES goods(goods_no)
);

-- 채팅방 chat_room
CREATE SEQUENCE chat_room_seq; -- 채팅방seq

CREATE TABLE chat_room (
    chat_room_no NUMBER(5) PRIMARY KEY, -- 채팅방 번호
    goods_no NUMBER(5) NOT NULL, -- 상품 번호
    buy_user_id VARCHAR2(20) NOT NULL, -- 아이디
    buy_user_nickname VARCHAR2(20) NOT NULL, -- 닉네임
    chat_room_created_date DATE DEFAULT SYSDATE, -- 생성일자
    CONSTRAINT fk_chat_room_user_id FOREIGN KEY(buy_user_id) REFERENCES users(user_id),
    CONSTRAINT fk_chat_room_buy_user_nickname FOREIGN KEY(buy_user_nickname) REFERENCES users(user_nickname),
    CONSTRAINT fk_chat_room_goods_no FOREIGN KEY(goods_no) REFERENCES goods(goods_no)
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
    chat_created_date DATE DEFAULT SYSDATE, -- 생성일자
    CONSTRAINT fk_chat_msg_send_id FOREIGN KEY(send_user_id) REFERENCES users(user_id),
    CONSTRAINT fk_chat_msg_send_nickname FOREIGN KEY(send_user_nickname) REFERENCES users(user_nickname),
    CONSTRAINT fk_chat_msg_chat_room_no FOREIGN KEY(chat_room_no) REFERENCES chat_room(chat_room_no)
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
    CONSTRAINT pk_nboard PRIMARY KEY (board_no),
    CONSTRAINT fk_nboard_user_id FOREIGN KEY(user_id) REFERENCES users(user_id),
    CONSTRAINT fk_nboard_user_nickname FOREIGN KEY(user_nickname) REFERENCES users(user_nickname)
);


-- 댓글 테이블 comments
CREATE SEQUENCE comments_seq; -- 댓글 seq

CREATE TABLE comments(
    comment_no NUMBER(5) PRIMARY KEY, -- 댓글 번호
    comment_content VARCHAR2(2000) NOT NULL, -- 댓글 내용
    comment_created_date DATE DEFAULT SYSDATE, -- 댓글 작성시간
    board_no NUMBER(5) NOT NULL, -- 게시판 번호
    user_id VARCHAR2(20) NOT NULL, -- 아이디
    user_nickname VARCHAR2(20) NOT NULL, -- 닉네임
    CONSTRAINT fk_comment_board_no FOREIGN KEY(board_no) REFERENCES nboard(board_no),
    CONSTRAINT fk_comment_user_id FOREIGN KEY(user_id) REFERENCES users(user_id),
    CONSTRAINT fk_comment_user_nickname FOREIGN KEY(user_nickname) REFERENCES users(user_nickname)
);


-- 공지사항 테이블 notice
CREATE SEQUENCE notice_seq; -- 공지사항 seq

CREATE TABLE notice (
    notice_no NUMBER(5) PRIMARY KEY, -- 공지번호
    user_id VARCHAR2(20) NOT NULL, -- 아이디
    user_nickname VARCHAR2(20) NOT NULL, -- 닉네임
    notice_title VARCHAR2(100) NOT NULL, -- 공지제목
    notice_content VARCHAR2(2000) NOT NULL, -- 공지내용
    notice_date DATE DEFAULT SYSDATE, -- 작성일
    CONSTRAINT fk_notice_user_id FOREIGN KEY(user_id) REFERENCES users(user_id),
    CONSTRAINT fk_notice_user_nickname FOREIGN KEY(user_nickname) REFERENCES users(user_nickname)
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

