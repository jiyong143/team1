<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<style type="text/css">
.side-bar-nav {
  margin: 0;
  font-family: "Lato", sans-serif;
}

.sidebar {
  margin: 0;
  padding: 0;
  width: 250px;
  background-color: #C0C0C0;
  position: absolute;
  height: 100%;
  
}

.sidebar a {
  display: block;
  color: black;
  padding: 16px;
  text-decoration: none;
}
 
.sidebar a.active {
  background-color: red;
  color: white;
}

.sidebar a:hover:not(.active) {
  background-color: black;
  color: white;
}

.media screen and (max-width: 700px) {
  .sidebar {
    width: 100%;
    height: auto;
    position: relative;
  }
.sidebar a {float: left;}
.div.content {margin-left: 0;}
}

.media screen and (max-width: 400px) {
  .sidebar a {
    text-align: center;
    float: none;
  }
}

.box3{
	display: inline-block;
}

body {
  font-family: 'Lato', sans-serif;
}

.overlay {
  height: 100%;
  width: 0;
  position: fixed;
  z-index: 1;
  top: 0;
  left: 0;
  background-color: rgb(0,0,0);
  background-color: rgba(0,0,0, 0.9);
  overflow-x: hidden;
  transition: 0.5s;
}

.overlay-content {
  position: relative;
  top: 25%;
  width: 100%;
  text-align: center;
  margin-top: 30px;
}

.overlay a {
  padding: 8px;
  text-decoration: none;
  font-size: 36px;
  color: #818181;
  display: block;
  transition: 0.3s;
}

.overlay a:hover, .overlay a:focus {
  color: #f1f1f1;
}

.overlay .closebtn {
  position: absolute;
  top: 20px;
  right: 45px;
  font-size: 60px;
}

@media screen and (max-height: 450px) {
  .overlay a {font-size: 20px}
  .overlay .closebtn {
  font-size: 10px;
  top: 15px;
  right: 35px;
  }
}
</style>
</head>
<bady>
	<div id="myNav" class="overlay">
	  <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
	  <div class="overlay-content">
	  	<c:if test="${user.me_authority == 'admin'}">
  			<a href="/team1/admin/memberManager">회원 관리</a>
  		</c:if>
	    <c:if test="${user.me_authority == 'admin' || user.me_authority == 'manager'}">
		    <a href="/team1/report/list">신고관리</a>
		    <a href="/team1/admin/topCategoryManager">대분류 관리</a>
		   	<a href="/team1/admin/midCategoryManager">중분류 관리</a>
	  	  	<a href="/team1/fixed/list">고정문의 관리</a>
	  	</c:if>
	  	<c:if test="${user.me_authority == 'user'}">
	  		<a href="/team1/member/mypage">마이페이지</a>
  		</c:if>
		<c:if test="${user.me_authority == 'user'}">
	  		<a href="/team1/product/insert">판매하기</a>
  		</c:if>
  		<c:if test="${user.me_authority == 'user'}">
	  		<a href="/team1/chat/list?page=1">채팅방</a>
  		</c:if>
 		<c:if test="${user.me_authority == 'user' || user.me_authority == 'admin'}">
	  		<a href="/team1/surport/list">고객지원</a>
  		</c:if>
  		<c:if test="${user.me_authority == 'user' || user.me_authority == 'admin'}">
	  		<a href="/team1/fixed/list">고정문의</a>
  		</c:if>
	  </div>
	</div>
    <c:if test="${user.me_authority == 'admin' || user.me_authority == 'manager' || user.me_authority == 'user'}">
		<span style="font-size:40px;cursor:pointer" onclick="openNav()">&#9776;</span>
	</c:if>
</bady>
<script>
function openNav() {
  document.getElementById("myNav").style.width = "40%";
}

function closeNav() {
  document.getElementById("myNav").style.width = "0%";
}
</script>
</html>