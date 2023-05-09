CREATE TABLE goods
(
	goods_id NUMBER GENERATED BY DEFAULT AS IDENTITY,
	goods_name VARCHAR2(100) NOT NULL,
	goods_pic VARCHAR2(100),
	goods_manufacturer VARCHAR2(100),
	capacity NUMBER,
	category_id NUMBER,
    	capacity_unit_id VARCHAR2(20),
	readcnt NUMBER DEFAULT 0


	CONSTRAINT goods_goods_id_pk PRIMARY KEY (goods_id)
);

CREATE TABLE member_goods_cart
(
	member_goods_cart_id NUMBER GENERATED BY DEFAULT AS IDENTITY,
	member_id NUMBER NOT NULL,
	goods_id NUMBER NOT NULL,
	cart_id NUMBER NOT NULL,

	CONSTRAINT member_goods_cart_member_goods_cart_id_pk PRIMARY KEY(member_goods_cart_id)
);


CREATE TABLE non_member_retail_cart
(
	non_member_retail_cart_id NUMBER GENERATED BY DEFAULT AS IDENTITY,
	non_member_id NUMBER NOT NULL,
	cart_id NUMBER NOT NULL,
	retail_id NUMBER NOT NULL,

	CONSTRAINT non_member_retail_cart_non_member_retail_cart_id_pk PRIMARY KEY(non_member_retail_cart_id)
);

CREATE TABLE non_member_goods_cart
(
	non_member_goods_cart_id NUMBER GENERATED BY DEFAULT AS IDENTITY,
	non_member_id NUMBER NOT NULL,
	goods_id NUMBER NOT NULL,
	cart_id NUMBER NOT NULL,

	CONSTRAINT non_member_goods_cart_non_member_goods_cart_id_pk PRIMARY KEY(non_member_goods_cart_id)
);


CREATE TABLE member_act_grade
(
	member_level_num NUMBER GENERATED BY DEFAULT AS IDENTITY,
	standard_grade NUMBER NOT NULL,
	name_grade VARCHAR2(20) NOT NULL,

	CONSTRAINT member_act_grade_member_level_num_pk PRIMARY KEY(member_level_num)
);

CREATE TABLE category
(
	category_id NUMBER,
	category_name VARCHAR2(40) NOT NULL,

	CONSTRAINT category_category_id_pk PRIMARY KEY(category_id)
);

CREATE TABLE capacity_unit
(
	capacity_unit_id VARCHAR2(20),
	capacity_unit_name VARCHAR2(50) NOT NULL,

	CONSTRAINT capacity_unit_capacity_unit_id_pk PRIMARY KEY(category_id)
);

CREATE TABLE chatroom
(
	chat_room_id NUMBER GENERATED BY DEFAULT AS IDENTITY,
	chat_room VARCHAR2(20),
	created_date TIMESTAMP(6) NOT NULL,
	chat_text VARCHAR2(1000),

	CONSTRAINT chatroom_chat_room_id_pk PRIMARY KEY(chat_room_id)
);

CREATE TABLE standard_value
(
	name_standard VARCHAR2(20),
	add_value NUMBER NOT NULL,

	CONSTRAINT standard_value_name_standard_pk PRIMARY KEY(name_standard)
);


-- ����


CREATE TABLE MEMBER (
	MEMBER_ID NUMBER GENERATED BY DEFAULT AS IDENTITY CONSTRAINT MEMBER_MEMBER_ID_PK PRIMARY KEY,
    MEMBER_LEVEL_NUM NUMBER NOT NULL,
    TOWN_ID NUMBER NOT NULL,
	LOGIN_ID VARCHAR2(20) NOT NULL,
	ALIAS VARCHAR2(10) NOT NULL,
	MONEY NUMBER NOT NULL,
	EMAIL VARCHAR2(30) NULL,
	MOBILE_NUM NUMBER NULL,
	SNS VARCHAR2(10) NULL,
	PWD VARCHAR2(20) NOT NULL,
	JOIN_DATE TIMESTAMP NOT NULL,
	POINT NUMBER NOT NULL,
	AUTHORITY_CODE VARCHAR2(10) NOT NULL,
	CONSTRAINT MEMBER_AUTHORITY_CODE_CK CHECK(AUTHORITY_CODE IN ('read', 'read+write')),
	ADMIN_ACCOUNT VARCHAR2(10) NOT NULL,
	CONSTRAINT MEMBER_ADMIN_ACCOUNT_CK CHECK (ADMIN_ACCOUNT IN ('user', 'admin'))
);


