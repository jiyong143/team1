<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 정보 수정</title>
<style>
.product-update {
	position: relative;
	top: 1000px;
	left: 50%;
	transform: translate(-50%, -50%);
	height: 2000px;
}

.file-list {
	list-style-type: none; /* 항목 기호 없앰 */
	display: flex;
	justify-content: space-between; /* 각 항목 사이에 공간을 균등하게 분배 */
	padding: 0; /* 기본 패딩 제거 */
}

#productTitle {
	padding: 0.5rem 1rem; /* 내부 여백 설정 */
	width: 25%; /* 너비를 부모 요소에 맞게 설정 */
	border: 1px solid #ccc; /* 테두리 설정 */
	border-radius: 0.25rem; /* 둥근 모서리 설정 */
	font-size: 14px; /* 폰트 크기 설정 */
	color: #333; /* 폰트 색상 설정 */
	transition: border-color 0.2s ease-in-out; /* 테두리 색상 전환 효과 설정 */
	position: absolute;
	top: 170px;
	left: 700px;
}

.price-update {
	padding: 0.5rem 1rem; /* 내부 여백 설정 */
	width: 25%; /* 너비를 부모 요소에 맞게 설정 */
	border: 1px solid #ccc; /* 테두리 설정 */
	border-radius: 0.25rem; /* 둥근 모서리 설정 */
	font-size: 14px; /* 폰트 크기 설정 */
	color: #333; /* 폰트 색상 설정 */
	transition: border-color 0.2s ease-in-out; /* 테두리 색상 전환 효과 설정 */
	position: absolute;
	top: 495px;
	left: 700px;
}

#productTitle:focus {
	outline: none; /* 포커스 시 기본 아웃라인 제거 */
	border-color: #007bff; /* 포커스 시 테두리 색상 변경 */
	box-shadow: 0 0 0 3px rgba(0, 123, 255, 0.25); /* 포커스 시 그림자 효과 설정 */
}

#product-content:focus {
	outline: none; /* 포커스 시 기본 아웃라인 제거 */
	border-color: #007bff; /* 포커스 시 테두리 색상 변경 */
	box-shadow: 0 0 0 3px rgba(0, 123, 255, 0.25); /* 포커스 시 그림자 효과 설정 */
}

img {
	border-radius: 8px; /* 이미지 테두리의 둥글기를 설정합니다. */
}

.jiyong {
	position: relative;
	margin-right: 5px;
}

.delete-button {
	position: absolute;
	top: 0;
	right: 0;
	background: none;
	border: none;
	padding: 0;
}

.image-update {
	top: 40px;
	left: 700px;
	position: absolute;
}

.category-update {
	position: absolute;
	top: 250px;
	left: 680px;
}

.topGroup-li, .midGroup-li {
	list-style-type: none;
	left: 0;
}

.topPlace-li, .midPlace-li {
	list-style-type: none;
	left: 0;
}

.buyer-li {
	list-style-type: none;
	left: 0;
}

#topGroup button {
	border: none; /* 버튼의 테두리를 제거합니다. */
	background-color: transparent; /* 버튼의 배경색을 투명으로 설정합니다. */
}

#midGroup button {
	border: none; /* 버튼의 테두리를 제거합니다. */
	background-color: transparent; /* 버튼의 배경색을 투명으로 설정합니다. */
}

.price-update button {
	border: none; /* 버튼의 테두리를 제거합니다. */
	background-color: transparent; /* 버튼의 배경색을 투명으로 설정합니다. */
}

#topGroup, #midGroup {
	max-height: 200px; /* 최대 높이를 지정하여 스크롤이 나타나도록 합니다. */
	overflow-y: auto; /* 세로 스크롤이 필요할 때만 스크롤을 표시합니다. */
	width: 239px;
}

#buyer {
	max-height: 200px; /* 최대 높이를 지정하여 스크롤이 나타나도록 합니다. */
	overflow-y: auto; /* 세로 스크롤이 필요할 때만 스크롤을 표시합니다. */
	width: 480px;
}

#topPlace, #midPlace, #smallPlace {
	max-height: 200px; /* 최대 높이를 지정하여 스크롤이 나타나도록 합니다. */
	overflow-y: auto; /* 세로 스크롤이 필요할 때만 스크롤을 표시합니다. */
	width: 158px;
}

#buyer::-webkit-scrollbar {
	display: none; /* 웹킷 브라우저에서 스크롤바를 숨깁니다. */
}

#topPlace::-webkit-scrollbar {
	display: none; /* 웹킷 브라우저에서 스크롤바를 숨깁니다. */
}

#midPlace::-webkit-scrollbar {
	display: none; /* 웹킷 브라우저에서 스크롤바를 숨깁니다. */
}

#smallPlace::-webkit-scrollbar {
	display: none; /* 웹킷 브라우저에서 스크롤바를 숨깁니다. */
}

#topGroup::-webkit-scrollbar {
	display: none; /* 웹킷 브라우저에서 스크롤바를 숨깁니다. */
}

#midGroup::-webkit-scrollbar {
	display: none; /* 웹킷 브라우저에서 스크롤바를 숨깁니다. */
}

#product-content::-webkit-scrollbar {
	display: none; /* 웹킷 브라우저에서 스크롤바를 숨깁니다. */
}

.group-list {
	display: flex;
	position: absolute;
	left: 18px;
}

.place-list {
	display: flex;
	position: absolute;
	left: 18px;
}

.category-ul {
	padding-left: 0;
}

.buyer-ul {
	padding-left: 0;
}

.place-ul {
	padding-left: 0;
}

.free-button {
	left: 370px;
	position: absolute;
	color: green;
}

.suggest-button {
	left: 270px;
	position: absolute;
	color: gray;
}

#product-content {
	position: absolute;
	left: 700px;
	top: 587px;
	width: 476px;
	resize: none;
}

.contentCount {
	position: absolute;
	left: 1100px;
	top: 1115px;
}

.michael {
	position: absolute;
	left: 1137px;
	top: 1115px;
}

.place-update {
	position: absolute;
	left: 685px;
	top: 1530px;
}

.place-update button {
	border: none; /* 버튼의 테두리를 제거합니다. */
	background-color: transparent; /* 버튼의 배경색을 투명으로 설정합니다. */
}

#buyer button {
	border: none; /* 버튼의 테두리를 제거합니다. */
	background-color: transparent; /* 버튼의 배경색을 투명으로 설정합니다. */
}

.font-semibold {
	position: absolute;
	left: 700px;
	top: 1140px;
}

.state-update {
	position: absolute;
	left: 700px;
	top: 200px;
}

.iButton {
	position: absolute;
	left: 0;
	top: 975px;
	display: inline-block;
	line-height: 3;
	white-space: nowrap;
	text-align: center;
	vertical-align: middle;
	padding: 0 20px;
	border-radius: 20px;
	border: 1px solid black;
	font-weight: bold;
}

.rButton {
	position: absolute;
	left: 120px;
	top: 975px;
	display: inline-block;
	line-height: 3;
	white-space: nowrap;
	text-align: center;
	vertical-align: middle;
	padding: 0 20px;
	border-radius: 20px;
	border: 1px solid black;
	font-weight: bold;
}

.cButton {
	position: absolute;
	left: 240px;
	top: 975px;
	display: inline-block;
	line-height: 3;
	white-space: nowrap;
	text-align: center;
	vertical-align: middle;
	padding: 0 20px;
	border-radius: 20px;
	border: 1px solid black;
	font-weight: bold;
}

#buyer {
	position: absolute;
	left: 700px;
	top: 1280px;
	display: none;
}

.buyer-span {
	position: absolute;
	left: 700px;
	top: 1240px;
	color: red;
	font-size: 12px;
}

#nameMessage {
	position: absolute;
	left: 700px;
	top: 210px;
	color: red;
	font-size: 12px;
}

#priceMessage {
	position: absolute;
	left: 700px;
	top: 550px;
	color: red;
	font-size: 12px;
}

#contentMessage {
	position: absolute;
	left: 700px;
	top: 1120px;
	color: red;
	font-size: 12px;
}

#imageMessage {
	position: absolute;
	left: 700px;
	top: 130px;
	color: red;
	font-size: 12px;
}

#categoryMessage {
	position: absolute;
	left: 700px;
	top: 460px;
	color: red;
	font-size: 12px;
}

#update-button {
	position: absolute;
	left: 875px;
	top: 1800px;
	background-color: rgb(33, 33, 33);
	border-radius: 10px;
	color: rgb(255, 255, 255);
	font-size: .875rem;
	font-weight: 600;
}

