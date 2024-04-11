<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!doctype html>
<html>
<head>
<meta charset="UTF-8">
<title>거래글 리스트</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
<div class="container">
  <h2>검색결과</h2>
  <p>현재 페이지 정보</p>            
  <table class="table table-bordered mb-3">
    <tbody>
      <tr>
        <td>카테고리</td>
        <td>중분류</td>
      </tr>
      <tr>
        <td>평균가격</td>
        <td>중분류 평균가</td>
      </tr>
      <tr>
        <td>가장 높은 가격</td>
        <td>중분류 최고가</td>
      </tr>
        <tr>
        <td>가장 낮은 가격</td>
        <td>중분류 최저가</td>
      </tr>
    </tbody>
  </table>
</div>

<form action="<c:url value="/product/list"/>" method="get">
	<div class="input-group mb-3">
		<select name="type" class="form-control">
			<option value="all" <c:if test="${pm.cri.type == 'all' }">selected</c:if>>전체</option>
			<option value="title" <c:if test="${pm.cri.type == 'title' }">selected</c:if>>제목</option>
			<option value="writer" <c:if test="${pm.cri.type == 'writer' }">selected</c:if>>작성자</option>
		</select>
		<input type="text" name="search" class="form-control" placeholder="검색어" value="${pm.cri.search}">
	</div>
</form>
<table class="table table-hover">
	<thead>
		<tr>
			<th>번호</th>
			<th>카테고리</th>
			<th>제목</th>
			<th>작성자</th>
			<th>작성일</th>
			<th>조회수</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach items="${list}" var="product" varStatus="vs">
			<tr>
				<td>${list.size() - vs.index}</td>
				<td>${product.pr_mg_num}</td>
				<td>
					<c:url value="/product/detail" var="url">
						<c:param name="page" value="${pm.cri.page}"/>
						<c:param name="type" value="${pm.cri.type}"/>
						<c:param name="search" value="${pm.cri.search}"/>
						<c:param name="prNum" value="${product.pr_num}"/>
					</c:url>
					<a href="${url}">${product.pr_name}</a>
				</td>
				<td>
					<c:url value="/product/list" var="url">
						<c:param name="type" value="writer"/>
						<c:param name="search" value="${product.pr_me_id}"/>
					</c:url>
					<a href="${url}">${product.pr_me_id }</a>
			</tr>
		</c:forEach>
	</tbody>
</table>
<ul class="pagination justify-content-center">
	<c:if test="${pm.prev}">
		<c:url value="/product/list" var="url">
			<c:param name="page" value="${pm.startPage - 1}"/>
			<c:param name="type" value="${pm.cri.type}"/>
			<c:param name="search" value="${pm.cri.search}"/>
		</c:url>
		<li class="page-item">
			<a class="page-link" href="${url}">이전</a>
		</li>
	</c:if>
	<c:forEach begin="${pm.startPage }" end="${pm.endPage}" var="i">
		<c:url value="/product/list" var="url">
			<c:param name="page" value="${i}"/>
			<c:param name="type" value="${pm.cri.type}"/>
			<c:param name="search" value="${pm.cri.search}"/>
		</c:url>
		<li class="page-item <c:if test="${pm.cri.page == i}">active</c:if>">
			<a class="page-link" href="${url}">${i}</a>
		</li>
	</c:forEach>
	<c:if test="${pm.next}">
		<c:url value="/product/list" var="url">
			<c:param name="page" value="${pm.endPage + 1}"/>
			<c:param name="type" value="${pm.cri.type}"/>
			<c:param name="search" value="${pm.cri.search}"/>
		</c:url>
		<li class="page-item">
			<a class="page-link" href="${url}">다음</a>
		</li>
	</c:if>
</ul>
<a class="btn btn-outline-success" href="<c:url value="/product/insert"/>">글 쓰기</a>
</body>
</html>