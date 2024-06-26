<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<meta charset="UTF-8">
<title>고객지원</title>
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
<jsp:include page="/WEB-INF/views/common/sideBar.jsp"/>
<div class="container">
<h1 class="page-title">고객지원</h1>
	<form action="<c:url value="/surport/list"/>" method="get">
		<div class="input-group mb-3">
			<select name="type" class="form-control">				
				<option value="all" <c:if test="${pms.cris.type == 'all'}">selected</c:if>>전체</option>
				<option value="title" <c:if test="${pms.cris.type == 'title'}">selected</c:if>>말머리</option>
				<option value="writer" <c:if test="${pms.cris.type == 'writer'}">selected</c:if>>작성자</option>
			</select>
			<input type="text" name="search" class="form-control" placeholder="검색어" value="${pms.cris.search}">
		</div>
	</form>

	<table class="table table-hover">
		<thead>
			<tr>
				<th>말머리</th>
				<th>제목</th>
				<th>작성자</th>
				<th>작성일</th>
				<th>조회수</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${list}" var="surport">
			<tr>
				<td>${surport.su_upHead}</td>
				<td class="list-title">
					<c:url value="/surport/detail" var="url">
						<c:param name="suNum" value="${surport.su_num}"/>
					</c:url>
					<a href="${url}">${surport.su_title}</a>
				</td>
				<td>
					<c:url value="/surpotr/list" var="aurl">
						<c:param name="type" value="writer"/>
						<c:param name="search" value="${surport.su_num}"/>
					</c:url>
					<a>${surport.su_me_id}</a>
				</td>
				<td>${surport.su_date}</td>
				<td>${surport.su_view}</td>
			</tr>
			</c:forEach>
		</tbody>
	</table>
	<ul class="pagination justify-content-center">
		<c:if test="${pms.prev}">
			<li class="page-item">
				<c:url var="url" value="/surport/list">
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
				<c:url var="url" value="/surport/list">
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
				<c:url var="url" value="/surport/list">
					<c:param name="page" value="${pms.endPage + 1}"/>
					<c:param name="search" value="${pms.cris.search}"/>
					<c:param name="type" value="${pms.cris.type}"/>
					<c:param name="order" value="${pms.cris.order}"/>
				</c:url>
				<a class="page-link" href="${url}">다음</a>
			</li>
		</c:if>
	</ul>
	<a href="<c:url value="/surport/insert"/>" class="btn btn-dark mb-4">문의하기</a>
	<a href="<c:url value="/fixed/list"/>" class="btn btn-dark mb-4">고정문의</a>	
</div>

</body>
</html>