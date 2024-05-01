<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
</head>
<body>
<div class="container">
	<h1>로그인</h1>
	<form action="<c:url value="/member/login"/>" method="post">
		<div class="form-group">
			<label for="id">아이디:</label>
			<input type="text" class="form-control" id="id" name="id" required>
		</div>
		<div class="form-group">
			<label for="pw">비번:</label>
			<input type="password" class="form-control" id="pw" name="pw" required>
		</div>
		<button type="submit" class="btn btn-outline-success col-12">로그인</button>
	</form>
	<a id="kakao-login-btn" href="javascript:loginWithKakao()">
	  <img src="https://k.kakaocdn.net/14/dn/btroDszwNrM/I6efHub1SN5KCJqLm1Ovx1/o.jpg" width="222" class="mt-3"
	    alt="카카오 로그인 버튼" />
	</a>
</div>
<script type="text/javascript">
Kakao.init('c569fff9e115f45eb5088c36d4040883');

function loginWithKakao() {
	Kakao.Auth.login({
  success: function (authObj) {
     Kakao.Auth.setAccessToken(authObj.access_token); // access토큰값 저장
				
     getInfo(); //동의한 회원정보 가져오기
  },
  fail: function (err) {
      console.log(err);
  }
});
}

function getInfo() {
	  Kakao.API.request({
	    url: '/v2/user/me',
	    success: function (res) {
	      // 아이디, 이메일
	      //그 외 동의 정보는 res.kakao_account.속성명을 통해 가져올 수 있다
	      //console.log(res.kakao_account);//에서 필요한 정보를 확인
	      //아이디는 발급 받은 앱키마다 다르므로 중간에 앱키를 바꾸면 같은 카카오 계정이지만
	      //다른 아이디값이 나옴. 주의!
	      console.log(res.kakao_account);
	      var id = res.id; 
	      var email = res.kakao_account.email;
	      var sns = "kakao"; //다른 sns 로그인을 위한 작업
	      //카카오 로그인 
				//가입한 회원인지 체크
	      if(!checkMember(sns, id)){
	        //안한 회원이면 가입 여부를 확인
	      	if(confirm("회원이 아닙니다. 가입하시겠습니까?")){
	        	//가입 
	      		signupSns(sns, id, email);
	      	}else{
	      		return;
	      	}
	      }
	      snsLogin(sns, id);
	     	location.href = '<c:url value="/"/>';

	    },
	    fail: function (error) {
	        alert('카카오 로그인에 실패했습니다. 관리자에게 문의하세요.' + JSON.stringify(error));
	    }
	  });
	}
	//ajax로 가입한 아이디인지 확인
	function checkMember(sns, email){
	  var res;
	  $.ajax({
			async : false,
			url : `<c:url value="/sns"/>/\${sns}/check/email`, 
			type : 'post',
			data : {email}, 
			success : function (data){
				res = data;
			}, 
			error : function(jqXHR, textStatus, errorThrown){

			}
		});
	  return res;
	 }
	 //sns 계정 정보로 가입 진행
	 function signupSns(sns, id, email){
	  $.ajax({
			async : false,
			url : `<c:url value="/sns"/>/\${sns}/signup`, 
			type : 'post',
			data : {id, email}, 
			success : function (data){
				
			}, 
			error : function(jqXHR, textStatus, errorThrown){
				
			}
		});
	 }
	 //sns 로그인 진행
	 function snsLogin(sns, id){
	  $.ajax({
			async : false,
			url : `<c:url value="/sns"/>/\${sns}/login`, 
			type : 'post', 
			data : {id},
			success : function (data){
				if(data){
					alert("로그인 되었습니다.");
				}
			}, 
			error : function(jqXHR, textStatus, errorThrown){
				
			}
		});
	 }

</script>
</body>
</html>