#smallPlaceMessage {
	position: absolute;
	left: 1020px;
	top:1750px;
	color: red;
	font-size: 12px;
}
#midPlaceMessage {
	position: absolute;
	left: 860px;
	top:1750px;
	color: red;
	font-size: 12px;
}


</style>
</head>
<body>
    <a id="success" href="<c:url value="/product/detail?pNum=${pro.pr_num }"/>"></a> 
    <a id="login" href="<c:url value="/member/login"/>"></a>
    <a id="fail" href="<c:url value="/product/update?num=${pro.pr_num }"/>"></a>
	<div class="product-update">
		<div class="image-update" style="display: flex; height: 100px;">
			<div id="image-picker" class="image-picker">
				<button
					class="flex items-center justify-center w-20 h-20 mr-1.5 bg-jnGray-200 rounded"
					onclick="openFilePicker()">
					<div class="flex flex-col">
						<svg width="32px" height="32px" viewBox="0 0 32 32" fill="none"
							xmlns="http://www.w3.org/2000/svg" class="">
	          <path fill-rule="evenodd" clip-rule="evenodd"
								d="M15.728 20.4461C13.6481 20.4461 11.9619 18.7599 11.9619 16.68C11.9619 14.6001 13.6481 12.9138 15.728 12.9138C17.8079 12.9138 19.4942 14.6001 19.4942 16.68C19.4942 18.7599 17.8079 20.4461 15.728 20.4461Z"
								fill="#C2C6CE"></path>
	          <path fill-rule="evenodd" clip-rule="evenodd"
								d="M10.4564 7.32295C10.9376 6.00587 11.5097 5.15997 12.8118 5.15997H17.9241C19.2253 5.15997 19.7975 6.00463 20.2785 7.32003H20.7897C24.7543 7.32003 27.968 10.4192 27.968 14.2417V19.119C27.968 22.9409 24.7543 26.04 20.7897 26.04H10.6669C6.7023 26.04 3.48798 22.9409 3.48798 19.119V14.2417C3.48798 10.487 6.58918 7.4303 10.4564 7.32295ZM21.3772 16.68C21.3772 19.8001 18.8481 22.3292 15.728 22.3292C12.6079 22.3292 10.0788 19.8001 10.0788 16.68C10.0788 13.5599 12.6079 11.0308 15.728 11.0308C18.8481 11.0308 21.3772 13.5599 21.3772 16.68ZM21.5988 11.88C21.5988 12.4 22.0204 12.8216 22.5403 12.8216C23.0603 12.8216 23.4819 12.4 23.4819 11.88C23.4819 11.36 23.0603 10.9385 22.5403 10.9385C22.0204 10.9385 21.5988 11.36 21.5988 11.88Z"
								fill="#C2C6CE"></path>
	        </svg>
						<p id="imageCount" class="mt-1 text-xs text-jnGray-500"></p>
					</div>
				</button>
			</div>


			<div class="images-container" style="margin-left: 5px;">
				<ul class="file-list">
					<c:forEach items="${files}" var="file">
						<li class="file-item">
							<div
								class="jiyong flex w-full h-full overflow-hidden border border-solid border-jnGreen rounded-lg">
								<img alt="productImage-0"
									src="<c:url value="/download${file.fi_name}"/>" width="80"
									height="80" decoding="async" data-nimg="1"
									class="object-cover w-full h-full bg-gray-200 rounded-lg"
									loading="lazy" style="color: transparent;"> <input
									id="original-input" value="${file }" type="hidden">
								<button class="delete-button" onclick="deleteFile(this)">
									<svg width="20px" height="20px" viewBox="0 0 20 20" fill="none"
										xmlns="http://www.w3.org/2000/svg">
		                        <path
											d="M10 18C14.4183 18 18 14.4183 18 10C18 5.58172 14.4183 2 10 2C5.58172 2 2 5.58172 2 10C2 14.4183 5.58172 18 10 18Z"
											fill="white"></path>
		                        <path
											d="M17.5 10C17.5 14.1421 14.1421 17.5 10 17.5V18.5C14.6944 18.5 18.5 14.6944 18.5 10H17.5ZM10 17.5C5.85786 17.5 2.5 14.1421 2.5 10H1.5C1.5 14.6944 5.30558 18.5 10 18.5V17.5ZM2.5 10C2.5 5.85786 5.85786 2.5 10 2.5V1.5C5.30558 1.5 1.5 5.30558 1.5 10H2.5ZM10 2.5C14.1421 2.5 17.5 5.85786 17.5 10H18.5C18.5 5.30558 14.6944 1.5 10 1.5V2.5Z"
											fill="#DADEE5"></path>
		                        <path d="M7 7L13 13M13 7L7 13"
											stroke="#363C45" stroke-linecap="round"></path>
		                    </svg>
								</button>
							</div>
						</li>
					</c:forEach>
					<div class="jiyong add-li" style="display: flex;"></div>
				</ul>
			</div>
		</div>
		<p id="imageMessage" style="display: none;">상품 이미지가 최소 1장 필요합니다.</p>
		<input value="${pro.pr_name }" id="productTitle" name="productTitle"
			type="text" placeholder="상품명"
			class="py-2 px-4 md:px-5 w-full appearance-none border text-input text-xs lg:text-sm font-body placeholder-body min-h-12 transition duration-200 ease-in-out bg-white border-gray-300 focus:border-heading h-11 md:h-12 focus:outline-none rounded-md"
			autocomplete="off" spellcheck="false" aria-invalid="false">
		<p id="nameMessage" style="display: none;">최대 30자까지 입력할 수 있습니다.</p>
		<section class="category-update" style="height: 100px;">
			<div
				class="group-list flex-row w-full overflow-hidden text-sm font-medium h-60">
				<div id="topGroup"
					class="w-1/2 h-full overflow-y-auto border border-solid rounded border-jnGray-300">
					<ul
						class="category-ul flex flex-col border-solid border-jnGray-300">
						<c:forEach items="${topList }" var="top">
							<li class="false h-10 p-3 topGroup-li">
								<button>
									<p class="truncate break-keep"
										style="font-weight: normal; font-size: 15px; color: initial;">${top.tg_title }</p>
								</button>
							</li>
						</c:forEach>
					</ul>
				</div>
				<div id="midGroup"
					class="w-1/2 h-full overflow-y-auto border border-solid rounded border-jnGray-300">
					<ul
						class="category-ul flex flex-col border-solid border-jnGray-300">
						<c:forEach items="${midList }" var="mid">
							<li class="false h-10 p-3 midGroup-li"
								data-value="${mid.mg_num }">
								<button>
									<p class="truncate break-keep"
										style="font-weight: normal; font-size: 15px; color: initial;">${mid.mg_title }</p>
								</button>
							</li>
						</c:forEach>
					</ul>
				</div>
			</div>
		</section>
		<p id="categoryMessage"></p>
		<div id="price-update"
			class="price-update flex items-center justify-between w-full border border-gray-300 border-solid rounded px-4  text-base scale-85 origin-top-left -mb-3  w-[117.65%] p-6  h-[60px] false">
			<label for="search" class="flex items-center py-0.5 w-2/3"> <span
				id="won"
				style="color : <c:if test="${pro.pr_price == 0 }">green</c:if> <c:if test="${pro.pr_price == -10 }">gray</c:if>;">₩</span>
				<input id="price-input" name="productPrice" type="text"
				inputmode="numeric"
				class="ml-1 bg-white focus:outline-none h-11 md:h-12 placeholer-jnGray-500 w-2/3 disabled:opacity-100 placeholer-jnGray-500"
				placeholder="판매가격" value="${price}" autocomplete="off"
				oninput="formatNumber(this)"
				style="color : <c:if test="${pro.pr_price == 0 }">green</c:if> <c:if test="${pro.pr_price == -10 }">gray</c:if> ; border : none; outline : none;"
				<c:if test="${pro.pr_price ==0 || pro.pr_price == -10 }">disabled</c:if>>
			</label>
			<button
				class="free-button flex items-center justify-center text-center text-jnGray-900">
				<svg width="22" height="22" viewBox="0 0 22 22"
					fill="<c:if test="${pro.pr_price == 0 }">rgb(13, 204, 90)</c:if> <c:if test="${pro.pr_price != 0 }">#FFFFFF</c:if> "
					xmlns="http://www.w3.org/2000/svg" class="mr-1 ">
		<path
						d="M12 21C16.9706 21 21 16.9706 21 12C21 7.02944 16.9706 3 12 3C7.02944 3 3 7.02944 3 12C3 16.9706 7.02944 21 12 21Z"
						stroke="<c:if test="${pro.pr_price == 0 }">rgb(13, 204, 90)</c:if> <c:if test="${pro.pr_price != 0 }">#9CA3AF</c:if>" stroke-width="1.5" stroke-linecap="round"
						stroke-linejoin="round"></path>
		<path d="M16 9L10.5 14.5L8 12" stroke="<c:if test="${pro.pr_price == 0 }">white</c:if> <c:if test="${pro.pr_price != 0 }">#C2C6CE</c:if>" stroke-width="1.5"
						stroke-linecap="round" stroke-linejoin="round"></path>
		</svg>
				무료나눔
			</button>
			<button
				class="suggest-button flex items-center justify-center text-center text-jnGray-900">
				<svg width="22" height="22" viewBox="0 0 22 22"
					fill="<c:if test="${pro.pr_price == -10 }">rgb(13, 204, 90)</c:if> <c:if test="${pro.pr_price != -10 }">#FFFFFF</c:if>"
					xmlns="http://www.w3.org/2000/svg" class="mr-1 ">
		<path
						d="M12 21C16.9706 21 21 16.9706 21 12C21 7.02944 16.9706 3 12 3C7.02944 3 3 7.02944 3 12C3 16.9706 7.02944 21 12 21Z"
						stroke="<c:if test="${pro.pr_price == -10 }">rgb(13, 204, 90)</c:if> <c:if test="${pro.pr_price != -10 }">#9CA3AF</c:if>" stroke-width="1.5" stroke-linecap="round"
						stroke-linejoin="round"></path>
		<path d="M16 9L10.5 14.5L8 12" stroke="<c:if test="${pro.pr_price == -10 }">white</c:if> <c:if test="${pro.pr_price != -10 }">#C2C6CE</c:if>" stroke-width="1.5"
						stroke-linecap="round" stroke-linejoin="round"></path>
		</svg>
				가격제안
			</button>
		</div>
		<p id="priceMessage"></p>
		<div class="content-update">
			<textarea id="product-content" name="product-content"
				class="px-4 py-3 items-center w-full rounded appearance-none transition duration-300 ease-in-out text-heading text-sm focus:outline-none focus:ring-0 bg-white border border-gray-300 focus:shadow focus:outline-none focus:border-heading placeholder-body inline-block w-full px-4 py-4 mt-6 outline-none align-middle overflow-x-scroll appearance-none resize-none border-solid border border-jnGray-300 placeholder:text-jnGray-500 h-[220px] text-sm"
				autocomplete="off" spellcheck="false" rows="20"
				data-gtm-form-interact-field-id="0"
				placeholder="- 상품명(브랜드)																																																- 모델명																																																- 구매 시기																																																- 사용 기간																																																- 하자 여부																																																* 실제 촬영한 사진과 함께 상세 정보를 입력해주세요.																																																																																																 																																																안전하고 건전한 거래환경을 위해 과학기술정보통신부,                 한국인터넷진흥원, 가지가 함께합니다.">${pro.content }</textarea>
			<p id="contentMessage"></p>
			<span id="contentCount"
				class="contentCount absolute right-0 text-sm leading-5 text-gray-400">${count }</span>
			<span class="michael">/1000</span>
		</div>
		<p class="font-semibold">상품상태</p>
		<p id="midPlaceMessage"></p>
		<p id="smallPlaceMessage"></p>
		<div id="state-update" class="state-update flex gap-3">
			<button class="iButton"
				style="background-color : ${pro.pr_ps_state eq '판매중' ? 'rgb(13 204 90)' : 'transparent'}; color :  ${pro.pr_ps_state eq '판매중' ? 'rgb(255 255 255)' : ''}; border-color : ${pro.pr_ps_state eq '판매중' ? 'rgb(13 204 90)' : ''};">판매중</button>
			<button class="rButton"
				style="background-color : ${pro.pr_ps_state eq '예약중' ? 'rgb(13 204 90)' : 'transparent'}; color :  ${pro.pr_ps_state eq '예약중' ? 'rgb(255 255 255)' : ''}; border-color : ${pro.pr_ps_state eq '예약중' ? 'rgb(13 204 90)' : ''};">예약중</button>
			<button class="cButton"
				style="background-color : ${pro.pr_ps_state eq '판매완료' ? 'rgb(13 204 90)' : 'transparent'}; color :  ${pro.pr_ps_state eq '판매완료' ? 'rgb(255 255 255)' : ''}; border-color : ${pro.pr_ps_state eq '판매완료' ? 'rgb(13 204 90)' : ''};">판매완료</button>
		</div>
		<span id="buyer-span" class="buyer-span"></span>
		<div id="buyer"
			class="overflow-y-auto border border-solid rounded border-jnGray-300">
		</div>
		<section class="place-update">
			<div
				class="place-list flex-row w-full overflow-hidden text-sm font-medium h-60">
				<div id="topPlace"
					class="w-1/3 h-full overflow-y-auto border border-solid rounded border-jnGray-300">
					<ul class="place-ul flex flex-col border-solid border-jnGray-300">
						<c:forEach items="${sidoList }" var="sido">
							<li class="false h-10 p-3 topPlace-li">
								<button>
									<p class="truncate break-keep"
										style="font-weight: normal; font-size: 15px; color: initial;">${sido.sido }</p>
								</button>
							</li>
						</c:forEach>
					</ul>
				</div>
				<div id="midPlace"
					class="w-1/3 h-full overflow-y-auto border border-solid rounded border-jnGray-300">
					<ul class="place-ul flex flex-col border-solid border-jnGray-300">
						<c:forEach items="${guList }" var="gu">
							<li class="false h-10 p-3 midPlace-li">
								<button>
									<p class="truncate break-keep"
										style="font-weight: normal; font-size: 15px; color: initial;">${gu.sigungu }</p>
								</button>
							</li>
						</c:forEach>
					</ul>
				</div>
				<div id="smallPlace"
					class="w-1/3 h-full overflow-y-auto border border-solid rounded border-jnGray-300">
					<ul class="place-ul flex flex-col border-solid border-jnGray-300">
						<c:forEach items="${dongList }" var="dong">
							<li class="false h-10 p-3 midPlace-li">
								<button>
									<p class="truncate break-keep"
										style="font-weight: normal; font-size: 15px; color: initial;">${dong.h_dong_nm }</p>
								</button>
							</li>
						</c:forEach>
					</ul>
				</div>
			</div>
		</section>
		<button id="update-button" data-variant="flat"
			class="text-[13px] md:text-sm leading-4 inline-flex items-center cursor-pointer transition ease-in-out duration-300 font-semibold font-body text-center justify-center border-0 border-transparent placeholder-white focus-visible:outline-none focus:outline-none rounded-md bg-heading text-white px-5 md:px-6 lg:px-8 py-4 md:py-3.5 lg:py-4 hover:text-white hover:bg-gray-600 hover:shadow-cart w-[20%] break-keep"
			type="submit">수정</button>
	</div>

	<script type="text/javascript">
