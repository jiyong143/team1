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
			<c:if test="${prUser.me_id eq user.me_id}">
				<button class="changeState btn btn-outline-success" style="width: 100%">상태 변경</button>
				<div style="margin-top: 10px" class="stateBox">
					<div>
						<select style="width: 30%; height: 40px; display: hidden" class="stateOption">
							<option>판매중</option>
							<option>예약중</option>
							<option>판매완료</option>
						</select>
						<select style="margin-left: 4%; width: 40%; height: 40px;" class="buyer">
							<option>a</option>
							<option>b</option>
						</select>
						<button style="width: 20%; float: right; height: 40px;" class="decideState btn btn-outline-success">선택</button>
					</div>
				</div>
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
									<td>안전거래</td>
									<td>거래후기</td>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td><a href="#">${tradeNum}</a></td><!-- 거래횟수 -->
									<td><a href="#">${reviewNum}</a></td><!-- 거래후기갯수 -->
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
	$(".stateBox").hide();
	$(".buyer").hide();
	
	$(".changeState").click(function(){
		$(".stateBox").show();
		let state = $(".stateOption").val();
	});
	
	$(document).on("change", ".stateOption", function(){
		let state = $(".stateOption").val();
		if(state != '판매중'){
			$(".buyer").show();
		}else{
			$(".buyer").hide();	
		}
	});
	
	$(".decideState").click(function(){
		alert(1);
	})
</script>	
	
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