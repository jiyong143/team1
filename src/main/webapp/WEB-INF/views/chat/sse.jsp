<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.container{
		margin-top: 80px;
		width: 800px;
	}
	.container>*{
		margin:5px;
	}
	/* 상대방 */
	.y-container{ 
	 	 border: 1px solid black; border-radius:20px; display: grid;
	     gap : 10px; padding : 5px; float: left; height: auto;
	     overflow: auto; margin-bottom :10px; background-color: violet;
	     overflow-wrap: break-word; /* 긴 단어가 div의 폭을 넘어서면 줄바꿈을 한다 */
	     grid-template-columns: repeat(3, 130px);
	     grid-template-rows: repeat(3, 30px);
	}
	.y-container .box{padding-bottom: 10px;}
	.y-container .box:first-of-type{
	    grid-column-start: 1;
	    grid-column-end: 4;
	    grid-row-start: 1;
	}
	.y-container .box:nth-of-type(2){
	    grid-row: 2/4;
	    grid-column-start: 3;
	}
	.y-container .box:nth-of-type(3){
	    grid-row: 2/4;
	    grid-column: 1/3;
	}
	

	/* 본인 */
	.mine-container{ 
		border: 1px solid black; border-radius:20px; display: grid;
        padding : 5px; float: right; gap : 10px;
        text-align : right;  background-color: #ced4da;
        margin-bottom :10px; height:auto; width:auto;
        overflow: auto; overflow-wrap: break-word; /* 긴 단어가 div의 폭을 넘어서면 줄바꿈을 한다 */
        grid-template-columns: repeat(3, 130px);
        grid-template-rows: repeat(3, 30px);
	}
	.mine-container .box:first-of-type{
	    grid-column-start: 1;
	    grid-column-end: 4;
	    grid-row-start: 1;
	}	
	.mine-container .box:nth-of-type(2){
	    grid-row: 2/4;
	    grid-column-start: 1;
	}
	.mine-container .box:nth-of-type(3){
	    grid-row: 2/4;
	    grid-column: 2/4;
	}
	.more{
		text-align: center;
		margin-bottom: 10px;
	}
	.msg-list{
		min-height: 600px;
	}
	.input-box{
		margin-bottom: 10px;
	}
   </style>
</head>
<body>
<div class="container">
	<input type="hidden" value="${error}" class="error">
	<div class="moreBox">
		<div class="more">
			<button class="chatmore btn btn-outline-success" onClick="moreChat()">더 보기</button>
		</div>
	</div>
	<div class="msg-list"></div>
	<form id="sseForm">
		<div class="input-group mb-3 input-box">
			<input type="text" class="form-control" id="msg" name="msg" placeholder="입력창">
			<div class="input-group-append">
				<button class="btn btn-success btn-send" type="submit">전송</button>
			</div>
		</div>
	</form>
</div>
<script type="text/javascript">
	$(".moreBox").hide();
	getMsgList();
	moreChat();
	
	let a = $(".error").val();
	console.log(a);
	if(a.length != 0){
		alert(a);
		location.href = "<c:url value='/'/>";
	}
	
	$("#sseForm").submit(function(e){
		e.preventDefault();	// 태그의 효과를 막아줌
		let obk = {
			msg : $("#msg").val(),
			cr_num : ${cr_num} 
		}
		console.log(obk);
		$.ajax({
			async : false,
			url : '<c:url value="/sse/send"/>',
			type : "post", 
			data : obk,
			success : function (data){
				console.log(data);
				$("#msg").val('');
				getMsgList();
			}, 
			error : function(jqXHR, textStatus, errorThrown){
			}
		});
		return false;
	})
	
	function getMsgList(){
		$.ajax({
			async : true, //비동기 : true(비동기), false(동기)
			url : '<c:url value="/sse/list"/>',
			type : 'post', 
			data : {cm_cr_num : ${cr_num}},	
			dataType : "json",
			success : function (data){
				console.log(data.msgs);
				displayMsgList(data.msgs, data.loginUser);
			}, 
			error : function(jqXHR, textStatus, errorThrown){

			}
		});
	}
	
	function displayMsgList(list, loginUser){
		let str = '';
		if(list == null || list.length == 0){
			str = '<h3>대화가 없습니다.</h3>';
			$('.msg-list').html(str);
			return;
		}
		
		for(item of list){
			if(loginUser.me_id == item.cm_me_id){
				str +=
					`
					<div class="mine-container">
						<div class="box">\${item.cm_me_id}</div>
						<div class="box">\${item.date_str}</div>
						<div class="box">\${item.cm_content}</div>
					</div>
					`
			}else{
				str +=
					`
					<div class="y-container">
						<div class="box">\${item.cm_me_id}</div>
						<div class="box">\${item.date_str}</div>
						<div class="box">\${item.cm_content}</div>
					</div>
					`;
			}
			$('.msg-list').html(str);
		}
	}
	
	function moreChat(){
		$.ajax({
			async : true, //비동기 : true(비동기), false(동기)
			url : '<c:url value="/chat/more"/>',
			type : 'post', 
			data : {cm_cr_num : ${cr_num}},	
			dataType : "json",
			success : function (data){
				console.log(data);
				getMsgList();
				if(data.chatCount >= data.totalMsgCount){
					$(".moreBox").hide();
				}else{
					$(".moreBox").show();
				}
			}, 
			error : function(jqXHR, textStatus, errorThrown){

			}
		});
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
		let obj = JSON.parse(e.data);
		console.log(obj);
	    console.log("메시지가 도착했습니다.");
		displayReceive(obj);
	});
	
	function displayReceive(obj){
		let str =
			`
			<div class="y-container">
				<div class="box">\${obj.cm_me_id}</div>
				<div class="box">\${obj.cm_time}</div>
				<div class="box">\${obj.cm_content}</div>
			</div>
			`;
		$(".msg-list").append(str);
	}
	
	// 뒤로가기 시 SSE 연결 끊기
	window.addEventListener('popstate', handlePageNavigation);

	// 페이지 이동 시 SSE 연결 끊기
	window.addEventListener('beforeunload', handlePageNavigation);
	
	// 뒤로가기 동작 감지하여 SSE 연결 닫기
	function handlePageNavigation() {
	    sseClose(); // SSE 연결 닫는 함수 호출
	}

	function sseClose(){
		$.ajax({
			async : true, //비동기 : true(비동기), false(동기)
			url : '<c:url value="/sse/close"/>',
			type : 'post', 
			data : {cm_cr_num : ${cr_num}},	
			dataType : "json",
			success : function (data){
				console.log("MsgCount 초기화");
			}, 
			error : function(jqXHR, textStatus, errorThrown){

			}
		});
	    sse.close(); // SSE 연결 닫기
	} 
</script>
</body>
</html>