<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
<style>
	.container{
		margin-top : 60px;
		margin-bottom : 50px;
		overflow: auto;
	}
	.carousel {
		width: 650px;
	}
	.carousel-inner img {
		width: 650px;
		height: 600px;
	}
	.imgContainer{
		width:65%;
		display: inline-block;
		float:left;
	}
	.infoContainer{
		width: 35%;
		height:600px;
		display: block;
		float:right;
		padding-bottom: 20px;
	}
	.categoryUl, .textUl, .placeUl{
		list-style: none;
		padding-left: 0px;
	}
	.categoryUl>li, .textUl>li, .placeUl>li{
		display: inline;
		padding-left: 6px;
	}
	.btn-sse{
		width: calc(100% - 50px);
		float: right;
	}
	.infoBox{
		float: left; display: inline-block;
		width:65%; margin-top: 50px;
		padding-right: 70px;
	}
	.bi-heart{
		font-size: 32px;
		height: 32px;
	}
	.bi-heart-fill{
		font-size: 32px;
		height: 32px;
		color:purple;
	}
	.bi-heart-fill:after{
		padding-top: 0px;
	}
	.sellerContainer{
		float: right; display: inline-block;
		width:35%; margin-top: 50px;
	}
	hr{ background : gray; margin-top: 30px; }
	
	.jiyong-ul{
	    display: flex; /* 요소들을 가로로 배열 */
	    padding: 0;
	    list-style: none; /* 기본 목록 스타일 제거 */
	}
	
	.jiyong-li{
	    flex: 1; /* 각각의 li 요소가 동일한 너비를 가지도록 함 */
	    position: relative; /* 상대 위치 설정 */
	}
	
	.jiyong-li:not(:first-child)::after {
	    content: ''; /* 가상 요소 생성 */
	    position: absolute; /* 절대 위치 설정 */
	    top: 50%; /* 상단 기준으로 50% 위치 */
	    transform: translateY(-50%); /* 수직 정렬 */
	    width: 1px; /* 경계선 너비 */
	    height: 70%; /* 경계선 높이 */
	    background-color: #D1D5DB; /* 회색 경계선 색상 */
	    
	}
	
	.jiyong-button{
	    display: flex; /* 버튼 내부 요소들을 세로로 배치 */
	    flex-direction: column; /* 버튼 내부 요소들을 세로로 배치 */
	    align-items: center; /* 버튼 내부 요소들을 수평으로 정렬 */
	    justify-content: center; /* 버튼 내부 요소들을 수직으로 정렬 */
	    padding: 6px; /* 내부 여백 설정 */
	    background-color: transparent; /* 배경색 투명 설정 */
	    border: none; /* 테두리 제거 */
	    cursor: pointer; /* 커서를 포인터로 변경하여 클릭 가능한 모양으로 변경 */
	    outline: none; /* 포커스시 테두리 제거 */
	}
	
	.jiyong-button:hover svg path { /* 버튼에 마우스를 올렸을 때 아이콘 색상 변경 */
	    stroke: #000; /* 아이콘 색상 변경 */
	}
	
