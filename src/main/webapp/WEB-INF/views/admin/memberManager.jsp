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
  background-color: #04AA6D;
  color: white;
}
</style>
</head>
<body>
<h1>회원관리</h1>
<table id="customers">
  <thead>
	 <tr>
      	<th>이름</th>
	    <th>아이디</th>
	    <th>이메일</th>
	    <th>전화번호</th>
	    <th>권한</th>
	    <th>상태</th>
	    <th>비고</th>
	 </tr>
  </thead>
  <tbody>
  	<c:forEach items="${list}" var="member">
	  <tr>
	    <td>${member.me_name}</td>
	    <td>${member.me_id}</td>
	    <td>${member.me_email}</td>
	    <td>${member.me_phone}</td>
	    <td>
		  <select class="form-control" id="me_authority" name="me_authority">
			  <option value="${member.me_authority}">${member.me_authority}</option>
			  <option value="manager">manager</option>
  			  <option value="user">user</option>
		  </select>
	    </td>
	     <td>
		  <select class="form-control" id="me_state" name="me_state">
			  <option value="${member.me_state}">${member.me_state}</option>
			  <option value="차단">차단</option>
			  <option value="정지">정지</option>
		  </select>
	    </td>
	    <td>
		  <button type="button" id="saveButton" class="btn btn-danger">저장</button>
		</td>
	  </tr>
  	</c:forEach>
  </tbody>
</table>
<script type="text/javascript">

</script>
</body>
</html>