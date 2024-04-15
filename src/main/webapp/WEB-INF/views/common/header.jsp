<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>header</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">

<style type="text/css">
	.nav-item {
		padding: 0.5rem 0xp;
		display: inline-block;
	}
	
	.dropdown-hover:hover>.dropdown-menu {
		display: inline-block;
	}
	
	.dropdown-hover>.dropdown-toggle:active {
		pointer-events: none;
	}
	

	.card-1 {
	  box-shadow: 0 1px 3px rgba(0,0,0,0.12), 0 1px 2px rgba(0,0,0,0.24);
	  transition: all 0.3s cubic-bezier(.25,.8,.25,1);
	}
	
	.card-1:hover {
	  box-shadow: 0 14px 28px rgba(0,0,0,0.25), 0 10px 10px rgba(0,0,0,0.22);
	}
	
	.ca-name {
		background: #F2F2F2;
		padding: 0 10px;
		font-weight: bold;
		color: 	#787878;
		border-radius: 10px;
		margin-left: 5px
	}
	
	.title-text{
		display:block;
		white-space: nowrap;
		overflow: hidden;
		text-overflow: ellipsis;
		min-width: 100px;
		max-width: 100px;
	
	}
	
	table tr th,table tr td {
		text-align: center;
	
	}
	
	.aTag {
		text-decoration: none; color: black;
	}
	
	.aTag:hover {
		text-decoration: underline;
		color: #848484;
	}
	
	/* 검색창을 가운데로 정렬하기 위한 CSS */
    .d-flex {
       justify-content: center; /* 가로 방향 가운데 정렬 */
       align-items: center; /* 세로 방향 가운데 정렬 */
       height: 100%; /* 부모 요소의 높이를 100%로 설정하여 수직 가운데 정렬 */
    }
    
		    /* 카테고리 메뉴 스타일 */
		.dropdown-menu {
		    border: none; /* 테두리 없음 */
		    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); /* 그림자 효과 */
		    border-radius: 8px; /* 모서리 둥글게 */
		    padding: 10px; /* 내부 간격 */
		}
		
		.dropdown-menu a {
		    color: #333; /* 링크 색상 */
		    text-decoration: none; /* 밑줄 없음 */
		    transition: color 0.3s ease; /* 색상 전환 효과 */
		    display: block; /* 링크를 블록 레벨 요소로 표시하여 전체 너비 차지 */
		    padding: 8px 15px; /* 내부 간격 */
		}
		
		.dropdown-menu a:hover {
		    background-color: #f8f9fa; /* 호버시 배경색 변경 */
		    color: #007bff; /* 호버시 텍스트 색상 변경 */
		}
		
		.dropdown-menu .divider {
		    margin: 5px 0; /* 구분선 간격 */
		    border-top: 1px solid #dee2e6; /* 구분선 스타일 */
		}
		
		.dropdown-menu .dropdown-header {
		    font-size: 0.85rem; /* 헤더 폰트 크기 */
		    color: #6c757d; /* 헤더 색상 */
		    padding: 3px 15px; /* 내부 간격 */
		    white-space: nowrap; /* 텍스트 줄 바꿈 방지 */
		}
			
