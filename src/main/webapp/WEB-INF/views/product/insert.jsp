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
				<label for="tg_title" style="display: block">카테고리</label>
				<select name="tg_title" class="form-control" style="width: 50%; display: inline;">
					<option id="title" value="">대분류를 선택하세요.</option>
					<c:forEach items="${topGroupList}" var="tg">
						<option id="tg_title" value="${tg.tg_title}">${tg.tg_title}</option>
					</c:forEach>
				</select>
				<select name="mg_title" class="form-control mid-group" style="width: 50%; display: inline; float: right"></select>
			</div>
			<div class="form-group">
				<label for="pr_name">제목</label>
				<input type="text" class="form-control" id="pr_name" name="pr_name">
			</div>
			<div class="form-group">
				<label for="sido" style="display: block">주소</label>
				<select name="sido" class="form-control" style="width: 33%; display: inline;">
					<option id="sido" value="">시/도를 선택하세요.</option>
					<c:forEach items="${sidoList}" var="sido">
						<option id="sido check" value="${sido.sido}">${sido.sido}</option>
					</c:forEach>
				</select>
				<select name="sigungu" class="form-control sigungu" style="width: 33%; display: inline;"></select>
				<select name="h_dong_nm" class="form-control h_dong_nm" style="width: 33%; display: inline;"></select>	
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
						<input type="text" class="form-control" id="pr_price" name="pr_price"
						 oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');"
						 autocomplete="off" disabled>
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
	$("[name=mg_title]").hide();
	
	$("[name=tg_title]").change(function(){
		$("[name=mg_title]").show();
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

<!-- 시/군/구 관련 -->
<script type="text/javascript">
	$("[name=sigungu]").hide();
	$("[name=h_dong_nm]").hide();
	
	$("[name=sido]").change(function(){
		
		$("[name=sigungu]").show();
		let sido = $("[name=sido]").val();
		
		// sido == 세종...
		if($("[name=sido]").val() == '세종특별자치시'){
			$("[name=h_dong_nm]").show();
			let obj = {
				sido : sido,
				sigungu : ""
			}
			dongAjax(obj);
		}
		
		// sido != 세종...
		let obj = {
			sido : sido
		}
		$.ajax({
			async : false,
			url : '<c:url value="/product/sigungu"/>', 
			type : 'get', 
			data : obj,
			dataType : "json", 
			success : function (data){
				displaysigungu(data.sigunguList);
			}, 
			error : function(jqXHR, textStatus, errorThrown){
	
			}
		});
	})
	
	function displaysigungu(list){
		let str = `<option id="sigungu" value="">시/군/구를 선택하세요.</option>`;
		for(item of list){
			str += `<option value="\${item.sigungu}">\${item.sigungu}</option>`;
		}
		$(".sigungu").html(str);
	}
</script>

<!-- 동 관련 -->
<script type="text/javascript">
	$("[name=sigungu]").change(function(){
		$("[name=h_dong_nm]").show();
		let sido = $("[name=sido]").val();
		let sigungu = $("[name=sigungu]").val();
		let obj = {
			sido : sido,
			sigungu : sigungu
		}
		dongAjax(obj);
	})
	
	function dongAjax(obj){
		$.ajax({
			async : false,
			url : '<c:url value="/product/dong"/>', 
			type : 'get', 
			data : obj,
			dataType : "json", 
			success : function (data){
				console.log(data);
				displaydong(data.dongList);
			}, 
			error : function(jqXHR, textStatus, errorThrown){
	
			}
		});
	}

	function displaydong(list){
		let str = `<option id="h_dong_nm" value="x">동을 선택하세요.</option>`;
		for(item of list){
			str += `<option value="\${item.h_dong_nm}">\${item.h_dong_nm}</option>`;
		}
		$(".h_dong_nm").html(str);
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
	const pr_price = document.querySelector('#pr_price');
	pr_price.addEventListener('keyup', function(e) {
		let value = e.target.value;
		// 입력 값이 없으면 빈문자열로 설정
		if (value === "" || value === null || isNaN(Number(value))) {
		  value = "";
		} else {
		  value = Number(value.replaceAll(',', ''));
		}
		const formatValue = value.toLocaleString('ko-KR');
		pr_price.value = formatValue; 
	});
	
	// 서버에 전송하기 전에 파일, 대분류, 제목, 내용 글자수 확인
	$("#productForm").submit(function(e){
		let res = false;

		if($(".h_dong_nm").val() == 'x'){
			alert("주소를 입력해야 합니다.");
			$(".h_dong_nm").focus();
			return false;
		}
		
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