CREATE TABLE NON_MEMBER (
	NON_MEMBER_ID NUMBER GENERATED BY DEFAULT AS IDENTITY CONSTRAINT NON_MEMBER_NON_MEMBER_ID_PK PRIMARY KEY,
    TOWN_ID NUMBER,
	NON_MEMBER_IP VARCHAR2(30) NOT NULL,
	AUTHORITY_CODE VARCHAR2(10) NOT NULL,
	CONSTRAINT NON_MEMBER_AUTHORITY_CODE_CK CHECK(AUTHORITY_CODE IN ('read', 'read+write'))
);


CREATE TABLE RETAIL (
	RETAIL_ID NUMBER GENERATED BY DEFAULT AS IDENTITY CONSTRAINT RETAIL_RETAIL_ID_PK PRIMARY KEY,
	RETAIL_NAME VARCHAR2(100) NOT NULL,
	RETAIL_ADDR VARCHAR2(300) NOT NULL,
    	town_id NUMBER CONSTRAINT retail_town_id_fk REFERENCES city(town_id)
);


CREATE TABLE CART (
	CART_ID NUMBER GENERATED BY DEFAULT AS IDENTITY CONSTRAINT CART_CART_ID_PK PRIMARY KEY,
	CART_CREATION_DATE TIMESTAMP NOT NULL,
	API_DATE TIMESTAMP NOT NULL
);


CREATE TABLE MEMBER_RETAIL_CART (
	MEMBER_RETAIL_CART_NUM NUMBER GENERATED BY DEFAULT AS IDENTITY CONSTRAINT MEMBER_RETAIL_CART_MEMBER_RETAIL_CART_NUM_PK PRIMARY KEY,
    MEMBER_ID NUMBER NOT NULL,
    RETAIL_ID NUMBER NOT NULL,
    CART_ID NUMBER NOT NULL
    
);

-- ����


CREATE TABLE withdrawal (
    withdrawal_num NUMBER GENERATED ALWAYS AS IDENTITY CONSTRAINT withdrawal_withdrawal_num_pk PRIMARY KEY,
    withdrawal_reason VARCHAR2(20) NOT NULL,
    etc_reason VARCHAR2(600)
);

CREATE TABLE country (
    country_id NUMBER GENERATED ALWAYS AS IDENTITY CONSTRAINT country_country_id_pk PRIMARY KEY,
    country_name VARCHAR2(20) NOT NULL
);

CREATE TABLE city (
    city_id NUMBER GENERATED ALWAYS AS IDENTITY CONSTRAINT city_city_id_pk PRIMARY KEY,
    city_name VARCHAR2(20) NOT NULL,
    country_id NUMBER NOT NULL
);

CREATE TABLE town (
    town_id NUMBER GENERATED ALWAYS AS IDENTITY CONSTRAINT town_town_id_pk PRIMARY KEY,
    town_name VARCHAR2(20) NOT NULL,
    city_id NUMBER NOT NULL
);

CREATE TABLE favorite (
    member_id NUMBER,
    retail_id NUMBER
);

CREATE TABLE sale (
    api_date DATE,
    retail_id NUMBER,
    goods_id NUMBER, 
    price NUMBER NOT NULL
);

CREATE TABLE wish_list (
    member_id NUMBER,
    goods_id NUMBER
);

CREATE TABLE chat_room_enter (
    chat_room_id NUMBER,
    member_id_1 NUMBER NOT NULL,
    member_id_2 NUMBER,
    member_id_3 NUMBER,
    member_id_4 NUMBER
);


-- �뼼


CREATE TABLE mate_board (
	post_no	NUMBER GENERATED BY DEFAULT AS IDENTITY	NOT NULL,
	member_id	NUMBER	NOT NULL,
	title	VARCHAR2(300)	NOT NULL,
	content	VARCHAR2(4000)	NOT NULL,
	views	NUMBER	NOT NULL,
	write_dt TIMESTAMP DEFAULT current_date	NOT NULL,
	report_cnt	NUMBER	NOT NULL,
	meeting_status	CHAR(1)	NOT NULL,
	meeting_time	TIMESTAMP	NOT NULL,
	meeting_area	VARCHAR2(70)	NOT NULL,
	participant_id_1	NUMBER	NOT NULL,
	participant_id_2	NUMBER	NOT NULL,
	participant_id_3	NUMBER	NOT NULL
);

