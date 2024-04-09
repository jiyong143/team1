<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="container">
	<h1>게시글 리스트</h1>
	<table class="table table-hover">
		<thead>
			<tr>
				<th>채팅방 번호</th>
				<th>판매자 아이디</th>
				<th>구매자 아이디</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${chatRoomList}" var="chatList">
				<tr>
					<td>${chatList.product.pr_me_id}</td>
					<td>
						<a href="<c:url value="/chat/detail?num=${chatList.cr_num}"/>">${chatList.pr_num}</a>
					</td>
					<td>${chatList.cr_me_id}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</div>
</body>
</html>