<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<meta charset="UTF-8">
<title>고정문의 상세</title>
<link
	href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.js"></script>

<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<style>
.container-box {
	width: 100%;
	height: 280px;
	box-shadow: 0 1px 5px 0px rgba(0, 0, 0, 0.2);
	margin-bottom: 10px
}

.form-group {
	width: 100%;
}

.button_comment {
	display: inline-block;
	vertical-align: top;
	font-size: 13px;
}

.page-title {
	font-size: 28px;
	font-weight: 800;
	margin-top: 10px;
}

.content-box {
	width: 100%;
	height: auto;
	box-shadow: 0 1px 5px 0px rgba(0, 0, 0, 0.2);
	padding: 10px;
}
.comment-title{
	font-size: 22px; 
	margin-bottom: 5px;
}
.container{
	margin-left: 200px;
}
</style>
</head>
<body>
<jsp:include page="/WEB-INF/views/common/sideBar.jsp"/>
	<div class="container">
		<h1 class="page-title">고정문의 상세</h1>
		<div class="container-box">

			<div class="form-group col-12 mt-3">
				<label for="fix_title">제목</label> <input type="text"
					class="form-control" id="fix_title" name="fix_title" readonly
					value="${fixed.fix_title}">
			</div>
			<div class="form-group col-12 mt-3">
				<label for="fix_me_id">작성자</label> <input type="text" class="form-control"
					id="fix_me_id" name="fix_me_id" readonly value="${fixed.fix_me_id}">
			</div>
			<div class="form-group col-12 mt-3">
				<label for="fix_view">조회수</label> <input type="number"
					class="form-control" id="fix_view" name="fix_view" readonly
					value="${fixed.fix_view}">
			</div>
		</div>
		<div class="form-group">
			<label for="fix_content">내용</label>
			<div class="content-box" id="fix_content" name="fix_content">${fixed.fix_content}</div>
		</div>
	
		<c:if test="${user.me_id == fixed.fix_me_id}">
			<a href="<c:url value="/fixed/delete?fixNum=${fixed.fix_num}"/>"
				class="btn btn-outline-success mb-3">삭제</a>
			<a href="<c:url value="/fixed/update?fixNum=${fixed.fix_num}"/>"
				class="btn btn-outline-warning mb-3">수정</a>
		</c:if>
		<a href="/team1/fixed/list" class="btn btn-outline-dark mb-4 mt-2">목록으로</a>
	</div>
</body>
</html>