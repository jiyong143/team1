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
	<h1 class="mt-1">회원가입</h1>
	<div class="member-container user-info">
		<form action="<c:url value="/member/signup"/>" method="post" id="signupfrom">
			<div class="form-group">
				<label for="id">아이디:</label>
				<input type="text" class="form-control" id="id" name="me_id" required>
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
				<input type="email" class="form-control" id="email" name="me_email" required>
				<label id="email-error" class="error text-danger" for="email"></label>
				<label id="email-error2" class="error text-danger"></label>
			</div>
			
			<div class="from-group">
				<label for="gender">성별:</label>
				<div class="form-check-inline">
				  <label class="form-check-label">
				    <input type="radio" class="form-check-input" name="me_gender" value="male" checked>남성
				  </label>
				</div>
				<div class="form-check-inline">
				  <label class="form-check-label">
				    <input type="radio" class="form-check-input" name="me_gender" value="female">여성
				  </label>
				</div>
				<div class="form-check-inline disabled">
				  <label class="form-check-label">
				    <input type="radio" class="form-check-input" name="me_gender" value="other">선택안함
				  </label>
				</div>
			</div>
			
			<div class="form-group">
				<label for="name">이름:</label>
				<input type="text" class="form-control" id="name" name="me_name" required>
				<label id="name-error" class="error text-danger" for="name"></label>
			</div>
			<div class="form-group">
				<label for="birth">생년월일:</label>
				<input type="date" class="form-control" id="birth" name="me_birth" required>
				<label id="birth-error" class="error text-danger" for="birth"></label>
				<label id="birth-error2" class="error text-danger"></label>
			</div>
			<div class="form-group">
				<label for="phone">핸드폰 번호(OOO-OOOO-OOOO):</label>
				<input type="tel" class="form-control" id="phone" name="me_phone" required>
				<label id="phone-error" class="error text-danger" for="phone"></label>
				<label id="phone-error2" class="error text-danger"></label>
			</div>
			<div class="form-group">
				<label for="sido" style="display: block">주소</label>
				<select name="sido" class="form-control" style="width: 33%; display: inline;" required>
					<option id="sido" value="">시/도를 선택하세요.</option>
					<c:forEach items="${sidoList}" var="sido">
						<option id="sido check" value="${sido.sido}">${sido.sido}</option>
					</c:forEach>
				</select>
				<select name="sigungu" class="form-control sigungu" style="width: 33%; display: inline;" required></select>
				<select name="h_dong_nm" class="form-control h_dong_nm" style="width: 33%; display: inline;" required></select>
<!-- 				<p class="text-danger d-none" id="addr_id">주소를 입력해주세요.</p> -->
			</div>
			<button type="submit" class="btn btn-outline-success col-12 mb-5">회원가입</button>
		</form>
	</div>
</div>

<!-- 시/군/구 관련 -->
<script type="text/javascript">
	$("[name=sigungu]").hide();
	$("[name=h_dong_nm]").hide();
	
	$("[name=sido]").change(function(){
		$("[name=sigungu]").show();
		let sido = $("[name=sido]").val();
		let obj = {
			sido : sido
		}
		$.ajax({
			async : false,
			url : '<c:url value="/product/sigungu"/>', 
			type : 'get', 
			data : obj,
			dataType : "json", 
			success : function (data){
				displaysigungu(data.sigunguList);
			}, 
			error : function(jqXHR, textStatus, errorThrown){
	
			}
		});
	})
	
	function displaysigungu(list){
		let str = `<option id="sigungu" value="">시/군/구를 선택하세요.</option>`;
		for(item of list){
			str += `<option value="\${item.sigungu}">\${item.sigungu}</option>`;
		}
		$(".sigungu").html(str);
	}
</script>

<!-- 동 관련 -->
<script type="text/javascript">
	$("[name=sigungu]").change(function(){
		$("[name=h_dong_nm]").show();
		let sido = $("[name=sido]").val();
		let sigungu = $("[name=sigungu]").val();
		let obj = {
			sido : sido,
			sigungu : sigungu
		}
		$.ajax({
			async : false,
			url : '<c:url value="/product/dong"/>', 
			type : 'get', 
			data : obj,
			dataType : "json", 
			success : function (data){
				displaydong(data.dongList);
			}, 
			error : function(jqXHR, textStatus, errorThrown){
	
			}
		});
	})

	function displaydong(list){
		let str = `<option id="h_dong_nm" value="">동을 선택하세요.</option>`;
		for(item of list){
			str += `<option value="\${item.h_dong_nm}">\${item.h_dong_nm}</option>`;
		}
		$(".h_dong_nm").html(str);
	}
</script>

<!-- 유효성 검사 -->
<script type="text/javascript">

$("[name=h_dong_nm]").val()

function addr() {
	if($("[name=h_dong_nm]").val()!=null && $("[name=sigungu]").val() != null && $("[name=sido]").val() != null) {
		$("#addr_id").removeClass("d-none");
		return true;
	} else {
		$("#addr_id").addClass("d-none");
		return false;
	}
}

$("#signupfrom").validate({
	rules : {
		me_id : {
			required : true,
			regex : /^\w{6,15}$/
		},
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
		me_id : {
			required : "필수 항목입니다.",
			regex : "아이디는 숫자 영문 6~15자입니다."
		},
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
		me_pw2 : {
			required : "필수 항목입니다."
		}
	},
	submitHandler : function(form){
		if(idCheckDup() && emailCheckDup() && phoneCheckDup() && birthCheckDup() && addr()) {
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
function idCheckDup(){
	$("#id-error2").text("");
	$("#id-error2").hide();
	//입력된 아이디를 가져옴
	let id = $('[name=me_id]').val();
	let obj = {
		id : id
	}
	let idRegex = /^\w{6,15}$/;
	if(!idRegex.test(id)){
		return false;
	}
	let result = false;
	//서버에 아이디를 전송해서 사용 가능/불가능 처리
	$.ajax({
		async : false,
		url : '<c:url value="/id/check/dup"/>', 
		type : 'get',
		data : obj,
		dataType : "json",
		success : function (data){
			result = data.result;
			if(!result){
				$("#id-error2").text("이미 사용중인 아이디입니다.");
				$("#id-error2").show();
			}
		}, 
		error : function(jqXHR, textStatus, errorThrown){

		}
	});
	return result;
}

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


$('[name=me_id]').on('input',function(){
	idCheckDup();
})
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