//이미지 갯수를 세어 화면에 표시하는 함수
function displayImageCount() {
    // ul 요소의 자식 노드 중 li 요소의 개수를 가져옴
    const imageCount = document.querySelectorAll('.file-list li').length;
    
    const containerCount = document.querySelectorAll('.add-img').length;
    
    const tatalCount = imageCount + containerCount;
    
    // 이미지 갯수를 표시할 요소를 가져옴
    const countElement = document.getElementById('imageCount');
      
    // 이미지 갯수를 화면에 표시
    countElement.textContent = tatalCount + '/5';
}

//페이지 로드시 이미지 갯수를 표시
window.addEventListener('load', displayImageCount);




//이미지 삭제 버튼 클릭 시 실행될 함수
function deleteFile(button) {
    // 삭제 버튼이 속한 부모 요소의 부모 요소를 찾아서 제거 (즉, li 태그 제거)
    button.parentNode.parentNode.remove();
    // 이때, 개수 다시 리뉴얼
    displayImageCount(); 
    
    button.parentNode.remove();// input에서 제거
}


function openFilePicker(){
    // type 이 file인 새로운 input 요소 만들고  그거  클릭
    var fileInput = document.createElement('input');
    fileInput.type = 'file';
    fileInput.classList.add('file-input');
    fileInput.setAttribute('name', 'file'); // name 속성을 "file"로 설정
    fileInput.style.display = 'none'; 
    fileInput.addEventListener('change', function(event) {
        handleFileSelect(event, fileInput); // handleFileSelect 함수 호출 시 fileInput 변수를 전달
    }, false); // 파일 입력(input) 요소에 이벤트 리스너 추가 
    fileInput.addEventListener('input', function(event) {
    	 fileInput.remove();// fileInput 없애기
    }, false);
    fileInput.click();
} 

