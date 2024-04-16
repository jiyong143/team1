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
("판매완료");

insert into `product`(pr_mg_num, pr_me_id, pr_name, pr_place, pr_content, pr_price)values
(1,"cjy0896","모자 팔아요","강남구 역삼동","모자 상태 좋아요 싸게 팝니다",10000),
(2,"cjy0896","바지 팔아요","군포시 산본동","바지 상태 좋아요 싸게 팝니다",15000),
(3,"cjy0896","세탁기 팔아요","동대문구 전농동","세탁기 상태 좋아요 싸게 팝니다",200000),
(4,"cjy0896","냉장고 팔아요","관악구 봉천동","냉장고 상태 좋아요 싸게 팝니다",300000),
(1,"cjy0896","아디다스 모자 팔아요","관악구 봉천동","냉장고 상태 좋아요 싸게 팝니다",15000),
(2,"cjy0896","멋있는 바지 팔아요","동대문구 전농동","냉장고 상태 좋아요 싸게 팝니다",10000),
(3,"cjy0896","삼성 세탁기 팔아요","강남구 역삼동","냉장고 상태 좋아요 싸게 팝니다",300000),
(4,"cjy0896","삼성 냉장고 팔아요","군포시 산본동","냉장고 상태 좋아요 싸게 팝니다",250000),
(1,"cjy0896","나이키 모자 팔아요","수원시 팔달구","얼마 안쓴거에요",12000),
(2,"cjy0896","이쁜 바지 사세요","수원시 권선구","큭별히 싸게 팝니다",30000),
(3,"cjy0896","세탁기 싸게 팔아요","강남구 강남동","유행하는 세탁기에요",400000),
(4,"cjy0896","냄장고 싸게 팔아요","군포시 산본동","냉장고 엄청 차가워요",350000);

select * from topgroup;
select * from midgroup;
select * from product;

select product.*, mg_title 
as pr_mg_name, tg_title as pr_tg_name 
	from product 
join midgroup 
	on pr_mg_num = mg_num 
join topgroup on mg_tg_num = tg_num;

insert into `surport_category`(sc_name) value ("사기조회"), ("이용정책");
select * from surport_category;

insert into `suport_manage`(sm_sc_num, sm_name) value (1,"문의사항");
insert into `suport_manage`(sm_sc_num, sm_name) value (2,"사기조항");
insert into `suport_manage`(sm_sc_num, sm_name) value (2,"신고조항");
insert into `suport_manage`(sm_sc_num, sm_name) value (2,"거래조항");
select * from suport_manage;

insert into `up_head`(uh_name) value ("필독");
insert into `up_head`(uh_name) value ("공지");
insert into `up_head`(uh_name) value ("문의");
insert into `up_head`(uh_name) value ("알리기");
select * from up_head;

select * from member;

insert into `surport` (su_sm_num, su_uh_num, su_me_id, su_title, su_content)
values (1, 4, "qwe123", "문의사항 테스트", "테스트 입니다");

insert into `surport` (su_sm_num, su_uh_num, su_me_id, su_title, su_content)
values (1, 4, "qwe123", "문의글 테스트 입니다", "테스트 중");

insert into `surport` (su_sm_num, su_me_id, su_title, su_content)
values (1, 3, "qwe123", "테스트 입니다", "테스트 중");

select * from surport;