</style>
</head>
<body>
	<div class="container">
		<div class="imgContainer">
			<div id="demo" class="carousel slide" data-ride="carousel">
			    <!-- Indicators -->
				<ul class="carousel-indicators">
					 <c:forEach items="${files}" var="list" varStatus="loop">
			            <c:if test="${loop.index == 0}">
			                <li data-target="#demo" data-slide-to="${loop.index}" class="active"></li>
			            </c:if>
			            <c:if test="${loop.index != 0}">
			                <li data-target="#demo" data-slide-to="${loop.index}"></li>
			            </c:if>
			        </c:forEach>
				</ul>
			
				<!-- 그림 -->
				<div class="carousel-inner">
					<c:forEach items="${files}" var="list" varStatus="loop">
						<c:if test="${loop.index == 0}">
							<div class="carousel-item active">
								<img src="<c:url value="/download${list.fi_name}"/>" alt="이미지">
							</div>
						</c:if>
						<c:if test="${loop.index != 0}">
							<div class="carousel-item">
								<img src="<c:url value="/download${list.fi_name}"/>" alt="이미지">
							</div>
						</c:if>
					</c:forEach>
				</div>
	
				<!-- 왼.오 화살표 -->
				<a class="carousel-control-prev" href="#demo" data-slide="prev">
					<span class="carousel-control-prev-icon"></span>
				</a>
				<a class="carousel-control-next" href="#demo" data-slide="next">
					<span class="carousel-control-next-icon"></span>
				</a>
			</div>
		</div>
		<div class="infoContainer">
			<div class="categoryContainer">
				<!-- 대분류 중분류 제목 가격 -->
				<ul class="categoryUl">
					<li>홈</li>
					<li>&gt;</li>
					<li>${info.pr_tg_name}</li>
					<li>&gt;</li>
					<li>${info.pr_mg_name}</li>
				</ul>
				<div>
					<h1>${info.pr_name}</h1>
					<c:choose>
						<c:when test="${info.pr_price == 0}">
							<h2 style="font-weight: bold; font-size: 20px;">무료 나눔🧡</h2>
						</c:when>
						<c:when test="${info.pr_price == -10}">
							<h2 style="font-size: 20px; color: #808080; font-weight: bold;">가격 제안</h2>	
						</c:when>
						<c:otherwise>
							<h2>${info.pr_price}원</h2>
						</c:otherwise>
					</c:choose>
					<c:choose>
						<c:when test="${info.pr_ps_state eq '판매완료'}">
							<svg width="50" height="30" viewBox="0 0 40 20" xmlns="http://www.w3.org/2000/svg">
							    <rect x="0" y="0" width="40" height="20" rx="4" fill="#708090"></rect>
							    <text x="50%" y="50%" alignment-baseline="middle" text-anchor="middle" fill="white" font-size="10">판매완료</text>
							</svg>
						</c:when>  
						<c:when test="${info.pr_ps_state eq '예약중'}">
							<svg width="50" height="30" viewBox="0 0 40 20" xmlns="http://www.w3.org/2000/svg">
							    <rect x="0" y="0" width="40" height="20" rx="4" fill="#0DCC5A"></rect>
							    <text x="50%" y="50%" alignment-baseline="middle" text-anchor="middle" fill="white" font-size="12">예약중</text>
							</svg>
						</c:when>
					</c:choose>
				</div>
			</div>
			<div class="textContainer">
				<!-- 시간 조회 찜수 -->
				<ul class="textUl">
					<li>${info.time}</li>
					<li>&#183;</li>
					<li>조회 ${info.pr_view}</li>
					<li>&#183;</li>
					<li>찜 ${info.pr_pickCount}</li>
					<li>&#183;</li>
					<li>채팅 ${info.pr_chatCount}</li>
				</ul>
				<ul class="placeUl">
					<li>&#186;</li>
					<li>거래희망지역</li>
					<li>${info.pr_place}</li>
				</ul>
			</div>
			<div class="btnContainer btnBox">
				<c:choose>
					<c:when test="${!empty user && pick.pi_num != 0}">
						<i class="bi bi-heart-fill btn-pick"></i>
					</c:when>
					<c:otherwise>
						<i class="bi bi-heart btn-pick"></i>
					</c:otherwise>
				</c:choose>
				<button class="btn btn-outline-success btn-sse">채팅하기</button>
			</div>
			<input type="hidden" id="pickValue" value="${pick}">
			
			<c:if test="${loginUser.me_id eq prUser.me_id}">
			<ul class="jiyong-ul flex w-full py-3 rounded bg-jnGray-100">
			   <!-- db에서 해당 상품의 시간을 현재로 수정 -->
				<li class="jiyong-li flex flex-1 basis-[25%] items-center justify-center px-3 relative after:absolute [&amp;:not(:first-child)]:after:w-[1px] after:bg-gray-300 after:h-9 after:left-0 [&amp;:not(:first-child)]:after:content-['']">
				<button class="jiyong-button flex flex-col items-center py-[6px]">
				<svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
				<path d="M5 8.99995V13.9656C5 17.8505 7.91015 21 11.5 21C15.0899 21 18 17.8505 18 13.9656V5" stroke="#141313" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"></path>
				<rect x="4.25" y="4" width="1.5" height="1" rx="0.5" fill="#141313"></rect>
				<rect x="4.25" y="6" width="1.5" height="1" rx="0.5" fill="#141313"></rect>
				<path d="M15 7L18 4L21 7" stroke="#141313" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"></path>
				</svg>
				<p class="mt-1 text-xs font-medium text-center text-jnBlack">위로 올리기</p>
				</button>
				</li>
				<!-- 상품 수정 화면으로 이동 -->
				<li class="jiyong-li flex flex-1 basis-[25%] items-center justify-center px-3 relative after:absolute [&amp;:not(:first-child)]:after:w-[1px] after:bg-gray-300 after:h-9 after:left-0 [&amp;:not(:first-child)]:after:content-['']">
				<button class="jiyong-button flex flex-col items-center py-[6px]">
				<svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
				<path d="M12 21H21" stroke="#141313" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"></path>
				<path d="M7.91993 19.7931C8.05181 19.7601 8.17224 19.6919 8.26836 19.5958L19.9497 7.91448C20.2034 7.66076 20.4047 7.35954 20.542 7.02803C20.6793 6.69652 20.75 6.34121 20.75 5.98239C20.75 5.62357 20.6793 5.26826 20.542 4.93675C20.4047 4.60524 20.2034 4.30402 19.9497 4.0503C19.696 3.79657 19.3948 3.59531 19.0633 3.45799C18.7317 3.32068 18.3764 3.25 18.0176 3.25C17.2929 3.25 16.5979 3.53788 16.0855 4.0503L4.40418 15.7316C4.30806 15.8278 4.23987 15.9482 4.2069 16.0801L3.27239 19.8181C3.2085 20.0737 3.28338 20.344 3.46967 20.5303C3.65596 20.7166 3.92632 20.7915 4.1819 20.7276L7.91993 19.7931Z" stroke="#141313" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"></path>
				</svg>
				<p class="mt-1 text-xs font-medium text-center text-jnBlack">상품수정</p>
				</button>
				</li>
				<!-- 상품 삭제 화면으로 이동 -->
				<li class="jiyong-li flex flex-1 basis-[25%] items-center justify-center px-3 relative after:absolute [&amp;:not(:first-child)]:after:w-[1px] after:bg-gray-300 after:h-9 after:left-0 [&amp;:not(:first-child)]:after:content-['']">
				<button class="jiyong-button flex flex-col items-center py-[6px]">
				<svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
				<path d="M3 6H5H21" stroke="#141313" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"></path>
				<path d="M8 6V4C8 3.46957 8.21071 2.96086 8.58579 2.58579C8.96086 2.21071 9.46957 2 10 2H14C14.5304 2 15.0391 2.21071 15.4142 2.58579C15.7893 2.96086 16 3.46957 16 4V6M19 6V20C19 20.5304 18.7893 21.0391 18.4142 21.4142C18.0391 21.7893 17.5304 22 17 22H7C6.46957 22 5.96086 21.7893 5.58579 21.4142C5.21071 21.0391 5 20.5304 5 20V6H19Z" stroke="#141313" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"></path>
				<path d="M10 11V17" stroke="#141313" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"></path><path d="M14 11V17" stroke="#141313" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"></path>
				</svg>
				<p class="mt-1 text-xs font-medium text-center text-jnBlack">상품삭제</p>
				</button>
				</li>
			</ul>
			</c:if>
		</div>
		<div class="infoBox">
			<h3>상품 정보</h3>
			<hr>
			${info.pr_content}
		</div>
		<div class="sellerContainer">
			<a href="<c:url value='/member/mypage?me_id=${prUser.me_id}'/>">
				<!-- 판매자 신상 -->
				<h3>판매자</h3>
				<hr>
				<h2>${prUser.me_id}</h2>
				<div>
					<!-- 신뢰지수(온도) -->
					<span class="font-medium text-base">신뢰지수</span>
					<div class="progress mt-3">
					  <div class="progress-bar" style="width:${prUser.me_manner}%">${prUser.me_manner}</div>
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
			</a>
		</div><!-- end seller -->
	</div><!-- end container -->
