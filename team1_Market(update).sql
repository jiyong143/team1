drop database if exists market;
create database market;

use market;

DROP TABLE IF EXISTS `member`;

CREATE TABLE `member` (
   `me_id`   			varchar(15)   	NOT NULL primary key,
   `me_pw`   			varchar(200) 	NOT NULL,
   `me_email`   		varchar(30) 	NOT NULL,
   `me_gender`   		varchar(10)   	NOT NULL,
   `me_name`   			varchar(15)   	NOT NULL,
   `me_birth`   		datetime    	NOT NULL,
   `me_phone`   		varchar(13)   	NOT NULL,
   `me_addr`   			varchar(25)   	NOT NULL,
   `me_authority`   		varchar(15)   	NOT NULL default 'user',
   `me_state`   		varchar(20)   	NOT NULL default '이용중',
   `me_manner`   		double   	NOT NULL default 36.5,
   `me_point` 			int 		NOT NULL default 0,
   `me_fi_num` 			int,
   `me_payment`			int		NULL,
   `me_report_count`		int		NOT NULL default 0,
   `me_stop_date`		datetime	NULL
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
   `pr_num`   		int   			NOT NULL primary key auto_increment,
   `pr_mg_num`   	int   			NOT NULL,
   `pr_me_id`   	varchar(15)   	  	NOT NULL,
   `pr_name`   		varchar(30)   		NOT NULL,
   `pr_place`   	varchar(30)   		NOT NULL,
   `pr_content` 	text 			NOT NULL,
   `pr_price`   	int   			NOT NULL,
   `pr_ps_state` 	varchar(20) 		NOT NULL default "판매중",
   `pr_basket`   	int   			NOT NULL default 0,
   `pr_view`   		int   			NOT NULL default 0,
   `pr_date`   		datetime 		NOT NULL default now(),
   `pr_buyId`   	varchar(20)
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
   `re_num`  	 int   		  	NOT NULL primary key auto_increment,
   `re_pr_num`   int   		  	NULL,
   `re_me_id`    varchar(15)   	NOT NULL,
   `re_name`   	 varchar(20)    NOT NULL,
   `re_content`  text 		  	NOT NULL,
   `re_date`   	 dateTime 	  	NOT NULL default now(),
   `re_cr_num`	 int			NULL,
   `re_state`	 varchar(30)    NOT NULL default '신고접수'
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
   `to_tr_num`   int   NOT NULL,
   `to_type` int
);

DROP TABLE IF EXISTS `surport`;


CREATE TABLE `surport` (
   `su_num`   int   NOT NULL primary key auto_increment,
   `su_type`	varchar(15)   NOT NULL,
   `su_upHead`  varchar(15)   NOT NULL,
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

DROP TABLE IF EXISTS `payment_detail`;

CREATE TABLE `payment_detail` (
	`pd_num`	int	NOT NULL primary key auto_increment,
	`pd_oriNum`	varchar(50)	not NULL,
	`pd_price`	int	not NULL,
	`pd_me_id`	varchar(15)	NOT NULL
);

DROP TABLE IF EXISTS `addr`;

CREATE TABLE IF NOT EXISTS `addr` (
SIDO VARCHAR(40) NULL COMMENT '시도명',
SIGUNGU VARCHAR(20) NULL COMMENT '시군구명',
h_dong_nm VARCHAR(20) NULL COMMENT '읍면동명'
);

DROP TABLE IF EXISTS `fixed`;

CREATE TABLE `fixed` (
	`fix_num`	int	NOT NULL primary key auto_increment,
	`fix_me_id`	varchar(15)	NOT NULL,
	`fix_title`	varchar(30)	NOT NULL,
	`fix_content`	text	NOT NULL,
	`fix_date`	dateTime	NOT NULL default now(),
	`fix_view`	int	NOT NULL default 0
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

ALTER TABLE `report` ADD CONSTRAINT `FK_chat_room_TO_report_1` FOREIGN KEY (
	`re_cr_num`
)
REFERENCES `chat_room` (
	`cr_num`
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

ALTER TABLE `fixed` ADD CONSTRAINT `FK_member_TO_fixed_1` FOREIGN KEY (
	`fix_me_id`
)
REFERENCES `member` (
	`me_id`
);
