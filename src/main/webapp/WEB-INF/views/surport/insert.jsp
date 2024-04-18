<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<meta charset="UTF-8">
<title>고객지원 작성</title>
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.js"></script>
<style>
.container-box{
	width: 100%; height: 260px;
    box-shadow: 0 1px 5px 0px rgba(0,0,0,0.2);
    margin-bottom : 10px
}
.form-group{ width: 100%;}
.page-title{
	font-size: 28px; 
	font-weight:800;
	margin-top:10px; 
}
</style>
</head>
<body>
<div class="container">
	<h1 class="page-title">문의글 작성</h1>
	<form action="<c:url value="/surport/insert"/>" method="post" enctype="multipart/form-data">
	<div class="container-box">
		<div class="select-box col-12 mt-4">
			<label for="suport_manage">지원타입 선택</label>
			<select class="form-control" id="suport_manage" name="su_sm_num">
				<c:forEach items="${suport_manage}" var="sm">
					<option value="${sm.sm_num}">${sm.sm_name}</option>
				</c:forEach>
			</select>
		</div>
		<div class="select-box col-12 mt-3">
			<label for="up_head">말머리 선택</label>
			<select class="form-control" id="up_head" name="su_uh_num">
				<c:forEach items="${up_head}" var="uh">
					<option value="${sm.uh_num}">${sm.uh_name}</option>
				</c:forEach>
			</select>
		</div>
		<div class="form-group col-12 mt-3">
			<label for="su_title">제목</label>
			<input type="text" class="form-control" id="su_title" name="su_title" required placeholder="제목을 입력해주세요.">
		</div>
	</div>	
		<div class="form-group mb-4">
			<label for="su_content">내용</label>
		  	<textarea class="form-control" id="su_content" name="su_content" required rows="10" placeholder="내용을 입력해주새요."></textarea>
		</div>		
		<button class="btn btn-dark col-12 mb-4">등록</button>
	</form>
</div>
<script type="text/javascript">	
	$("form").submit(function() {
		let title = $("[name=su_title]").val();
		if(title.length == 0){
			alert("제목은 공백으로 남길 수 없습니다.");
			$("[name=su_title]").focus();
			return false;
		}
		let content = $("[name=su_content]").val();
		if(content.length = 0){
			alert("내용은 공백으로 남길 수 없습니다.")
			$("[name-su_content]").focus();
			return false;
		}
		
	});
	
	$('[name = su_content]').summernote({
		   placeholder: '내용을 입력하세요',
		   tabsize: 2,
		   height: 400
		});
</script>
</body>
</html>