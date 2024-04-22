<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<meta charset="UTF-8">
<title>고객지원 상세</title>
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.js"></script>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<style>
.container-box{
	width: 100%; height: 430px;	
    box-shadow: 0 1px 5px 0px rgba(0,0,0,0.2);
    margin-bottom : 10px
}
.form-group{ width: 100%;}

.textarea-comment{
	width: 100%; height: 260px;
    box-shadow: 0 1px 5px 0px rgba(0,0,0,0.2);
    margin-bottom : 10px
}
.comment_title{
    float: left;
    margin-top: 3px;
    margin-right: 12px;
    font-size: 17px;
}
.button_comment{
    display: inline-block;
    vertical-align: top;
    font-size: 13px;
}
.page-title{
	font-size: 28px; 
	font-weight:800;
	margin-top:10px; 
}
.content-box{
	width: 100%;
	height: auto;
	box-shadow: 0 1px 5px 0px rgba(0,0,0,0.2);
	padding: 10px;
}
</style>
</head>
<body>
<div class="container">
	<h1 class="page-title">문의글 상세</h1>
	<div class="container-box">
		<div class="select-box col-12 mt-3">
			<label for="suport_manage">지원타입 선택</label>
			<input class="form-control" id="su_sm_name" name="su_sm_name" readonly value="${surport.su_sm_num}">
		</div>
		<div class="select-box col-12 mt-3">
			<label for="upHead">말머리 선택</label>
			<input class="form-control" id="su_uh_name" name="su_uh_name" readonly value="${surport.su_uh_num}">
		</div>
		<div class="form-group col-12 mt-3">
			<label for="su_title">제목</label>
			<input type="text" class="form-control" id="su_title" name="su_title" readonly value="${surport.su_title}">
		</div>
		<div class="form-group col-12 mt-3">
			<label for="id">작성자</label>
			<input type="text" class="form-control" id="id" name="id" readonly value="${surport.su_me_id}">
		</div>	
			<div class="form-group col-12 mt-3">
			<label for="su_view">조회수</label>
			<input type="number" class="form-control" id="su_view" name="su_view" readonly value="${surport.su_view}">
		</div>
	</div>
		<div class="form-group">
			<label for="su_content">내용</label>
			<div class="content-box" id="su_content" name="su_content">${surport.su_content}</div>
		</div>
		<a href="/team1/surport/list" class="btn btn-outline-dark mb-4 mt-2">목록으로</a>
		<c:if test="${user.me_id == surport.su_me_id}">
			<a href="<c:url value="/surport/delete?suNum=${surport.su_num}"/>" class="btn btn-outline-success mb-3">삭제</a>
			<a href="<c:url value="/surport/update?suNum=${surport.su_num}"/>" class="btn btn-outline-warning mb-3">수정</a>
		</c:if>
	
	<div class="container-comment">	
	<h3 class="comment_title"> 댓글(<span class="comment-total">-</span>) </h3>
	
	
		
		<div class="box-comment-list">
			<div class="box-comment row">
			
			
				<div class="col-3">아이디</div>
				<div class="col-9">내용</div>
			</div>
		</div>
		<div class="box-pagination">
			<ul class="pagination justify-content-center"></ul>
		</div>
		<div class="box-comment-insert">
			<em data="" class="comment_inbox_name">${surport.su_me_id}</em>
			<div class="input-group mb-3">
				<textarea class="form-control textarea-comment">
				
				
				</textarea>
			</div>
				<button class="btn btn-outline-success btn-comment-insert mb-4">댓글 등록</button>
		</div>
	
	</div>
</div>

<script type="text/javascript">	
	
//su_sm_num의 값을 문자열로 변환
var su_sm_num = "${surport.su_sm_num}";
document.getElementById("su_sm_name").value = convertToString(su_sm_num);

//su_uh_num의 값을 문자열로 변환
var su_uh_num = "${surport.su_uh_num}";
document.getElementById("su_uh_name").value = convertToString(su_uh_num);

//숫자를 문자열로 변환하는 함수
function convertToString(num) {
 // JavaScript의 String 함수를 사용하여 문자열로 변환
 return String(num);
}

</script>
</body>
</html>