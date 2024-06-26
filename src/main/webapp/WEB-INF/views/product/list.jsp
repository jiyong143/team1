<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
<style>
.container {
	overflow: auto;
}

.xl\:h-24 {
	height: 6rem;
}

@media ( min-width : 1024px) .lg\:px-8 {
	padding-left
	
	 
	
	:
	
	 
	
	2rem
	
	 
	
	;
	padding-right
	
	 
	
	:
	
	 
	
	2rem
	
	
	;
}

@media ( min-width : 1024px) .lg\:h-20 {
	height
	
	 
	
	:
	
	
	5rem
	
	
	;
}

.px-0 {
	padding-left: 0;
	padding-right: 0;
}

.justify-between {
	justify-content: space-between;
}

.items-center {
	align-items: center;
}

.max-w-\[1024px\] {
	max-width: 1024px;
}

.h-full {
	height: 100%;
}

.flex {
	display: flex;
}

.box-content {
	box-sizing: content-box;
}

.mx-auto {
	margin-left: auto;
	margin-right: auto;
}

.relative {
	position: relative;
}

@media ( min-width : 1280px) .xl\:h-24 {
	height
	
	 
	
	:
	
	
	6rem
	
	
	;
}

@media ( min-width : 1024px) .lg\:px-8 {
	padding-left
	
	 
	
	:
	
	 
	
	2rem
	
	
	;
	padding-right
	
	 
	
	:
	
	 
	
	2rem
	
	
	;
}

