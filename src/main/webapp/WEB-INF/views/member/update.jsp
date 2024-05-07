<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<!-- jquery validtaion -->
<script src="https://cdn.jsdelivr.net/npm/jquery-validation@1.19.5/dist/jquery.validate.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/jquery-validation@1.19.5/dist/additional-methods.min.js"></script>
<meta charset="UTF-8">
</head>
<body>
<div class="container">
	<h1 class="mt-1">회원정보수정</h1>
	<div class="member-container user-info">
		<form action="<c:url value="/member/update"/>" method="post" id="signupfrom">
			<div class="form-group">
				<label for="id">아이디:</label>
				<input type="text" class="form-control" id="id" name="me_id" readOnly value="${member.me_id}">
				<label id="id-error" class="error text-danger" for="id"></label>
				<label id="id-error2" class="error text-danger"></label>
			</div>
			<div class="form-group">
				<label for="pw">비번:</label>
				<input type="password" class="form-control" id="pw" name="me_pw" required>
				<label id="pw-error" class="error text-danger" for="pw"></label>
			</div>
			<div class="form-group">
				<label for="pw2">비번확인:</label>
				<input type="password" class="form-control" id="pw2" name="me_pw2" required>
				<label id="pw2-error" class="error text-danger" for="pw2"></label>
			</div>
			<div class="form-group">
				<label for="email">이메일:</label>
				<input type="email" class="form-control" id="email" name="me_email" required value="${member.me_email}">
				<label id="email-error" class="error text-danger" for="email"></label>
				<label id="email-error2" class="error text-danger"></label>
			</div>
			
			<div class="from-group">
				<label for="gender">성별:</label>
				<div class="form-check-inline">
				  <label class="form-check-label">
				    <input type="radio" class="form-check-input" name="me_gender" value="male" <c:if test="${member.me_gender == 'male'}">checked</c:if>>남성
				  </label>
				</div>
				<div class="form-check-inline">
				  <label class="form-check-label">
				    <input type="radio" class="form-check-input" name="me_gender" value="female" <c:if test="${member.me_gender == 'female'}">checked</c:if>>여성
				  </label>
				</div>
				<div class="form-check-inline disabled">
				  <label class="form-check-label">
				    <input type="radio" class="form-check-input" name="me_gender" value="other" <c:if test="${member.me_gender == 'other'}">checked</c:if>>선택안함
				  </label>
				</div>
			</div>
			
			<div class="form-group">
				<label for="name">이름:</label>
				<input type="text" class="form-control" id="name" name="me_name" required value="${member.me_name}">
				<label id="name-error" class="error text-danger" for="name"></label>
			</div>
			<div class="form-group">
				<label for="birth">생년월일:</label>
				<input type="date" class="form-control" id="birth" name="me_birth" required value="${member.me_birth}">
				<label id="birth-error" class="error text-danger" for="birth"></label>
				<label id="birth-error2" class="error text-danger"></label>
			</div>
			<div class="form-group">
				<label for="phone">핸드폰 번호(OOO-OOOO-OOOO):</label>
				<input type="tel" class="form-control" id="phone" name="me_phone" required value="${member.me_phone}">
				<label id="phone-error" class="error text-danger" for="phone"></label>
				<label id="phone-error2" class="error text-danger"></label>
			</div>
			<div class="form-group">
				<label for="addr">주소:</label>
				<input type="text" class="form-control" id="addr" name="me_addr" required value="${member.me_addr}">
				<label id="addr-error" class="error text-danger" for="addr"></label>
			</div>
			<button type="submit" class="btn btn-outline-success col-12 mb-5">회원정보 수정</button>
		</form>
	</div>
</div>