ALTER TABLE mate_board ADD CONSTRAINT mate_board_post_no_pk PRIMARY KEY (POST_NO);

CREATE TABLE mate_board_comment (
	comment_no	NUMBER GENERATED BY DEFAULT AS IDENTITY	NOT NULL,
	post_no	NUMBER	NOT NULL,
	member_id	NUMBER	NOT NULL,
	secret_yn	CHAR(1)	NOT NULL,
	content	VARCHAR2(4000)	NOT NULL,
    like_cnt	NUMBER	NOT NULL,
	high_comment_no	NUMBER	NULL,
	write_dt TIMESTAMP DEFAULT current_date 	NOT NULL,
	comment_lv	NUMBER(1)	DEFAULT 1	NOT NULL
);

ALTER TABLE mate_board_comment ADD CONSTRAINT mate_board_comment_comment_no_post_no_pk PRIMARY KEY (comment_no, POST_NO);

CREATE TABLE mate_board_file (
	file_id	VARCHAR2(200)	NOT NULL,
	post_no	NUMBER	NOT NULL,
	file_name	VARCHAR2(200)	NOT NULL,
	file_path	VARCHAR2(1000)	NOT NULL,
	file_type	VARCHAR2(5)	NOT NULL,
	file_size	NUMBER	NOT NULL,
	create_dt 	TIMESTAMP DEFAULT current_date	NOT NULL
);

ALTER TABLE mate_board_file ADD CONSTRAINT mate_board_file_file_id_post_no_pk PRIMARY KEY (file_ID, post_no);

CREATE TABLE mate_board_act_not (
	not_no	NUMBER GENERATED BY DEFAULT AS IDENTITY	NOT NULL,
	member_id	NUMBER	NOT NULL,
	post_no	NUMBER,
	not_target_member_id	NUMBER	NOT NULL,
	not_content	VARCHAR2(150)	NOT NULL,
	not_type	VARCHAR2(15)	NOT NULL,
	not_dt  TIMESTAMP DEFAULT current_date 	NOT NULL,
	not_read_dt	TIMESTAMP	NULL
);

ALTER TABLE mate_board_act_not ADD CONSTRAINT mate_board_act_not_not_no_pk PRIMARY KEY (not_no);

CREATE TABLE mate_board_keyword_not (
	not_no	NUMBER GENERATED BY DEFAULT AS IDENTITY	NOT NULL,
	not_content	VARCHAR2(150)	NOT NULL,
	not_dt 	TIMESTAMP DEFAULT current_date 	NOT NULL,
	not_read_dt	TIMESTAMP	NULL,
	post_no	NUMBER,
	keyword	VARCHAR2(30)	NOT NULL,
	member_id	NUMBER	NOT NULL
);

ALTER TABLE mate_board_keyword_not ADD CONSTRAINT mate_board_keyword_not_not_no_pk PRIMARY KEY (not_no);

CREATE TABLE mate_board_bookmark (
	bookmark_no	NUMBER GENERATED BY DEFAULT AS IDENTITY	NOT NULL,
	member_id	NUMBER	NOT NULL,
	post_no	NUMBER	NOT NULL
);

ALTER TABLE mate_board_bookmark ADD CONSTRAINT mate_board_bookmark_bookmark_no_pk PRIMARY KEY (bookmark_no);

CREATE TABLE mate_board_tags (
	tag_name	VARCHAR2(60)	NOT NULL,
	post_no	NUMBER
);

ALTER TABLE mate_board_tags ADD CONSTRAINT mate_board_tags_tag_name_post_no_pk PRIMARY KEY (tag_name, post_no);


CREATE TABLE qna_board (
	post_no	NUMBER	GENERATED BY DEFAULT AS IDENTITY NOT NULL,
	member_id NUMBER	NOT NULL,
	title	VARCHAR2(300)	NOT NULL,
	content	VARCHAR2(4000)	NOT NULL,
	views	NUMBER	NOT NULL,
	write_dt	TIMESTAMP DEFAULT current_date 	NOT NULL,
	secret_yn	CHAR(1)	NOT NULL
);