@media ( min-width : 1024px) .lg\:h-20 {
	height
	
	 
	
	:
	
	 
	
	5rem
	
	
	;
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

.text-gray-700 { -
	-tw-text-opacity: 1;
	color: rgb(41, 41, 41/ var( - -tw-text-opacity));
}

.bg-white { -
	-tw-bg-opacity: 1;
	background-color: rgb(255, 255, 255/ var( - -tw-bg-opacity));
}

.border-jnGray-300 { -
	-tw-border-opacity: 1;
	border-color: rgb(218, 222, 229/ var( - -tw-border-opacity));
}

body, html {
	font-family: Pretendard Variable, sans-serif; -
	-tw-text-opacity: 1;
	color: rgb(90, 90, 90/ var( - -tw-text-opacity));
	-webkit-font-smoothing: antialiased;
	-moz-osx-font-smoothing: grayscale;
}

body {
	margin: 0;
	line-height: inherit;
}

html {
	-webkit-text-size-adjust: 100%;
	-moz-tab-size: 4;
	-o-tab-size: 4;
	tab-size: 4;
	font-family: ui-sans-serif, system-ui, -apple-system, BlinkMacSystemFont,
		Segoe UI, Roboto, Helvetica Neue, Arial, Noto Sans, sans-serif,
		Apple Color Emoji, Segoe UI Emoji, Segoe UI Symbol, Noto Color Emoji;
	font-feature-settings: normal;
}

.before\:bg-\[\#F1F1F1\]:before {
	content: var(- -tw-content); -
	-tw-bg-opacity: 1;
	background-color: rgb(241, 241, 241/ var( - -tw-bg-opacity));
}

.before\:w-screen:before {
	content: var(- -tw-content);
	width: 100vw;
}

.before\:bottom-0:before {
	content: var(- -tw-content);
	bottom: 0;
}

.before\:absolute:before {
	content: var(- -tw-content);
	position: absolute;
}

*, :after, :before {
	box-sizing: border-box;
	border: 0 solid #f9f9f9;
}

*, :after, :before {
	box-sizing: border-box;
	border: 0 solid #f9f9f9;
}

:not(.scrollbar-show)::-webkit-scrollbar {
	display: none;
}

.relative {
	position: relative;
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

.bg-white { -
	-tw-bg-opacity: 1;
	background-color: rgb(255, 255, 255/ var( - -tw-bg-opacity));
}

body, html {
	font-family: Pretendard Variable, sans-serif; -
	-tw-text-opacity: 1;
	color: rgb(90, 90, 90/ var( - -tw-text-opacity));
	-webkit-font-smoothing: antialiased;
	-moz-osx-font-smoothing: grayscale;
}

html {
	-webkit-tap-highlight-color: transparent;
}

html {
	-webkit-text-size-adjust: 100%;
	-moz-tab-size: 4;
	-o-tab-size: 4;
	tab-size: 4;
	font-family: ui-sans-serif, system-ui, -apple-system, BlinkMacSystemFont,
		Segoe UI, Roboto, Helvetica Neue, Arial, Noto Sans, sans-serif,
		Apple Color Emoji, Segoe UI Emoji, Segoe UI Symbol, Noto Color Emoji;
	font-feature-settings: normal;
}

*, :after, :before {
	box-sizing: border-box;
	border: 0 solid #f9f9f9;
}

:after, :before { -
	-tw-content: "";
}

*, :after, :before {
	box-sizing: border-box;
	border: 0 solid #f9f9f9;
}

:not(.scrollbar-show)::-webkit-scrollbar {
	display: none;
}

.container {
	max-width: 1024px;
	margin: auto;
	padding: 0 20px;
}

.table-container {
	margin-top: 20px;
	overflow-x: auto;
}

table {
	width: 100%;
	border-collapse: collapse;
	border: 1px solid #ccc;
	margin-top: 20px;
}

th, td {
	padding: 10px;
	border: 1px solid #ccc;
	text-align: center;
}

th {
	background-color: #f2f2f2;
}

h5 {
	text-align: center;
	margin-bottom: 20px;
}

.product-container {
	width: 20%; /* 5개의 상품을 한 줄에 배치하기 위해 20%로 설정 */
	float: left; /* 왼쪽 정렬 */
	box-sizing: border-box; /* padding과 border가 요소의 크기에 포함되도록 설정 */
	padding: 10px; /* 각 상품 컨테이너의 안쪽 여백 설정 */
}

.product-box {
	width: 200px; /* 원하는 너비로 설정 */
	height: 200px; /* 원하는 높이로 설정 */
	border: 5px solid white; /* 테두리 설정 */
}

.product-image img {
	display: block; /* 선택 사항: 블록 요소로 표시 */
	width: 200px; /* 원하는 너비로 설정 */
	height: 200px; /* 원하는 높이로 설정 */
	transition: transform 0.5s ease; /* 이미지 변환에 애니메이션 효과 추가 */
}

/* 호버 시 이미지 확대 효과 */
.product-image:hover img {
	transform: scale(1.2); /* 이미지 확대 */
}

.product-image {
	width: 200px; /* 원하는 너비로 설정 */
	height: 200px; /* 원하는 높이로 설정 */
	overflow: hidden; /* 이미지가 div 밖으로 넘치지 않도록 설정 */
	border: 5px solid white; /* 선택 사항: 이미지 테두리 */
	border-radius: 15px;
}

.static {
	text-align: left;
	font-size: 20px;
	font-weight: bold;
}

/* 제품 가격 정보 컨테이너 스타일 */
.product-price-container {
	background: rgb(247 249 250);
	border-radius: 8px;
	padding: 20px;
}

/* 제품 가격 제목 스타일 */
.product-price-title {
	font-size: 20px;
	font-weight: bold;
	color: #333333;
	margin-bottom: 10px;
}

/* 제품 가격 스타일 */
.product-price {
	font-size: 24px;
	font-weight: bold;
	color: #333333;
}

/* 가격 정보 항목 간격 조정 */
.product-price-item {
	height : 100px;	
    background-color: #D1D1D1;
    width: 100%;
    bottom: 0;
    font-size: 10px;
    width: 100%;
}


/* 각 span 태그 사이의 간격을 조정 */
.product-price-item span {
	margin-right: 10px; /* 우측 여백 추가 */
}

/* 각 div 태그 사이에 구분선을 추가 */
.product-price-item+.product-price-item {
	border-left: 3px solid #E5E7EB; /* 왼쪽에 1px 두께의 실선 구분선 추가 */
}

.product-list {
	margin: 0 auto; /* 가로 여백을 화면 왼쪽과 오른쪽 모두 동일하게 설정 */
	max-width: 1200px; /* 최대 너비를 지정하여 내용이 너무 퍼지지 않도록 설정 */
	margin-top : 17px;
}

.search-input {
	width: 400px;
	padding: 10px;
	border: 2px solid #ddd;
	border-radius: 20px;
	font-size: 16px;
	outline: none;
}

.price-container {
	display: flex;
	
	align-items: center; 
}



button {
	flex-shrink: 0; /* 버튼이 너무 커지지 않도록 설정 */
}

li {
	list-style: none;
}

.pagination {
	width: 100%;
}

.horizontal-list {
	list-style-type: none;
	padding: 0;
	margin: 0;
	display: flex;
}

.horizontal-list li {
	background-color: #f2f2f2;
	padding: 0px;
	margin: 0;
	border-radius: 5px;
}

.product-information {
	display: flex;
}

.price {
	margin-right: 10px;
}

.bottom-container {
	font-size: 14px; /* 원하는 크기로 설정 */
	font-weight: bold;
}

.bottom-text {
	color: #A0AEC0; /* 회색으로 설정 */
}

.search {
	position: absolute;
	left: 250px;
	top: 30px;
}

.product-table {
	margin-top: 80px;
}

.place-container {
}

.checkbox1 {
}

.checkbox2 {
}

.float-right {
	display: flex;
	justify-content: space-around;
	width: 100%;
}

.order-list-item {
	border: none;
	background-color: transparent;
}

.minPrice-box, .anfruf, .maxPrice-box{
margin-right : 5px;
}


</style>
</head>

<body>
<jsp:include page="/WEB-INF/views/common/sideBar.jsp"/>
	<div class="container">
		<div
			class="h-full lg:h-20 xl:h-24 px-0 lg:px-8 2xl:px-16 max-w-[1024px] min-[1600px]:max-w-[1280px] flex items-center mx-auto box-content justify-between relative before:absolute before:w-screen before:bg-[#F1F1F1] before:bottom-0">
			<div class="relative hidden ms-7 me-7 xl:ms-9 lg:block flex-1">
				<div
					class="search relative flex items-center justify-between w-full rounded-md bg-borderBottom">
					<label for="search" class="flex items-center justify-between">
						<span
						class="absolute top-0 left-0 flex items-center justify-center flex-shrink-0 w-12 h-full cursor-pointer md:w-14 focus:outline-none"><svg
								width="24" height="24" viewBox="0 0 24 24"
								xmlns="http://www.w3.org/2000/svg"
								class="w-[16px] h-[16px] text-heading">
								<path
									d="M10.0278 19.0556C14.3233 19.0556 17.8056 15.5733 17.8056 11.2778C17.8056 6.98223 14.3233 3.5 10.0278 3.5C5.73223 3.5 2.25 6.98223 2.25 11.2778C2.25 15.5733 5.73223 19.0556 10.0278 19.0556Z"
									stroke="currentColor" stroke-width="1.5" stroke-linecap="round"
									stroke-linejoin="round" fill="transparent"></path>
								<path d="M21 21.8999L15.5 16.8999" stroke="currentColor"
									stroke-width="1.5" stroke-linecap="round"
									stroke-linejoin="round"></path></svg> </span> <input type="search"
						id="search-header" class="search-input"
						placeholder="${MName}에 관련해 검색해보세요." aria-label="search-header"
						autocomplete="off" name="search" value="${search }">
					</label>
				</div>

				<div
					class="bg-white flex flex-col h-full max-h-64vh lg:max-h-[550px] w-full z-10 absolute h-auto shadow-header hidden mt-4">
					<div
						class="os-host os-host-foreign os-theme-thin os-host-flexbox os-host-resize-disabled os-host-scrollbar-horizontal-hidden os-host-scrollbar-vertical-hidden os-host-transition">
						<div class="os-resize-observer-host observed">
							<div class="os-resize-observer" style="left: 0px; right: auto;">
							</div>
						</div>
						<div class="os-size-auto-observer observed"
							style="height: calc(100% + 1px); float: left;">
							<div class="os-resize-observer"></div>
						</div>
						<div class="os-content-glue" style="margin: 0px;"></div>
						<div class="os-padding">
							<div
								class="os-viewport os-viewport-native-scrollbars-invisible os-viewport-native-scrollbars-overlaid">
								<div class="os-content"
									style="padding: 0px; height: 100%; width: 100%;">
									<div
										class="h-full bg-white border rounded-md rounded-t-none border-gray-150">
										<div class="flex justify-center items-center h-[528px]">
										</div>
									</div>
								</div>
							</div>
						</div>

						<div
							class="os-scrollbar os-scrollbar-horizontal os-scrollbar-unusable os-scrollbar-auto-hidden">
							<div class="os-scrollbar-track os-scrollbar-track-off">
								<div class="os-scrollbar-handle"
									style="transform: translate(0px, 0px);"></div>
							</div>
						</div>

						<div
							class="os-scrollbar os-scrollbar-vertical os-scrollbar-unusable os-scrollbar-auto-hidden">
							<div class="os-scrollbar-track os-scrollbar-track-off">
								<div class="os-scrollbar-handle"
									style="transform: translate(0px, 0px);"></div>
							</div>
						</div>

						<div class="os-scrollbar-corner"></div>
					</div>
				</div>
			</div>
		</div>

		<table class="product-table hidden lg:table filterTable">
			<tbody>
				<tr>
					<td style="font-size: 20px; font-weight: bold;">카테고리</td>
					<td>
						<div class="flex items-center w-full chawkbazarBreadcrumb">
							<span style="font-size: 20px; font-weight: bold;">${TName}</span>
							&gt; <span style="font-size: 20px; font-weight: bold;">
								${MName}</span>
						</div>
					</td>
				</tr>
				<tr>
					<td style="font-size: 20px; font-weight: bold;">가격</td>
					<td class="price-filter" style="text-align: left">
						<div class="price-container"
							style="display: flex; align-items: center;">
							<div class="minPrice-box">
								<input type="text" id="minPrice"
									class="minPrice-input w-[152px] border rounded border-jnGray-200 py-[10px] px-4 text-sm font-medium"
									placeholder="최소 가격" data-idx="0" name="minPrice"
									value="${min }"
									oninput="this.value = this.value.replace(/[^0-9]/g, '').replace(/(\..*)\./g, '$1')"
									autocomplete="off">
							</div>
                            <div>
							<span class="mx-[6px] anfruf"> <svg
									xmlns="http://www.w3.org/2000/svg" width="10" height="4"
									fill="none" class="inline">
                                  <path fill="#5A616B"
										d="M7.895.628 9.297.62q0 .651-.182 1.205-.182.545-.515.947-.326.401-.788.628-.454.22-1 .22-.636 0-1.129-.25-.484-.258-1.045-.773a3.5 3.5 0 0 0-.652-.507 1.25 1.25 0 0 0-.651-.182.94.94 0 0 0-.584.182 1.14 1.14 0 0 0-.378.5 2 2 0 0 0-.137.757H.796q0-.659.183-1.197.18-.545.507-.931.333-.395.788-.606a2.3 2.3 0 0 1 1-.213q.636 0 1.144.266.516.265 1.046.757.363.349.659.523.295.174.628.174a1 1 0 0 0 .599-.19q.257-.196.401-.537a1.95 1.95 0 0 0 .144-.765"></path>
                                  </svg>
							</span>
							</div>

							<div class="maxPrice-box">
								<input type="text" id="maxPrice"
									class="maxPrice-input w-[152px] border rounded border-jnGray-200 py-[10px] px-4 text-sm font-medium"
									placeholder="최대 가격" data-idx="1" name="maxPrice"
									value="${max }"
									oninput="this.value = this.value.replace(/[^0-9]/g, '').replace(/(\..*)\./g, '$1')"
									autocomplete="off">
							</div>
							<button type="submit"
								class="price-button w-full lg:mt-0 lg:w-auto bg-black py-[10px] px-4 m-0 lg:mx-2 rounded text-sm font-medium text-white"
								style="background-color: black;">적용</button>
						</div>
					</td>
				</tr>
				<tr>
					<td style="font-size: 20px; font-weight: bold;">주소</td>
					<td class="price-filter" style="text-align: left">
						<div class="place-container">
							<input type="text" class="place-input border rounded border-jnGray-200 py-[10px] px-4 text-sm font-medium" style="vertical-align:middle;" placeholder="장소를 입력하세요" name="place"
								value="${place }" autocomplete="off">
							<button
								class="w-full lg:mt-0 lg:w-auto bg-jnBlack py-[10px] px-4 m-0 lg:mx-2 rounded text-sm font-medium text-white"
								style="background-color: black; vertical-align:middle;">적용</button>
						</div>
					</td>
				</tr>
				<tr>
					<td style="font-size: 20px; font-weight: bold;">옵션</td>
					<td>
						<div class="float-left state-option">
							<input id="saleYn" name="apple" type="checkbox"
								<c:if test="${pm.cri.apple == 'yes' }">checked</c:if>
								value="yes"> 
							<label for="saleYn" class="checkbox-label"> <span class="checkbox-text">예약중 상품 포함</span></label>
							<input id="saleZn" name="banana" type="checkbox"
								<c:if test="${pm.cri.banana == 'yes' }">checked</c:if> value="yes"> 
							<label for="saleZn" class="checkbox-label"> <span class="checkbox-text">판매완료 상품 포함</span></label>
						</div>
					</td>
				</tr>
			</tbody>
		</table>
		<br> 
		<br>
		<div class="product-price-container">
			<h4 class="product-price-title">현재 페이지의 상품 가격을 비교해봤어요</h4>
			<div
				class="product-price-items flex flex-col lg:bg-jnGray-100 overflow-hidden lg:flex-row lg:rounded-lg">
				<div
					class="product-price-item relative flex flex-1 justify-between items-center py-6 px-6 lg:px-12 lg:py-6 !mt-0 mb-2 rounded-lg lg:mb-0  lg:bg-none before:-left-0.5 :before:block before:absolute before:w-[1px] before:h-8 before:bg-jnGray-300 before:content-none"
					aria-labelledby="product-item-price-title-1" tabindex="0">
					<span id="product-item-price-title-1"
						class="font-medium text-sm lg:text-lg text-jnGray-800" style="font-size: 15px; margin-left : 15px; font-weight : bold;">평균
						가격</span> <span tabindex="0"
						class="product-price font-bold text-lg lg:text-2xl text-jnGray-800">${avgPrice }<span style="font-size : 20px;">원</span></span>
				</div>
				<div
					class="product-price-item relative flex flex-1 justify-between items-center py-6 px-6 lg:px-12 lg:py-6 !mt-0 mb-2 rounded-lg lg:mb-0  lg:bg-none before:-left-0.5 :before:block before:absolute before:w-[1px] before:h-8 before:bg-jnGray-300"
					aria-labelledby="product-item-price-title-2" tabindex="0">
					<span id="product-item-price-title-2"
						class="font-medium text-sm lg:text-lg text-jnGray-800" style="font-size: 15px; margin-left : 15px; font-weight : bold;">가장
						높은 가격</span> <span tabindex="0"
						class="product-price font-bold text-lg lg:text-2xl text-jnGray-800">${maxPrice }<span style="font-size : 20px;">원</span></span>
				</div>
				<div
					class="product-price-item relative flex flex-1 justify-between items-center py-6 px-6 lg:px-12 lg:py-6 !mt-0 mb-2 rounded-lg lg:mb-0  lg:bg-none before:-left-0.5 :before:block before:absolute before:w-[1px] before:h-8 before:bg-jnGray-300"
					aria-labelledby="product-item-price-title-3" tabindex="0">
					<span id="product-item-price-title-3"
						class="font-medium text-sm lg:text-lg text-jnGray-800" style="font-size: 15px; margin-left : 15px; font-weight : bold;">가장
						낮은 가격</span> <span tabindex="0"
						class="product-price font-bold text-lg lg:text-2xl text-jnGray-800">${minPrice }<span style="font-size : 20px;">원</span></span>
				</div>
			</div>
		</div>

		<div class="mt-3">
			<ul class="float-right" style="width: 50%">
				<li><button id="pr_num" class="float-left order-list-item"
						style=" font-size : 13px; font-weight : bold;  color : <c:if test="${pm.cri.order == 'pr_num' }">black;</c:if> <c:if test="${pm.cri.order != 'pr_num' }">gray;</c:if>">최신순</button></li>
				<li class="float-left" style="color: gray;">|</li>
				<li><button id="pr_view" class="float-left order-list-item"
						style=" font-size : 13px; font-weight : bold;  color : <c:if test="${pm.cri.order == 'pr_view' }">black;</c:if> <c:if test="${pm.cri.order != 'pr_view' }">gray;</c:if>">조회수순</button></li>
				<li class="float-left" style="color: gray;">|</li>
				<li><button id="pr_basket" class="float-left order-list-item"
						style=" font-size : 13px; font-weight : bold;  color : <c:if test="${pm.cri.order == 'pr_basket' }">black;</c:if> <c:if test="${pm.cri.order != 'pr_basket' }">gray;</c:if>">찜순</button></li>
				<li class="float-left" style="color: gray;">|</li>
				<li><button id="asc" class="float-left order-list-item"
						style=" font-size : 13px; font-weight : bold;  color : <c:if test="${pm.cri.order == 'asc' }">black;</c:if> <c:if test="${pm.cri.order != 'asc' }">gray;</c:if>">낮은가격순</button></li>
				<li class="float-left" style="color: gray;">|</li>
				<li><button id="desc" class="float-left order-list-item"
						style=" font-size : 13px; font-weight : bold;  color : <c:if test="${pm.cri.order == 'desc' }">black;</c:if> <c:if test="${pm.cri.order != 'desc' }">gray;</c:if>">높은가격순</button></li>
			</ul>
		</div>

		<h4 class="productTotalCount" style="font-size : 20px;">총 ${totalCount }개</h4>
		<div class="product-list">
			<c:forEach var="pro" items="${pList}" varStatus="loop">
				<a href="<c:url value="/product/detail?pNum=${pro.pr_num}"/>"
					style="color: black;">
					<div class="product-container">
						<!-- 이미지 추가 -->
						<div class="product-image">
							<c:if test="${pro.fileList.size() >=1 }">
								<img
									src="<c:url value='/download${pro.fileList.get(0).fi_name}'/>"
									alt="${pro.pr_name}">
							</c:if>
						</div>
						<div class="product-box">
							<h7 class="product-name">${pro.pr_name}</h7>
							<div class="product-information">
								<p class="price">
									<c:choose>
										<c:when test="${pro.pr_price == 0}">
											<span style="font-weight: bold; font-size: 18px;">무료
												나눔🧡</span>
										</c:when>
										<c:when test="${pro.pr_price < 0}">
											<span
												style="font-size: 17px; color: #808080; font-weight: bold;">가격
												제안</span>
										</c:when>
										<c:otherwise>
											<span style="font-weight: bold; font-size: 20px;">${pro.price}원</span>
										</c:otherwise>
									</c:choose>
								</p>
								<p class="state">
									<c:choose>
										<c:when test="${pro.pr_ps_state eq '판매완료'}">
											<svg width="50" height="30" viewBox="0 0 40 20"
												xmlns="http://www.w3.org/2000/svg">
                                    <rect x="0" y="0" width="40"
													height="20" rx="4" fill="#708090"></rect>
                                    <text x="50%" y="50%"
													alignment-baseline="middle" text-anchor="middle"
													fill="white" font-size="10">판매완료</text>
                                </svg>
										</c:when>
										<c:when test="${pro.pr_ps_state eq '예약중'}">
											<svg width="50" height="30" viewBox="0 0 40 20"
												xmlns="http://www.w3.org/2000/svg">
                                    <rect x="0" y="0" width="40"
													height="20" rx="4" fill="#0DCC5A"></rect>
                                    <text x="50%" y="50%"
													alignment-baseline="middle" text-anchor="middle"
													fill="white" font-size="12">예약중</text>
                                </svg>
										</c:when>
									</c:choose>
								</p>
							</div>
							<div class="bottom-container">
								<span class="text-sm text-gray-400 bottom-text">${pro.dong}</span>
								<span class="text-sm text-gray-400 mx-1 bottom-text">|</span> <span
									class="text-sm text-gray-400 bottom-text">${pro.time}</span>
							</div>
						</div>
					</div>
				</a>
				<c:if test="${loop.index % 5 == 4}">
					<!-- 한 줄에 5개의 상품이 들어가면 줄 바꿈 -->
					<br>
				</c:if>
			</c:forEach>
		</div>

		<!-- 페이지네이션 -->

		<ul class="pagination justify-content-center">
			<c:if test="${pm.prev}">
				<li class="page-item"><c:url var="url" value="/product/list3">
						<c:param name="page" value="${pm.startPage - 1}" />
						<c:param name="mNum" value="${num}" />
						<c:param name="mName" value="${MName}" />
						<c:param name="tName" value="${TName}" />
						<c:param name="search" value="${pm.cri.search}" />
						<c:param name="minPrice" value="${minimum}" />
						<c:param name="maxPrice" value="${maximum}" />
						<c:param name="order" value="${pm.cri.order}" />
						<c:param name="place" value="${pm.cri.place }" />
						<c:param name="apple" value="${pm.cri.apple }" />
						<c:param name="banana" value="${pm.cri.banana }" />
					</c:url> <a class="page-link" href="${url}">이전</a></li>
			</c:if>
			<c:forEach begin="${pm.startPage}" end="${pm.endPage}" var="i">
				<c:set var="active" value="${pm.cri.page == i ?'active':'' }" />
				<li class="page-item ${active}"><c:url var="url"
						value="/product/list3">
						<c:param name="page" value="${i}" />
						<c:param name="mNum" value="${num}" />
						<c:param name="mName" value="${MName}" />
						<c:param name="tName" value="${TName}" />
						<c:param name="search" value="${pm.cri.search}" />
						<c:param name="minPrice" value="${minimum}" />
						<c:param name="maxPrice" value="${maximum}" />
						<c:param name="order" value="${pm.cri.order}" />
						<c:param name="place" value="${pm.cri.place }" />
						<c:param name="apple" value="${pm.cri.apple }" />
						<c:param name="banana" value="${pm.cri.banana }" />
					</c:url> <a class="page-link" href="${url}">${i}</a></li>
			</c:forEach>
			<c:if test="${pm.next}">
				<li class="page-item"><c:url var="url" value="/product/list3">
						<c:param name="page" value="${pm.endPage + 1}" />
						<c:param name="mNum" value="${num}" />
						<c:param name="mName" value="${MName}" />
						<c:param name="tName" value="${TName}" />
						<c:param name="search" value="${pm.cri.search}" />
						<c:param name="minPrice" value="${minimum}" />
						<c:param name="maxPrice" value="${maximum}" />
						<c:param name="order" value="${pm.cri.order}" />
						<c:param name="place" value="${pm.cri.place }" />
						<c:param name="apple" value="${pm.cri.apple }" />
						<c:param name="banana" value="${pm.cri.banana }" />
					</c:url> <a class="page-link" href="${url}">다음</a></li>
			</c:if>
		</ul>
	</div>

	<script type="text/javascript">


<!--가격 적용 버튼 클릭시-->
const priceButton = document.querySelector('.price-button');

priceButton.addEventListener('click', function() {
	let minPrice = $(".minPrice-input").val();
	let maxPrice = $(".maxPrice-input").val(); 
	if(minPrice=="" || minPrice == null || maxPrice =="" || maxPrice == null){
		return;
	}
	let minPrice1 = minPrice.replace(/,/g, '');
	minPrice = Number(minPrice1);
	let maxPrice1 = maxPrice.replace(/,/g, '');
	maxPrice = Number(maxPrice1);
	let gap = maxPrice-minPrice;
	if(gap <0 || maxPrice >1000000000 ){
		return;
	}
	sendPrice(minPrice, maxPrice);
});


function sendPrice(minPrice, maxPrice){
	let apple = document.getElementById("saleYn").checked ? "yes" : "no";
	let banana = document.getElementById("saleZn").checked ? "yes" : "no";
	let mNum = '${num}';
	let place = $(".place-input").val();
	let tName='${TName}';
	let mName = '${MName}';
	let order;
	let search = $(".search-input").val();

	const orderItems = document.querySelectorAll('.order-list-item');
	 for(let i=0; i<orderItems.length; i++){
    	var orderItem = orderItems[i];
    	var computedStyle = window.getComputedStyle(orderItem);
    	var backgroundColor = computedStyle.getPropertyValue('color');
    	if(backgroundColor === 'rgb(0, 0, 0)'){
    		order=orderItem.id;
    	}
    }
	
    var data = {
        "apple" : apple,
        "banana" : banana,
        "mNum" : mNum,
        "search" : search,
        "place" : place,
        "minPrice" : minPrice,
        "maxPrice" : maxPrice,
        "order"  : order,
        "tName" : tName,
		"mName" : mName
    };

    // AJAX 요청
    $.ajax({
    	async : false,
        type: "get",
        url: '<c:url value="/product/list2"/>', 
        data: data, // 보낼 데이터 입력
        dataType : "json",
        success: function(data) {
            // 성공적으로 응답을 받았을 때 실행할 코드
            addMethod(data.pList);
            addPrice(data.avgPrice, data.maxPrice, data.minPrice);
            addPagination(data.pm,data.num,data.TName, data.MName, data.order, data.apple, data.banana, data.place, data.search, data.min, data.max );
            addTotalCount(data.totalCount);
        },
        error: function(xhr, status, error) {
            // 요청이 실패했을 때 실행할 코드
            console.error("Error sending data:", error);
        }
    });
}

<!--최소 금액 입력시-->
const minInput = document.querySelector('#minPrice');
minInput.addEventListener('keyup', function(e) {
  let value = e.target.value;
  // 입력 값이 없으면 빈문자열로 설정
  if (value === "" || value === null || isNaN(Number(value))) {
    value = "";
  } else {
    value = Number(value.replaceAll(',', ''));
  }
  const formatValue = value.toLocaleString('ko-KR');
  minInput.value = formatValue; 
});

<!--최대 금액 입력시-->
const maxInput = document.querySelector('#maxPrice');
maxInput.addEventListener('keyup', function(e) {
  let value = e.target.value;
  // 입력 값이 없으면 빈문자열로 설정
  if (value === "" || value === null || isNaN(Number(value))) {
    value = "";
  } else {
    value = Number(value.replaceAll(',', ''));
  }
  const formatValue = value.toLocaleString('ko-KR');
  maxInput.value = formatValue; 
});
 
<!-- 검색창 입력시 -->
$(".search-input").change(function(){
	var search = $(this).val().trim();
	sendSearch(search);
});


// 검색창에 입력할 때 실행되는 함수
function sendSearch(search) {
    let apple = document.getElementById("saleYn").checked ? "yes" : "no";
	let banana = document.getElementById("saleZn").checked ? "yes" : "no";
	let mNum = '${num}';
	let place = $(".place-input").val();
	let minPrice = $(".minPrice-input").val();
	let maxPrice = $(".maxPrice-input").val(); 
	let tName='${TName}';
	let mName = '${MName}';
	let order;

	const orderItems = document.querySelectorAll('.order-list-item');
	 for(let i=0; i<orderItems.length; i++){
     	var orderItem = orderItems[i];
     	var computedStyle = window.getComputedStyle(orderItem);
     	var backgroundColor = computedStyle.getPropertyValue('color');
     	if(backgroundColor === 'rgb(0, 0, 0)'){
     		order=orderItem.id;
     	}
     }
	
	
	if(minPrice=="" || minPrice == null){
		minPrice =-100;
	}else if(minPrice=="0"){
		minPrice=0;
	}else{
		let minPrice1 = minPrice.replace(/,/g, '');
		minPrice = Number(minPrice1);	
	}
	
	if(maxPrice=="" || maxPrice == null){
		maxPrice =1000000000;
	}else if(maxPrice=="0"){
		maxPrice=0;
	}else{
		let maxPrice1 = maxPrice.replace(/,/g, '');
		maxPrice = Number(maxPrice1);	
	}
	
    var data = {
        "apple" : apple,
        "banana" : banana,
        "mNum" : mNum,
        "search" : search,
        "place" : place,
        "minPrice" : minPrice,
        "maxPrice" : maxPrice,
        "order"  : order,
        "tName" : tName,
		"mName" : mName
    };

    // AJAX 요청
    $.ajax({
    	async : false,
        type: "get",
        url: '<c:url value="/product/list2"/>', 
        data: data, // 보낼 데이터 입력
        dataType : "json",
        success: function(data) {
            // 성공적으로 응답을 받았을 때 실행할 코드
            addMethod(data.pList);
            addPrice(data.avgPrice, data.maxPrice, data.minPrice);
            addPagination(data.pm,data.num,data.TName, data.MName, data.order, data.apple, data.banana, data.place, data.search, data.min, data.max );
            addTotalCount(data.totalCount);
        },
        error: function(xhr, status, error) {
            // 요청이 실패했을 때 실행할 코드
            console.error("Error sending data:", error);
        }
    });
} 


<!-- 주소 입력시 -->
$(".place-input").change(function(){
	var place = $(this).val().trim();
	sendPlace(place);
});

// 거래 희망 장소 입력할 때 실행되는 함수
function sendPlace(place) {
    let apple = document.getElementById("saleYn").checked ? "yes" : "no";
	let banana = document.getElementById("saleZn").checked ? "yes" : "no";
	let mNum = '${num}';
	let minPrice = $(".minPrice-input").val();
	let maxPrice = $(".maxPrice-input").val();
	let tName='${TName}';
	let mName = '${MName}';
	let search = $(".search-input").val();
	let order;

	const orderItems = document.querySelectorAll('.order-list-item');
	 for(let i=0; i<orderItems.length; i++){
    	var orderItem = orderItems[i];
    	var computedStyle = window.getComputedStyle(orderItem);
    	var backgroundColor = computedStyle.getPropertyValue('color');
    	if(backgroundColor === 'rgb(0, 0, 0)'){
    		order=orderItem.id;
    	}
    }
	
	if(minPrice=="" || minPrice == null){
		minPrice =-100;
	}else if(minPrice=="0"){
		minPrice=0;
	}else{
		let minPrice1 = minPrice.replace(/,/g, '');
		minPrice = Number(minPrice1);	
	}
	
	if(maxPrice=="" || maxPrice == null){
		maxPrice =1000000000;
	}else if(maxPrice=="0"){
		maxPrice=0;
	}else{
		let maxPrice1 = maxPrice.replace(/,/g, '');
		maxPrice = Number(maxPrice1);	
	}
	
    var data = {
        "apple" : apple,
        "banana" : banana,
        "mNum" : mNum,
        "search" : search,
        "place" : place,
        "minPrice" : minPrice,
        "maxPrice" : maxPrice,
        "order"  : order,
        "tName" : tName,
		"mName" : mName
    };

    // AJAX 요청
    $.ajax({
    	async : false,
        type: "get",
        url: '<c:url value="/product/list2"/>', 
        data: data, // 보낼 데이터 입력
        dataType : "json",
        success: function(data) {
            // 성공적으로 응답을 받았을 때 실행할 코드
            addMethod(data.pList);
            addPrice(data.avgPrice, data.maxPrice, data.minPrice);
            addPagination(data.pm,data.num,data.TName, data.MName, data.order, data.apple, data.banana, data.place, data.search ,data.min, data.max );
            addTotalCount(data.totalCount);
        },
        error: function(xhr, status, error) {
            // 요청이 실패했을 때 실행할 코드
            console.error("Error sending data:", error);
        }
    });
}



	$(".order-list-item").click(function(){
		$(".order-list-item").css("color", "gray");
	})
	
	$("#pr_num").click(function(){
		$("#pr_num").css("color", "black");
		clickOrder("pr_num");
		
	})
	
	$("#pr_view").click(function(){
		$("#pr_view").css("color", "black");
		clickOrder("pr_view");
		
	})
	
	$("#pr_basket").click(function(){
		$("#pr_basket").css("color", "black");
		clickOrder("pr_basket");
		
	})
	
	$("#asc").click(function(){
		$("#asc").css("color", "black");
		clickOrder("asc");
		
	})
	
	$("#desc").click(function(){
		$("#desc").css("color", "black");
		clickOrder("desc");
		
	})
	
	function clickOrder(str1) {
		let apple = document.getElementById("saleYn").checked ? "yes" : "no";
		let banana = document.getElementById("saleZn").checked ? "yes" : "no";
		let mNum = '${num}';
		let search = $(".search-input").val();
		let place = $(".place-input").val();
		let minPrice = $(".minPrice-input").val();
		let maxPrice = $(".maxPrice-input").val();
		let page = '${pm.cri.page}';
		let tName='${TName}';
		let mName = '${MName}';
				
		if(minPrice=="" || minPrice == null){
			minPrice =-100;
		}else if(minPrice=="0"){
			minPrice=0;
		}else{
			let minPrice1 = minPrice.replace(/,/g, '');
			minPrice = Number(minPrice1);	
		}
		
		if(maxPrice=="" || maxPrice == null){
			maxPrice =1000000000;
		}else if(maxPrice=="0"){
			maxPrice=0;
		}else{
			let maxPrice1 = maxPrice.replace(/,/g, '');
			maxPrice = Number(maxPrice1);	
		}
		let obj = { 
			"order" : str1,
			"apple" : apple,
			"banana" : banana,
			"mNum" : mNum,
			"search" : search,
			"place" : place,
			"minPrice" : minPrice,
			"maxPrice" : maxPrice,
			"page" : page,
			"tName" : tName,
			"mName" : mName
		};
		$.ajax({
			async : false,
			url : '<c:url value="/product/list2"/>', 
			type : 'get',
			data : obj,
			dataType : "json", 
			success : function (data){
				addMethod(data.pList);
				addPagination(data.pm, data.num, data.TName, data.MName, data.order, data.apple, data.banana, data.place, data.search, data.min, data.max);
			}, 
			error : function(jqXHR, textStatus, errorThrown){
				console.log(jqXHR.responseText)
			}
		});
	}
	
	function addMethod(list) {
		let str='';
		for(pro of list) {
			str += 
				`
				<a href="<c:url value="/product/detail?pNum=\${pro.pr_num}"/>" style="color : black;">
	            <div class="product-container"> 
	                <!-- 이미지 추가 -->
	                <div class="product-image">
	            `
	            if(pro.fileList.length >= 1){
	                  str += `<img src="<c:url value='/download\${pro.fileList[0].fi_name}'/>" alt="${pro.pr_name}">`
	            }
	            str += `
	                </div>
	                <div class="product-box">
	                    <h7 class="product-name">\${pro.pr_name}</h7>
	                    <div class="product-information">
	                    <p class="price">
	              	`;
	            if(pro.pr_price == 0){
	            	str += `<span style="font-weight: bold; font-size: 18px;">무료 나눔🧡</span>`
	            }else if(pro.pr_price < 0){
	            	str += `<span style="font-size: 17px; color: #808080; font-weight: bold;">가격 제안</span>`
	            }else{
	            	str += `<span style="font-weight: bold; font-size: 20px;">\${pro.price }원</span>`
	            }
	            
	                str += `
	                    </p>
	                    <p class="state">
	                    `;
	                    
	            if(pro.pr_ps_state === '판매완료'){
	            	str += `<svg width="50" height="30" viewBox="0 0 40 20" xmlns="http://www.w3.org/2000/svg">
                             <rect x="0" y="0" width="40" height="20" rx="4" fill="#708090"></rect>
                             <text x="50%" y="50%" alignment-baseline="middle" text-anchor="middle" fill="white" font-size="10">판매완료</text>`
                            
                           
	            }else if(pro.pr_ps_state === '예약중'){
	            	str += `<svg width="50" height="30" viewBox="0 0 40 20" xmlns="http://www.w3.org/2000/svg">
                             <rect x="0" y="0" width="40" height="20" rx="4" fill="#0DCC5A"></rect>
                             <text x="50%" y="50%" alignment-baseline="middle" text-anchor="middle" fill="white" font-size="12">예약중</text>`                                       
	            }
	            
	               str += `
	                    </svg>
	                    </p>
	                    </div>
	                    <div class="bottom-container">
	                    <span class="text-sm text-gray-400 bottom-text">\${pro.dong}</span>
	                    <span class="text-sm text-gray-400 mx-1 bottom-text">|</span>
	                    <span class="text-sm text-gray-400 bottom-text">\${pro.time}</span>
	                </div>
	            </div>
	           </div>
	        </a>
	        `	
		}
		$(".product-list").html(str);
	}
	
	function addPagination(pm,num,TName, MName, order, apple, banana, place, search, min, max){
		let str = '';
		if(pm.prev == true){
			str += `<li class="page-item">
			<a class="page-link" href="<c:url value="/product/list3?tName=\${TName}&mName=\${MName}&page=\${pm.cri.startPage-1}&mNum=\${num}&search=\${search}&minPrice=\${min}&maxPrice=\${max}&order=\${order}&place=\${place}&apple=\${apple}&banana=\${banana}"/>">이전</a>
		</li>`;
		}
		 for(let i=pm.startPage; i<=pm.endPage; i++){
			 var active = pm.cri.page == i ? 'active' : '';
			str +=`<li class="page-item \${active}">
				<a class="page-link" href="<c:url value="/product/list3?tName=\${TName}&mName=\${MName}&page=\${i}&mNum=\${num}&search=\${search}&minPrice=\${min}&maxPrice=\${max}&order=\${order}&place=\${place}&apple=\${apple}&banana=\${banana}"/>">\${i}</a>
		     </li>`;
		 }
		 
		 if(pm.next == true){
				str += `<li class="page-item">
				<a class="page-link" href="<c:url value="/product/list3?tName=\${TName}&mName=\${MName}&page=\${pm.endPage+1}&mNum=\${num}&search=\${search}&minPrice=\${min}&maxPrice=\${max}&order=\${order}&place=\${place}&apple=\${apple}&banana=\${banana}"/>">다음</a>
			</li>`;
			}		 
		 $(".pagination").html(str);
	}
	

$(".state-option").change(function(){
	sendCheckboxData();
}); 
//체크박스가 변경될 때마다 실행되는 함수
function sendCheckboxData() {
    // 체크박스의 상태를 확인하여 데이터 객체에 저장
    let apple = document.getElementById("saleYn").checked ? "yes" : "no";
	let banana = document.getElementById("saleZn").checked ? "yes" : "no";
	let mNum = '${num}';
	let search = $(".search-input").val();
	let place = $(".place-input").val();
	let minPrice = $(".minPrice-input").val();
	let maxPrice = $(".maxPrice-input").val();
	let page = '${pm.cri.page}';
	let tName='${TName}';
	let mName = '${MName}';
	let order;

	const orderItems = document.querySelectorAll('.order-list-item');
	 for(let i=0; i<orderItems.length; i++){
    	var orderItem = orderItems[i];
    	var computedStyle = window.getComputedStyle(orderItem);
    	var backgroundColor = computedStyle.getPropertyValue('color');
    	if(backgroundColor === 'rgb(0, 0, 0)'){
    		order=orderItem.id;
    	}
    }
	
	if(minPrice=="" || minPrice == null){
		minPrice =-100;
	}else if(minPrice=="0"){
		minPrice=0;
	}else{
		let minPrice1 = minPrice.replace(/,/g, '');
		minPrice = Number(minPrice1);	
	}
	
	if(maxPrice=="" || maxPrice == null){
		maxPrice =1000000000;
	}else if(maxPrice=="0"){
		maxPrice=0;
	}else{
		let maxPrice1 = maxPrice.replace(/,/g, '');
		maxPrice = Number(maxPrice1);	
	}

    var data = {
        "apple" : apple,
        "banana" : banana,
        "mNum" : mNum,
        "search" : search,
        "place" : place,
        "order" : order,
        "minPrice" : minPrice,
        "maxPrice" : maxPrice,
        "order"  : order,
        "page" : page,
        "tName" : tName,
		"mName" : mName
    };

    // AJAX 요청
    $.ajax({
    	async : false,
        type: "get",
        url: '<c:url value="/product/list2"/>', 
        data: data, // 보낼 데이터 입력
        dataType : "json",
        success: function(response) {
            // 성공적으로 응답을 받았을 때 실행할 코드
            addMethod(response.pList);
            addPrice(response.avgPrice, response.maxPrice, response.minPrice);
            addPagination(response.pm,response.num,response.TName, response.MName, response.order, response.apple, response.banana, response.place, response.search, response.min, response.max);
            addTotalCount(response.totalCount);
        },
        error: function(xhr, status, error) {
            // 요청이 실패했을 때 실행할 코드
            console.error("Error sending data:", error);
        }
    });
} 

function addPrice(avgPrice, maxPrice, minPrice){
	
	let str='';
	str += `
    <h4 class="product-price-title">현재 페이지의 상품 가격을 비교해봤어요</h4>
	<div class="flex flex-col lg:bg-jnGray-100 overflow-hidden lg:flex-row lg:rounded-lg">
    <div class="product-price-item relative flex flex-1 justify-between items-center py-6 px-6 lg:px-12 lg:py-6 !mt-0 mb-2 rounded-lg lg:mb-0 lg:bg-none before:-left-0.5 :before:block before:absolute before:w-[1px] before:h-8 before:bg-jnGray-300 before:content-none" aria-labelledby="product-item-price-title-1" tabindex="0">
        <span id="product-item-price-title-1" class="font-medium text-sm lg:text-lg text-jnGray-800" style="font-size: 15px; margin-left : 15px; font-weight : bold;">평균 가격</span>
        <span tabindex="0" class="product-price font-bold text-lg lg:text-2xl text-jnGray-800">\${avgPrice }<span style="font-size : 20px;">원</span></span>
    </div>
    <div class="product-price-item relative flex flex-1 justify-between items-center py-6 px-6 lg:px-12 lg:py-6 !mt-0 mb-2 rounded-lg lg:mb-0 lg:bg-none before:-left-0.5 :before:block before:absolute before:w-[1px] before:h-8 before:bg-jnGray-300" aria-labelledby="product-item-price-title-2" tabindex="0">
        <span id="product-item-price-title-2" class="font-medium text-sm lg:text-lg text-jnGray-800" style="font-size: 15px; margin-left : 15px; font-weight : bold;">가장 높은 가격</span>
        <span tabindex="0" class="product-price font-bold text-lg lg:text-2xl text-jnGray-800">\${maxPrice }<span style="font-size : 20px;">원</span></span>
    </div>
    <div class="product-price-item relative flex flex-1 justify-between items-center py-6 px-6 lg:px-12 lg:py-6 !mt-0 mb-2 rounded-lg lg:mb-0 lg:bg-none before:-left-0.5 :before:block before:absolute before:w-[1px] before:h-8 before:bg-jnGray-300" aria-labelledby="product-item-price-title-3" tabindex="0">
        <span id="product-item-price-title-3" class="font-medium text-sm lg:text-lg text-jnGray-800" style="font-size: 15px; margin-left : 15px; font-weight : bold;">가장 낮은 가격</span>
        <span tabindex="0" class="product-price font-bold text-lg lg:text-2xl text-jnGray-800">\${minPrice }<span style="font-size : 20px;">원</span></span>
    </div>
  </div>`
  
	$(".product-price-container").html(str);	
}

function addTotalCount(count){
	let str='';
	str += `<span>총 \${count}개</span>`
	$(".productTotalCount").html(str);
}

</script>

</body>
</html>