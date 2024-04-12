<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table class="table table-hover msg-list">
		<c:forEach items="${chatMsgList}" var="msglist">
			<tr>
				<td>${msglist.cm_me_id}</td>
				<td>${msglist.cm_content}</td>
				<td>${msglist.cm_time}</td>
			</tr>
		</c:forEach>
	</table>
	<form>
		<div class="input-group mb-3 input-box">
			<input type="text" class="form-control" id="msg" name="msg" placeholder="입력창">
			<div class="input-group-append">
				<button class="btn btn-success btn-send" type="submit">전송</button>
			</div>
		</div>
	</form>
	
<script type="text/javascript">
	$("form").submit(function(e){
		e.preventDefault();	// 태그의 효과를 막아줌
		let obj = $(this).serialize()	// form태그에 있는 input태그들을 객체로 변환
		console.log(obj)
		$.ajax({
			async : false,
			url : '<c:url value="/sse/send"/>',
			type : "post", 
			data : obj, 
			success : function (data){
				console.log(data);
				$("#msg").val('');
			}, 
			error : function(jqXHR, textStatus, errorThrown){
			}
		});
		return false;
	})
	
	$.ajax({
		async : false,
		url : '<c:url value="/sse/list"/>',
		type : "get",
		data : obj,
		success : function (data){
			console.log(data);
			displayMsgList(data.list);
		}, 
		error : function(jqXHR, textStatus, errorThrown){
		}
	});
	
	function displayMsgList(list){
		console.log(list);
		
		let str = '';
		if(list == null || list.length == 0){
			str = '<h3>등록된 댓글이 없습니다.</h3>';
			$('.msg-list').html(str);
			return;
		}
		for(item of list){
			str +=
				`
				<tr>
					<td>${item.cm_me_id}</td>
					<td>${item.cm_content}</td>
					<td>${item.cm_time}</td>
				</tr>
				`;
			$('.msg-list').html(str);
		}
	}
</script>
</body>
</html>