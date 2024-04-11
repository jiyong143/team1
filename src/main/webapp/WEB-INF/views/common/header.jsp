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
				<a class="nav-link" href="<c:url value="/logout"/>">로그아웃</a>
			</li>
		</c:if>
		<li class="nav-item">
				<a class="nav-link" href="<c:url value="/product/list"/>">게시글</a>
		</li>
		<li class="nav-item">
	    	<a class="nav-link" href="<c:url value="/sse"/>">sse 예제</a>
	    </li>
	</ul>
</nav>
<script type="text/javascript">
	//이벤트 생성
	const sse = new EventSource("<c:url value='/sse/connect'></c:url>");
	
	sse.addEventListener('connect', (e) => {
		const { data: receivedConnectData } = e;
		console.log('connect event data: ',receivedConnectData);  // "connected!"
	});
	
	sse.addEventListener('receive', e => {  
	    const { data: receivedData } = e;  
	    obj = JSON.parse(receivedData);
	    console.log(obj)
	    console.log("보낸 사람 : " + obj.from);
	    console.log("메세지 : " + obj.msg)
	});
	
	//페이지 이동 시 sse 연결 끊기.
	window.addEventListener('beforeunload', function (e) {
		if (sse) {
	  	sse.close(); // SSE 연결 닫기
	  }
	});
	</script>