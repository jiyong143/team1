<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<meta charset="UTF-8">
<title>고정문의</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
 <script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.slim.min.js"></script>
 <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
 <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>

  <div class="container">
  <h2>고객관리</h2>
  <p>자유롭게 문의해주세요.</p>            
  <table class="table">
    <thead>
      <tr>
        <th>동일한 게시글을 올려서 내 게시글이 미노출 됐어요
	  </th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td>
        	15회의 끌어올리기 횟수를 채우지 않고 동일한 게시글을 여러 번 작성하면 홈 화면에 노출되지 않아요. 숨김 또는 삭제 후 게시글을 작성했더라도 동일한 게시글을 여러 번 작성했다면 중복 게시글로 분류되어 미노출 됩니다.        	
			미노출 처리된 게시글을 다시 노출하는 방법을 안내해 드릴게요.

			1. 제일 처음 작성한 게시글을 찾아서  해주세요.
			2. 나머지 중복 게시글(숨김글 포함)의 상태를 [거래완료] 로 바꿔 주세요.
			3. 이미 제일 처음 작성한 게시글을 포함하여 나머지 중복 게시글을 1개라도 삭제했다면 모든 중복 게시글을 삭제해주세요.
			4. 7~10일이 지난 뒤 다시 작성 해주시길 바랍니다.
			5. 게시글을 홈 화면에 노출하고 싶다면 새롭게 게시글을 작성하는 대신 기한을 지켜 끌어올리기 해주시길 바랍니다. 🙂
    	</td>
    </tbody>
  </table>
  
  <table class="table">
    <thead>
      <tr>
        <th>자주묻는 질문</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td>
       		<a href="#"> 부적절한 회원 신고 안내</a>
       </td>
      </tr>
      <tr>
        <td>중고거래</td>
      </tr>
      <tr>
        <td>상품판매</td>
      </tr>
      <tr>
        <td>기타</td>
      </tr>
    </tbody>
  </table>
</div>
  
<button class="btn btn-dark mb-4">이전으로</button>

</body>
</html>