</style>
</head>
<body>
	<nav class="navbar navbar-expand-lg navbar-light bg-light"
		style="padding: 0px; height: 80px">
		<!-- Container wrapper -->
		<div class="container-fluid">
			<!-- Toggle button -->
			<button class="navbar-toggler px-0" type="button"
				data-mdb-toggle="collapse" data-mdb-target="#navbarExampleOnHover"
				aria-controls="navbarExampleOnHover" aria-expanded="false"
				aria-label="Toggle navigation">
				<i class="fas fa-bars"></i>
			</button>
			
			<!-- Collapsible wrapper -->
			<div class="collapse navbar-collapse" id="navbarExampleOnHover">
				<!-- Left links -->
				<ul class="navbar-nav me-auto ps-lg-0" style="padding-left: 0.15rem; margin-left: 20px">
					<li class="nav-item">
						<a class="nav-link" href="<c:url value="/"/>">
							<span style="font-weight: bold; font-size : 24px" >Gaji</span>							
	                    	<img src="<c:url value="/resources/img/eggplant.png"/>" alt="logo" style="width:40px;">							
						</a>
					</li>
					<!-- 검색창 -->
                   <form class="d-flex">
                     <input class="form-control me-2" type="search" placeholder="검색" aria-label="Search">
                     <button class="btn btn-outline-success" type="submit">검색</button>
                   </form>
					<!-- Navbar dropdown -->
					<li class="nav-item dropdown dropdown-hover position-static" style="margin-left: 20px; line-height: 45px">
						<a class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
						role="button" data-mdb-toggle="dropdown" aria-expanded="false">
							카테고리 </a> <!-- Dropdown menu -->
						<div class="dropdown-menu col-10 mt-0 card-1"
							aria-labelledby="navbarDropdown"
							style="border-top-left-radius: 0; border-top-right-radius: 0;">
							<div class="container">
								<div class="row my-4 here"></div>
							</div>
						</div>
					</li>
				</ul>
				<ul class="navbar-nav ms-auto ps-lg-0"
					style="padding-right: 0.15rem">
					<c:if test="${user == null}">
						<li class="nav-item"><a class="nav-link btn btn-light"
							href="<c:url value="/member/login"/>">로그인</a></li>
						<li class="nav-item"><a class="nav-link btn btn-light" style="margin-left: 7px"
							href="<c:url value="/member/signup"/>">회원가입</a></li>
					</c:if>
					<c:if test="${user != null}">
			        	<li class="nav-item">
				          	<a class="nav-link btn btn-light" href="<c:url value="/member/logout"/>">로그아웃</a>
				        </li>
			        </c:if>
				    <li class="nav-item"><a class="nav-link btn btn-light"
							href="<c:url value="/member/mypage"/>">마이</a></li>		
          <li class="nav-item">
		<li class="nav-item">
		  <a class="nav-link" href="<c:url value="/surport/list"/>">고객센터</a>
	   </li>
	   <li class="nav-item">
		  <a class="nav-link" href="<c:url value="/product/insert"/>">판매하기</a>
	   </li>
	
				</ul>
				<!-- Left links -->
			</div>
			<!-- Collapsible wrapper -->
		</div>
		<!-- Container wrapper -->
	</nav>
<script type="text/javascript">
getGroup();
function getGroup(){
	$.ajax({
		url : '<c:url value="/top/group"/>',
		type: 'get',
		success : function(data){
			let str = '';
			for (topGroup of data.tList){
				str += '<div class="col-md-6 col-lg-2 mb-3 mb-lg-0" style="border-right: solid 2px #E6E6E6;">';
				str += '<div class="list-group list-group-flush">';
				str += '<div class="ca-name" style="margin-bottom: 15px">' + topGroup.tg_title + '</div>'; // topGroup 이름 출력
			for (midGroup of data.mList){
				if (midGroup.mg_tg_num == topGroup.tg_num){
					str += `<div class="list-group-item list-group-item-action" onclick="showProduct(\${midGroup.mg_num}, '\${midGroup.mg_title}', '\${topGroup.tg_title}')"> \${midGroup.mg_title} </div>`; // 해당 topGroup에 속하는 midGroup 출력
				}
			}
			str += '</div>';
			str += '</div>';
			}	
			$(".here").html(str);
		}
	})
}

function showProduct(mNum, mName, tName){
	
	let urlParams = new URLSearchParams("?");
	if(mNum)
		urlParams.append("mNum", mNum);
	if(mName)
		urlParams.append("mName", mName);
	if(tName)
		urlParams.append("tName", tName);
	location.href = '<c:url value="/product/list?"/>' + urlParams;
	
}

</script>
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
</body>
</html>
