<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
	<a class="navbar-brand" href="<c:url value='/'/>">
		<img src="<c:url value="/resources/img/bird.jpg"/>" alt="logo" style="width:40px;">
	</a>

	<!-- Links -->
	<ul class="navbar-nav">
		<c:if test="${user==null }">
			<li class="nav-item">
				<a class="nav-link" href="<c:url value="/member/signup"/>">회원가입</a>
			</li>
			<li class="nav-item">
				<a class="nav-link" href="<c:url value="/member/login"/>">로그인</a>
			</li>
		</c:if>
		<c:if test="${user!=null }">
			<li class="nav-item">
				<a class="nav-link" href="<c:url value="/member/logout"/>">로그아웃</a>
			</li>
		</c:if>
		<li class="nav-item">
			<a class="nav-link" href="<c:url value="/product/list"/>">게시글</a>
		</li>
		<li class="nav-item">
			<a class="nav-link" href="<c:url value="/chat/chatList"/>">판매자와의 대화</a>
		</li>
		<li class="nav-item">
			<a class="nav-link" href="<c:url value="/member/mypage"/>">마이</a>
		</li>
	</ul>
</nav>

<nav class="category-container">
	<div class="category-toggle" onclick="toggleCategory()">
		<span></span><span></span><span></span>
	</div>
	<div class="category" id="category">
		<div class="category-box">
			<c:forEach items="${list}" var="top">
				<h3>${top.tg_title}</h3>
				<hr>
				<div class="board-list">
					<c:forEach items="${top.midGroupList}" var="mid">
						<c:url var="url" value="/product/list">
							<c:param name="mNum" value="${mid.mg_num}" />
						</c:url>
						<h5>
							<li><a href="${url}">${mid.mg_title}</a></li>
						</h5>
					</c:forEach>
				</div>
			</c:forEach>
		</div>
	</div>
</nav>
