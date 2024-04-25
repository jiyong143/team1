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
	}
	/* 상대방 */
	.y-container{ 
	     display: grid;
	     padding : 5px;
	     float: left;
	     width: 100%;
	     background-color: violet;
	     grid-template-columns: repeat(3, 130px);
	     grid-template-rows: repeat(3, 30px);
	}
	.y-container .box{ border: 1px solid black; padding : 5px;}
	.y-container .box:first-of-type{
	    grid-column-start: 1;
	    grid-column-end: 4;
	    grid-row-start: 1;
	    background-color: yellow;
	}
	.y-container .box:nth-of-type(2){
	    grid-row: 2/4;
	    grid-column-start: 3;
	    background-color: gray;
	}
	.y-container .box:nth-of-type(3){
	    grid-row: 2/4;
	    grid-column: 1/3;
	    background-color: skyblue;
	}
	
	
	/* 본인 */
	.mine-container{ 
		display: grid;
        padding : 5px;
        float: right;
        text-align : right;
        background-color: #ced4da;
        grid-template-columns: repeat(3, 130px);
        grid-template-rows: repeat(3, 30px);
	}
	.mine-container .box{ border: 1px solid black; padding : 5px;}
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
   </style>
</head>

<body>
<div class="container">
	<input type="hidden" value="${error}" class="error">
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
	getMsgList();
	
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
			cr_num :${cr_num} 
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
	setInterval(getMsgList, 1000);
</script>
</body>
</html>