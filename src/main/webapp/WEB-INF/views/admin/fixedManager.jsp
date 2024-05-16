<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<meta charset="UTF-8">
<title>고정문의</title>
<style type="text/css">
.page-title{
	font-size: 28px; 
	font-weight:800;
	margin-top:10px; 
}
.list-title{
	color: red;
}
</style>
</head>
<body>
<div class="container">
<h1 class="page-title">고정문의 리스트</h1>
	<table class="table table-hover">
		<thead>
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>작성자</th>
				<th>작성일</th>
				<th>조회수</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${list}" var="fixed">
			<tr>
				<td>${fixed.fix_num}</td>
				<td class="list-title">
					<c:url value="/fixed/detail" var="url">
						<c:param name="fixNum" value="${fixed.fix_num}"/>
					</c:url>
					<a href="${url}">${fixed.fix_title}</a>
				</td>
				<td>
					<c:url value="/fixed/list" var="aurl">
						<c:param name="type" value="writer"/>
						<c:param name="search" value="${fixed.fix_num}"/>
					</c:url>
					${fixed.fix_me_id}
				</td>
				<td>${fixed.fix_date}</td>
				<td>${fixed.fix_view}</td>
			</tr>
			</c:forEach>
		</tbody>
	</table>
	<ul class="pagination justify-content-center">
		<c:if test="${pms.prev}">
			<li class="page-item">
				<c:url var="url" value="/fixed/list">
					<c:param name="page" value="${pms.startPage - 1}"/>
					<c:param name="search" value="${pms.cris.search}"/>
					<c:param name="type" value="${pms.cris.type}"/>
					<c:param name="order" value="${pms.cris.order}"/>
				</c:url>
				<a class="page-link" href="${url}">이전</a>
			</li>
		</c:if>
		<c:forEach begin="${pms.startPage}" end="${pms.endPage}" var="i">
			<c:set var="active" value="${pm.cris.page == i ?'active':'' }"/>
			<li class="page-item ${active}">
				<c:url var="url" value="/fixed/list">
					<c:param name="page" value="${i}"/>
					<c:param name="search" value="${pms.cris.search}"/>
					<c:param name="type" value="${pms.cris.type}"/>
					<c:param name="order" value="${pms.cris.order}"/>
				</c:url>
				<a class="page-link" href="${url}">${i}</a>
			</li>
		</c:forEach>
		<c:if test="${pms.next}">
			<li class="page-item">
				<c:url var="url" value="/fixed/list">
					<c:param name="page" value="${pms.endPage + 1}"/>
					<c:param name="search" value="${pms.cris.search}"/>
					<c:param name="type" value="${pms.cris.type}"/>
					<c:param name="order" value="${pms.cris.order}"/>
				</c:url>
				<a class="page-link" href="${url}">다음</a>
			</li>
		</c:if>
	</ul>
	  	<c:if test="${member.me_authority != 'admin'}">
			<a href="<c:url value="/fixed/insert"/>" class="btn btn-dark mb-4">고정문의 작성</a>
		</c:if>
</div>

</body>
</html>