ALTER TABLE qna_board ADD CONSTRAINT qna_board_post_no_pk PRIMARY KEY (POST_NO);


CREATE TABLE qna_board_comment (
	comment_no	NUMBER GENERATED BY DEFAULT AS IDENTITY	NOT NULL,
	post_no	NUMBER	NOT NULL,
	member_id	NUMBER	NOT NULL,
	secret_yn	CHAR(1)	NOT NULL,
	content	VARCHAR2(4000)	NOT NULL,
	like_cnt	NUMBER	NOT NULL,
	high_comment_no	NUMBER	NULL,
	write_dt	TIMESTAMP DEFAULT current_date 	NOT NULL,
	comment_lv	NUMBER(1)	DEFAULT 0	NOT NULL
);
-- new qna_board_comment
CREATE TABLE qna_board_comment (
	comment_no	NUMBER GENERATED BY DEFAULT AS IDENTITY	NOT NULL,
	post_no	NUMBER	NOT NULL,
	member_id	NUMBER	NOT NULL,
	secret_yn	CHAR(1)	NOT NULL,
	content	VARCHAR2(4000)	NOT NULL,
	like_cnt	NUMBER	NOT NULL,
	write_dt	TIMESTAMP DEFAULT current_date 	NOT NULL,
	comment_root	NUMBER	NOT NULL,
	comment_step	NUMBER	DEFAULT 0	NOT NULL,
	comment_indent	NUMBER	DEFAULT 0	NOT NULL
);


-- new new qna_board_comment
CREATE TABLE qna_board_comment (
	comment_no	NUMBER GENERATED BY DEFAULT AS IDENTITY	NOT NULL,
	post_no	NUMBER	NOT NULL,
	member_id	NUMBER	NOT NULL,
	secret_yn	CHAR(1)	NOT NULL,
	content	VARCHAR2(4000)	NOT NULL,
	delete_yn	CHAR(1)	NOT NULL,
	write_dt	TIMESTAMP DEFAULT current_date 	NOT NULL,
	comment_root	NUMBER	NOT NULL,
	comment_step	NUMBER	DEFAULT 0	NOT NULL,
	comment_indent	NUMBER	DEFAULT 0	NOT NULL
);


ALTER TABLE qna_board_comment ADD CONSTRAINT qna_board_comment_comment_no_post_no_pk PRIMARY KEY (POST_NO, comment_no);


drop table qna_board_comment_like;

CREATE TABLE qna_board_comment_like (
	comment_like_no	NUMBER	GENERATED BY DEFAULT AS IDENTITY NOT NULL,
	post_no	NUMBER	NOT NULL,
	comment_no	NUMBER	NOT NULL,
	member_id NUMBER	NOT NULL
);

ALTER TABLE qna_board_comment_like ADD CONSTRAINT qna_board_comment_like_comment_like_no_pk PRIMARY KEY (comment_like_no);

CREATE TABLE qna_board_file (
	file_ID	VARCHAR2(200)	NOT NULL,
	post_no	NUMBER	NOT NULL,
	file_name	VARCHAR2(200)	NOT NULL,
	file_path	VARCHAR2(1000)	NOT NULL,
	file_type	VARCHAR2(5)	NOT NULL,
	file_size	NUMBER	NOT NULL,
	create_dt	TIMESTAMP DEFAULT current_date 	NOT NULL
);

ALTER TABLE qna_board_file ADD CONSTRAINT qna_board_file_file_id_post_no_pk PRIMARY KEY (POST_NO, file_ID);

CREATE TABLE qna_board_act_not (
	not_no	NUMBER GENERATED BY DEFAULT AS IDENTITY	NOT NULL,
	member_id	NUMBER	NOT NULL,
	post_no	NUMBER	NOT NULL,
	not_target_member_id	NUMBER	NOT NULL,
	not_content	VARCHAR2(150)	NOT NULL,
	not_type	VARCHAR2(15)	NOT NULL,
	not_dt	TIMESTAMP DEFAULT current_date 	NOT NULL,
	not_read_dt	TIMESTAMP	NULL
);

ALTER TABLE qna_board_act_not ADD CONSTRAINT qna_board_act_not_not_no_pk PRIMARY KEY (not_no, member_id);


