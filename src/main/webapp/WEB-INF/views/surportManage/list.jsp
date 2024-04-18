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
</head>
<style>
	.tbody{
		display: table-header-group;
	}
	.h2{
		display: mt-4;
	}
</style>
<body>
  <div class="container">
  <h2>고객관리</h2>
  <hr>           
  <h3>자주 묻는 질문</h3>
  <hr>
  <table class="table">
      <tr>
        <p>
        <li data=""/>
        	<a href="/team1/surportManage/QnA/QnApage1">거래금지 물품</a>
    	</p>
      </tr>
      <tr>
        <p>
        <li data=""/>
        	<a href="/team1/surportManage/QnA/QnApage2">거래 매너</a>
        </p>
      </tr>
      <tr>
         <p>
         	<li data=""/>
        	<a href="/surportManage/userQnA">회원탈퇴</a>
        </p>
      </tr>
      <tr>
         <p>
         	<li data=""/>
        	<a href="/surportManage/userQnA">매너평가</a>
        </p>
      </tr>
  </table>
  
  <hr>
  <h3>운영정책</h3>
  <hr>
  <table class="table">
      <tr>
        <p>
        <li data=""/>
        	<a href="/team1/surportManage/userQnA">부적절한 의도와 목적의 서비스 이용</a>
    	</p>
      </tr>
      <tr>
        <p>
        <li data=""/>
        	<a href="/team1/surportManage/userQnA2">불법 ・ 유해 콘텐츠와 거래금지물품</a>
        </p>
      </tr>
      <tr>
         <p>
         	<li data=""/>
        	<a href="/surportManage/userQnA">폭력적이고 혐오감을 유발하는 정보</a>
        </p>
      </tr>
      <tr>
         <p>
         	<li data=""/>
        	<a href="/surportManage/userQnA">개인정보 및 사생활 침해 행위</a>
        </p>
      </tr>
      <tr>
         <p>
         	<li data=""/>
        	<a href="/surportManage/userQnA">서비스 이용 제한 정책</a>
        </p>
      </tr>
  </table>

</body>
</html>