function handleFileSelect(event, fileInput) {
    const files = event.target.files; // 선택된 파일들의 배열
    
    // 파일을 화면에 보이게 하기
    for (let i = 0; i < files.length; i++) {
        const file = files[i];
        displayFile(file,fileInput);
    }
    
    
}


function displayFile(file,fileInput) {
	const countElement = document.getElementById('imageCount');
	const value1 = countElement.textContent.trim();
	const value = value1.split('/')[0];

	if(value==5){
		alert("최대 5장까지 가능합니다.");
		 fileInput.remove();// fileInput 없애기 
		return;
	}
	
    const reader = new FileReader();
    
    // 파일 읽기가 완료되면 호출되는 콜백 함수
    reader.onload = function(e) {
        // 이미지를 담는 div 요소 생성
        const container = document.createElement('div');
        container.classList.add('jiyong'); // 컨테이너에 클래스 추가
        
        // 이미지 요소 생성 및 설정
        const img = document.createElement('img');
        img.src = e.target.result; // 파일 데이터의 URL을 설정
        img.width = 80; // 이미지 너비 조절
        img.height = 80; // 이미지 높이 조절
        img.classList.add('add-img'); // 이미지에 클래스 추가
        
        // 이미지를 담는 div 요소 생성
        const imgContainer = document.createElement('div');
        imgContainer.appendChild(img); // 이미지를 div에 추가
        
        // 버튼 요소 생성 및 설정
        const button = document.createElement('button');
        button.classList.add('delete-button'); // 버튼에 클래스 추가
        button.onclick = function() {
            container.remove(); // 버튼을 클릭하면 컨테이너 요소 삭제
            displayImageCount();
        };
        
        // SVG 아이콘 요소 생성 및 설정
        const svg = document.createElementNS('http://www.w3.org/2000/svg', 'svg');
        svg.setAttribute('width', '20px');
        svg.setAttribute('height', '20px');
        svg.setAttribute('viewBox', '0 0 20 20');
        svg.setAttribute('fill', 'none');
        
        const path1 = document.createElementNS('http://www.w3.org/2000/svg', 'path');
        path1.setAttribute('d', 'M10 18C14.4183 18 18 14.4183 18 10C18 5.58172 14.4183 2 10 2C5.58172 2 2 5.58172 2 10C2 14.4183 5.58172 18 10 18Z');
        path1.setAttribute('fill', 'white');
        
        const path2 = document.createElementNS('http://www.w3.org/2000/svg', 'path');
        path2.setAttribute('d', 'M17.5 10C17.5 14.1421 14.1421 17.5 10 17.5V18.5C14.6944 18.5 18.5 14.6944 18.5 10H17.5ZM10 17.5C5.85786 17.5 2.5 14.1421 2.5 10H1.5C1.5 14.6944 5.30558 18.5 10 18.5V17.5ZM2.5 10C2.5 5.85786 5.85786 2.5 10 2.5V1.5C5.30558 1.5 1.5 5.30558 1.5 10H2.5ZM10 2.5C14.1421 2.5 17.5 5.85786 17.5 10H18.5C18.5 5.30558 14.6944 1.5 10 1.5V2.5Z');
        path2.setAttribute('fill', '#DADEE5');
        
        const path3 = document.createElementNS('http://www.w3.org/2000/svg', 'path');
        path3.setAttribute('d', 'M7 7L13 13M13 7L7 13');
        path3.setAttribute('stroke', '#363C45');
        path3.setAttribute('stroke-linecap', 'round');
        
        svg.appendChild(path1);
        svg.appendChild(path2);
        svg.appendChild(path3);
        
        button.appendChild(svg);
        
        // 버튼을 담는 div 요소 생성
        const buttonContainer = document.createElement('div');
        buttonContainer.style.position = 'absolute'; // 상대적 위치 설정
        buttonContainer.style.top = '0'; // 이미지의 상단에 위치
        buttonContainer.style.right = '0'; // 이미지의 오른쪽에 위치
        buttonContainer.appendChild(button); // 버튼을 div에 추가
        
        // input 담는 div 요소 생성
        const inputContainer = document.createElement('div');
        inputContainer.appendChild(fileInput);
        
        // 이미지와 버튼을 담는 컨테이너에 이미지와 버튼 컨테이너 추가
        container.appendChild(imgContainer); 
        container.appendChild(buttonContainer);
        container.appendChild(inputContainer);

        // 선택한 요소에 컨테이너 추가
        const addLiElement = document.querySelector('.add-li');
        addLiElement.appendChild(container);
        displayImageCount();
    };
    
    // 파일 읽기 시작
    reader.readAsDataURL(file);
    imageMessage.style.display = "none";
    
}



document.addEventListener('DOMContentLoaded', function() {
	var pNum = '${pro.pr_num}';
    var serverText = '${pro.pr_tg_name}';
    var serverText1 = '${pro.pr_mg_name}';
    var buttons = document.querySelectorAll('#topGroup button');
    var buttons1 = document.querySelectorAll('#midGroup button');
    
    buttons.forEach(function(button) {
        var buttonText = button.querySelector('p').textContent.trim();
        if (buttonText === serverText) {
            button.classList.add('selected');
            button.querySelector('p').style.fontWeight = 'bold'; // 진하게 만들기
            button.querySelector('p').style.color = 'black'; // 진하게 만들기
            button.closest('li').style.backgroundColor = '#ced4da';// 버튼 포함하는 li의 배경색을 회색으로 
        }
        
        button.addEventListener('click', function() {
            buttons.forEach(function(btn) {
                btn.classList.remove('selected');
                btn.querySelector('p').style.fontWeight = 'normal'; // 모든 버튼 스타일 초기화
                btn.closest('li').style.backgroundColor = ''; // 버튼 포함하는 li의 배경색을 기본으로 
                btn.querySelector('p').style.color = 'initial';
            });
            
            button.classList.add('selected');
            button.querySelector('p').style.fontWeight = 'bold'; // 클릭한 버튼 스타일 변경          
            button.querySelector('p').style.color = 'black';
            button.closest('li').style.backgroundColor = '#ced4da';
            console.log(pNum);
            sendTop(button);
        });      
    });
    
    
    buttons1.forEach(function(button) {
        var buttonText = button.querySelector('p').textContent.trim();
        
        if (buttonText === serverText1) {
            button.classList.add('selected');
            button.querySelector('p').style.fontWeight = 'bold'; // 진하게 만들기
            button.querySelector('p').style.color = 'black'; // 진하게 만들기            
            button.closest('li').style.backgroundColor = '#ced4da';// 버튼 포함하는 li의 배경색을 회색으로 
        }
        
        button.addEventListener('click', function() {
            buttons1.forEach(function(btn) {
                btn.classList.remove('selected');
                btn.querySelector('p').style.fontWeight = 'normal'; // 모든 버튼 스타일 초기화 
                btn.closest('li').style.backgroundColor = ''; // 버튼 포함하는 li의 배경색을 기본으로 
                btn.querySelector('p').style.color = 'initial';
            });
            
            button.classList.add('selected');
            button.querySelector('p').style.fontWeight = 'bold'; // 클릭한 버튼 스타일 변경          
            button.querySelector('p').style.color = 'black'; 
            button.closest('li').style.backgroundColor = '#ced4da';
        });      
    });
});