CREATE TABLE qna_board_keyword_not (
	not_no	NUMBER GENERATED BY DEFAULT AS IDENTITY	NOT NULL,
	not_content	VARCHAR2(150)	NOT NULL,
	not_dt	TIMESTAMP DEFAULT current_date 	NOT NULL,
	not_read_dt	TIMESTAMP	NULL,
	post_no	NUMBER	NOT NULL,
	keyword	VARCHAR2(30)	NOT NULL,
	member_id	NUMBER	NOT NULL
);

ALTER TABLE qna_board_keyword_not ADD CONSTRAINT qna_board_keyword_not_not_no_pk PRIMARY KEY (not_no);

CREATE TABLE qna_board_bookmark (
	bookmark_no	NUMBER GENERATED BY DEFAULT AS IDENTITY	NOT NULL,
	member_id	NUMBER	NOT NULL,
	post_no	NUMBER	NOT NULL
);

ALTER TABLE qna_board_bookmark ADD CONSTRAINT qna_board_bookmark_bookmark_no_pk PRIMARY KEY (bookmark_no);

-- ����

CREATE TABLE region_board (
    post_no NUMBER,
    member_id NUMBER NOT NULL,        
    title VARCHAR2(300) NOT NULL,
    content VARCHAR2(4000) NOT NULL,
    views NUMBER DEFAULT 0 NOT NULL,
    write_dt TIMESTAMP DEFAULT current_timestamp NOT NULL,
    like_cnt NUMBER DEFAULT 0 NOT NULL,
    hate_cnt NUMBER DEFAULT 0 NOT NULL,
    report_cnt NUMBER DEFAULT 0 NOT NULL,
    writing_area NUMBER NOT NULL
);


CREATE TABLE sale_board (
    post_no NUMBER,
    member_id NUMBER NOT NULL,
    title VARCHAR2(300) NOT NULL,
    content VARCHAR2(4000) NOT NULL,
    views NUMBER DEFAULT 0 NOT NULL,
    write_dt TIMESTAMP DEFAULT current_timestamp NOT NULL,
    like_cnt NUMBER DEFAULT 0 NOT NULL,
    hate_cnt NUMBER DEFAULT 0 NOT NULL,
    report_cnt NUMBER DEFAULT 0 NOT NULL,
    writing_area NUMBER NOT NULL
);

-- like hate테이블 추가
CREATE TABLE sale_board_like (
	like_no	NUMBER	GENERATED BY DEFAULT AS IDENTITY NOT NULL,
	post_no	NUMBER	NOT NULL,
	member_id NUMBER	NOT NULL
);

ALTER TABLE sale_board_like ADD CONSTRAINT sale_board_like_like_no_pk PRIMARY KEY (like_no);

CREATE TABLE sale_board_hate (
	hate_no	NUMBER	GENERATED BY DEFAULT AS IDENTITY NOT NULL,
	post_no	NUMBER	NOT NULL,
	member_id NUMBER	NOT NULL
);

ALTER TABLE sale_board_hate ADD CONSTRAINT sale_board_hate_hate_no_pk PRIMARY KEY (hate_no);

-- /like hate테이블 추가

CREATE TABLE region_board_comment (
    comment_no NUMBER,
    post_no NUMBER,
    member_id NUMBER NOT NULL,
    secret_yn CHAR(1) NOT NULL,
    content VARCHAR2(4000) NOT NULL,
    like_cnt NUMBER DEFAULT 0 NOT NULL,
    high_comment_no NUMBER,
    write_dt TIMESTAMP DEFAULT current_timestamp NOT NULL,
    comment_lv NUMBER(1) DEFAULT 1 NOT NULL,
    
    CONSTRAINT region_board_comment_comment_no_post_no_pk PRIMARY KEY(comment_no, post_no)
);   

    
CREATE TABLE sale_board_comment (
    comment_no NUMBER,
    post_no NUMBER,
    member_id NUMBER NOT NULL,
    content VARCHAR2(4000) NOT NULL,
    like_cnt NUMBER DEFAULT 0 NOT NULL,
    high_comment_no NUMBER,
    write_dt TIMESTAMP DEFAULT current_timestamp NOT NULL,
    comment_lv NUMBER(1) DEFAULT 1 NOT NULL,
    
    CONSTRAINT sale_board_comment_comment_no_post_no_pk PRIMARY KEY(comment_no, post_no)
);    

