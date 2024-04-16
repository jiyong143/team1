<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<meta charset="UTF-8">
<title>고객지원 작성</title>
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.js"></script>

</head>
<body>
<div class="container">
	<h1>문의글 작성</h1>
	<form action="<c:url value="/surport/insert"/>" method="post" enctype="multipart/form-data">
		<div class="form-group mt-4">
			<label for="suport_manage">문의글 선택</label>
			<select class="form-control" id="suport_manage" name="su_sm_num">
				<c:forEach items="${suport_manage}" var="sm">
					<option value="${sm.sm_num}">${sm.sm_name}</option>
				</c:forEach>
			</select>
		</div>
		
		<div class="form-group">
			<label for="su_title">제목</label>
			<input type="text" class="form-control" id="su_title" name="su_title" required placeholder="제목을 입력해주세요.">
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
		lst title = $("[name=su_title]").val();
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