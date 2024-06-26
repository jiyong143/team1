use market;

insert into `topgroup` values
(1,"옷"),
(2,"가전제품"); 

insert into `midgroup` values
(1,1,"모자"),
(2,1,"바지"),
(3,2,"세탁기"),
(4,2,"냉장고");

insert into `member`(me_id,me_pw,me_email,me_gender,me_name,me_birth,me_phone,me_addr) values
("cjy0896","michael@0896","dkdlel404@naver.com","남성","지용","1997-03-13","010-8829-0896","관악구 봉천동");

insert into `product_state`values
("판매중"),
("예약중"),
("판매완료"),
("삭제중");

insert into `product`(pr_mg_num, pr_me_id, pr_name, pr_place, pr_content, pr_price)values
(1,"cjy0896","모자 팔아요","서울특별시 강남구 역삼동","모자 상태 좋아요 싸게 팝니다",10000),
(3,"cjy0896","세탁기 팔아요","서울특별시 동대문구 전농동","세탁기 상태 좋아요 싸게 팝니다",200000),
(4,"cjy0896","냉장고 팔아요","서울특별시 관악구 봉천동","냉장고 상태 좋아요 싸게 팝니다",300000),
(1,"cjy0896","아디다스 모자 팔아요","서울특별시 관악구 봉천동","냉장고 상태 좋아요 싸게 팝니다",15000),
(2,"cjy0896","멋있는 바지 팔아요","서울특별시 동대문구 전농동","냉장고 상태 좋아요 싸게 팝니다",10000),
(3,"cjy0896","삼성 세탁기 팔아요","서울특별시 강남구 역삼동","냉장고 상태 좋아요 싸게 팝니다",300000),
(3,"cjy0896","세탁기 싸게 팔아요","서울특별시 강남구 강남동","유행하는 세탁기에요",400000);

insert into `suport_manage`(sm_name) value ("공지사항");
insert into `suport_manage`(sm_name) value ("문의사항");

insert into `up_head`(uh_name) value ("필독");
insert into `up_head`(uh_name) value ("공지");
insert into `up_head`(uh_name) value ("문의");

insert into `surport` (su_sm_num, su_uh_num, su_me_id, su_title, su_content)
values (2, 3, "cjy0896", "문의사항 테스트", "테스트 입니다");

insert into `surport` (su_sm_num, su_uh_num, su_me_id, su_title, su_content)
values (1, 2, "cjy0896", "문의사항 테스트", "테스트 입니다");



show global variables like 'local_infile';
set global local_infile=true;
load data local infile "D:\address/addr.txt" into table addr character set 'utf8' fields terminated by '	' ignore 1 lines;

/*
show global variables like 'local_infile';
set global local_infile=true;

SELECT * FROM surport;

insert into comment (co_su_num, co_me_id, co_content)
values (3, "admin1", "댓글 테스트 입니다");

insert into comment (co_su_num, co_me_id, co_content)
values (5, "admin1", "댓글 테스트 입니다");

insert into comment (co_su_num, co_me_id, co_content)
values (3, "admin1", "댓글 테스트 입니다");

insert into comment (co_su_num, co_me_id, co_content)
values (7, "admin1", "댓글 테스트 입니다");

insert into comment (co_su_num, co_me_id, co_content)
values (10, "admin1", "댓글 테스트 입니다");

insert into comment (co_su_num, co_me_id, co_content)
values (8, "admin1", "댓글 테스트 입니다");

select * from comment;
values (2, 3, "cjy0896", "문의사항 테스트", "테스트 입니다");

insert into `surport` (su_sm_num, su_uh_num, su_me_id, su_title, su_content)
values (1, 2, "cjy0896", "데이터베이스 테스트", "테스트 입니다");
load data local infile "D:\qqq.txt" into table addr character set 'utf8' fields terminated by '	' ignore 1 lines;
*/

ALTER TABLE `market`.`chat_state` 
DROP FOREIGN KEY `FK_chat_room_TO_chat_state_1`;
ALTER TABLE `market`.`chat_state` 
ADD CONSTRAINT `FK_chat_room_TO_chat_state_1`
  FOREIGN KEY (`cs_cr_num`)
  REFERENCES `market`.`chat_room` (`cr_num`)
  ON DELETE CASCADE
  ON UPDATE CASCADE;
  
  ALTER TABLE `market`.`chat_room` 
DROP FOREIGN KEY `FK_product_TO_chat_room_1`;
ALTER TABLE `market`.`chat_room` 
ADD CONSTRAINT `FK_product_TO_chat_room_1`
  FOREIGN KEY (`cr_pr_num`)
  REFERENCES `market`.`product` (`pr_num`)
  ON DELETE CASCADE
  ON UPDATE CASCADE;
  
ALTER TABLE `market`.`chat_message` 
DROP FOREIGN KEY `FK_chat_room_TO_chat_message_1`;
ALTER TABLE `market`.`chat_message` 
ADD CONSTRAINT `FK_chat_room_TO_chat_message_1`
  FOREIGN KEY (`cm_cr_num`)
  REFERENCES `market`.`chat_room` (`cr_num`)
  ON DELETE CASCADE
  ON UPDATE CASCADE;


insert into `report` (re_pr_num, re_me_id, re_name, re_content, re_date)
values (1, 'asd123', '비매너 사용자예요.', '테스트 입니다', now());
insert into `report` (re_pr_num, re_me_id, re_name, re_content, re_date)
values (4, 'asd123', '거래 중 분쟁이 발생했어요.', '테스트 입니다', now());
insert into `report` (re_pr_num, re_me_id, re_name, re_content, re_date)
values (2, 'asd123', '거래 중 분쟁이 발생했어요.', '테스트 테스트', now());

insert into `report` (re_pr_num, re_me_id, re_name, re_content)
values (2, 'asd123', '거래 중 분쟁이 발생했어요.', '테스트 테스트 테스트');
insert into `report` (re_pr_num, re_me_id, re_name, re_content)
values (2, 'asd123', '거래 중 분쟁이 발생했어요.', '테스트 테스트 테스트');
insert into `report` (re_pr_num, re_me_id, re_name, re_content)
values (2, 'asd123', '거래 중 분쟁이 발생했어요.', '테스트 테스트 테스트');

INSERT INTO review_type VALUES ('default',0),('거래와 상관없는 대화',-1),('느린거래',-1),('상품이 설명과 동일해요',1),('시간을 지키지 않았어요',-1),('응답시간이 빨라요',1),('친절해요',1);