document.addEventListener('DOMContentLoaded', function() {
	var pNum = '${pro.pr_num}';
    var serverText = '${sido}';
    var serverText1 = '${gu}';
    var serverText2 = '${dong}';
    var buttons = document.querySelectorAll('#topPlace button');
    var buttons1 = document.querySelectorAll('#midPlace button');
    var buttons2 = document.querySelectorAll('#smallPlace button');
    
    buttons.forEach(function(button) {
        var buttonText = button.querySelector('p').textContent.trim();
        if (buttonText === serverText) {
            button.classList.add('selected');
            button.querySelector('p').style.fontWeight = 'bold'; // 진하게 만들기
            button.querySelector('p').style.color = 'black'; // 진하게 만들기
            button.closest('li').style.backgroundColor = '#ced4da';// 버튼 포함하는 li의 배경색을 회색으로 
        }
        
        button.addEventListener('click', function() {
            buttons.forEach(function(btn) {
                btn.classList.remove('selected');
                btn.querySelector('p').style.fontWeight = 'normal'; // 모든 버튼 스타일 초기화
                btn.closest('li').style.backgroundColor = ''; // 버튼 포함하는 li의 배경색을 기본으로 
                btn.querySelector('p').style.color = 'initial';
            });

            button.classList.add('selected');
            button.querySelector('p').style.fontWeight = 'bold'; // 클릭한 버튼 스타일 변경          
            button.querySelector('p').style.color = 'black';
            button.closest('li').style.backgroundColor = '#ced4da';
            sendTopPlace(button);
        });      
    });
    
    
    buttons1.forEach(function(button) {
        var buttonText = button.querySelector('p').textContent.trim();
        
        if (buttonText === serverText1) {
            button.classList.add('selected');
            button.querySelector('p').style.fontWeight = 'bold'; // 진하게 만들기
            button.querySelector('p').style.color = 'black'; // 진하게 만들기            
            button.closest('li').style.backgroundColor = '#ced4da';// 버튼 포함하는 li의 배경색을 회색으로 
        }
        
        button.addEventListener('click', function() {
            buttons1.forEach(function(btn) {
                btn.classList.remove('selected');
                btn.querySelector('p').style.fontWeight = 'normal'; // 모든 버튼 스타일 초기화 
                btn.closest('li').style.backgroundColor = ''; // 버튼 포함하는 li의 배경색을 기본으로 
                btn.querySelector('p').style.color = 'initial';
            });
            
            button.classList.add('selected');
            button.querySelector('p').style.fontWeight = 'bold'; // 클릭한 버튼 스타일 변경          
            button.querySelector('p').style.color = 'black'; 
            button.closest('li').style.backgroundColor = '#ced4da';
            sendMidPlace(button);
        });      
    });
    
    buttons2.forEach(function(button) {
        var buttonText = button.querySelector('p').textContent.trim();
        
        if (buttonText === serverText2) {
            button.classList.add('selected');
            button.querySelector('p').style.fontWeight = 'bold'; // 진하게 만들기
            button.querySelector('p').style.color = 'black'; // 진하게 만들기            
            button.closest('li').style.backgroundColor = '#ced4da';// 버튼 포함하는 li의 배경색을 회색으로 
        }
        
        button.addEventListener('click', function() {
            buttons2.forEach(function(btn) {
                btn.classList.remove('selected');
                btn.querySelector('p').style.fontWeight = 'normal'; // 모든 버튼 스타일 초기화 
                btn.closest('li').style.backgroundColor = ''; // 버튼 포함하는 li의 배경색을 기본으로 
                btn.querySelector('p').style.color = 'initial';
            });
            
            button.classList.add('selected');
            button.querySelector('p').style.fontWeight = 'bold'; // 클릭한 버튼 스타일 변경          
            button.querySelector('p').style.color = 'black'; 
            button.closest('li').style.backgroundColor = '#ced4da';
        });      
    });
 
});


function sendTop(button) {
	var categoryMessage = document.getElementById("categoryMessage");
	var pNum = '${pro.pr_num}';
	var topName = button.querySelector('p').textContent.trim();
    var data = {
       "topName" : topName,
       "pNum" : pNum
    };

    console.log(data)
    // AJAX 요청
    $.ajax({
    	async : false,
        type: "get",
        url: '<c:url value="/product/update1"/>', 
        data: data, // 보낼 데이터 입력
        dataType : "json",
        success: function(data) {
            // 성공적으로 응답을 받았을 때 실행할 코드
            addMid(data.mids, data.mName);
            categoryMessage.textContent = "";// 메시지 클리어
        },
        error: function(xhr, status, error) {
            // 요청이 실패했을 때 실행할 코드
            console.error("Error sending data:", error);
        }
    });
} 


function sendTopPlace(button) {
	var midPlaceMessage = document.getElementById('midPlaceMessage');
	var smallPlaceMessage = document.getElementById('smallPlaceMessage');
	var pNum = '${pro.pr_num}';
	var topPlace = button.querySelector('p').textContent.trim();
    var data = {
       "topPlace" : topPlace,
       "pNum" : pNum
    };
    // AJAX 요청
    $.ajax({
    	async : false,
        type: "get",
        url: '<c:url value="/product/update2"/>', 
        data: data, // 보낼 데이터 입력
        dataType : "json",
        success: function(data) {
            // 성공적으로 응답을 받았을 때 실행할 코드
            addMidPlace(data.guList, data.gu);
            removeSmallPlace();// 동 공간을 리셋하는 작업
            midPlaceMessage.textContent = "";// 메시지 클리어
            smallPlaceMessage.textContent = "";// 메시지 클리어
        },
        error: function(xhr, status, error) {
            // 요청이 실패했을 때 실행할 코드
            console.error("Error sending data:", error);
        }
    });
}

function removeSmallPlace(){
	let str = '';
	$("#smallPlace").html(str);
}

function sendMidPlace(button) {
	var pNum = '${pro.pr_num}';
	var midPlace = button.querySelector('p').textContent.trim();
    var data = {
       "midPlace" : midPlace,
       "pNum" : pNum
    };

    // AJAX 요청
    $.ajax({
    	async : false,
        type: "get",
        url: '<c:url value="/product/update3"/>', 
        data: data, // 보낼 데이터 입력
        dataType : "json",
        success: function(data) {
            // 성공적으로 응답을 받았을 때 실행할 코드
            addSmallPlace(data.dongList, data.dong);
        },
        error: function(xhr, status, error) {
            // 요청이 실패했을 때 실행할 코드
            console.error("Error sending data:", error);
        }
    });
}

function addMid(mids,mName){
	
	let str = '';
	str += `<ul class="category-ul flex flex-col border-solid border-jnGray-300">`;
	for(let i=0; i<mids.length; i++){
		const mid = mids[i];
		if(mName === mid.mg_title){
			str+=`<li class="false h-10 p-3 midGroup-li" style="background-color : #ced4da; " data-value="\${mid.mg_num }">
			      <button onClick="clickMid(this)">
			      <p class="truncate break-keep" style="font-weight : bold; color : black; font-size : 15px;">\${mid.mg_title }</p>
			      </button>
				  </li>`;
		}else{
			str+=`<li class="false h-10 p-3 midGroup-li" data-value="\${mid.mg_num }">
			      <button onClick="clickMid(this)">
			      <p class="truncate break-keep" style="font-weight : normal; color : initial; font-size : 15px; ">\${mid.mg_title }</p>
			      </button>
				  </li>`;
		}
	}
	str+=`</ul>`;
	 $("#midGroup").html(str);
}

function addMidPlace(mids, gu){
	
	let str = '';
	str += `<ul class="place-ul flex flex-col border-solid border-jnGray-300">`;
	for(let i=0; i<mids.length; i++){
		const mid = mids[i];
		if(gu === mid.sigungu){
			str+=`<li class="false h-10 p-3 midPlace-li" style="background-color : #ced4da; ">
			      <button onClick="clickMidPlace(this)">
			      <p class="truncate break-keep" style="font-weight : bold; color : black; font-size : 15px;">\${mid.sigungu }</p>
			      </button>
				  </li>`;
		}else{
			str+=`<li class="false h-10 p-3 midPlace-li">
			      <button onClick="clickMidPlace(this)">
			      <p class="truncate break-keep" style="font-weight : normal; color : initial; font-size : 15px; ">\${mid.sigungu}</p>
			      </button>
				  </li>`;
		}
	}
	str+=`</ul>`;
	 $("#midPlace").html(str);
}


function addSmallPlace(smalls, dong){
	
	let str = '';
	str += `<ul class="place-ul flex flex-col border-solid border-jnGray-300">`;
	for(let i=0; i<smalls.length; i++){
		const small = smalls[i];
		if(dong === small.h_dong_nm){
			str+=`<li class="false h-10 p-3 smallPlace-li" style="background-color : #ced4da; ">
			      <button onClick="clickSmallPlace(this)">
			      <p class="truncate break-keep" style="font-weight : bold; color : black; font-size : 15px;">\${small.h_dong_nm }</p>
			      </button>
				  </li>`;
		}else{
			str+=`<li class="false h-10 p-3 smallPlace-li">
			      <button onClick="clickSmallPlace(this)">
			      <p class="truncate break-keep" style="font-weight : normal; color : initial; font-size : 15px; ">\${small.h_dong_nm}</p>
			      </button>
				  </li>`;
		}
	}
	str+=`</ul>`;
	 $("#smallPlace").html(str);
}


