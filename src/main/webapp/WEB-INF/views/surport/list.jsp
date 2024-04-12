<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<meta charset="UTF-8">
<title>고객지원</title>
</head>
<body>

<div class="container">
<h1>고객지원</h1>
  
	<table class="table table-hover">
		<thead>
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>내용</th>
				<th>작성자</th>
				<th>작성일</th>
				<th>조회수</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td>${surport.su_num}</td>
				<td>${surport.su_title}</td>
				<td>${surport.su_content}</td>
				<td>${surport.su_me_id}</td>
				<td>${surport.su_date}</td>
			</tr>
		</tbody>
	</table>
	<ul class="pagination justify-content-center">
		<c:if test="${pm.prev}">
			<li class="page-item">
				<c:url var="url" value="/post/list">
					<c:param name="page" value="${pm.startPage - 1}"/>
					<c:param name="search" value="${pm.cri.search}"/>
					<c:param name="type" value="${pm.cri.type}"/>
					<c:param name="order" value="${pm.cri.order}"/>
				</c:url>
				<a class="page-link" href="${url}">이전</a>
			</li>
		</c:if>
		<c:forEach begin="${pm.startPage}" end="${pm.endPage}" var="i">
			<c:set var="active" value="${pm.cri.page == i ?'active':'' }"/>
			<li class="page-item ${active}">
				<c:url var="url" value="/post/list">
					<c:param name="page" value="${i}"/>
					<c:param name="search" value="${pm.cri.search}"/>
					<c:param name="type" value="${pm.cri.type}"/>
					<c:param name="order" value="${pm.cri.order}"/>
				</c:url>
				<a class="page-link" href="${url}">${i}</a>
			</li>
		</c:forEach>
		<c:if test="${pm.next}">
			<li class="page-item">
				<c:url var="url" value="/post/list">
					<c:param name="page" value="${pm.endPage + 1}"/>
					<c:param name="search" value="${pm.cri.search}"/>
					<c:param name="type" value="${pm.cri.type}"/>
					<c:param name="order" value="${pm.cri.order}"/>
				</c:url>
				<a class="page-link" href="${url}">다음</a>
			</li>
		</c:if>
	</ul>
	<a href="<c:url value="/surport/insert"/>" class="btn btn-dark">문의하기</a>
		<a href="<c:url value="/surport/detail"/>" class="btn btn-dark">문의상세</a>
		<a href="<c:url value="/surportMm/list"/>" class="btn btn-dark">고정문의</a>
	
</div>

</body>
</html>