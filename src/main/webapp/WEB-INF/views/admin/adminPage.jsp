<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<meta charset="UTF-8">
<title>admin_page</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.4/Chart.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
.Manager-container{
	width: 600px; 
	height:auto; 
	margin-left: 800px;
}
</style>
</head>
<body>
<jsp:include page="/WEB-INF/views/common/sideBar.jsp"/>
<nav>
  <div>
	  <table class="table">
	    <thead>
	      <tr>
	        <th>번호</th>
	        <th>아이디</th>
	        <th>이메일</th>
	        <th>전화번호</th>
	        <th>권한</th>
	      </tr>
	    </thead>
	    <tbody>
	  	<c:forEach items="${list}" var="member">
		  <tr>
		  	<c:if test="${member.me_authority != 'admin'}">
			    <td>${member.me_name}</td>
			    <td class="me_id">${member.me_id}</td>
			    <td>${member.me_email}</td>
			    <td>${member.me_gender}</td>
			    <td>${member.me_phone}</td>
		    </c:if>
	    	</tr>
	    </c:forEach>
	    </tbody>
	  </table>
	</div>
</nav>
</body>
</html>