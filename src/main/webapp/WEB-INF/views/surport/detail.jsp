<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<meta charset="UTF-8">
<title>고객지원 상세</title>
<link rel="stylesheet" href="/css/summernote/summernote-lite.css">
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.css" rel="stylesheet">

<script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.js"></script>
</head>
<body>
<div class="container">
	<h1>문의글 상세</h1>
	<form action="<c:url value="/surport/detail"/>" method="post">
		<div class="form-group mt-4">
			<label for="surportManage">문의글</label>
			<input type="text" class="form-control" readonly value="${surport.su_sm_num}">
		</div>
		
		<div class="form-group">
			<label for="su_title">제목</label>
			<input type="text" class="form-control"readonly value="${surport.su_title}">
		</div>
		
		<div class="form-group">
			<label>조회수:</label>
			<input type="text" class="form-control" readonly value="${surport.su_view }">
		</div>
		<div class="form-group">
			<label>작성자:</label>
			<input type="text" class="form-control" readonly value="${surport.su_me_id }">
		</div>
		
		<div class="form-group mb-4">
			<label for="su_content">내용</label>
		  	<textarea class="form-control" id="su_content" name="su_content" readonly value="${surport.su_content}"></textarea>
		</div>		
			<a href="<c:url value="/surport/update"/>" class="btn btn-warning mb-4">수정</a>
			<button type="button" class="btn btn-danger mb-4">삭제</button> 
			<a href="<c:url value="/surport/list"/>" class="btn btn-dark col-12 mb-4">이전으로</a>
	</form>
</div>

<script type="text/javascript">
	
</script>

</body>
</html>