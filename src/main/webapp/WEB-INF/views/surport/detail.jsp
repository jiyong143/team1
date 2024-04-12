<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<meta charset="UTF-8">
<title>고객문의 상세</title>
<link rel="stylesheet" href="/css/summernote/summernote-lite.css">
<script src="/js/summernote/summernote-lite.js"></script>
<script src="/js/summernote/lang/summernote-ko-KR.js"></script>

</head>
<body>
<div class="container">
	<h1>문의글 상세</h1>
	<form action="<c:url value="/surport/detail"/>" method="post" enctype="multipart/form-data">
		<div class="form-group mt-4">
			<label for="surportManage">말머리</label>
			<select class="form-control" id="surportManage" name="su_sm_num">
				<c:forEach items="${list}" var="co">
					<option value="${sm.sm_num}">${sm.sm_name }</option>
				</c:forEach>
			</select>
		</div>
		
		<!--  
		<div class="form-group">
			<label for="title">제목</label>
			<input type="text" class="form-control" id="title" name="su_title" required>
		</div>
		-->
		
		
		<div class="form_group">
			<textarea type="text" class="form-control mb-4" readonly="su_title"
			style="overflow: hidden; overflow-wrap: break-word; height: 47.6px;"></textarea>
		</div>
		
		
		<form method="post">
			<div class="form-group mb-4">
			
				  <textarea class="form-control" id="summernote" name="su_content" required rows="10" readonly="su_content"></textarea>
			</div>
		</form>
		
		<a href="<c:url value="/surport/update"/>" class="btn btn-dark col-12 mb-4">수정</a>
		<button type="submit" class="btn btn-dark col-12 mb-4">삭제</button>
	</form>
</div>

<script type="text/javascript">
	$(document).ready(function() {
		$('#summernote').summernote({
			  height: 300,                
			  minHeight: null,            
			  maxHeight: null,            
			  focus: true,                 
			  lang: "ko-KR",				
			  placeholder: '최대 2048자까지 쓸 수 있습니다'       
		});
	});
	//서머노트에 text 쓰기
	$('#summernote').summernote('insertText', 써머노트에 쓸 텍스트);
	// 서머노트 쓰기 비활성화
	$('#summernote').summernote('disable');
	// 서머노트 쓰기 활성화
	$('#summernote').summernote('enable');
	// 서머노트 리셋
	$('#summernote').summernote('reset');
	// 마지막으로 한 행동 취소 ( 뒤로가기 )
	$('#summernote').summernote('undo');
	// 앞으로가기
	$('#summernote').summernote('redo');
</script>

</body>
</html>