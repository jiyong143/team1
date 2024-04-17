<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.carousel {
		width: 600px;
	}
	.carousel-inner img {
		width: 600px;
		height: 600px;
	}
</style>
</head>
<body>
	<div class="container">
		<h1>상세</h1>
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
<script type="text/javascript">
	printImg();
	
	function printImg(){
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