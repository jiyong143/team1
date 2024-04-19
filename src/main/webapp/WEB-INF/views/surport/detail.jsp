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
.comment_title {
    float: left;
    margin-top: 3px;
    margin-right: 12px;
    font-size: 17px;
}
.button_comment {
    display: inline-block;
    vertical-align: top;
    font-size: 13px;
}
.page-title{
	font-size: 28px; 
	font-weight:800;
	margin-top:10px; 
}
</style>
</head>
<body>
<div class="container">
	<h1 class="page-title">문의글 상세</h1>
	<div class="container-box">
		<div class="select-box col-12 mt-3">
			<label for="suport_manage">지원타입 선택</label>
			<select class="form-control" id="suport_manage" name="su_sm_num" readonly value="${surport.su_sm_num}">
				<c:forEach items="${suport_manage}" var="sm">
					<option value="${sm.sm_num}">${sm.sm_name}</option>
				</c:forEach>
			</select>
		</div>
		<div class="select-box col-12 mt-3">
			<label for="up_head">말머리 선택</label>
			<select class="form-control" id="up_head" name="su_uh_num" readonly value="${surport.su_uh_num}">
				<c:forEach items="${up_head}" var="uh">
					<option value="${sm.uh_num}">${sm.uh_name}</option>
				</c:forEach>
			</select>
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
		<div class="content-box mb-4">
			<label for="su_content">내용</label>
		  	<textarea class="form-control" id="su_content" name="su_content" required rows="10"readonly value="${surport.su_content}"></textarea>
		</div>
		<a href="/team1/surport/list" class="btn btn-outline-dark mb-4">목록으로</a>
		<c:if test="${user.me_id == surport.su_me_id}">
			<a href="<c:url value="/surport/delete?suNum=${surport.su_num}"/>" class="btn btn-outline-success mb-4">삭제</a>
			<a href="<c:url value="/surport/update?suNum=${surport.su_num}"/>" class="btn btn-outline-warning mb-4">수정</a>
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
			<em data="" class="comment_inbox_name">${surport.su_me_id}id</em>
			<div class="input-group mb-3">
				<textarea class="form-control textarea-comment">
				
				
				</textarea>
			</div>
				<button class="btn btn-outline-success btn-comment-insert mb-4">댓글 등록</button>
		</div>
	
	</div>
</div>

<script type="text/javascript">	

</script>
</body>
</html>