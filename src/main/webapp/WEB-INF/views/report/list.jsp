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

	<form action="<c:url value="/report/list"/>" method="get">
		<div class="input-group mb-3">
			<select name="type" class="form-control">				
				<option value="writer" <c:if test="${pmr.crir.type == 'writer'}">selected</c:if>>작성자</option>
			</select>
			<input type="text" name="search" class="form-control" placeholder="검색어" value="${pmr.crir.search}">
		</div>
	</form>

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
					<a href="${url}">${report.re_me_id}</a>
				</td>
				<td>${report.re_date}</td>
				<td>${report.re_state}</td>
				<td>${report.re_count}</td>
			</tr>
			</c:forEach>
		</tbody>
	</table>
	<ul class="pagination justify-content-center">
		<c:if test="${pmr.prev}">
			<li class="page-item">
				<c:url var="url" value="/report/list">
					<c:param name="page" value="${pmr.startPage - 1}"/>
					<c:param name="search" value="${pmr.crir.search}"/>
					<c:param name="type" value="${pmr.crir.type}"/>
					<c:param name="order" value="${pmr.crir.order}"/>
				</c:url>
				<a class="page-link" href="${url}">이전</a>
			</li>
		</c:if>
		<c:forEach begin="${pmr.startPage}" end="${pmr.endPage}" var="i">
			<c:set var="active" value="${pmr.crir.page == i ?'active':''}"/>
			<li class="page-item ${active}">
				<c:url var="url" value="/report/list">
					<c:param name="page" value="${i}"/>
					<c:param name="search" value="${pmr.crir.search}"/>
					<c:param name="type" value="${pmr.crir.type}"/>
					<c:param name="order" value="${pmr.crir.order}"/>
				</c:url>
				<a class="page-link" href="${url}">${i}</a>
			</li>
		</c:forEach>
		<c:if test="${pmr.next}">
			<li class="page-item">
				<c:url var="url" value="/report/list">
					<c:param name="page" value="${pmr.endPage + 1}"/>
					<c:param name="search" value="${pmr.crir.search}"/>
					<c:param name="type" value="${pmr.crir.type}"/>
					<c:param name="order" value="${pmr.crir.order}"/>
				</c:url>
				<a class="page-link" href="${url}">다음</a>
			</li>
		</c:if>
	</ul>
		<a href="<c:url value="/report/insertProduct"/>" class="btn btn-dark mb-4">신고하기</a>
</div>

</body>
</html>