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
							<h2>무료 나눔</h2>
						</c:when>
						<c:when test="${info.pr_price == -10}">
							<h2>가격 제안</h2>	
						</c:when>
						<c:otherwise>
							<h2>${info.pr_price}원</h2>
						</c:otherwise>
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
				</ul>
				<ul class="placeUl">
					<li>&#186;</li>
					<li>거래희망지역</li>
					<li>${info.pr_place}</li>
				</ul>
			</div>
			<div class="btnContainer btnBox"></div>
			<input type="hidden" id="pickValue" value="${pick}">
		</div>
		<div class="infoBox">
			<h3>상품 정보</h3>
			<hr>
			${info.pr_content}
		</div>
		<div class="sellerContainer">
		<a href="<c:url value="#"/>">
			<!-- 판매자 신상 -->
				<h3>판매자</h3>
				<hr>
				<h2>${user.me_id}</h2>
				<div>
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
			}, 
			error : function(jqXHR, textStatus, errorThrown){

			}
		});
	});
</script>

<!-- 찜하기 관련 ajax -->
<script type="text/javascript">
	let a = $("#pickValue").val();
	console.log(a);
	let pickRes = "";
	
	if(a == 'insert'){
		pickRes = "insert";
	}else{
		pickRes = "delete";
	}
	
	dataPick(pickRes);

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
				}
				console.log(data.res)
				dataPick(data.res);
			},
			error : function(jqXHR, textStatus, errorThrown){

			}
		});
	});
	
	function dataPick(data){
		let str='';
		if(data == 'delete'){
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
</body>
</html>