-- new sale_board_comment
CREATE TABLE sale_board_comment (
	comment_no	NUMBER GENERATED BY DEFAULT AS IDENTITY	NOT NULL,
	post_no	NUMBER	NOT NULL,
	member_id	NUMBER	NOT NULL,
	content	VARCHAR2(4000)	NOT NULL,
	delete_yn	CHAR(1)	NOT NULL,
	write_dt	TIMESTAMP DEFAULT current_date 	NOT NULL,
	comment_root	NUMBER	NOT NULL,
	comment_step	NUMBER	DEFAULT 0	NOT NULL,
	comment_indent	NUMBER	DEFAULT 0	NOT NULL,

    CONSTRAINT sale_board_comment_comment_no_post_no_pk PRIMARY KEY(comment_no, post_no)
);
ALTER TABLE sale_board_comment ADD secret_yn CHAR(1) DEFAULT 0 NOT NULL;
-- /new sale_board_comment

-- new sale_board_comment_like

CREATE TABLE sale_board_comment_like (
	comment_like_no	NUMBER	GENERATED BY DEFAULT AS IDENTITY NOT NULL,
	post_no	NUMBER	NOT NULL,
	comment_no	NUMBER	NOT NULL,
	member_id NUMBER	NOT NULL
);

ALTER TABLE sale_board_comment_like ADD CONSTRAINT sale_board_comment_like_comment_like_no_pk PRIMARY KEY (comment_like_no);

-- /new sale_board_comment_like


CREATE TABLE region_board_file (
    file_id VARCHAR2(200),
    post_no NUMBER NOT NULL,
    file_name VARCHAR2(200) NOT NULL,
    file_path VARCHAR2(1000) NOT NULL,
    file_size NUMBER NOT NULL,
    create_dt TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
    
    CONSTRAINT region_board_file_file_id_post_no_pk PRIMARY KEY(file_id, post_no)
);


CREATE TABLE sale_board_file (
    file_id VARCHAR2(200),
    post_no NUMBER NOT NULL,
    file_name VARCHAR2(200) NOT NULL,
    file_path VARCHAR2(1000) NOT NULL,
    file_size NUMBER NOT NULL,
    create_dt TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL
);


CREATE TABLE member_keyword (
    keyword VARCHAR2(30),
    member_id NUMBER
);


CREATE TABLE region_board_keyword_not (
    not_no NUMBER,
    not_content VARCHAR2(150) NOT NULL,
    not_dt TIMESTAMP NOT NULL,
    not_read_dt TIMESTAMP,
    post_no NUMBER,
    keyword VARCHAR2(30) NOT NULL,
    member_id NUMBER NOT NULL
); 


CREATE TABLE sale_board_keyword_not (
    not_no NUMBER,
    not_content VARCHAR2(150) NOT NULL,
    not_dt TIMESTAMP NOT NULL,
    not_read_dt TIMESTAMP,
    post_no NUMBER,
    keyword VARCHAR2(30),
    member_id NUMBER
);


CREATE TABLE region_board_act_not (
    not_no NUMBER,
    member_id NUMBER NOT NULL,
    post_no NUMBER,
    not_target_member_id NUMBER NOT NULL,
    not_content VARCHAR2(150) NOT NULL,
    not_type VARCHAR2(15)
        CONSTRAINT region_board_act_not_not_type_ck 
        CHECK (not_type in ('comment', 'comment_comment', 'deal_cpl', 'mate_join', 'mate_cpl')) NOT NULL,
    not_dt TIMESTAMP NOT NULL,
    not_read_dt TIMESTAMP
);


CREATE TABLE sale_board_act_not (
    not_no NUMBER,
    member_id NUMBER NOT NULL,
    post_no NUMBER,
    not_target_member_id NUMBER NOT NULL,
    not_content VARCHAR2(150) NOT NULL,
    not_type VARCHAR2(15)
        CONSTRAINT sale_board_act_not_not_type_ck 
        CHECK (not_type in ('comment', 'comment_comment', 'deal_cpl', 'mate_join', 'mate_cpl')) NOT NULL,
    not_dt TIMESTAMP NOT NULL,
    not_read_dt TIMESTAMP
);


