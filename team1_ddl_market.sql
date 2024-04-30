drop database if exists market;
create database market;

use market;

DROP TABLE IF EXISTS `member`;

CREATE TABLE `member` (
   `me_id`   varchar(15)   NOT NULL primary key,
   `me_pw`   varchar(200) not NULL,
   `me_email`   varchar(30) not   NULL,
   `me_gender`   varchar(10)   not   NULL,
   `me_name`   varchar(15)   not   NULL,
   `me_birth`   Datetime    not NULL,
   `me_phone`   varchar(13)   not   NULL,
   `me_addr`   varchar(25)   not   NULL,
   `me_authority`   varchar(15)   not   NULL default 'user',
   `me_state`   varchar(4)   not   NULL default '이용중',
   `me_manner`   double   not   NULL default 36.5,
   `me_point` int not null default 0,
   `me_fi_num` int
);

DROP TABLE IF EXISTS `topGroup`;

CREATE TABLE `topGroup` (
   `tg_num`   int   NOT NULL primary key auto_increment,
   `tg_title`   varchar(10)   not   NULL
);

DROP TABLE IF EXISTS `midGroup`;

CREATE TABLE `midGroup` (
   `mg_num`   int   NOT NULL primary key auto_increment,
   `mg_tg_num`   int   NOT NULL,
   `mg_title`   varchar(10)   not   NULL
);

DROP TABLE IF EXISTS `product`;

CREATE TABLE `product` (
   `pr_num`   int   NOT NULL primary key auto_increment,
   `pr_mg_num`   int   NOT NULL,
   `pr_me_id`   varchar(15)   NOT NULL,
   `pr_name`   varchar(30)   not   NULL,
   `pr_place`   varchar(30)   not   NULL,
   `pr_content` text not NULL,
   `pr_price`   int   not   NULL,
   `pr_ps_state` varchar(20) NOT NULL default "판매중",
   `pr_basket`   int   not   NULL default 0,
   `pr_view`   int   not   NULL default 0,
   `pr_date`   datetime not NULL default now(),
   `pr_buyId`   varchar(20)
);

DROP TABLE IF EXISTS `file`;

CREATE TABLE `file` (
   `fi_num`   int   NOT NULL primary key auto_increment,
   `fi_ori_name`   varchar(40)   not   NULL,
   `fi_name`   varchar(150)   not   NULL,
   `fi_pr_num`   int   NOT NULL
);

DROP TABLE IF EXISTS `report`;

CREATE TABLE `report` (
   `re_num`   int   NOT NULL primary key auto_increment,
   `re_pr_num`   int   NOT NULL,
   `re_me_id`   varchar(15)   NOT NULL,
   `re_name`   varchar(10)   not   NULL,
   `re_content` text not NULL,
   `re_date`   dateTime not NULL default now(),
   `re_state`   varchar(20)   not   NULL default "신고접수"
);

DROP TABLE IF EXISTS `pick`;

CREATE TABLE `pick` (
   `pi_num`   int   NOT NULL primary key auto_increment,
   `pi_me_id`   varchar(15)   NOT NULL,
   `pi_pr_num`   int   NOT NULL
);

DROP TABLE IF EXISTS `product_state`;

CREATE TABLE `product_state` (
   `ps_state`   varchar(20)   NOT NULL primary key
);

DROP TABLE IF EXISTS `chat_message`;

CREATE TABLE `chat_message` (
   `cm_num`   int   NOT NULL primary key auto_increment,
   `cm_cr_num`   int   NOT NULL,
   `cm_me_id`   varchar(15)   NOT NULL,
   `cm_content` text not NULL,
   `cm_time` dateTime not   NULL default now()
);

DROP TABLE IF EXISTS `chat_room`;

CREATE TABLE `chat_room` (
   `cr_num`   int   NOT NULL primary key auto_increment,
   `cr_pr_num`   int   NOT NULL,
   `cr_me_id`   varchar(15)   NOT NULL
);

DROP TABLE IF EXISTS `chat_state`;

CREATE TABLE `chat_state` (
   `cs_num`   int   NOT NULL primary key auto_increment,
   `cs_cr_num`   int   NOT NULL,
   `cs_me_id`   varchar(15)   NOT NULL,
   `cs_state`   varchar(10)   not   NULL default "이용중"
);

DROP TABLE IF EXISTS `trade_review`;

CREATE TABLE `trade_review` (
   `tr_num`   int   NOT NULL primary key auto_increment,
   `tr_me_id`   varchar(15)   NOT NULL,
   `tr_pr_num`   int   NOT NULL
);

DROP TABLE IF EXISTS `review_type`;

CREATE TABLE `review_type` (
   `rt_type`   varchar(20) primary key NOT NULL,
   `rt_point`   int   not   NULL
);

DROP TABLE IF EXISTS `trade_outcome`;

