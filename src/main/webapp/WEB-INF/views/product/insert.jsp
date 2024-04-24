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
						<option id="tg_title check" value="${tg.tg_title}">${tg.tg_title}</option>
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
				<div class="form-check">
					<label class="form-check-label">
						<input type="radio" class="form-check-input" value="0" checked name="optradio">무료 나눔
					</label>
				</div>
				<div class="form-check">
					<label class="form-check-label">
						<input type="radio" class="form-check-input" value="-10" name="optradio">가격 제안
					</label>
				</div>
				<div class="form-check">
					<label class="form-check-label">
						<input type="radio" class="form-check-input priceTag" value="" name="optradio">가격 등록
						<input type="number" class="form-control" id="pr_price" name="pr_price" disabled>
					</label>
				</div>
			</div>
			<div class="form-group">
				<label>첨부파일(최대 5개)</label>
				<input type="file" class="form-control" name="file">
				<input type="file" class="form-control" name="file">
				<input type="file" class="form-control" name="file">
				<input type="file" class="form-control" name="file">
				<input type="file" class="form-control" name="file">
			</div>
			<button class="btn btn-outline-success">상품 등록</button>
		</form>
	</div>
	
	
<!-- 대분류 변경시 ajax로 중분류 실시간 변경 -->
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

<!-- 가격 관련 -->
<script type="text/javascript">
	$(".form-check-input").change(function(){
		let a = $(".priceTag").is(":checked");
		if(a == true){
			$("[name=pr_price]").prop('disabled',false);
		}else{
			$("[name=pr_price]").prop('disabled',true);
		}
	});
	
	$("[name=pr_price]").change(function(){
		let a = $(this).val();
		$(".priceTag").val(a);
		let b = $(".priceTag").val();
	});
</script>

<!-- 최소 글자 제한 + summernote -->
<script type="text/javascript">
// 서버에 전송하기 전에 제목, 내용 글자수 확인
$("#productForm").submit(function(e){
	let res = false;
	for(let i = 0; i < 5; i++){
		let fileTag = document.getElementsByName("file")[i];
		if(fileTag.value.length != 0){
			res = true
			return;
		}
	}
	if(res = true){
		alert("파일은 1개 이상 등록해야합니다.");
		return false;
	}else{
		return true;
	}
	
	if($("[name=file]").val().length == 0){
		alert("파일은 1개 이상 등록해야합니다.");
		return false;
	}
	
	if(!$(".check").checked){
		alert("대분류를 선택해야합니다.");
		$("[name = tg_title]").focus();
		return false;
	}
	
	let title = $("[name = pr_name]").val();
	if(title.length == 0){
		alert("제목은 1글자 이상 입력해야 합니다.");
		$("[name = pr_name]").focus();
		return false;
	}
	
	let place = $("[name = pr_place]").val();
	if(place.length == 0){
		alert("지역은 1글자 이상 입력해야 합니다.");
		$("[name = pr_place]").focus();
		return false;
	}
	
	let content = $("[name = pr_content]").val();
	if(content.length == 0){
		alert("내용은 1글자 이상 입력해야 합니다.");
		$("[name = pr_content]").focus();
		return false;
	}
	
	$(".priceTag").value = $("#pr_price").val();
	
});

$('[name = pr_content]').summernote({
	placeholder: '내용을 입력하세요',
	tabsize: 2,
	height: 400
});
</script>
</body>
</html>