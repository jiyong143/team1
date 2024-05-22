<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<meta charset="UTF-8">
<title>문의 작성</title>
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
<jsp:include page="/WEB-INF/views/common/sideBar.jsp"/>
<div class="container">
	<h1 class="page-title">문의 작성</h1>
	<form action="<c:url value="/surport/insert"/>" method="post" enctype="multipart/form-data">
	<div class="container-box">
		<div class="select-box col-12 mt-4">
			<label for="su_type">지원타입 선택</label>
				<select class="form-control" id="su_type" name="su_type">
				<c:if test="${user.me_authority == 'admin'}">
					<option value="공지사항" <c:if test='${surport.su_type == "공지사항"}'>selected</c:if>>공지사항</option>
				</c:if>
				<c:if test="${user.me_authority == 'user' || user.me_authority == 'admin'}">
					<option value="문의사항" <c:if test='${surport.su_type == "문의사항"}'>selected</c:if>>문의사항</option>
					<option value="일반게시글" <c:if test='${surport.su_type == "일반게시글"}'>selected</c:if>>일반게시글</option>
				</c:if>
				</select>
		</div>
		<div class="select-box col-12 mt-3">
			<label for="su_upHead">말머리 선택</label>
			<select class="form-control" id="su_upHead" name="su_upHead">
				<c:if test="${user.me_authority == 'admin'}">
					<option value="공지" <c:if test='${surport.su_upHead == "공지"}'>selected</c:if>>공지</option>
				</c:if>
				<c:if test="${user.me_authority == 'user' || user.me_authority == 'admin'}">
					<option value="문의" <c:if test='${surport.su_upHead == "문의"}'>selected</c:if>>문의</option>
					<option value="일반" <c:if test='${surport.su_upHead == "일반"}'>selected</c:if>>일반</option>
				</c:if>
			</select>
		</div>
		<div class="form-group col-12 mt-3">
			<label for="su_title">제목</label>
			<input type="text" class="form-control" id="su_title" name="su_title" required placeholder="제목을 입력해주세요.">
		</div>
	</div>	
		<div class="form-group mb-4">
			<label for="su_content">내용</label>
		  	<textarea class="content-box" id="su_content" name="su_content" required rows="10" placeholder="내용을 입력해주새요."></textarea>
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