CREATE TABLE `trade_outcome` (
   `to_num`   int   NOT NULL primary key auto_increment,
   `to_rt_type` varchar(20) NOT NULL,
   `to_tr_num`   int   NOT NULL
);

DROP TABLE IF EXISTS `surport`;

CREATE TABLE `surport` (
   `su_num`   int   NOT NULL primary key auto_increment,
   `su_sm_num`   int   NOT NULL,
   `su_uh_num`   int   NOT NULL,
   `su_me_id`   varchar(15)   NOT NULL,
   `su_title`   varchar(30)   NOT NULL,
   `su_content`   text   NOT NULL,
   `su_date`   dateTime   NOT NULL default now(), 
   `su_view`   int   NOT NULL default 0
);

DROP TABLE IF EXISTS `comment`;

CREATE TABLE `comment` (
	`co_num`	int	NOT NULL primary key auto_increment,
	`co_content`	text	NOT NULL,
	`co_su_num`	int	NOT NULL,
	`co_me_id`	varchar(15)	NOT NULL
);

DROP TABLE IF EXISTS `suport_manage`;

CREATE TABLE `suport_manage` (
   `sm_num`   int   NOT NULL primary key auto_increment,
   `sm_name`   varchar(20)      NOT NULL
);

DROP TABLE IF EXISTS `up_head`;

CREATE TABLE `up_head` (
   `uh_num`   int   NOT NULL primary key auto_increment,
   `uh_name`   varchar(5)   NOT NULL
);

DROP TABLE IF EXISTS `payment_detail`;

CREATE TABLE `payment_detail` (
	`pd_num`	int	NOT NULL primary key auto_increment,
	`pd_oriNum`	varchar(50)	not NULL,
	`pd_price`	int	not NULL,
	`pd_me_id`	varchar(15)	NOT NULL
);

DROP TABLE IF EXISTS `ZIPCODE`;

CREATE TABLE IF NOT EXISTS `ZIPCODE` (
ZIP_NO VARCHAR(5) NULL COMMENT '우편번호',
SIDO VARCHAR(20) NULL COMMENT '시도',
SIDO_ENG VARCHAR(40) NULL COMMENT '시도(영문)',
SIGUNGU VARCHAR(20) NULL COMMENT '시군구',
SIGUNGU_ENG VARCHAR(40) NULL COMMENT '시군구(영문)',
EUPMYUN VARCHAR(20) NULL COMMENT '읍면',
EUPMYUN_ENG VARCHAR(40) NULL COMMENT '읍면(영문)',
DORO_CD VARCHAR(12) NULL COMMENT '도로명코드',
DORO VARCHAR(80) NULL COMMENT '도로명',
DORO_ENG VARCHAR(80) NULL COMMENT '도로명(영문)',
UNDERGROUND_YN CHAR(1) NULL COMMENT '지하여부',
BUILD_NO1 DECIMAL(5,0) NULL COMMENT '건물번호본번',
BUILD_NO2 DECIMAL(5,0) NULL COMMENT '건물번호부번',
BUILD_NO_MANAGE_NO VARCHAR(25) NULL COMMENT '건물관리번호',
DARYANG_NM VARCHAR(40) NULL COMMENT '다량배달처명',
BUILD_NM VARCHAR(200) NULL COMMENT '시군구용건물명',
DONG_CD VARCHAR(10) NULL COMMENT '법정동코드',
DONG_NM VARCHAR(20) NULL COMMENT '법정동명',
RI VARCHAR(20) NULL COMMENT '리명',
H_DONG_NM VARCHAR(40) NULL COMMENT '행정동명',
SAN_YN VARCHAR(1) NULL COMMENT '산여부',
ZIBUN1 DECIMAL(4,0) NULL COMMENT '지번본번',
EUPMYUN_DONG_SN VARCHAR(2) NULL COMMENT '읍면동일련번호',
ZIBUN2 DECIMAL(4,0) NULL COMMENT '지번부번' ,
ZIP_NO_OLD VARCHAR(4) NULL COMMENT '구우편번호' ,
ZIP_SN VARCHAR(2) NULL COMMENT '우편일련번호'
);

ALTER TABLE `midGroup` ADD CONSTRAINT `FK_topGroup_TO_midGroup_1` FOREIGN KEY (
   `mg_tg_num`
)
REFERENCES `topGroup` (
   `tg_num`
);

ALTER TABLE `product` ADD CONSTRAINT `FK_midGroup_TO_product_1` FOREIGN KEY (
   `pr_mg_num`
)
REFERENCES `midGroup` (
   `mg_num`
);

ALTER TABLE `product` ADD CONSTRAINT `FK_member_TO_product_1` FOREIGN KEY (
   `pr_me_id`
)
REFERENCES `member` (
   `me_id`
);