function clickMidPlace(button){
	 var midPlaceMessage = document.getElementById('midPlaceMessage');
	 var smallPlaceMessage = document.getElementById('smallPlaceMessage');
	 var buttons1 = document.querySelectorAll('#midPlace button');
	 buttons1.forEach(function(btn) {
    btn.classList.remove('selected');
    btn.querySelector('p').style.fontWeight = 'normal'; // 모든 버튼 스타일 초기화                
    btn.querySelector('p').style.color = 'initial';
    btn.closest('li').style.backgroundColor = ''; // 버튼 포함하는 li의 배경색을 기본으로 
    });
	 
	button.classList.add('selected');
    button.querySelector('p').style.fontWeight = 'bold'; // 클릭한 버튼 스타일 변경          
    button.querySelector('p').style.color = 'black'; 	
    button.closest('li').style.backgroundColor = '#ced4da'; // 버튼 포함하는 li의 배경색을 회색으로
    midPlaceMessage.textContent = "";// 시군구 메시지 클리어
    smallPlaceMessage.textContent = ""; // 동 메시지 클리어
    sendMidAddr(button);
}


function sendMidAddr(button) {
	var pNum = '${pro.pr_num}';
	var topPlace = document.querySelector("#topPlace .selected").querySelector('p').textContent.trim();
	var midPlace = button.querySelector('p').textContent.trim();
    var data = {
       "midPlace" : midPlace,
       "topPlace" : topPlace,
       "pNum" : pNum
    };

    // AJAX 요청
    $.ajax({
    	async : false,
        type: "get",
        url: '<c:url value="/product/update4"/>', 
        data: data, // 보낼 데이터 입력
        dataType : "json",
        success: function(data) {
            // 성공적으로 응답을 받았을 때 실행할 코드
            addSmallPlace(data.dongList, data.dong);
        },
        error: function(xhr, status, error) {
            // 요청이 실패했을 때 실행할 코드
            console.error("Error sending data:", error);
        }
    });
}



function clickSmallPlace(button){
	var smallPlaceMessage = document.getElementById('smallPlaceMessage');
	var buttons2 = document.querySelectorAll('#smallPlace button');
	 buttons2.forEach(function(btn) {
   btn.classList.remove('selected');
   btn.querySelector('p').style.fontWeight = 'normal'; // 모든 버튼 스타일 초기화                
   btn.querySelector('p').style.color = 'initial';
   btn.closest('li').style.backgroundColor = ''; // 버튼 포함하는 li의 배경색을 기본으로 
   });
	 
   button.classList.add('selected');
   button.querySelector('p').style.fontWeight = 'bold'; // 클릭한 버튼 스타일 변경          
   button.querySelector('p').style.color = 'black'; 	
   button.closest('li').style.backgroundColor = '#ced4da'; // 버튼 포함하는 li의 배경색을 회색으로
   smallPlaceMessage.textContent = ""; // 동 메시지 클리어
}

