<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>

body {
	font-family: "Lato", sans-serif;
}

.main {
	margin-left: 160px; /* Same as the width of the sidenav */
	font-size: 28px; /* Increased text to enable scrolling */
	padding: 0px 10px;
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
	width: 16.5%; /* 5개의 상품을 한 줄에 배치하기 위해 20%로 설정 */
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
	background: rgb(247, 249, 250);
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
	margin-bottom: 15px;
}

/* 각 span 태그 사이의 간격을 조정 */
.product-price-item span {
	margin-right: 20px; /* 우측 여백 추가 */
}

/* 각 div 태그 사이에 구분선을 추가 */
.product-price-item+.product-price-item {
	border-left: 3px solid #E5E7EB; /* 왼쪽에 1px 두께의 실선 구분선 추가 */
}

.product-list, .product-list1 {
	margin: 0 auto; /* 가로 여백을 화면 왼쪽과 오른쪽 모두 동일하게 설정 */
	max-width: 1200px; /* 최대 너비를 지정하여 내용이 너무 퍼지지 않도록 설정 */
	margin-top: 120px;
}

.product-list{
position : absolute;
top : 1px;
left: 360px;
}

.product-list1{
position : absolute;
top : 370px;
left: 360px;
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
	justify-content: space-between;
	align-items: center;
}

