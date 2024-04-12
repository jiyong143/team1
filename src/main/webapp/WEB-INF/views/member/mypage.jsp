<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
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
						<h2>유저 아이디 떠야함</h2>
						<!-- 프로필 이미지 -->
						<div class="flex items-center translate-x-3 lg:hidden">
							<img alt="" src="">
						</div>
						
					</div>
						
				</div>
				<!-- 신뢰지수(온도) -->
				<span class="font-medium text-base">신뢰지수</span>
				<div class="progress mt-3">
				  <div class="progress-bar" style="width:36.5%">36.5</div>
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
								<td style="text-align: center;">10</td><!-- 거래횟수 -->
								<td style="text-align: center;">3</td><!-- 거래후기갯수 -->
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
					총0개(개시글 수)
					<ul class="float-right" style="width:30%">
						<li><button class="float-left">최신순</button></li>
						<li><button class="float-left">낮은가격순</button></li>
						<li><button class="float-left">높은가격순</button></li>
					</ul>
				</div>
				<div class="mt-3"> <!-- 내 판매글 출력 -->
					
				</div>
			</div>
			<p class="py-12 text-center d-none">선택된 조건에 해당하는 상품이 없습니다.</p>
		</div>
	</div>
</body>
<script type="text/javascript">

	$(".list-group-item").click(function() {
		$(".list-group-item").removeClass("bg-info");
	})

	$("#all").click(function() {
		$("#all").addClass("bg-info");
	})
	
	$("#sale").click(function() {
		$("#sale").addClass("bg-info");
	})
	
	$("#reservation").click(function() {
		$("#reservation").addClass("bg-info");
	})
	
	$("#saleCompleted").click(function() {
		$("#saleCompleted").addClass("bg-info");
	})
	
</script>
</html>