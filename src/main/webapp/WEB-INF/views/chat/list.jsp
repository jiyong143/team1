<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	.container{
		margin-top: 80px;
	}
</style>
</head>
<body>
	<div class="container">
		<table class="table table-hover">
			<thead>
				<tr>
					<th>상대방 아이디</th>
					<th>최근 메시지 내용</th>
					<th>최근 메시지 시간</th>
					<th></th>
					<th></th>
				</tr>
			</thead>
			<tbody>
				<c:choose>
					<c:when test="${crv.size() != 0}">
						<c:forEach items="${crv}" var="crv">
							<c:url var="url" value="/chat/sse">
								<c:param name="cr_num" value="${crv.cr_num}"/>
							</c:url>
							<tr>
								<c:if test="${loginUser.me_id eq crv.cr_me_id}">
									<td onClick="location.href='${url}'">${crv.product.pr_me_id}</td>
								</c:if>
								<c:if test="${loginUser.me_id ne crv.cr_me_id}">
									<td onClick="location.href='${url}'">${crv.cr_me_id}</td>
								</c:if>
								<td onClick="location.href='${url}'">${crv.chatMessage.cm_content}</td>
								<td onClick="location.href='${url}'">${crv.chatMessage.date_str}</td>
								<td>
									<c:if test="${loginUser.me_id eq crv.cr_me_id}">
										<button class="declarationBtn btn btn-outline-danger" data-id="${crv.product.pr_me_id}">신고하기</button>
									</c:if>
									<c:if test="${loginUser.me_id ne crv.cr_me_id}">
										<button class="declarationBtn btn btn-outline-danger" data-id="${crv.cr_me_id}">신고하기</button>
									</c:if>
								</td>
								<td>
									<button class="outBtn btn btn-outline-success" data-num="${crv.cr_num}">나가기</button>
								</td>
							</tr>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<tr>
							<td colspan="4"><span>생성된 채팅방이 없습니다.</span></td>
						</tr>
					</c:otherwise>
				</c:choose>
			</tbody>
		</table>
		<ul class="pagination justify-content-center">
			<c:if test="${pm.prev}">
				<c:url value="/chat/list" var="url">
					<c:param name="page" value="${pm.startPage - 1}"/>
				</c:url>
				<li class="page-item">
					<a class="page-link" href="${url}">이전</a>
				</li>
			</c:if>
			<c:forEach begin="${pm.startPage}" end="${pm.endPage}" var="i">
				<c:url value="/chat/list" var="url">
					<c:param name="page" value="${i}"/>
				</c:url>
				<li class="page-item <c:if test="${pm.cri.page == i}">active</c:if>">
					<a class="page-link" href="${url}">${i}</a>
				</li>
			</c:forEach>
			<c:if test="${pm.next}">
				<c:url value="/chat/list" var="url">
					<c:param name="page" value="${pm.endPage + 1}"/>
				</c:url>
				<li class="page-item">
					<a class="page-link" href="${url}">다음</a>
				</li>
			</c:if>
		</ul>
	</div><!-- end container -->
	
<!-- 나가기 버튼 -->
<script type="text/javascript">
	$(document).on("click", ".outBtn", function(){
		let page = ${pm.cri.page};
		console.log(page);
		let num = $(this).data('num');	// 채팅방 번호
		
		if(confirm("채팅방을 나가시겠습니까?")){
			btnOutCheck(num);
			var url = '<c:url value="/chat/list"/>' + '?page='+page;
			location.href = url;
		}
	});
	
	function btnOutCheck(num){
		$.ajax({
			async : false,
			url : '<c:url value="/chat/out"/>',
			type : "post", 
			data : {num : num},
			success : function (data){
				console.log(data.num);
			}, 
			error : function(jqXHR, textStatus, errorThrown){
			}
		});
	}
</script>

<!-- 신고하기 버튼 -->
<script type="text/javascript">
	$(document).on("click", ".declarationBtn", function(){
		let page = ${pm.cri.page};
		let id = $(this).data('id');	// 채팅방 번호
		
		if(confirm("채팅방을 신고하시겠습니까?")){
			var url = '<c:url value="/report/insertChat"/>' + '?me_id='+ id;
			console.log(url);
			location.href = url;
		}
	});
</script>
</body>
</html>