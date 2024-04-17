<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.container{
		margin-top : 100px;
	}
	.carousel {
		width: 650px;
	}
	.carousel-inner img {
		width: 650px;
		height: 600px;
	}
	.ImgContainer{
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
	.box{
		float: left; display: inline-block;
		margin-top: 30px;
	}
</style>
</head>
<body>
	<div class="container">
		<div class="ImgContainer">
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
			<div class="TextContainer">
				<!-- 시간 조회 찜수 -->
				<ul class="textUl">
					<li>${info.time}</li>
					<li>&#183;</li>
					<li>조회 ${info.pr_view}</li>
					<li>&#183;</li>
					<li>찜 ${info.pr_basket}</li>
				</ul>
				<ul class="placeUl">
					<li>&#186;</li>
					<li>거래희망지역</li>
					<li>${info.pr_place}</li>
				</ul>
			</div>
			<div class="btnContainer">
				<!-- 찜하기 버튼 => 기본 x 클릭 => 선택돼있으면 클래스에 btnActive추가 else 클래스 삭제 -->
				<label for=":r1d:" class="relative">
					<svg width="32" height="32" viewBox="0 0 32 32" fill="none" xmlns="http://www.w3.org/2000/svg" class="pointer-events-none w-8 h-8">
						<path d="M5.94197 17.9925L15.2564 26.334C15.3282 26.3983 15.3641 26.4305 15.3975 26.4557C15.7541 26.7249 16.2459 26.7249 16.6025 26.4557C16.6359 26.4305 16.6718 26.3983 16.7436 26.3341L26.058 17.9925C28.8244 15.5151 29.1565 11.3015 26.8124 8.42125L26.5675 8.12029C23.8495 4.78056 18.5906 5.35863 16.663 9.20902C16.3896 9.75505 15.6104 9.75505 15.337 9.20902C13.4094 5.35863 8.1505 4.78056 5.43249 8.12028L5.18755 8.42125C2.84352 11.3015 3.17564 15.5151 5.94197 17.9925Z" stroke-width="1.5" stroke="#9CA3AF"></path>
					</svg>
				</label>
				<button class="btn btn-outline-success btn-sse">채팅하기</button>
			</div>
		</div>
		<div class="box">
			<h3>상품 정보</h3>
			<hr>
			${info.pr_content}
		</div>
		<div class="SellerContainer">
		<!-- 판매자 신상 -->
		</div>
	</div>
<script type="text/javascript">
	print();
	
	function print(){
		$.ajax({
			async : true, //비동기 : true(비동기), false(동기)
			url : '<c:url value="/product/detail"/>', 
			type : 'post', 
			data : {pr_num : ${pNum}},
			dataType : "json",
			success : function (data){
				console.log(data);
			}, 
			error : function(jqXHR, textStatus, errorThrown){

			}
		});
	}
</script>
</body>
</html>