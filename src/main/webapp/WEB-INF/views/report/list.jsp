<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<meta charset="UTF-8">
<title>신고 게시판</title>
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
<h1 class="page-title">신고 게시판</h1>
	<table class="table table-hover">
		<thead>
			<tr>
				<th>번호</th>
				<!-- 리스트 번호를 => 말버리 이름으로 변경 -->
				<th>신고 타입</th>
				<th>작성자</th>
				<th>신고일</th>
				<th>처분상태</th>
				<th>신고횟수</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${list}" var="report">
			<tr>
				<td>${report.re_num}</td>
				<td class="list-title">
					<c:url value="/report/detailProduct" var="url">
						<c:param name="reNum" value="${report.re_num}"/>
					</c:url>
					<a href="${url}">${report.re_name}</a>
				</td>
				<td>
					<a href="${aurl}">${report.re_me_id}</a>
				</td>
				<td>${report.re_date}</td>
				<td>${report.re_state}</td>
				<td>${report.re_count}</td>
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
		<a href="<c:url value="/report/insertProduct"/>" class="btn btn-dark mb-4">신고하기</a>
</div>

</body>
</html>