<!-- sse관련 ajax -->
<script type="text/javascript">	
	$(".btn-sse").click(function(){
		$.ajax({
			async : true, //비동기 : true(비동기), false(동기)
			url : '<c:url value="/product/chat"/>', 
			type : 'post', 
			data : {pr_num : ${pNum}},
			dataType : "json",
			success : function (data){
				console.log(data);
				console.log(data.cr_num);
				if(data.msg != null){
					alert(data.msg);
					return;
				}
				let num = data.cr_num;
				if(confirm("채팅방으로 이동하겠습니까?")){
					var url = '<c:url value="/chat/sse"/>' + '?cr_num=' + num;
					location.href = url;
				}else{
					
				}
			}, 
			error : function(jqXHR, textStatus, errorThrown){

			}
		});
	});
</script>

<!-- 찜하기 관련 ajax -->
<script type="text/javascript">
	$(document).on('click', ".btn-pick",function(){
		$.ajax({
			async : true, //비동기 : true(비동기), false(동기)
			url : '<c:url value="/product/pick"/>',
			type : 'post', 
			data : {pr_num : ${pNum}},
			dataType : "json",
			success : function (data){
				if(data.msg != null){
					alert(data.msg);
					return;
				}
				console.log(data)
				dataPick(data.res);
				pickAndViewCount();
			},
			error : function(jqXHR, textStatus, errorThrown){

			}
		});
	});
	
	function dataPick(res){
		let str='';
		if(res == 'delete'){
			str += 
				`
				<i class="bi bi-heart btn-pick"></i>
				<button class="btn btn-outline-success btn-sse">채팅하기</button>
				`;
		}else{
			str += 
				`
				<i class="bi bi-heart-fill btn-pick"></i>
				<button class="btn btn-outline-success btn-sse">채팅하기</button>
				`;
		}
		$(".btnBox").html(str);
	}
</script>

<!-- 조회수, 찜하기 관련 ajax -->
<script type="text/javascript">
	pickAndViewCount();
	function pickAndViewCount(){
		$.ajax({
			async : true, //비동기 : true(비동기), false(동기)
			url : '<c:url value="/product/pickAndView"/>',
			type : 'post', 
			data : {pr_num : ${pNum}},
			dataType : "json",
			success : function (data){
	            updateInformation(data.pickInfo);
				// 서버에서 변경된 정보를 가져와서 처리
	            // 변경된 정보가 있을 경우 업데이트
			},
			error : function(jqXHR, textStatus, errorThrown){
		
			}
		});
	}
	
	function updateInformation(pickInfo){
		let str = '';
		str += 
			`
			<li>\${pickInfo.time}</li>
			<li>&#183;</li>
			<li>조회 \${pickInfo.pr_view}</li>
			<li>&#183;</li>
			<li>찜 \${pickInfo.pr_pickCount}</li>
			<li>&#183;</li>
			<li>채팅 \${pickInfo.pr_chatCount}</li>
			`;
		$(".textUl").html(str);
	}

	// 일정한 간격으로 서버에 변경된 정보를 확인
	//setInterval(pickAndViewCount, 5000);
</script>
</body>
</html>