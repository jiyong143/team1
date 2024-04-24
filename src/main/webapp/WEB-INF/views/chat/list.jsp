<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	table{
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
				</tr>
			</thead>
			<tbody>
			<c:forEach items="${crv}" var="crv">
				<c:url var="url" value="/chat/sse">
					<c:param name="cr_num" value="${crv.cr_num}"/>
				</c:url>
				<tr onClick="location.href='${url}'">
					<c:if test="${loginUser.me_id eq crv.cr_me_id}">
						<td>${crv.product.pr_me_id}</td>
					</c:if>
					<c:if test="${loginUser.me_id ne crv.cr_me_id}">
						<td>${crv.cr_me_id}</td>
					</c:if>
					<td>${crv.chatMessage.cm_content}</td>
					<td>${crv.chatMessage.date_str}</td>
				</tr>
			</c:forEach>
			</tbody>
		</table>
	</div><!-- end container -->
</body>
</html>