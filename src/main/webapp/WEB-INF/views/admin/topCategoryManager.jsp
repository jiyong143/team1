<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.1.js"></script>
<style type="text/css">
	.card-1 {
		padding: 30px;
	  box-shadow: 0 1px 3px rgba(0,0,0,0.12), 0 1px 2px rgba(0,0,0,0.24);
	  transition: all 0.3s cubic-bezier(.25,.8,.25,1);
	}
	.card-1:hover {
	  box-shadow: 0 14px 28px rgba(0,0,0,0.25), 0 10px 10px rgba(0,0,0,0.22);
	}
	.category-list-table {
		margin-top: 20px
	}
</style>
</head>
<body>
<div class="container mt-3 col-6 card-1">
	<h2 style="font-weight: bold">대분류 관리</h2>
	<div class="input-group mb-3" style="margin-top: 30px;">
		<input type="text" name="topGroup" class="form-control category-content" placeholder="새로 등록할 대분류 이름을 입력하세요.">
		<button class="btn btn-success btn-category-insert" type="button" onClick="addBtn()">등록</button>
	</div>
	<table class="table table-hover category-list-table">
		<thead class="box-category-list">
			<tr class="box-category">
				<td class="col-2">대분류 번호</td>
				<td class="col-5">대분류 제목</td>
				<td class="col-2"></td>
				<td class="col-2"></td>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${topList}" var="topList" varStatus="i">
				<tr>
					<td>${i.index+1}</td>
					<td>${topList.tg_title}</td>
					<td>
						<button value="${topList.tg_num}" class="updateBtn btn btn-outline-warning">수정</button>
					</td>
					<td>
						<button value="${topList.tg_num}" class="deleteBtn btn btn-outline-danger">삭제</button>
					</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<div class="box-category-pagination">
		<ul class="pagination justify-content-center">
			<li class="page-item">
				<a class="page-link" href="javascript:void(0);">이전</a>
			</li>
			<li class="page-item active">
				<a class="page-link" href="javascript:void(0);">1</a>
			</li>
			<li class="page-item">
				<a class="page-link" href="javascript:void(0);">다음</a>
			</li>
		</ul>
	</div>
</div>
<script type="text/javascript">
	function addBtn(){
		let topGroup = $("[name=topGroup]").val();
		$.ajax({
			async : true,
			url : '<c:url value="/admin/topCategoryManager"/>',
			type : 'post', 
			data : {topGroup : topGroup},	
			success : function (data){
			    console.log(data);
			},
			error : function(jqXHR, textStatus, errorThrown){

			}
		});
	}

	$(document).on("click", ".updateBtn", function(){
		let val = this.value;	// 수정할 대분류 번호
		
	});
	
	$(document).on("click", ".deleteBtn", function(){
		let val2 = this.value;	// 삭제할 대분류 번호
		alert(val2);
	});
</script>
</body>
</html>