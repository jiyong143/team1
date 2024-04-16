<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style type="text/css">
.px-0 {
    padding-left: 0;
    padding-right: 0;
}
.max-w-\[1024px\] {
    max-width: 1024px;
}
*, :after, :before {
    box-sizing: border-box;
    border: 0 solid #f9f9f9;
}

div {
    display: block;
    unicode-bidi: isolate;
}

body, html {
    font-family: Pretendard Variable, sans-serif;
    --tw-text-opacity: 1;
    color: rgb(90 90 90 / var(--tw-text-opacity));
    -webkit-font-smoothing: antialiased;
    -moz-osx-font-smoothing: grayscale;
}

body {
    margin: 0;
    line-height: inherit;
}

li {
	list-style:none;
}
</style>
</head>
<body>
	<div
		class="mt-3 mx-auto box-content max-w-[1024px] min-[1600px]:max-w-[1280px] basis-[calc(100%-180px)] flex-grow px-0 md:px-0 2xl:px-0">
		<div class="block mt-8 lg:mt-[72px] mb-5 lg:mb-0">
			<div
				class="relative w-full h-full col-span-2 text-black grid grid-cols-1 gap-y-4 gap-x-0 lg:grid-cols-2 lg:gap-x-8 lg:gap-y-6 lg:min-w-[800px]">
				<div class="flex flex-col space-y-2 justify-start">
					<div class="flex items-center">
						<h2>${user.me_id}</h2>
						<!-- 프로필 이미지 -->
						<div class="flex items-center translate-x-3 lg:hidden">
							<img alt="" src="">
						</div>
						
					</div>
						
				</div>
				<!-- 신뢰지수(온도) -->
				<span class="font-medium text-base">신뢰지수</span>
				<div class="progress mt-3">
				  <div class="progress-bar" style="width:${user.me_manner}%">${user.me_manner}</div>
				</div>		
				<div class="mt-3 relative flex justify-evenly border border-gray-300 rounded-lg py-4 lg:py-6">
					<table class="w-100">
						<thead>
							<tr style="width:auto">
								<td style="text-align: center;">안전거래</td>
								<td style="text-align: center;">거래후기</td>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td style="text-align: center;"><a href="#">${tradeNum}</a></td><!-- 거래횟수 -->
								<td style="text-align: center;"><a href="#">${reviewNum}</a></td><!-- 거래후기갯수 -->
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</div>
		<!--$-->
		<div class="px-0 mt-8 lg:mt-[60px]">
			<div class="flex-col mb-4 lg:mb-5">
				<h3 class="text-lg font-bold md:text-[22px] text-jnBlack">내 상품</h3>
				<ul style="cursor:pointer;" class="list-group list-group-horizontal">
					<li id="all" class="list-group-item w-25 all" value="all">전체</li>
					<li id="sale" class="list-group-item w-25" value="sale">판매중</li>
					<li id="reservation" class="list-group-item w-25" value="reservation">예약중</li>
					<li id="saleCompleted" class="list-group-item w-25" value="saleCompleted">판매완료</li>
				</ul>
				<div class="mt-3">
					<p class="list-size"></p>
					<ul class="float-right" style="width:30%">
						<li><button class="float-left">최신순</button></li>
						<li><button class="float-left">낮은가격순</button></li>
						<li><button class="float-left">높은가격순</button></li>
					</ul>
				</div>
				<div class="mt-3"> <!-- 내 판매글 출력 -->
					<table class="table table-hover">
						<thead>
							<tr>
								<th>번호</th>
								<th>대분류</th>
								<th>중분류</th>
								<th>제목</th>
								<th>작성자</th>
								<th>찜수</th>
								<th>가격</th>
								<th>거래 희망 장소</th>
								<th>작성일</th>
								<th>조회수</th>
								<th>판매상태</th>
							</tr>
						</thead>
						<tbody class="addPro">
							<tr>
								<td>${pro.pr_num }</td>
								<td>${pro.pr_tg_name }</td>
								<td>${pro.pr_mg_name }</td>
								<td>
									<a href="<c:url value="/post/detail?pNum=${pro.pr_num }"/>">${pro.pr_name}</a>
								</td>
								<td>${pro.pr_me_id }</td>
								<td>${pro.pr_basket }</td>
								<td>${pro.pr_price }</td>
								<td>${pro.pr_place }</td>
								<td>${pro.pr_date }</td>
								<td>${pro.pr_view }</td>
								<td>${pro.pr_ps_state }</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
			<p class="py-12 text-center d-none">선택된 조건에 해당하는 상품이 없습니다.</p>
		</div>
	</div>
</body>
<script type="text/javascript">
	$(function(){
		$("#all").click();
	});

	$(".list-group-item").click(function() {
		$(".list-group-item").removeClass("bg-info");
		
	})
	
	$("#all").click(function() {
		$("#all").addClass("bg-info");
		clickAll("all");
	})
	
	$("#sale").click(function() {
		$("#sale").addClass("bg-info");
		clickAll("sale");
	})
	
	$("#reservation").click(function() {
		$("#reservation").addClass("bg-info");
		clickAll("reservation");
	})
	
	$("#saleCompleted").click(function() {
		$("#saleCompleted").addClass("bg-info");
		clickAll("saleCompleted");
	})

	function clickAll(str1) {
		let clickData;
		let obj = { clickData : str1 };
		$.ajax({
			async : false,
			url : '<c:url value="/member/mypage/all"/>', 
			type : 'get',
			data : obj,
			dataType : "json",
			success : function (data){
				addMethod(data.list);
			}, 
			error : function(jqXHR, textStatus, errorThrown){
	
			}
		});
		return clickData;
	}

function addMethod(list) {
	addListSize(list);
	let str='';
	for(item of list) {
		str += 
			`
			<tr>
				<td>\${item.pr_num }</td>
				<td>\${item.tg_title }</td>
				<td>\${item.mg_title }</td>
				<td>
					<a href="<c:url value="/post/detail?pNum= \${item.pr_num } "/>"> \${item.pr_name} </a>
				</td>
				<td>\${item.pr_me_id }</td>
				<td>\${item.pr_basket }</td>
				<td>\${item.pr_price }</td>
				<td>\${item.pr_place }</td>
				<td>\${item.pr_date2 }</td>
				<td>\${item.pr_view }</td>
				<td>\${item.pr_ps_state }</td>	
			</tr>
			`
	}
	$(".addPro").html(str);
}

function addListSize(list) {
	$(".list-size").empty();
	let str = "";
	str += `총 \${list[0].listSize}개`;
	$(".list-size").html(str);
}
	
	
</script>
</html>