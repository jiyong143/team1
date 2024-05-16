<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<meta charset="UTF-8">
<title>고정문의</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<style type="text/css">
.body{
	min-width: 240px;
	max-width: 768px;
	margin: 0 auto;
	padding: 2.4rem 1.6rem;
	font-weight: 400;
	position: relative;
	overflow-x: hidden
}
.page-title{
	font-size: 28px; 
	font-weight:800;
	margin-top:10px;
	margin-left: 20px; 
}
.page-name{
	font-size:18x;
	font-weight:600;
	margin-left: 20px;
}
.page-item{
	margin-lefe: 20px;
}
.contant-1{
	margin-left: 20px;
	margin-right: 20px;
}
.text-box1{
	margin-left: 40px;	
}
.strong{font-colot: green;}


</style>
</head>
<body id="page-container">
<div class="item-boxes">
	<h1 id="page-title">고객관리</h1>
	<hr>           
	<h2 id="page-name">거래 금지 물품</h2>
	<hr>
		<div class="page-item">
 			<p class="contant-1">
 				당근은 현행 법령을 위반하는 물품의 거래는 물론, 당근에서 거래가 부적절하다고 판단되는 물품에 대해 운영정책에 따라 금지하고 있어요. 
			</p>
			<p class="contant-1">
				또한, 판매 자격을 갖춘 경우라도 개인간 거래를 지향하는 당근 중고거래 서비스에서는 해당 물품을 판매할 수 없어요.
			</p>
			<p></p>
        	<ul>
        		<li>
        			<p>
        				<strong>생명이 있는 동물</strong>
        			</p>
        		</li>
        		<li class="text-box1">
        			<p>식물 제외/ 곤충, 관상어 포함</p>
        		</li>
        	</ul>
        	<ul>
        		<li>
        			<p>
        				<strong>개인정보:신분증/ 통장/ 계정</strong>
        			</p>
        		</li>
        		<li class="text-box1">
        			<p>운전면허증, 학생증, 추천인 계정 포함</p>
        		</li>
        	</ul>
        	<ul>
        		<li>
        			<p>
        				<strong>불법 현금 융통: 대리결제 / 후불결제 현금화 / 대출</strong>
        			</p>
        		</li>
        	</ul>
        	<ul>
        		<li>
        			<p>
        				<strong>상표권 침해 물품: 가품 / 이미테이션 / 위조물품</strong>
        			</p>
        		</li>
        	</ul>
        	<ul>
        		<li>
        			<p>
        				<strong>청소년유해약물 등: 주류 / 담배 / 라이터 / 마약류</strong>
        			</p>
        		</li>
        		<li class="text-box1">
        			<p>무알콜 주류, 전자담배 기기장치류, 가스라이터 포함</p>
        		</li>
        	</ul>
        	<ul>
        		<li>
        			<p>
        				<strong>청소년유해매체물 등: 음란물 / 성생활용품 / 게임아이템</strong>
        			</p>
        		</li>
        		<li class="text-box1">
        			<p>청소년이용불가등급물 및 선정적인 이미지∙글 포함</p>
        		</li>
        	</ul>
        	<ul>
        		<li>
        			<p>
        				<strong>의약품 / 의료기기 / 건강기능식품</strong>
        			</p>
        		</li>
        		<li class="text-box1">
        			<p>동물용 의약품, 한약, 다이어트약 포함</p>
        		</li>
        		<li class="text-box1">
        			<p>체온계, 혈압계 제외</p>
        		</li>
        		<li class="text-box1">
        			<p>동물용 건강기능식품 제외</p>
        		</li>
        	</ul>
        	<ul>
        		<li>
        			<p>
        				<strong>콘택트렌즈 / 도수 있는 안경</strong>
        			</p>
        		</li>
        	</ul>
        	<ul>
        		<li>
        			<p>
        				<strong>거래 금지 식품: 무허가/ 위해 식품</strong>
        			</p>
        		</li>
        		<li class="text-box1">
        			<p>직접 제조, 포장 개봉, 소비기한 경과 식품 등</p>
        		</li>
        	</ul>
        	<ul>
        		<li>
        			<p>
        				<strong>위험한 물질: 유해화학물질 / 유류 등</strong>
        			</p>
        		</li>
        		<li class="text-box1">
        			<p>농약, 유독물, 휘발유, 경유, LPG 포함</p>
        		</li>
        	</ul>
        		<ul>
        		<li>
        			<p>
        				<strong>위험한 물품: 총포∙도검∙화약류 / 청소년유해물품 등</strong>
        			</p>
        		</li>
        		<li class="text-box1">
        			<p>전기충격기, 비비탄 총∙총알, 레이저포인터 포함</p>
        		</li>
        	</ul>
       		
		</div>
</div>  

  
<button class="btn btn-dark mb-4">이전으로</button>

</body>
</html>