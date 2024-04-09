<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
</head>
<body>
<div class="container">
	<h1>상품 목록</h1>
	<table class="table table-hover">
		<thead>
			<tr>
				<th>번호</th>
				<th>대분류</th>
				<th>중분류</th>
				<th>제목</th>
				<th>작성자</th>
				<th>찜수</th>
				<th>가격</th>
				<th>거래 희망 장소</th>
				<th>작성일</th>
				<th>조회수</th>
				<th>판매상태</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${pList}" var="pro">
				<tr>
					<td>${pro.pr_num }</td>
					<td>${pro.pr_tg_name }</td>
					<td>${pro.pr_mg_name }</td>
					<td>
						<a href="<c:url value="/post/detail?pNum=${pro.pr_num }"/>">${pro.pr_name}</a>
					</td>
					<td>${pro.pr_me_id }</td>
					<td>${pro.pr_basket }</td>
					<td>${pro.pr_price }</td>
					<td>${pro.pr_place }</td>
					<td>${pro.pr_date }</td>
					<td>${pro.pr_view }</td>
					<td>${pro.pr_ps_state }</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<a href="<c:url value="/post/insert"/>" class="btn btn-outline-success">글쓰기</a>
</div>
<script type="text/javascript">
$("[name=order]").change(function(){
	$("#searchForm").submit();
});
</script>
</body>
</html>