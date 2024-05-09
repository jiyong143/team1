<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	.card-1 {
		background-color:white;
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
	<h2 style="font-weight: bold">중분류 관리</h2>
	<div class="input-group mb-3" style="margin-top: 30px; width: 100%">
		<select class="tg" style="width: 100%">
			<option>대분류를 선택하세요.</option>
			<c:forEach items="${list}" var="list">
				<option value="${list.tg_title}">${list.tg_title}</option>
			</c:forEach>
		</select>
	</div>	
	<div class="input-group mb-3" style="margin-top: 30px;">
		<input type="text" name="topGroup" class="form-control category-content" placeholder="새로 등록할 중분류 이름을 입력하세요.">
		<button class="btn btn-success btn-category-insert" type="button">등록</button>
	</div>
	<table class="table table-hover category-list-table">
		<thead class="box-category-list">
			<tr class="box-category">
				<td class="col-2">대분류 제목</td>
				<td class="col-5">중분류 제목</td>
				<td class="col-2"></td>
				<td class="col-2"></td>
			</tr>
		</thead>
		<tbody class="midGroupList">
			<tr>
				<td colspan=4><h3>대분류를 선택하세요.</h3></td>
			</tr>
		</tbody>
	</table>
	<div class="box-category-pagination">
		
	</div>
</div>
<!-- 화면 출력 -->
<script type="text/javascript">
	$(document).on("change", ".tg", function(){
		let a = $(".tg").val();
		let cri = {
			page : 1
		}
		console.log(a);
		if(a == "대분류를 선택하세요."){
			let str = 
				`
				<tr>
					<td colspan=4><h3>대분류를 선택하세요.</h3></td>
				</tr>
				`;
			$('.midGroupList').html(str);
			return;
		}
		
		$.ajax({
			async : true,
			url : '<c:url value="/admin/midCategoryByTopManager"/>',
			type : 'post', 
			dataType : "json",
			data : {topGroup : a, cri : cri},
			success : function (data){
				console.log(data);
				displayMid(data.midList);
				displayPagination(data.pm);
			},
			error : function(jqXHR, textStatus, errorThrown){

			}
		});
	})
	
	function displayMid(list){
		let str = '';
		if(list == null || list.length == 0){
			str = 
				`
				<tr>
					<td colspan=4><h3>대분류에 해당하는 중분류가 없습니다.</h3></td>
				</tr>
				`;
			$('.midGroupList').html(str);
			return;
		}
		for(item of list){
			str += 
				`
				<tr>
					<td>\${item.mg_tg_title}</td>
					<td>\${item.mg_title}</td>
					<td>
						<button value="\${item.mg_num}" class="updateBtn btn btn-outline-warning">수정</button>
					</td>
					<td>
						<button value="\${item.mg_num}" class="deleteBtn btn btn-outline-danger">삭제</button>
					</td>
				</tr>
				`;
			$('.midGroupList').html(str);
		}
	}
	
	function displayPagination(pm){
		str = '';
		str += 
			`
			<ul class="pagination justify-content-center">
				<c:if test="${pm.prev}">
					<c:url value="/admin/midCategoryManager" var="url">
						<c:param name="page" value="${pm.startPage - 1}"/>
					</c:url>
					<li class="page-item">
						<a class="page-link" href="${url}">이전</a>
					</li>
				</c:if>
				<c:forEach begin="${pm.startPage}" end="${pm.endPage}" var="i">
					<c:url value="/admin/midCategoryManager" var="url">
						<c:param name="page" value="${i}"/>
					</c:url>
					<li class="page-item <c:if test="${pm.cri.page == i}">active</c:if>">
						<a class="page-link" href="${url}">${i}</a>
					</li>
				</c:forEach>
				<c:if test="${pm.next}">
					<c:url value="/admin/midCategoryManager" var="url">
						<c:param name="page" value="${pm.endPage + 1}"/>
					</c:url>
					<li class="page-item">
						<a class="page-link" href="${url}">다음</a>
					</li>
				</c:if>
			</ul>
			`;
			$(".box-category-pagination").html(str);
	}
</script>

<!-- 중분류 추가,수정,삭제 -->
<script type="text/javascript">
	<!-- 중분류 추가 -->
	$(document).on("click", ".btn-category-insert", function(){
		let topGroup = $("[name=topGroup]").val();
		let tg = $(".tg").val();
		$.ajax({
			async : true,
			url : '<c:url value="/admin/addMidCategoryManager"/>',
			type : 'post', 
			dataType : "json",
			data : {topGroup : topGroup, tg : tg},	
			success : function (data){
			    alert(data.msg);
			    $("[name=topGroup]").val("");
			    var url = '<c:url value="/admin/midCategoryManager"/>' + '?page=1';
				location.href = url;
			},
			error : function(jqXHR, textStatus, errorThrown){

			}
		});
	});

	<!-- 중분류 수정 -->
	$(document).on("click", ".updateBtn", function(){
		let tg_num = this.value;	// 수정할 대분류 번호 => DB에 저장되 있는 번호
		$(".btn-category-insert").addClass("btn-category-update");
		$(".btn-category-insert").removeClass("btn-category-insert");
		$("[name=topGroup]").attr("placeholder", "수정할 중분류 이름을 입력하세요.");
		
		$(".btn-category-update").click(function(){
			let topGroup = $("[name=topGroup]").val();
			let obj = {
				topGroup : topGroup,
				tg_num : tg_num
			}
			$.ajax({
				async : true,
				url : '<c:url value="/admin/updateMidCategoryManager"/>',
				type : 'post', 
				dataType : "json",
				data : obj,	
				success : function (data){
				    console.log(data);
				    alert(data.msg);
					$(".btn-category-update").addClass("btn-category-insert");
					$(".btn-category-update").removeClass("btn-category-update");
					$("[name=topGroup]").attr("placeholder", "새로 추가할 중분류 이름을 입력하세요.");
					var url = '<c:url value="/admin/midCategoryManager"/>' + '?page=1';
					location.href = url;
				},
				error : function(jqXHR, textStatus, errorThrown){

				}
			});
		});
	});
	
	<!-- 중분류 삭제 -->
	$(document).on("click", ".deleteBtn", function(){
		let tg_num = this.value;	// 삭제할 대분류 번호
		$.ajax({
			async : true,
			url : '<c:url value="/admin/deleteMidCategoryManager"/>',
			type : 'post', 
			dataType : "json",
			data : {tg_num : tg_num},	
			success : function (data){
			    alert(data.msg);
			    var url = '<c:url value="/admin/midCategoryManager"/>' + '?page=1';
				location.href = url;
			},
			error : function(jqXHR, textStatus, errorThrown){

			}
		});
	});
</script>
</body>
</html>