function clickMid(button){
	 var buttons1 = document.querySelectorAll('#midGroup button');
	 var categoryMessage = document.getElementById("categoryMessage");
	 buttons1.forEach(function(btn) {
     btn.classList.remove('selected');
     btn.querySelector('p').style.fontWeight = 'normal'; // 모든 버튼 스타일 초기화                
     btn.querySelector('p').style.color = 'initial';
     btn.closest('li').style.backgroundColor = ''; // 버튼 포함하는 li의 배경색을 기본으로 
     });
	 
	 button.classList.add('selected');
     button.querySelector('p').style.fontWeight = 'bold'; // 클릭한 버튼 스타일 변경          
     button.querySelector('p').style.color = 'black'; 	
     button.closest('li').style.backgroundColor = '#ced4da'; // 버튼 포함하는 li의 배경색을 회색으로
     categoryMessage.textContent = "";// 메시지 클리어
}

	const container = document.getElementById('price-update');
	const inputField = document.getElementById('price-input');
	
	inputField.addEventListener('focus', function() {
		container.style.outline = 'none';  /* 포커스 시 기본 아웃라인 제거 */
	    container.style.borderColor = '#007bff'; // 클릭했을 때 테두리 색상 변경
	    container.style.boxShadow = '0 0 0 3px rgba(0, 123, 255, 0.25)'; /* 포커스 시 그림자 효과 설정 */
	});
	
	inputField.addEventListener('blur', function() {
		container.style.outline = '';  /* 기본 아웃라인 복원 */
		container.style.borderColor = ''; // 테두리 색상 초기화
		container.style.boxShadow = ''; /* 그림자 효과 초기화 */
	});

	const freeButton = document.querySelector('.free-button');
	const freeIcon = freeButton.querySelector('svg');
	const suggestButton = document.querySelector('.suggest-button');
	const suggestIcon = suggestButton.querySelector('svg');
	const priceInput = document.getElementById("price-input");
	const won = document.getElementById("won");
	
	freeButton.addEventListener('click', function() {
		var freePath1 = freeButton.querySelector('path:first-of-type');
		var freePath2 = freeButton.querySelector('path:nth-of-type(2)');
		var suggestPath1 = suggestButton.querySelector('path:first-of-type');
		var suggestPath2 = suggestButton.querySelector('path:nth-of-type(2)');
		const freeValue = freeIcon.getAttribute('fill');
		if(freeValue === 'rgb(13, 204, 90)'){
			freeIcon.setAttribute('fill', '#FFFFFF'); // 아이콘의 색상을 기본으로 변경
			freePath1.style.stroke="#9CA3AF";
			freePath2.style.stroke="#C2C6CE";
			won.style.color=""; // 색 기본으로
			priceInput.style.color="";
			priceInput.value = ""; // 가격입력창 비우기
			priceInput.disabled= false;
		}else{
			freeIcon.setAttribute('fill', 'rgb(13, 204, 90)'); // 아이콘의 색상을 초록색으로 변경
			priceInput.value = "무료나눔"; // 가격입력창에 무료나눔이라고 뜨게 하기
			priceInput.disabled= true;
			priceInput.style.color = "green"; // 색은 초록색으로
			won.style.color="green"; // 마찬가지로 초록색으로
			freePath1.style.stroke="rgb(13, 204, 90)";
			freePath2.style.stroke="white";
			suggestIcon.setAttribute('fill', '#FFFFFF'); // 아이콘의 색상을 기본으로 변경
			suggestPath1.style.stroke="#9CA3AF";
			suggestPath2.style.stroke="#C2C6CE";
		}    
	});
	
	suggestButton.addEventListener('click', function() {
		var freePath1 = freeButton.querySelector('path:first-of-type');
		var freePath2 = freeButton.querySelector('path:nth-of-type(2)');
		var suggestPath1 = suggestButton.querySelector('path:first-of-type');
		var suggestPath2 = suggestButton.querySelector('path:nth-of-type(2)');
		const suggestValue = suggestIcon.getAttribute('fill');
		if(suggestValue === 'rgb(13, 204, 90)'){
			suggestIcon.setAttribute('fill', '#FFFFFF'); // 아이콘의 색상을 기본으로 변경
			priceInput.value = ""; // 가격입력창 비우기
			won.style.color=""; // 색 기본으로
			suggestPath1.style.stroke="#9CA3AF";
			suggestPath2.style.stroke="#C2C6CE";
			priceInput.style.color="";
			priceInput.disabled= false;
		}else{
			suggestIcon.setAttribute('fill', 'rgb(13, 204, 90)'); // 아이콘의 색상을 초록색으로 변경
			priceInput.value = "가격제안"; // 가격입력창에 무료나눔이라고 뜨게 하기
			priceInput.style.color = "gray"; // 색은 회색으로
			won.style.color="gray"; // 마찬가지로 회색으로
			suggestPath1.style.stroke="rgb(13, 204, 90)";
			suggestPath2.style.stroke="white";
			freeIcon.setAttribute('fill', '#FFFFFF'); // 아이콘의 색상을 기본으로 변경
			freePath1.style.stroke="#9CA3AF";
			freePath2.style.stroke="#C2C6CE";
			priceInput.disabled= true;
		}   
	});
	
	<!--가격 입력시 작용 -->
	priceInput.addEventListener('input', function() {
	    var priceMessage = document.getElementById("priceMessage");
	    let value = this.value;
	    
	    if (value === "" || value === null || isNaN(Number(value))) {
	        // 입력 값이 없거나 숫자가 아니면 빈 문자열로 설정
	        this.value = "";
	        priceMessage.style.display = "none"; // 메시지 숨김
	    } else {
	        // 입력값을 숫자로 변환하여 최대값을 확인
	        const numericValue = Number(value.replaceAll(',', ''));
	        if (numericValue <= 100000000) {
	            // 최대값 이내의 값인 경우 표시를 업데이트
	            const formatValue = numericValue.toLocaleString('ko-KR');
	            this.value = formatValue; 
	            priceMessage.style.display = "none"; // 메시지 숨김
	        } else {
	            // 최대값을 초과하는 경우 입력을 막고 메시지를 표시
	            this.value = value.slice(0, 8); // 100,000,000 이상의 값은 100,000,000으로 제한
	            const formatValue = Number(this.value.replaceAll(',', '')).toLocaleString('ko-KR');
	            this.value = formatValue; // 콤마 추가
	            priceMessage.style.display = "block"; 
	            priceMessage.textContent = "최대 1억원까지 입력 가능합니다."; // 메시지 표시
	        }
	    }
	});
	
	var iButton = document.querySelector(".iButton");
	var rButton = document.querySelector(".rButton");
	var cButton = document.querySelector(".cButton");
	
	var stateButtons = document.querySelectorAll('.state-update button');
	
	iButton.addEventListener('click', function() {
		var buyer = document.getElementById("buyer");
		var buyerSpan = document.querySelector(".buyer-span");
		var stateButtons = document.querySelectorAll('.state-update button');
		    stateButtons.forEach(function(btn) {
		    btn.style.backgroundColor = 'transparent'; // 버튼의 배경색을 기본으로 
		    btn.style.color = '';
		    btn.style.borderColor = '';
		    });
		iButton.style.backgroundColor = 'rgb(13 204 90)';
		iButton.style.color = 'rgb(255 255 255)';
		iButton.style.borderColor = 'rgb(13 204 90)';
		buyerSpan.textContent="";
		buyer.style.display = "none";
	});
	
	rButton.addEventListener('click', function() {
		var buyer = document.getElementById("buyer");
		var buyerSpan = document.querySelector(".buyer-span");
		var stateButtons = document.querySelectorAll('.state-update button');
		    stateButtons.forEach(function(btn) {
		    btn.style.backgroundColor = 'transparent'; // 버튼의 배경색을 기본으로 
		    btn.style.color = '';
		    btn.style.borderColor = '';
		    });
		rButton.style.backgroundColor = 'rgb(13 204 90)';
		rButton.style.color = 'rgb(255 255 255)';
		rButton.style.borderColor = 'rgb(13 204 90)';
		buyerSpan.textContent="";
		buyer.style.display = "none";
	});
	
	cButton.addEventListener('click', function() {
		var buyerSpan = document.getElementById("buyer-span");
		var stateButtons = document.querySelectorAll('.state-update button');
		    stateButtons.forEach(function(btn) {
		    btn.style.backgroundColor = 'transparent'; // 버튼의 배경색을 기본으로 
		    btn.style.color = '';
		    btn.style.borderColor = '';
		    });
		cButton.style.backgroundColor = 'rgb(13 204 90)';
		cButton.style.color = 'rgb(255 255 255)';
		cButton.style.borderColor = 'rgb(13 204 90)';
		showIds();// 채팅방 아이디 뿌려주는 함수
	});
	
	function showIds(){
		var pNum = '${pro.pr_num}';
	    var data = {
	       "pNum" : pNum
	    };

	    // AJAX 요청
	    $.ajax({
	    	async : false,
	        type: "get",
	        url: '<c:url value="/product/update5"/>', 
	        data: data, // 보낼 데이터 입력
	        dataType : "json",
	        success: function(data) {
	            // 성공적으로 응답을 받았을 때 실행할 코드
	            addIds(data.chatRoomList);
	        },
	        error: function(xhr, status, error) {
	            // 요청이 실패했을 때 실행할 코드
	            console.error("Error sending data:", error);
	        }
	    });
		
	}
	
	
	function addIds(list){
		var buyerSpan = document.querySelector(".buyer-span");
		if(list.length==0){
			buyerSpan.textContent ="채팅방이 존재하지 않아 구매자 아이디를 찾을 수 없습니다.";
			return;
		}
		buyerSpan.textContent ="구매자 아이디를 선택해주세요.";
		var buyer = document.getElementById("buyer");
		buyer.style.display = "block";
		let str = '';
		str += `<ul class="buyer-ul flex flex-col border-solid border-jnGray-300">`;
		for(let i=0; i<list.length; i++){
			const object = list[i];
				str+=`<li class="false h-10 p-3 buyer-li">
				      <button onClick="clickBuyer(this)">
				      <p class="truncate break-keep" style="color : black; font-size : 15px;">\${object.cr_me_id }</p>
				      </button>
					  </li>`;
		}
		str+=`</ul>`;
		 $("#buyer").html(str);
	}
	
	function clickBuyer(button){
		var buyerSpan = document.getElementById("buyer-span");
		var buyerButton = document.querySelectorAll('#buyer button');
		 buyerButton.forEach(function(btn) {
	     btn.classList.remove('selected');
	     btn.querySelector('p').style.fontWeight = 'normal'; // 모든 버튼 스타일 초기화                
	     btn.querySelector('p').style.color = 'initial';
	     btn.closest('li').style.backgroundColor = ''; // 버튼 포함하는 li의 배경색을 기본으로 
	     });
		 
		 button.classList.add('selected');
	     button.querySelector('p').style.fontWeight = 'bold'; // 클릭한 버튼 스타일 변경          
	     button.querySelector('p').style.color = 'black'; 	
	     button.closest('li').style.backgroundColor = '#ced4da'; // 버튼 포함하는 li의 배경색을 회색으로
	     buyerSpan.textContent = ""// 메시지 클리어
	}
	
	
	<!--제약 조건들-->
	
	document.getElementById("productTitle").addEventListener("input", function() {
		var nameMessage = document.getElementById("nameMessage");
	    var inputTextLength = this.value.length;
	    if (inputTextLength > 30) {
	        this.value = this.value.slice(0, 30);
	        nameMessage.style.display = "block"; 
	        nameMessage.textContent = "최대 30자까지 입력할 수 있습니다.";
	    }else{
	    nameMessage.style.display = "none";  
	    }
	});
	
	document.getElementById("product-content").addEventListener("input", function() {
	    const span = document.getElementById('contentCount');
	    var contentMessage = document.getElementById("contentMessage");
	    var inputTextLength = this.value.length;
	    if (inputTextLength > 1000) {
	        this.value = this.value.slice(0, 1000);
	        contentMessage.style.display = "block";
	        span.textContent = 1000;
	    } else {
	        contentMessage.style.display = "none";  
	        span.textContent = inputTextLength;
	    }
	});
	
	
	function formatNumber(input) {
	    // 입력된 값에서 숫자가 아닌 것을 모두 제거합니다.
	    input.value = input.value.replace(/[^0-9]/g, '');

	    // 만약 값이 0으로 시작한다면 0을 제외하고 모두 제거합니다.
	    if (input.value.startsWith('0')) {
	        input.value = input.value.substring(1);
	    }
	}
	
	document.getElementById("update-button").addEventListener("click", function() {
		var midPlaceMessage = document.getElementById("midPlaceMessage");
		var smallPlaceMessage = document.getElementById("smallPlaceMessage");
		var imageMessage = document.getElementById("imageMessage");
		var priceInput = document.getElementById("price-input");
		var productContent = document.getElementById("product-content");
		var nameMessage = document.getElementById("nameMessage");
		var buyerSpan = document.getElementById("buyer-span");
		var priceMessage = document.getElementById("priceMessage");
		var categoryMessage = document.getElementById("categoryMessage");
		var buyerSpan = document.getElementById("buyer-span");
		var contentMessage = document.getElementById("contentMessage");
		var productTitle = document.getElementById("productTitle");
		var midPlaces = document.querySelectorAll("#midPlace li");
		var smallPlaces = document.querySelectorAll("#smallPlace li");
		
		let d = false;
        // 이미지 판단 
		var imgTags = document.getElementsByTagName("img");
        if(imgTags.length-1==0){
        	imageMessage.style.display = "block";
        	d=true;
        }   
        // 제목 판단
        var titleLength = productTitle.value.replace(/\s/g, "").length;
        if(titleLength<2){
        	nameMessage.style.display = "block";
        	nameMessage.textContent = "상품명은 최소 2자 이상 입력해 주세요.";
        	d=true;
        }
        
        // 카테고리 판단
        var midGroups = document.getElementsByClassName("midGroup-li");
        var count = 0;
        for(let i=0; i<midGroups.length; i++){
        	var mid = midGroups[i];
        	var computedStyle = window.getComputedStyle(mid);
        	var backgroundColor = computedStyle.getPropertyValue('background-color');
        	if(backgroundColor === 'rgb(206, 212, 218)'){
        		count=count +1;
        	}
        }
        if(count==0){
        	categoryMessage.textContent = "카테고리를 선택해주세요.";
        	d = true;
        }
        
        // 가격 판단 
        var price = Number(priceInput.value.replace(/,/g, ""));
        if(price==0||price<1000){
        	priceMessage.style.display='block';
        	priceMessage.textContent = "상품 가격은 1000원 이상이여야 합니다.";
        	d=true;
        }
        
        // 상품 설명 판단
        var contentLength = productContent.value.replace(/\s+/g, '').length;
        if(contentLength<10){
        	contentMessage.style.display ="block";
        	contentMessage.textContent = "상품 설명은 공백 제외 최소 10자 필요합니다.";
        	d= true;
        }
        // 상태 판단
        
        var stateContent = buyerSpan.textContent.length;
        if(stateContent!=0){
        	buyerSpan.textContent = "구매자 아이디를 선택해주세요.";
        	d = true;
        }
        
        // 주소 판단
        var midCount = midPlaces.length;
        var smallCount =smallPlaces.length;
        var midCounts=0;
        var smallCounts=0;
        for(let i=0; i<midCount; i++){
        	var midPlace = midPlaces[i];
        	var computedStyle = window.getComputedStyle(midPlace);
        	var backgroundColor = computedStyle.getPropertyValue('background-color');
        	if(backgroundColor === 'rgb(206, 212, 218)'){
        		midCounts++;
        	}
        }
        
        for(let i=0; i<smallCount; i++){
        	var smallPlace = smallPlaces[i];
        	var computedStyle = window.getComputedStyle(smallPlace);
        	var backgroundColor = computedStyle.getPropertyValue('background-color');
        	if(backgroundColor === 'rgb(206, 212, 218)'){
        		smallCounts++;
        	}
        }
        
        if(midCount>1){
        	if(midCounts==0){
        		midPlaceMessage.textContent="시군구 주소를 선택해주세요";
        		d = true;
        	}else if(smallCounts==0){
        		smallPlaceMessage.textContent="동 주소를 선택해주세요";
        		d= true;
        	}
        }
        if(!d){
        	update();
        }else{
        	alert("필수항목들을 다시 확인해주세요.");
        }
	 });
	     
        function update() {
        	var productTitle = document.getElementById("productTitle"); //수정할 제목
        	var priceInput = document.getElementById("price-input"); //수정할 가격
        	var productContent = document.getElementById("product-content"); //수정할 내용
        	var stateButtons = document.querySelectorAll("#state-update button"); //수정할 상태
        	var ids = document.querySelectorAll("#buyer li"); // 구매자
        	var sidos = document.querySelectorAll("#topPlace li"); // 시
        	var gus = document.querySelectorAll("#midPlace li"); // 구
        	var dongs = document.querySelectorAll("#smallPlace li"); // 동
            var originalInputs = document.querySelectorAll('#original-input');
            var fileInputs = document.querySelectorAll('.file-input');
            var arr = []; // 배열 초기화
            
            for (let i = 0; i < originalInputs.length; i++) {
                arr.push(originalInputs[i].value); // 배열에 값 추가
            }
            // FormData 객체 생성
            var formData = new FormData();

            // 새로 추가한 이미지 파일들 
            fileInputs.forEach(function(fileInput) { 
                var files = fileInput.files;
                for (var i = 0; i < files.length; i++) {  
                    formData.append('files', files[i]);
                }
            });
            
            // 기존 이미지 파일들(arr 의 크기가 0 일때는 안보냄)
            if(arr.length!=0){
            arr.forEach(function(value) {
                formData.append('arr[]', value);
            });
        }else{
        	formData.append('arr[]', "남은 것 없음");
        }
             
            // 상품 번호 
            formData.append('pNum','${pro.pr_num}' );
            
            // 상품 이름
            var Title = productTitle.value;
            formData.append('pName',Title);
                       
            
            // 카테고리
            var liElements = document.querySelectorAll('#midGroup li');
			for (var i = 0; i < liElements.length; i++) {
			    var liElement = liElements[i];
			    var computedStyle = window.getComputedStyle(liElement);
			    var backgroundColor = computedStyle.backgroundColor;
			    if (backgroundColor === 'rgb(206, 212, 218)') {
			    	var dataValue = liElement.getAttribute('data-value');	
			    	var midName = liElement.querySelector('button').querySelector('p').textContent;
			    	formData.append('mNum', dataValue);
			    	formData.append('mName', midName);
			    }
			}
			
			// 가격 
			var strPrice = priceInput.value;
			var price;
			
			if(strPrice==="무료나눔"){
				price = 0;
			}else if(strPrice==="가격제안"){
				price=-10;
			}else{
				// , 제외한 문자열을 숫자로 바꿈
				price = Number(strPrice.replace(/,/g, ""));
			}			
			formData.append("price",price);
			
			// 상품 내용
			var content = productContent.value;
			formData.append("content",content);
						
			// 상품 상태
			for (var i = 0; i < stateButtons.length; i++) {
			    var stateButton = stateButtons[i];
			    var computedStyle = window.getComputedStyle(stateButton);
			    var backgroundColor = computedStyle.backgroundColor;
			    if (backgroundColor === 'rgb(13, 204, 90)') {
			    	var state = stateButton.textContent;
			    	formData.append("state",state);
			    }
			}		
			var buyer="";
			if(state==="판매완료"){	
				for (let i = 0; i < ids.length; i++) {
				    var id = ids[i];
				    var computedStyle = window.getComputedStyle(id);
				    var backgroundColor = computedStyle.backgroundColor;
				    if (backgroundColor === 'rgb(206, 212, 218)') {
				    	buyer = id.querySelector('button').querySelector('p').textContent;
				    }
				}			
			}			
			formData.append("buyer",buyer);
			
			// 주소
			var sido="";
			var gu="";
			var dong="";
			for (let i = 0; i < sidos.length; i++) {
			    var sido1 = sidos[i];
			    var computedStyle = window.getComputedStyle(sido1);
			    var backgroundColor = computedStyle.backgroundColor;
			    if (backgroundColor === 'rgb(206, 212, 218)') {
			    	sido = sido1.querySelector('button').querySelector('p').textContent;
			    	formData.append("sido",sido);
			    }
			}
			for (let i = 0; i < gus.length; i++) {
			    var gu1 = gus[i];
			    var computedStyle = window.getComputedStyle(gu1);
			    var backgroundColor = computedStyle.backgroundColor;
			    if (backgroundColor === 'rgb(206, 212, 218)') {
			    	gu = gu1.querySelector('button').querySelector('p').textContent;
			    	formData.append("gu",gu);
			    }
			}
			for (let i = 0; i < dongs.length; i++) {
			    var dong1 = dongs[i];
			    var computedStyle = window.getComputedStyle(dong1);
			    var backgroundColor = computedStyle.backgroundColor;
			    if (backgroundColor === 'rgb(206, 212, 218)') {
			    	dong = dong1.querySelector('button').querySelector('p').textContent;
			    	formData.append("dong",dong);
			    }
			}
			
			
			 var tName;
			 var topGroups = document.getElementsByClassName("topGroup-li");// 대분류 이름
			 for(let i=0; i<topGroups.length; i++){
		        	var top = topGroups[i];
		        	var computedStyle = window.getComputedStyle(top);
		        	var backgroundColor = computedStyle.getPropertyValue('background-color');
		        	if(backgroundColor === 'rgb(206, 212, 218)'){
		        		tName = top.querySelector('button').querySelector('p').textContent;
		        	}
		        }
			 formData.append("tName",tName);
			
            $.ajax({
    	    	async : false,
    	        type: "post",
    	        url: '<c:url value="/product/update"/>', 
    	        data: formData, // 보낼 데이터 입력
    	        cache : false,
    	        contentType : false,	
    	        processData : false,
    	        success: function(data) {
    	            // 성공적으로 응답을 받았을 때 실행할 코드
    	            alert(data.msg);
    	            move(data.url);// 화면이동 함수
    	            
    	        },
    	        error: function(xhr, status, error) {
    	            // 요청이 실패했을 때 실행할 코드
    	            console.log(xhr);
    	        }
    	    });     
        }
        
        function move(url){
        	var success = document.getElementById("success"); // 수정 성공 
        	var login = document.getElementById("login"); // 로그인 문제
        	var fail = document.getElementById("fail"); // 수정 실패
        	if(url==="/product/detail"){
        		success.click();
        	}else if(url==="/member/login"){
        		login.click();
        	}else{
        		fail.click();
        	}
        }
</script>
</body>
</html>