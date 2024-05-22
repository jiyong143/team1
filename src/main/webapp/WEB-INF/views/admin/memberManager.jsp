<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<meta charset="UTF-8">
<title>회원 관리 페이지</title>
<style type="text/css">
#customers {
  font-family: Arial, Helvetica, sans-serif;
  border-collapse: collapse;
  width: 100%;
}

#customers td, #customers th {
  border: 1px solid #ddd;
  padding: 8px;
}

#customers tr:nth-child(even){background-color: #f2f2f2;}

#customers tr:hover {background-color: #ddd;}

#customers th {
  padding-top: 12px;
  padding-bottom: 12px;
  text-align: left;
  background-color: #6a1b9a;
  color: white;
}
</style>
</head>
<body>
<jsp:include page="/WEB-INF/views/common/sideBar.jsp"/>
<div class="container">
	<h1>회원관리</h1>
	<table id="customers">
	  <thead>
		 <tr>
	      	<th>이름</th>
		    <th>아이디</th>
		    <th>이메일</th>
		    <th>성별</th>
		    <th>전화번호</th>
		    <th>권한</th>
		    <th>상태</th>
		    <th>비고</th>
		 </tr>
	  </thead>
	  <tbody>
	  	<c:forEach items="${list}" var="member">
		  <tr>
		  	<c:if test="${member.me_authority != 'admin'}">
			    <td>${member.me_name}</td>
			    <td class="me_id">${member.me_id}</td>
			    <td>${member.me_email}</td>
			    <td>${member.me_gender}</td>
			    <td>${member.me_phone}</td>
			    <td>
				  <select class="form-control me_authority" name="me_authority">
		 			  <option value="user" <c:if test='${member.me_authority == "user"}'>selected</c:if>>user</option>
					  <option value="manager" <c:if test='${member.me_authority == "manager"}'>selected</c:if>>manager</option>
				  </select>
			    </td>
			     <td>
				  <select class="form-control me_state" name="me_state">
					  <option value="이용중" <c:if test='${member.me_state == "이용중"}'>selected</c:if>>이용중</option>
					  <option value="차단" <c:if test='${member.me_state == "차단"}'>selected</c:if>>차단</option>
					  <option value="정지" <c:if test='${member.me_state == "정지"}'>selected</c:if>>정지</option>
				  </select>
			    </td>
			    <td>
				  <button type="button" class="btn btn-danger saveButton">저장</button>
				</td>
			</c:if>
		  </tr>
	  	</c:forEach>
	  </tbody>
	</table>
</div>
<script type="text/javascript">
$(document).ready(function() {
	  // 저장 버튼 클릭 이벤트 핸들러
	  $(".saveButton").click(function() {
	    var data = [];
	    // 현재 행에서 데이터를 가져와 배열에 추가
	    var $row = $(this).closest("tr");
	    var me_id = $row.find(".me_id").text(); // 아이디 가져오기
	    var me_authority = $row.find(".me_authority").val(); // 권한 가져오기
	    var me_state = $row.find(".me_state").val(); // 상태 가져오기
	    let obj = {
	    	me_id : me_id,
	    	me_authority : me_authority,
	    	me_state : me_state
	    }
	    data.push({me_id : me_id, me_authority : me_authority, me_state : me_state});
	    console.log(data);
	    console.log(obj);
	    // 서버에 데이터 전송
	    $.ajax({
	      type: "POST",
	      url: '<c:url value="/admin/memberManager"/>',
	      data: obj,
	      dataType : "json",
	      success: function(response) {
	        alert("권한이 변경되었습니다.");
	      },
	      error: function(xhr, status, error) {
	        
	        alert("오류가 발생했습니다. 다시 시도해주세요.");
	      }
	    });
	  });
	});
</script>
</body>
</html>
