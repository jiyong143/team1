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
	<form action="<c:url value="/product/list"/>" method="get" id="searchForm">
	<input type="hidden" value="${num }" name="mNum">
		<div class="input-group mb-3">
			<select class="form-control" name="type">
				<option value="all" <c:if test="${pm.cri.type == 'all' }">selected</c:if>>전체(제목,내용,주소)</option>
				<option value="title" <c:if test="${pm.cri.type == 'title' }">selected</c:if>>제목, 내용</option>
				<option value="address" <c:if test="${pm.cri.type == 'address' }">selected</c:if>>주소</option>
			</select>
			<input type="text" class="form-control" name="search" value="${pm.cri.search }">
			<input type="int" value="${pm.cri.minPrice }" name="minPrice" placeholder="최소 가격">
			<input type="int" value="${pm.cri.maxPrice }" name="maxPrice" placeholder="최대 가격">
			<button class="btn btn-outline-success">검색</button>
		</div>
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
		<select class="form-control col-4 offset-8 mb-4" name="order">
			<option value="pr_num" <c:if test="${pm.cri.order == 'pr_num' }">selected</c:if>>최신순</option>
			<option value="pr_view" <c:if test="${pm.cri.order == 'pr_view' }">selected</c:if>>조회수순</option>
			<option value="pr_basket" <c:if test="${pm.cri.order == 'pr_basket' }">selected</c:if>>찜순</option>
			<option value="desc" <c:if test="${pm.cri.order == 'desc' }">selected</c:if>>가격 높은순</option>
			<option value="asc" <c:if test="${pm.cri.order == 'asc' }">selected</c:if>>가격 낮은순</option>
		</select>
	</form>
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
	
	<ul class="pagination justify-content-center">
		<c:if test="${pm.prev}">
			<li class="page-item">
				<c:url var="url" value="/product/list">
					<c:param name="page" value="${pm.startPage - 1}"/>
					<c:param name="search" value="${pm.cri.search}"/>
					<c:param name="type" value="${pm.cri.type}"/>
					<c:param name="order" value="${pm.cri.order}"/>
					<c:param name="mNum"  value="${num }" />
				</c:url>
				<a class="page-link" href="${url}">이전</a>
			</li>
		</c:if>
		<c:forEach begin="${pm.startPage}" end="${pm.endPage}" var="i">
			<c:set var="active" value="${pm.cri.page == i ?'active':'' }"/>
			<li class="page-item ${active}">
				<c:url var="url" value="/product/list">
					<c:param name="page" value="${i}"/>
					<c:param name="search" value="${pm.cri.search}"/>
					<c:param name="type" value="${pm.cri.type}"/>
					<c:param name="order" value="${pm.cri.order}"/>
					<c:param name="mNum"  value="${num }" />
				</c:url>
				<a class="page-link" href="${url}">${i}</a>
			</li>
		</c:forEach>
		<c:if test="${pm.next}">
			<li class="page-item">
				<c:url var="url" value="/product/list">
					<c:param name="page" value="${pm.endPage + 1}"/>
					<c:param name="search" value="${pm.cri.search}"/>
					<c:param name="type" value="${pm.cri.type}"/>
					<c:param name="order" value="${pm.cri.order}"/>
					<c:param name="mNum"  value="${num }" />
				</c:url>
				<a class="page-link" href="${url}">다음</a>
			</li>
		</c:if>
	</ul>
	<a href="<c:url value="/product/insert"/>" class="btn btn-outline-success">글쓰기</a>
</div>
<script type="text/javascript">
$("[name=order]").change(function(){
	$("#searchForm").submit();
});
</script>
</body>
</html>