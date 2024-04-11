<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style type="text/css">
element.style {
}
.px-0 {
    padding-left: 0;
    padding-right: 0;
}
.basis-\[calc\(100\%-180px\)\] {
    flex-basis: calc(100% - 180px);
}
.flex-grow {
    flex-grow: 1;
}
.max-w-\[1024px\] {
    max-width: 1024px;
}
.box-content {
    box-sizing: content-box;
}
.mx-auto {
    margin-left: auto;
    margin-right: auto;
}
*, :after, :before {
    box-sizing: border-box;
    border: 0 solid #f9f9f9;
}
user agent stylesheet
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
</style>
</head>
<body>
	<h1>마이페이지 테스트</h1>

	<div
		class="mx-auto box-content max-w-[1024px] min-[1600px]:max-w-[1280px] basis-[calc(100%-180px)] flex-grow px-0 md:px-0 2xl:px-0">
		<div class="block mt-8 lg:mt-[72px] mb-5 lg:mb-0">
			<div
				class="relative w-full h-full col-span-2 text-black grid grid-cols-1 gap-y-4 gap-x-0 lg:grid-cols-2 lg:gap-x-8 lg:gap-y-6 lg:min-w-[800px]">
				<div class="flex flex-col space-y-2 justify-start">
					<div class="flex items-center">
						<div class="w-full">
							<div class="w-full lg:flex lg:items-center">
								<h2
									class="mr-3 text-[22px] lg:text-[28px] leading-[39px] font-semibold cursor-pointer inline-block lg:block">유저 아이디 떠야함</h2>
								<div
									class="min-[480px]:relative flex space-x-[6px] mt-1 text-[#787E89] text-[12px] mb-[1px] flex-auto"></div>
							</div>
						</div>
						<!-- 프로필 이미지 -->
						<div class="flex items-center translate-x-3 lg:hidden">
							<img alt="profile-image" src="" width="60" height="60"
								decoding="async" data-nimg="1"
								class="rounded-full w-[48px] h-[48px] lg:w-[60px] lg:h-[60px] hidden"
								loading="lazy" style="color: transparent"> <img
								alt="profile-image"
								src="https://img2.joongna.com/common/Profile/Default/profile_m.png"
								width="60" height="60" decoding="async" data-nimg="1"
								class="rounded-full w-[48px] h-[48px] lg:w-[60px] lg:h-[60px] box-content border-4 border-white -translate-x-3"
								loading="lazy" style="color: transparent">
						</div>
						
					</div>
						
				</div>
				<!-- 신뢰지수(온도) -->
				<span class="font-medium text-base">신뢰지수</span>
				
				<div
					class="relative flex justify-evenly w-full border border-gray-300 rounded-lg pl-[8px] pr-[15px] py-4 lg:py-6">
					<ul
						class="flex justify-between items-center text-center text-jnGray-600 w-full">
						<li>
							<dt class="justify-center mt-0">안전거래</dt>
						</li>
						<li class="cursor-pointer">
							<dt class="justify-center mt-0">거래후기</dt>
						</li>
					</ul>
				</div>
			</div>
		</div>
		<!--$-->
		<div class="px-0 mt-8 lg:mt-[60px]">
			<div class="flex-col mb-4 lg:mb-5">
				<h3 class="text-lg font-bold md:text-[22px] text-jnBlack">내 상품</h3>
				<ul class="list-group list-group-horizontal">
					<li class="list-group-item w-25">전체</li>
					<li class="list-group-item w-25 ">판매중</li>
					<li class="list-group-item w-25 ">예약중</li>
					<li class="list-group-item w-25 ">판매완료</li>
				</ul>
				<div class="flex flex-wrap items-center justify-between">
					<div
						class="flex-shrink-0 mb-1 text-sm text-body md:text-base pe-4 md:me-6 lg:block">
						총0개
					</div>
					<ul class="flex space-x-3">
						<li>
							<button class="text-sm font-medium text-[#141313]">최신순</button>
						</li>
						<li><span
							class="inline-block mb-0 w-[1px] h-[10px] border border-[#DADEE5]"></span></li>
						<li><button class="text-sm font-medium text-[#787E89]">낮은가격순</button>
						</li>
						<li><span
							class="inline-block mb-0 w-[1px] h-[10px] border border-[#DADEE5]"></span></li>
						<li><button class="text-sm font-medium text-[#787E89]">높은가격순</button></li>
					</ul>
				</div>
			</div>
			<p class="py-12 text-center">선택된 조건에 해당하는 상품이 없습니다.</p>
		</div>
	</div>
</body>
</html>