<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
* {
	padding: 0;
	margin: 0;
	box-sizing: border-box;
}

#btnWrap {
	width: 500px;
	margin: 100px auto;
}

.popupBtn {
	width: 150px;
	height: 50px;
	padding: 10px 5px;
	background-color: #007bff;
	color: #fff; /* 텍스트 색상을 지정하세요 */
	border: none; /* 테두리 제거 */
	cursor: pointer;
}

#modalWrap {
	position: fixed; /* 화면에 고정 */
	z-index: 1; /* 상위에 위치 */
	padding-top: 100px;
	left: 0;
	top: 0;
	width: 100%;
	height: 100%;
	overflow: auto;
	background-color: rgba(0, 0, 0, 0.7); /* 반투명한 배경색 */
	display: none; /* 초기에는 숨김 */
}

#modalBody {
	width: 500px;
	height: 300px;
	padding: 30px 30px;
	margin: 0 auto;
	border: 1px solid #777;
	background-color: #fff;
}

#closeBtn {
	float: right;
	font-weight: bold;
	color: #777;
	font-size: 25px;
	cursor: pointer;
}

.close::before {
	content: "\00d7";
	font-size: 30pt;
}
</style>
</head>
<body>
	<div class="container text-center mt-3">
	<h1>리뷰 가능한 판매글 목록</h1>
		<table class="table table-hover text-center">
			<thead>
				<tr>
					<td>제목</td>
					<td>판매자</td>
					<td>후기작성</td>
					<td>비고</td>
				</tr>
			</thead>
			<tbody>
				<c:if test="${reviewList.size()>=1}">
					<c:forEach items="${reviewList}" var="reviewList">
						<tr>
							<td>${reviewList.pr_name}</td>
							<td>${reviewList.pr_me_id}</td>
							<td><button class="popupBtn" value="${reviewList.pr_num}">작성</button></td>
							<td><button type="button" class="reviewDelete close w-100" id="reviewDelete" value="${reviewList.tr_num}"></button></td>
						</tr>
					</c:forEach>
				</c:if>
				<c:if test="${reviewList.size()==0}">
					작성 가능한 후기가 없습니다.
				</c:if>
			</tbody>
		</table>
		<div id="modalWrap">
			<!-- 모달 창을 감싸는 div -->
			<div id="modalBody">
				<!-- 모달을 닫는 X 버튼 -->
				<span id="closeBtn">&times;</span>
				<!-- 모달 창 내용 -->
				<fieldset>
					<legend>상대방의 후기를 작성해주세요</legend>
					<form action="<c:url value='/review/write'/>" method="post">
					<input name="prNum" id="prNum" type="hidden" value="10"/>
						<c:forEach items="${reviewType}" var="reviewType">
							<c:if test="${reviewType.rt_type!='default'}">
								<div>
									<input type="checkbox" id="${reviewType.rt_type}" value="${reviewType.rt_type}"
										name="rt_type" /> <label
										for="${reviewType.rt_type}">${reviewType.rt_type}</label>
								</div>
							</c:if>
						</c:forEach>
						<button type="submit">작성완료</button>
					</form>
				</fieldset>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		const modal = document.getElementById("modalWrap"); // 모달 창 요소 가져오기
		
		$(".popupBtn").click(function() {
			$("#prNum").val(this.value);
			modal.style.display = "block"; // 버튼을 클릭하면 모달을 보이게 함
		});

		$("#closeBtn").click(function() {
			modal.style.display = "none"; // 모달을 닫는 버튼(X)을 클릭하면 모달을 숨김
		});

		window.onclick = function(event) {
			if (event.target == modal) {
				modal.style.display = "none"; // 모달 외부를 클릭하면 모달을 숨김
			}
		};
		
		$(".reviewDelete").click(function() {
			if(confirm("후기를 작성하지 않으시겠습니까?")){
				let obj = {reviewDeleteVal : this.value}
				$.ajax({
					async : false,
					url : '<c:url value="/review/write/delete"/>',
					type : 'post',
					data : obj,
					dataType : "json",
					success : function (data){
						
					}, 
					error : function(jqXHR, textStatus, errorThrown){
						
					}
				});
			}
		});
		
	</script>
</body>
</html>