.minPrice-box, .maxPrice-box {
	flex: 1;
	margin-right: 6px;
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

.anfruf {
	position: absolute;
	left: 992px;
}

.maxPrice-box {
	position: absolute;
	left: 1010px;
}

.price-button {
	position: absolute;
	left: 1243px;
	top: 234px;
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
	position: absolute;
	left: 760px;
	top: 285px;
}

.newProduct {
	position: absolute;
	left: 380px;
	top: 100px;
	font-weight: bold;
	font-size: 25px;
}

.polpularProduct {
	position: absolute;
	left: 380px;
	top: 460px;
	font-weight: bold;
	font-size: 25px;
}


.prev-button {
	position: absolute;
	left: 375px;
	top: 205px;
}

.before-button {
	position: absolute;
	left: 375px;
	top: 575px;
}



.next-button {
	position: absolute;
	left: 1518px;
	top: 205px;
}

.daum-button {
	position: absolute;
	left: 1518px;
	top: 575px;
}

.next-button:hover, .prev-button:hover, .daum-button:hover,.before-button:hover {
	background-color: black;
}

.container-circle, .container-circles {
	display: flex;
}

[class^="circle"] {
	height: 10px;
	width: 10px;
	margin: 0 10px;
	border-radius: 50%;
}

[class^="popular"] {
	height: 10px;
	width: 10px;
	margin: 0 10px;
	border-radius: 50%;
}



.black, .black1 {
	background-color: black;
}

.gray, .gray1 {
	background-color: #ced4da;
}

.container-circle {
	position: absolute;
	left: 885px;
	top: 460px;
}

.container-circles {
	position: absolute;
	left: 885px;
	top: 845px;
}


</style>
<title>Home</title>
</head>
<body>

<jsp:include page="/WEB-INF/views/common/sideBar.jsp"/>

	<h3
		class="newProduct text-lg md:text-xl lg:text-2xl 2xl:text-3xl xl:leading-10 font-bold text-heading">방금
		등록된 상품</h3>
	<div class="product-list">
		<c:forEach var="pro" items="${products}">
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
		</c:forEach>
	</div>
	
	<h3
		class="polpularProduct text-lg md:text-xl lg:text-2xl 2xl:text-3xl xl:leading-10 font-bold text-heading">실시간 인기상품</h3>
	<div class="product-list1">
		<c:forEach var="pro" items="${popularProducts}">
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
		</c:forEach>
	</div>

	<input id="page" class="page" type="hidden" value="1">
	<input id="popular" class="popular" type="hidden" value="1">
	<!-- 최근오른쪽 -->

	<button style="height: 60px;"
		class="next-button w-7 h-7 text-black absolute transition duration-250 transform hover:bg-gray-900 hover:text-white focus:outline-none text-sm md:text-base lg:w-9 lg:h-9 lg:text-xl xl:w-10 xl:h-10 3xl:w-12 3xl:h-12 3xl:text-2xl right-0 bg-white/25 shadow-transparent !w-12 !h-12 rounded-none hidden lg:flex justify-center items-center z-10 top-[66px] min-[1600px]:top-[84px] translate-y-0 m-0"
		id="next" aria-label="next-button">
		<svg width="26" height="28" viewBox="0 0 26 28" fill="none"
			xmlns="http://www.w3.org/2000/svg" style="transform: scaleX(-1);">
        <g filter="url(#filter0_d_19461_8348)">
            <path fill-rule="evenodd" clip-rule="evenodd"
				d="M15.8122 5.34218C16.4517 6.0669 16.3825 7.17278 15.6578 7.81224L8.645 14L15.6578 20.1878C16.3825 20.8273 16.4517 21.9331 15.8122 22.6579C15.1727 23.3826 14.0669 23.4517 13.3421 22.8122L5.26706 15.6872C4.25192 14.7914 4.25192 13.2086 5.26706 12.3129L13.3421 5.1878C14.0669 4.54835 15.1727 4.61747 15.8122 5.34218Z"
				fill="white"></path>
        </g>
        <defs>
            <filter id="filter0_d_19461_8348" x="0.505707" y="0.75"
				width="19.7443" height="26.5" filterUnits="userSpaceOnUse"
				color-interpolation-filters="sRGB">
                <feFlood flood-opacity="0" result="BackgroundImageFix"></feFlood>
                <feColorMatrix in="SourceAlpha" type="matrix"
				values="0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 127 0"
				result="hardAlpha"></feColorMatrix>
                <feOffset></feOffset>
                <feGaussianBlur stdDeviation="2"></feGaussianBlur>
                <feComposite in2="hardAlpha" operator="out"></feComposite>
                <feColorMatrix type="matrix"
				values="0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0.35 0"></feColorMatrix>
                <feBlend mode="normal" in2="BackgroundImageFix"
				result="effect1_dropShadow_19461_8348"></feBlend>
                <feBlend mode="normal" in="SourceGraphic"
				in2="effect1_dropShadow_19461_8348" result="shape"></feBlend>
            </filter>
        </defs>
    </svg>
	</button>


	<!-- 최근왼쪽 -->

	<button style="display: none; height: 60px;"
		class="prev-button w-7 h-7 text-black absolute transition duration-250 transform hover:bg-gray-900 hover:text-white focus:outline-none text-sm md:text-base lg:w-9 lg:h-9 lg:text-xl xl:w-10 xl:h-10 3xl:w-12 3xl:h-12 3xl:text-2xl right-0 bg-white/25 shadow-transparent !w-12 !h-12 rounded-none hidden lg:flex justify-center items-center z-10 top-[66px] min-[1600px]:top-[84px] translate-y-0 m-0"
		id="prev" aria-label="next-button">
		<svg width="26" height="28" viewBox="0 0 26 28" fill="none"
			xmlns="http://www.w3.org/2000/svg">
        <g filter="url(#filter0_d_19461_8348)">
            <path fill-rule="evenodd" clip-rule="evenodd"
				d="M15.8122 5.34218C16.4517 6.0669 16.3825 7.17278 15.6578 7.81224L8.645 14L15.6578 20.1878C16.3825 20.8273 16.4517 21.9331 15.8122 22.6579C15.1727 23.3826 14.0669 23.4517 13.3421 22.8122L5.26706 15.6872C4.25192 14.7914 4.25192 13.2086 5.26706 12.3129L13.3421 5.1878C14.0669 4.54835 15.1727 4.61747 15.8122 5.34218Z"
				fill="white"></path>
        </g>
        <defs>
            <filter id="filter0_d_19461_8348" x="0.505707" y="0.75"
				width="19.7443" height="26.5" filterUnits="userSpaceOnUse"
				color-interpolation-filters="sRGB">
                <feFlood flood-opacity="0" result="BackgroundImageFix"></feFlood>
                <feColorMatrix in="SourceAlpha" type="matrix"
				values="0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 127 0"
				result="hardAlpha"></feColorMatrix>
                <feOffset></feOffset>
                <feGaussianBlur stdDeviation="2"></feGaussianBlur>
                <feComposite in2="hardAlpha" operator="out"></feComposite>
                <feColorMatrix type="matrix"
				values="0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0.35 0"></feColorMatrix>
                <feBlend mode="normal" in2="BackgroundImageFix"
				result="effect1_dropShadow_19461_8348"></feBlend>
                <feBlend mode="normal" in="SourceGraphic"
				in2="effect1_dropShadow_19461_8348" result="shape"></feBlend>
            </filter>
        </defs>
    </svg>
	</button>
	
	<!-- 인기오른쪽 -->

	<button style="height: 60px;"
		class="daum-button w-7 h-7 text-black absolute transition duration-250 transform hover:bg-gray-900 hover:text-white focus:outline-none text-sm md:text-base lg:w-9 lg:h-9 lg:text-xl xl:w-10 xl:h-10 3xl:w-12 3xl:h-12 3xl:text-2xl right-0 bg-white/25 shadow-transparent !w-12 !h-12 rounded-none hidden lg:flex justify-center items-center z-10 top-[66px] min-[1600px]:top-[84px] translate-y-0 m-0"
		id="daum" aria-label="next-button">
		<svg width="26" height="28" viewBox="0 0 26 28" fill="none"
			xmlns="http://www.w3.org/2000/svg" style="transform: scaleX(-1);">
        <g filter="url(#filter0_d_19461_8348)">
            <path fill-rule="evenodd" clip-rule="evenodd"
				d="M15.8122 5.34218C16.4517 6.0669 16.3825 7.17278 15.6578 7.81224L8.645 14L15.6578 20.1878C16.3825 20.8273 16.4517 21.9331 15.8122 22.6579C15.1727 23.3826 14.0669 23.4517 13.3421 22.8122L5.26706 15.6872C4.25192 14.7914 4.25192 13.2086 5.26706 12.3129L13.3421 5.1878C14.0669 4.54835 15.1727 4.61747 15.8122 5.34218Z"
				fill="white"></path>
        </g>
        <defs>
            <filter id="filter0_d_19461_8348" x="0.505707" y="0.75"
				width="19.7443" height="26.5" filterUnits="userSpaceOnUse"
				color-interpolation-filters="sRGB">
                <feFlood flood-opacity="0" result="BackgroundImageFix"></feFlood>
                <feColorMatrix in="SourceAlpha" type="matrix"
				values="0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 127 0"
				result="hardAlpha"></feColorMatrix>
                <feOffset></feOffset>
                <feGaussianBlur stdDeviation="2"></feGaussianBlur>
                <feComposite in2="hardAlpha" operator="out"></feComposite>
                <feColorMatrix type="matrix"
				values="0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0.35 0"></feColorMatrix>
                <feBlend mode="normal" in2="BackgroundImageFix"
				result="effect1_dropShadow_19461_8348"></feBlend>
                <feBlend mode="normal" in="SourceGraphic"
				in2="effect1_dropShadow_19461_8348" result="shape"></feBlend>
            </filter>
        </defs>
    </svg>
	</button>
	
	<!-- 인기 왼쪽 -->
	<button style=" display : none; height: 60px;"
		class="before-button w-7 h-7 text-black absolute transition duration-250 transform hover:bg-gray-900 hover:text-white focus:outline-none text-sm md:text-base lg:w-9 lg:h-9 lg:text-xl xl:w-10 xl:h-10 3xl:w-12 3xl:h-12 3xl:text-2xl right-0 bg-white/25 shadow-transparent !w-12 !h-12 rounded-none hidden lg:flex justify-center items-center z-10 top-[66px] min-[1600px]:top-[84px] translate-y-0 m-0"
		id="before" aria-label="next-button">
		<svg width="26" height="28" viewBox="0 0 26 28" fill="none"
			xmlns="http://www.w3.org/2000/svg">
        <g filter="url(#filter0_d_19461_8348)">
            <path fill-rule="evenodd" clip-rule="evenodd"
				d="M15.8122 5.34218C16.4517 6.0669 16.3825 7.17278 15.6578 7.81224L8.645 14L15.6578 20.1878C16.3825 20.8273 16.4517 21.9331 15.8122 22.6579C15.1727 23.3826 14.0669 23.4517 13.3421 22.8122L5.26706 15.6872C4.25192 14.7914 4.25192 13.2086 5.26706 12.3129L13.3421 5.1878C14.0669 4.54835 15.1727 4.61747 15.8122 5.34218Z"
				fill="white"></path>
        </g>
        <defs>
            <filter id="filter0_d_19461_8348" x="0.505707" y="0.75"
				width="19.7443" height="26.5" filterUnits="userSpaceOnUse"
				color-interpolation-filters="sRGB">
                <feFlood flood-opacity="0" result="BackgroundImageFix"></feFlood>
                <feColorMatrix in="SourceAlpha" type="matrix"
				values="0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 127 0"
				result="hardAlpha"></feColorMatrix>
                <feOffset></feOffset>
                <feGaussianBlur stdDeviation="2"></feGaussianBlur>
                <feComposite in2="hardAlpha" operator="out"></feComposite>
                <feColorMatrix type="matrix"
				values="0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0.35 0"></feColorMatrix>
                <feBlend mode="normal" in2="BackgroundImageFix"
				result="effect1_dropShadow_19461_8348"></feBlend>
                <feBlend mode="normal" in="SourceGraphic"
				in2="effect1_dropShadow_19461_8348" result="shape"></feBlend>
            </filter>
        </defs>
    </svg>
	</button>
	<div class="container-circle">
		<div class="circle1 black"></div>
		<div class="circle2 gray"></div>
		<div class="circle3 gray"></div>
		<div class="circle4 gray"></div>
		<div class="circle5 gray"></div>
	</div>
	
	<div class="container-circles"> 
		<div class="popularcircle1 black1"></div>
		<div class="popularcircle2 gray1"></div>
		<div class="popularcircle3 gray1"></div>
		<div class="popularcircle4 gray1"></div>
		<div class="popularcircle5 gray1"></div>
	</div>


	<script type="text/javascript">  

$(".next-button").on("click", function(){ 
	let page = $(".page").val();
	page = Number(page) +1;	
	let obj = { 	
			"page" : page
		};
		$.ajax({
			async : false,
			url : '<c:url value="/product/new"/>',   
			type : 'get',
			data : obj,
			dataType : "json", 
			success : function (data){
				addProducts(data.products);
				savePage(data.page);
				changeNextButton(data.page);
				changeCircle(data.page);
			}, 
			error : function(jqXHR, textStatus, errorThrown){
				console.log(jqXHR.responseText)
			}
		});
});

$(".daum-button").on("click", function(){ 
	let page = $(".popular").val();
	page = Number(page) +1;	
	let obj = { 	
			"page" : page
		};
		$.ajax({
			async : false,
			url : '<c:url value="/product/popular"/>',   
			type : 'get',
			data : obj,
			dataType : "json", 
			success : function (data){
				addPopularProducts(data.products);
				savePopularPage(data.page);
				changePopularNextButton(data.page);
				changePopularCircle(data.page);
			}, 
			error : function(jqXHR, textStatus, errorThrown){
				console.log(jqXHR.responseText)
			}
		});
});

$(".before-button").on("click", function(){ 
	let page = $(".popular").val();
	page = Number(page) -1;	
	let obj = { 	
			"page" : page
		};
		$.ajax({
			async : false,
			url : '<c:url value="/product/popular"/>',   
			type : 'get',
			data : obj,
			dataType : "json", 
			success : function (data){
				addPopularProducts(data.products);
				savePopularPage(data.page);
				changePopularBeforeButton(data.page);
				changePopularCircle(data.page);
			}, 
			error : function(jqXHR, textStatus, errorThrown){
				console.log(jqXHR.responseText)
			}
		});
});

function changeCircle(page){
	let page2 = $(".page").val();
	 const circles = document.querySelectorAll('[class^="circle"]');
	 // 모든 원의 스타일을 기본으로 
	 circles.forEach((circle) => {
	        circle.classList.remove('black');
	        circle.classList.add('gray');
	 });
	 // 현재 페이지에 해당하는 원 스타일 바꿈
	 circles.forEach((circle) => {
	        if (circle.classList.contains('circle'+page2)) {
	        	circle.classList.remove('gray');
	            circle.classList.add('black');
	            
	        }
	 });
}

function changePopularCircle(page){
	let page2 = $(".popular").val();
	 const circles = document.querySelectorAll('[class^="popular"]');
	 // 모든 원의 스타일을 기본으로 
	 circles.forEach((circle) => {
	        circle.classList.remove('black1');
	        circle.classList.add('gray1');
	 });
	 // 현재 페이지에 해당하는 원 스타일 바꿈
	 circles.forEach((circle) => {
	        if (circle.classList.contains('popularcircle'+page2)) {
	        	circle.classList.remove('gray1');
	            circle.classList.add('black1');
	            
	        }
	 });
}
	          
	        

$(".prev-button").on("click", function(){ 
	let page = $(".page").val();
	page = Number(page) -1;	
	let obj = { 	
			"page" : page
		};
		$.ajax({
			async : false,
			url : '<c:url value="/product/new"/>',   
			type : 'get',
			data : obj,
			dataType : "json", 
			success : function (data){
				addProducts(data.products);
				savePage(data.page);
				changePrevButton(data.page);
				changeCircle(data.page);
				
			}, 
			error : function(jqXHR, textStatus, errorThrown){
				console.log(jqXHR.responseText)
			}
		});
});


function changePrevButton(page){
	var prevButton = document.getElementById('prev');
	var nextButton = document.getElementById('next');
	
	nextButton.style.display='block'; // 다음 버튼 보이게 하기
	if(page==1){
		prevButton.style.display='none';
	}
}

function changePopularBeforeButton(page){
	var beforeButton = document.getElementById('before');
	var daumButton = document.getElementById('daum');
	
	daumButton.style.display='block'; // 다음 버튼 보이게 하기
	if(page==1){
		beforeButton.style.display='none';
	}
}



function changeNextButton(page){
	var prevButton = document.getElementById('prev');
	var nextButton = document.getElementById('next');
	
	prevButton.style.display='block'; // 이전 버튼 보이게 하기
	if(page==5){
		nextButton.style.display='none';
	}
}

function changePopularNextButton(page){
	var beforeButton = document.getElementById('before');
	var daumButton = document.getElementById('daum');
	
	beforeButton.style.display='block'; // 이전 버튼 보이게 하기
	if(page==5){
		daumButton.style.display='none';
	}
}

function savePage(page){
	var page1 = document.getElementById('page');
	page1.value='';
	page1.value=page;
}

function savePopularPage(page){
	var page1 = document.getElementById('popular');
	page1.value='';
	page1.value=page;
}

function addProducts(products){
	let str='';
	for(pro of products) {
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

function addPopularProducts(products){
	let str='';
	for(pro of products) {
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
	$(".product-list1").html(str);
}

</script>
</body>
</html>