<!-- 유효성 검사 -->
<script type="text/javascript">
$("#signupfrom").validate({
	rules : {
		me_pw : {
			required : true,
			regex : /^[a-zA-Z0-9!@#]{6,15}$/
		},
		me_pw2 : {
			equalTo : pw //name이 아닌 id를 써 줌
		},
		me_email : {
			required : true,
			email : true
		},
		me_phone : {
			required : true,
			regex : /^(01[016789]{1}|02|0[3-9]{1}[0-9]{1})-?[0-9]{3,4}-?[0-9]{4}$/
		},
		me_name : {
			required : true,
			regex : /^[가-힣]+$/
		}
	}, 
	messages : {
		me_pw : {
			required : "필수 항목입니다.",
			regex : "비밀번호는 숫자,영문, !@#만 사용가능하며 6~15자입니다."
		},
		me_pw2 : {
			equalTo : "비밀번호와 일치하지 않습니다."
		},
		me_email : {
			required : "필수 항목입니다.",
			email : "이메일 형식이 아닙니다."
		},
		me_phone : {
			required : "필수 항목입니다.",
			regex : "전화번호 형식이 아닙니다."
		},
		me_name : {
			required : "필수 항목입니다.",
			regex : "한글이름만 가능합니다."
		},
		me_birth : {
			required : "필수 항목입니다."
		},
		me_addr : {
			required : "필수 항목입니다."
		},
		me_pw2 : {
			required : "필수 항목입니다."
		}
	},
	submitHandler : function(form){
		if(emailCheckDup() && phoneCheckDup() && birthCheckDup()) {
			return true;
		}
		return false;
	}
});

$.validator.addMethod(
	"regex",
	function (value, element, regexp){
		var re= new RegExp(regexp);
		return this.optional(element) || re.test(value);
	},
	"정규표현식에 맞지 않습니다."
)
</script>

<!-- 아이디 중복 검사 -->
<script type="text/javascript">

function emailCheckDup(){
	$("#email-error2").text("");
	$("#email-error2").hide();
	let email = $('[name=me_email]').val();
	let obj = {
		email : email
	}
	let result2 = false;
	let emailRegex = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/i;
	if(!emailRegex.test(email)){
		return false;
	}
	$.ajax({
		async : false,
		url : '<c:url value="/email/check/dup"/>', 
		type : 'get', 
		data : obj, 
		dataType : "json", 
		success : function (data){
			result2 = data.result;
			if(!result2){
				$("#email-error2").text("이미 사용중인 이메일입니다.");
				$("#email-error2").show();
			}
		}, 
		error : function(jqXHR, textStatus, errorThrown){

		}
	});
	return result2;
}

function phoneCheckDup(){
	$("#phone-error2").text("");
	$("#phone-error2").hide();
	//입력된 아이디를 가져옴
	let phone = $('[name=me_phone]').val();
	let obj = {
		phone : phone
	}
	let phoneRegex = /^(01[016789]{1}|02|0[3-9]{1}[0-9]{1})-?[0-9]{3,4}-?[0-9]{4}$/;
	if(!phoneRegex.test(phone)){
		return false;
	}
	let result3 = false;
	
	$.ajax({
		async : false,
		url : '<c:url value="/phone/check/dup"/>', 
		type : 'get', 
		data : obj, 
		dataType : "json", 
		success : function (data){
			result3 = data.result;
			if(!result3){
				$("#phone-error2").text("이미 사용중인 번호입니다.");
				$("#phone-error2").show();
			}
		}, 
		error : function(jqXHR, textStatus, errorThrown){

		}
	});
	return result3;
}

function birthCheckDup(){
	$("#birth-error2").text("");
	$("#birth-error2").hide();
	//입력된 아이디를 가져옴
	let birth = $('[name=me_birth]').val();
	let obj = {
		birth : birth
	}
	let result = false;
	//서버에 아이디를 전송해서 사용 가능/불가능 처리
	$.ajax({
		async : false,
		url : '<c:url value="/birth/check/dup"/>', 
		type : 'get', 
		data : obj, 
		dataType : "json", 
		success : function (data){
			result = data.result;
			if(!result){
				
				$("#birth-error2").text("입력할 수 없는 생년월일입니다.");
				$("#birth-error2").show();
			}
		}, 
		error : function(jqXHR, textStatus, errorThrown){

		}
	});
	return result;
}

$('[name=me_email]').on('input',function(){
	emailCheckDup();
})
$('[name=me_phone]').on('input',function(){
	phoneCheckDup();
})
$('[name=me_birth]').on('input',function(){
	birthCheckDup();
})
</script>

</body>
</html>