CREATE TABLE region_board_bookmark (
    bookmark_no NUMBER,
    member_id NUMBER NOT NULL,
    post_no NUMBER
);


CREATE TABLE sale_board_bookmark (
    bookmark_no NUMBER,
    member_id NUMBER NOT NULL,
    post_no NUMBER
);


-- �α� 
--�Խ��� 
CREATE TABLE CRAWLING_BOARD(
    POST_NO NUMBER GENERATED BY DEFAULT AS IDENTITY NOT NULL CONSTRAINT CRAWLIING_BOARD_POST_NO_PK PRIMARY KEY,
    MEMBER_ID  NUMBER NOT NULL,
    TITLE VARCHAR(300) NOT NULL,
    CONTENT VARCHAR(4000) NOT NULL,
    VIEWS NUMBER NULL, 
    WRITE_DT TIMESTAMP DEFAULT current_date NOT NULL,
    LIKE_CNT NUMBER NOT NULL,
    HATE_CNT NUMBER NOT NULL);

CREATE TABLE USED_BOARD(
    POST_NO NUMBER NOT NULL CONSTRAINT USED_BOARD_POST_NO_PK 
    PRIMARY KEY,
    MEMBER_ID NUMBER NOT NULL,
    TITLE VARCHAR2(300) NOT NULL,
    CONTENT VARCHAR2(4000) NOT NULL,
    VIEWS NUMBER NOT NULL, 
    WRITE_DT TIMESTAMP NOT NULL,
    REPORT_CNT NUMBER NOT NULL,
    SALE_STATUS NUMBER(1) NOT NULL,
    WRITING_AREA_ID NUMBER NOT NULL,
    PRICE NUMBER NULL);

--�ϸ�ũ
CREATE TABLE CRAWLING_BOARD_BOOKMARK(
    BOOKMARK_NO NUMBER GENERATED BY DEFAULT AS IDENTITY CONSTRAINT CRAWLING_BOARD_BOOKMARK_BOOKMARK_NO_PK 
    PRIMARY KEY,
    MEMBER_ID NUMBER CONSTRAINT CRAWLING_BOARD_BOOKMARK_MEMBER_ID_FK 
    REFERENCES MEMBER(MEMBER_ID) ON DELETE CASCADE,
    POST_NO  NUMBER CONSTRAINT CRAWLING_BOARD_BOOKMARK_POST_NO_FK 
    REFERENCES CRAWLING_BOARD(POST_NO) ON DELETE SET NULL
);
CREATE TABLE USED_BOARD_BOOKMARK(
    BOOKMARK_NO NUMBER CONSTRAINT USED_BOARD_BOOKMARK_BOOKMARK_NO_PK 
    PRIMARY KEY,
    MEMBERS_ID NUMBER CONSTRAINT USED_BOARD_BOOKMARK_MEMBER_ID_FK 
    REFERENCES MEMBER(MEMBER_ID) ON DELETE CASCADE,
    POST_NO  NUMBER CONSTRAINT USED_BOARD_BOOKMARK_POST_NO_FK 
    REFERENCES USED_BOARD(POST_NO) ON DELETE SET NULL
); 

--Ȱ���˸�
CREATE TABLE CRAWLING_BOARD_ACT_NOT(
    NOT_NO NUMBER GENERATED BY DEFAULT AS IDENTITY CONSTRAINT CRAWLING_BOARD_ACT_NOT_NOT_NO_PK PRIMARY KEY,
    MEMBER_ID NUMBER NOT NULL,
    POST_NO NUMBER,
    NOT_TARGET_MEMBER_ID NUMBER NOT NULL,
    NOT_CONTENT VARCHAR2(150) NOT NULL,
    NOT_TYPE VARCHAR2(15) CONSTRAINT CRAWLING_BOARD_ACT_NOT_NOT_TYPE_CK
    CHECK (NOT_TYPE IN('comment', 'comment_comment', 'deal_cpl', 'mate_join', 'mate_cpl')) 
    NOT NULL,
    NOT_DT TIMESTAMP DEFAULT current_date NOT NULL,
    NOT_READ_DT TIMESTAMP);