ALTER TABLE `product` ADD CONSTRAINT `FK_product_state_TO_product_1` FOREIGN KEY (
   `pr_ps_state`
)
REFERENCES `product_state` (
   `ps_state`
);

ALTER TABLE `file` ADD CONSTRAINT `FK_product_TO_file_1` FOREIGN KEY (
   `fi_pr_num`
)
REFERENCES `product` (
   `pr_num`
);

ALTER TABLE `report` ADD CONSTRAINT `FK_product_TO_report_1` FOREIGN KEY (
   `re_pr_num`
)
REFERENCES `product` (
   `pr_num`
);

ALTER TABLE `report` ADD CONSTRAINT `FK_member_TO_report_1` FOREIGN KEY (
   `re_me_id`
)
REFERENCES `member` (
   `me_id`
);

ALTER TABLE `pick` ADD CONSTRAINT `FK_member_TO_pick_1` FOREIGN KEY (
   `pi_me_id`
)
REFERENCES `member` (
   `me_id`
);

ALTER TABLE `pick` ADD CONSTRAINT `FK_product_TO_pick_1` FOREIGN KEY (
   `pi_pr_num`
)
REFERENCES `product` (
   `pr_num`
);

ALTER TABLE `chat_message` ADD CONSTRAINT `FK_chat_room_TO_chat_message_1` FOREIGN KEY (
   `cm_cr_num`
)
REFERENCES `chat_room` (
   `cr_num`
);

ALTER TABLE `chat_message` ADD CONSTRAINT `FK_member_TO_chat_message_1` FOREIGN KEY (
   `cm_me_id`
)
REFERENCES `member` (
   `me_id`
);

ALTER TABLE `chat_room` ADD CONSTRAINT `FK_product_TO_chat_room_1` FOREIGN KEY (
   `cr_pr_num`
)
REFERENCES `product` (
   `pr_num`
);

ALTER TABLE `chat_room` ADD CONSTRAINT `FK_member_TO_chat_room_1` FOREIGN KEY (
   `cr_me_id`
)
REFERENCES `member` (
   `me_id`
);

ALTER TABLE `chat_state` ADD CONSTRAINT `FK_chat_room_TO_chat_state_1` FOREIGN KEY (
   `cs_cr_num`
)
REFERENCES `chat_room` (
   `cr_num`
);

ALTER TABLE `chat_state` ADD CONSTRAINT `FK_member_TO_chat_state_1` FOREIGN KEY (
   `cs_me_id`
)
REFERENCES `member` (
   `me_id`
);

ALTER TABLE `trade_review` ADD CONSTRAINT `FK_member_TO_trade_review_1` FOREIGN KEY (
   `tr_me_id`
)
REFERENCES `member` (
   `me_id`
);

ALTER TABLE `trade_review` ADD CONSTRAINT `FK_product_TO_trade_review_1` FOREIGN KEY (
   `tr_pr_num`
)
REFERENCES `product` (
   `pr_num`
);

ALTER TABLE `trade_outcome` ADD CONSTRAINT `FK_review_type_TO_trade_outcome_1` FOREIGN KEY (
   `to_rt_type`
)
REFERENCES `review_type` (
   `rt_type`
);

ALTER TABLE `trade_outcome` ADD CONSTRAINT `FK_trade_review_TO_trade_outcome_1` FOREIGN KEY (
   `to_tr_num`
)
REFERENCES `trade_review` (
   `tr_num`
);

ALTER TABLE member ADD CONSTRAINT `FK_file_TO_member_1` FOREIGN KEY (
   `me_fi_num`
)
REFERENCES file (
   `fi_num`
);

ALTER TABLE `surport` ADD CONSTRAINT `FK_suport_manage_TO_surport_1` FOREIGN KEY (
   `su_sm_num`
)
REFERENCES `suport_manage` (
   `sm_num`
);

ALTER TABLE `surport` ADD CONSTRAINT `FK_up_head_TO_surport_1` FOREIGN KEY (
   `su_uh_num`
)
REFERENCES `up_head` (
   `uh_num`
);

ALTER TABLE `surport` ADD CONSTRAINT `FK_member_TO_surport_1` FOREIGN KEY (
   `su_me_id`
)
REFERENCES `member` (
   `me_id`
);

ALTER TABLE `comment` ADD CONSTRAINT `FK_surport_TO_comment_1` FOREIGN KEY (
	`co_su_num`
)
REFERENCES `surport` (
	`su_num`
);

ALTER TABLE `comment` ADD CONSTRAINT `FK_member_TO_comment_1` FOREIGN KEY (
	`co_me_id`
)
REFERENCES `member` (
	`me_id`
);

ALTER TABLE `payment_detail` ADD CONSTRAINT `FK_member_TO_payment_detail_1` FOREIGN KEY (
	`pd_me_id`
)
REFERENCES `member` (
	`me_id`
);
