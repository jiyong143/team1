<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
body {
  font-family: "Lato", sans-serif;
}

.sidenav {
  height: 100%;
  width: 210px;
  position: auto;
  z-index: 1;
  top: 0;
  left: 0;
  background-color: #111;
  overflow-x: hidden;
  padding-top: 20px;
    margin-bottom: 100px;
  
}

.sidenav a {
  padding: 6px 8px 6px 16px;
  text-decoration: none;
  font-size: 25px;
  color: #818181;
  display: block;
}

.sidenav a:hover {
  color: #f1f1f1;
}

.main {
  margin-left: 160px; /* Same as the width of the sidenav */
  font-size: 28px; /* Increased text to enable scrolling */
  padding: 0px 10px;
}

@media screen and (max-height: 450px) {
  .sidenav {padding-top: 15px;}
  .sidenav a {font-size: 18px;}
}
</style>
<title>Home</title>
</head>
<body>
<!-- 
<div class="sidenav">

<div class="container">
  <div class="card" style="width:100%; background-color: gray;">
	<img src="<c:url value="/resources/img/avatar1.png"/>" alt="Card image" style="width:100%;">
    <div class="card-body">
      <h4 class="card-title" style="font-size: 10px;">John Doe</h4>
      <a href="#" class="btn btn-primary" style="width: 80px; font-size: 10px;">See Profile</a>
    </div>
  </div>
</div>



  <a href="<c:url value="/product/insert"/>">판매하기</a>
  <a href="<c:url value="/report/list"/>">신고</a>
  <a href="#clients">Clients</a>
  <a href="#contact">Contact</a>
</div>   
-->

</body>
</html>