CREATE TABLE USED_BOARD_ACT_NOT(
    NOT_NO NUMBER CONSTRAINT USED_BOARD_ACT_NOT_NOT_NO_PK PRIMARY KEY,
    MEMBER_ID NUMBER NOT NULL,
    POST_NO NUMBER NOT NULL,
    NOT_TARGET_MEMBER_ID NUMBER NOT NULL,
    NOT_CONTENT VARCHAR2(150) NOT NULL,
    NOT_TYPE VARCHAR2(15) CONSTRAINT USED_BOARD_ACT_NOT_NOT_TYPE_CK
    CHECK (NOT_TYPE IN('comment', 'comment_comment', 'deal_cpl', 'mate_join', 'mate_cpl')) 
    NOT NULL,
    NOT_DT TIMESTAMP NOT NULL,
    NOT_READ_DT TIMESTAMP);
    
--Ű����˸� XX
CREATE TABLE CRAWLING_BOARD_KEYWORD_NOT(
    NOT_NO NUMBER GENERATED BY DEFAULT AS IDENTITY CONSTRAINT CRAWLING_BOARD_KEYWORD_NOT_NOT_NO_PK PRIMARY KEY NOT NULL,
    NOT_CONTENT VARCHAR2(150) NOT NULL,
    NOT_DT TIMESTAMP DEFAULT current_date NOT NULL,
    NOT_READ_DT TIMESTAMP,
    POST_NO NUMBER ,
    KEYWORD VARCHAR2(30) NOT NULL,
    MEMBER_ID NUMBER NOT NULL);
    
CREATE TABLE USED_BOARD_KEYWORD_NOT(
    NOT_NO NUMBER CONSTRAINT USED_BOARD_KEYWORD_NOT_NOT_NO_PK PRIMARY KEY NOT NULL,
    NOT_CONTENT VARCHAR2(150) NOT NULL,
    NOT_DT TIMESTAMP NOT NULL,
    NOT_READ_DT TIMESTAMP,
    POST_NO NUMBER CONSTRAINT USED_BOARD_ACT_NOT_MEMBER_ID_FK
    REFERENCES USED_BOARD(POST_NO) ON DELETE SET NULL,
    KEYWORD VARCHAR2(30) NOT NULL,
    MEMBER_ID NUMBER NOT NULL);

--�ڸ�Ʈ
CREATE TABLE CRAWLING_BOARD_COMMENT (
    COMMENT_NO NUMBER GENERATED BY DEFAULT AS IDENTITY,
    POST_NO NUMBER NOT NULL,
    MEMBER_ID NUMBER NOT NULL,
    CONTENT VARCHAR2(4000) NOT NULL,
    LIKE_CNT NUMBER DEFAULT 0 NOT NULL,
    HIGH_COMMENT_NO NUMBER,
    WRITE_DT TIMESTAMP DEFAULT current_date NOT NULL,
    COMMENT_LV NUMBER(1) DEFAULT 0 NOT NULL);
CREATE TABLE USED_BOARD_COMMENT (
    COMMENT_NO NUMBER,
    POST_NO NUMBER NOT NULL,
    MEMBER_ID NUMBER NOT NULL,
    SECRET_YN CHAR(1) CONSTRAINT USED_BOARD_COMMENT_SECRET_YN_CK 
    CHECK(SECRET_YN IN('Y', 'N')) NOT NULL,    
    CONTENT VARCHAR2(4000) NOT NULL,
    LIKE_CNT NUMBER DEFAULT 0 NOT NULL,
    HIGH_COMMENT_NO NUMBER,
    WRITE_DT TIMESTAMP NOT NULL,
    COMMENT_LV NUMBER(1) DEFAULT 0 NOT NULL);

--FILE
CREATE TABLE CRAWLING_BOARD_FILE (
    FILE_ID VARCHAR2(200),
    POST_NO NUMBER NOT NULL,
    FILE_NAME VARCHAR2(200) NOT NULL,
    FILE_PATH VARCHAR2(1000) NOT NULL,
    FILE_SIZE NUMBER NOT NULL,
    CREATE_DT TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL);    
CREATE TABLE USED_BOARD_FILE (
    FILE_ID VARCHAR2(200),
    POST_NO NUMBER NOT NULL,
    FILE_NAME VARCHAR2(200) NOT NULL,
    FILE_PATH VARCHAR2(1000) NOT NULL,
    FILE_SIZE NUMBER NOT NULL,
    CREATE_DT TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL);






