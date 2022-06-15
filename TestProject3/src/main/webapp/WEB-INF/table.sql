CREATE SEQUENCE tickets_seq;
-- 상품 테이블
CREATE TABLE tickets(
	ticket_num NUMBER PRIMARY KEY, -- 상품 번호
 	cate_num NUMBER CONSTRAINT cate_num_fk REFERENCES category(num), -- 카테고리 번호
 	name  VARCHAR2(100), -- 이름
 	price NUMBER, -- 가격
 	grade NUMBER, -- 등급
 	cast VARCHAR2(400), -- 출연
 	hours VARCHAR(20), -- 관람시간
 	startdate DATE, -- 첫 공연일
 	enddate DATE -- 마지막 공연일
);

-- 카테고리 테이블
CREATE TABLE category(
	num NUMBER PRIMARY KEY, -- 카테고리 번호
	name VARCHAR(20) -- 이름
);

-- 장소 테이블
CREATE TABLE locations(
	location_num NUMBER PRIMARY KEY, -- 장소 번호
	ticket_num NUMBER CONSTRAINT ticket_num_fk REFERENCES tickets(ticket_num), -- 상품 번호
	name VARCHAR2(100), -- 이름
	addr VARCHAR2(100), -- 주소
	tel VARCHAR2(20) -- 전화번호
);

CREATE SEQUENCE schedules_seq;
-- 공연 일정 테이블
CREATE TABLE schedules(
   schedule_num NUMBER PRIMARY KEY, -- 공연일정 번호
   location_num NUMBER CONSTRAINT location_num_fk REFERENCES locations(location_num), -- 장소 번호
   dDay DATE, -- 공연 날짜
   times NUMBER, -- 회차
   startTime VARCHAR2(50) -- 시작 시간
);

-- 회원 테이블
CREATE TABLE users(
	id VARCHAR2(20) PRIMARY KEY, -- 회원 아이디
    pwd VARCHAR2(50), -- 비밀번호
	name VARCHAR2(20), -- 이름
	phone VARCHAR2(20), -- 전화번호
	addr VARCHAR2(50), -- 주소
	email VARCHAR2(100) -- 이메일
);

CREATE SEQUENCE booking_seq;
-- 예약 테이블
CREATE TABLE booking(
   booking_num NUMBER PRIMARY KEY, -- 예약 번호
   ticket_num NUMBER CONSTRAINT ticket_num_fk REFERENCES tickets(ticket_num), -- 상품 번호
   location_num NUMBER CONSTRAINT location_num_fk REFERENCES locations(location_num), -- 장소 번호
   schedule_num NUMBER CONSTRAINT schedule_num_fk REFERENCES schedules(schedule_num), -- 공연 일정 번호
   id VARCHAR2(20) CONSTRAINT user_id_fk REFERENCES users(id), -- 회원 아이디
   seat_num NUMBER CONSTRAINT seat_num_fk REFERENCES seat(seat_num), -- 좌석 번호
   bookDate DATE -- 예약일
);

-- 좌석 테이블
CREATE TABLE seat(
	seat_num NUMBER PRIMARY KEY, -- 좌석 번호
	schedule_num NUMBER CONSTRAINT schedule_num_fk REFERENCES schedules(schedule_num), -- 공연 일정 번호
	status NUMBER -- 상태
);