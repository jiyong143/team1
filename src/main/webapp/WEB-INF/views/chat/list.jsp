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
		margin-top: 200px;
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
									<button class="outBtn" data-num="${crv.cr_num}">나가기</button>
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
	</div><!-- end container -->
<script type="text/javascript">
	$(document).on("click", ".outBtn", function(){
		let num = $(this).data('num');	// 채팅방 번호
		
		if(confirm("채팅방을 나가시겠습니까?")){
			btnOutCheck(num);
			var url = '<c:url value="/chat/list"/>';
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
</body>
</html>