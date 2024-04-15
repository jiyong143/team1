<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.js"></script>
</head>
<body>
	<div class="container">
		<form action="<c:url value="/product/insert"/>" method="post" enctype="multipart/form-data" id="productForm">
			<h1>상품 등록</h1>
			<div class="form-group">
				<label for="tg_title">대분류</label>
				<select name="tg_title" class="form-control">
					<option id="title" value="">대분류를 선택하세요.</option>
					<c:forEach items="${topGroupList}" var="tg">
						<option id="tg_title" value="${tg.tg_title}">${tg.tg_title}</option>
					</c:forEach>
				</select>
			</div>
			<div class="form-group">
				<label for="mg_title">중분류</label>
				<select name="mg_title" class="form-control mid-group"></select>
			</div>
			<div class="form-group">
				<label for="pr_name">제목</label>
				<input type="text" class="form-control" id="pr_name" name="pr_name">
			</div>
			<div class="form-group">
				<label for="pr_place">지역</label>
				<input type="text" class="form-control" id="pr_place" name="pr_place">
			</div>
			<div class="form-group">
				<label for="pr_content">내용</label>
				<textarea class="form-control" id="pr_content" name="pr_content"></textarea>
			</div>
			<div class="form-group">
				<label for="pr_price">가격</label>
				<input type="number" class="form-control" id="pr_price" name="pr_price">
			</div>
			<div class="form-group">
				<label>첨부파일(최대 5개)</label>
				<input type="file" class="form-control" name="file">
				<input type="file" class="form-control" name="file">
				<input type="file" class="form-control" name="file">
			</div>
			<button class="btn btn-outline-success">게시글 등록</button>
		</form>
	</div>
<script type="text/javascript">
	$("[name=tg_title]").change(function(){
		let title = $("[name=tg_title]").val();
		console.log(title);
		let obj = {
			tg_title : title
		}
		$.ajax({
			async : false,
			url : '<c:url value="/product/midGroup"/>', 
			type : 'get', 
			data : obj,
			dataType : "json", 
			success : function (data){
				console.log(data);
				displayMidGroup(data.data);
			}, 
			error : function(jqXHR, textStatus, errorThrown){

			}
		});
	})
	
	function displayMidGroup(list){
		let str = '';
		for(item of list){
			for(let mid of item.midGroupList){
				str += `<option value="\${mid.mg_title}">\${mid.mg_title}</option>`;
			}
		}
		$(".mid-group").html(str);
	}
</script>	

<script type="text/javascript">
// 서버에 전송하기 전에 제목, 내용 글자수 확인
$("#productForm").submit(function(){
	let title = $("[name = pr_title]").val();
	if(title.length == 0){
		alert("제목은 1글자 이상 입력해야 합니다.");
		$("[name = pr_title]").focus();
		return false;
	}
	
	let content = $("[name = pr_content]").val();
	if(content.length == 0){
		alert("내용은 1글자 이상 입력해야 합니다.");
		$("[name = pr_content]").focus();
		return false;
	}
});

$('[name = pr_content]').summernote({
	placeholder: '내용을 입력하세요',
	tabsize: 2,
	height: 400
});
</script>
</body>
</html>