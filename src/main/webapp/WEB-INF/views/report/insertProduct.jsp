<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<meta charset="UTF-8">
<title>신고글 작성</title>
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.js"></script>
<style>
.container-box{
   width: 100%; height: 280px;
    box-shadow: 0 1px 5px 0px rgba(0,0,0,0.2);
    margin-bottom : 5px;
    padding: 2px;
}
.form-group{ width: 100%;}
.page-title{
	font-size: 28px; 
	font-weight:800;
	margin-top:10px;
	margin-bottom: 6px; 
   font-size: 28px; 
   font-weight:800;
   margin-top:10px;
   margin-bottom: 6px; 
}
.content-box{
	width: 100%; height: auto;
    box-shadow: 0 0px 5px 0px rgba(0,0,0,0.2);
    margin-bottom : 5px;
    padding: 2px;
}
.container-reportTable{
	margin-left: 350px;
}
</style>
</head>
<body>
<div class="container-reportTable">
   <h1 class="page-title">신고글 작성</h1>
   <form action="<c:url value="/report/insertProduct"/>" method="post" enctype="multipart/form-data">
		<div class="container-box">
		
			<div class="form-group col-12 mt-3">
			   <label for="re_pr_num">신고 대상자</label>
			   <input type="number" class="form-control" id="re_pr_num" name="re_pr_num" readonly value="${info.pr_num}">
			</div>
		
			<div class="form-group col-12 mt-3">
			   <label for="re_me_id">신고 신정자</label>
			   <input type="text" class="form-control" id="re_me_id" name="re_me_id" readonly value="${user.me_id}">
			</div>
			
			<div class="select-box col-12 mt-3">
				<label for="suport_manage">신고유형</label>
		      	<select class="form-control" id="report_name" name="re_name">
					<option value="신고 유형을 선택해주세요." <c:if test='${report.re_name == "신고 유형을 선택해주세요."}'>selected</c:if>>신고 유형을 선택해주세요.</option>
					<option value="비매너 사용자예요." <c:if test='${report.re_name == "비매너 사용자예요."}'>selected</c:if>>비매너 사용자예요.</option>
					<option value="전문 판매업자 같아요." <c:if test='${report.re_name == "전문 판매업자 같아요."}'>selected</c:if>>전문 판매업자 같아요.</option>
					<option value="거래 중 분쟁이 발생했어요." <c:if test='${report.re_name == "거래 중 분쟁이 발생했어요."}'>selected</c:if>>거래 중 분쟁이 발생했어요.</option>
					<option value="사기인 것 같아요." <c:if test='${report.re_name == "사기인 것 같아요."}'>selected</c:if>>사기인 것 같아요.</option>
					<option value="연애 목적의 대화를 해요." <c:if test='${report.re_name == "연애 목적의 대화를 해요."}'>selected</c:if>>연애 목적의 대화를 해요.</option>
					<option value="기타 문제가 있어요." <c:if test='${report.re_name == "기타 문제가 있어요."}'>selected</c:if>>기타 문제가 있어요.</option>
				</select>
			</div>
			
		</div>   
		<div class="form-group mb-2">
			<label for="re_content">내용</label>
		  	<textarea class="form-control" id="re_content" name="re_content" required rows="10" placeholder="내용을 입력해주새요."></textarea>
		</div>
		<button class="reportBtn btn-dark col-12 mb-4">등록</button>
   </form>
</div>

<script type="text/javascript">	
   
   $(document).ready(function(){
	   $("#reportBtn").click(function(){
		   var userId = $(this).data("re_me_id");
		   reportCount(userId);
	   })
   })
   
   function reportCount(userId){
	   $.ajax({
		   type: "POST",
		   url: "/reportCount",
		   data: {
			   userId: userId
		   },
		   success: function(response){
			   alert("신고가 성공적으로 처리되었습니다.");
		   },
		   error: function(xhr, status, error){
			   alert("오류가 발생하였습니다." + error);
		   }
	   });
   }
   
</script>
</body>
</html>