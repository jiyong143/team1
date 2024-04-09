<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!doctype html>
<html>
<head>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
	<!-- Brand -->
	<a class="navbar-brand" href="#">Logo</a>
	<!-- Links -->
	<ul class="navbar-nav">
		<li class="nav-item">
			<a class="nav-link" href="<c:url value="/signup"/>">회원가입</a>
		</li>
		<li class="nav-item">
			<a class="nav-link" href="<c:url value="/login"/>">로그인</a>
		</li>
		<li class="nav-item">
			<a class="nav-link" href="<c:url value="/list"/>">거래글</a>
		</li>
	</ul>
</nav>
</body>
</html>
