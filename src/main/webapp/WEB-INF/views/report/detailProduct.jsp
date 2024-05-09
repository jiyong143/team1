<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<meta charset="UTF-8">
<title>신고글 상세내역</title>
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
</style>
</head>
<body>
<div class="container">
   <h1 class="page-title">신고글 상세내역</h1>
   <form action="<c:url value="/report/insertProduct"/>" method="post" enctype="multipart/form-data">
		<div class="container-box">
		
			<div class="form-group col-12 mt-3">
			   <label for="re_pr_num">신고 대상자</label>
			   <input type="number" class="form-control" id="re_pr_num" name="re_pr_num" readonly value="${report.re_pr_num}">
			</div>
		
			<div class="form-group col-12 mt-3">
			   <label for="re_me_id">신고 신정자</label>
			   <input type="text" class="form-control" id="re_me_id" name="re_me_id" readonly value="${report.re_me_id}">
			</div>
			
			<div class="select-box col-12 mt-3">
				<label for="suport_manage">신고유형</label>
		      	<input type="text" class="form-control" id="re_name" name="re_name" readonly value="${report.re_name}"> 
			</div>
			
		</div>   
		<div class="form-group mb-2">
			<label for="re_content">내용</label>
		  	<textarea class="content-box" id="re_content" name="re_content" readonly>${report.re_content}</textarea>
		</div>
		<button class="btn btn-dark col-12 mb-4">등록</button>
   </form>
</div>

<script type="text/javascript">	
	$("form").submit(function() {
		let name = $("[name=re_name]").val();
		if(title.length == 0){
			alert("신고 유형을 선택해주세요.");
			$("[name=re_name]").focus();
			return false;
		}
		let content = $("[name=re_content]").val();
		if(content.length = 0){
			alert("내용은 공백으로 남길 수 없습니다.")
			$("[name-su_content]").focus();
			return false;
		}
		
	});
	
	$('[name = re_content]').summernote({
		   placeholder: '내용을 입력하세요',
		   tabsize: 2,
		   height: 400
		});

<script type="text/javascript">   
   $("form").submit(function() {
      let name = $("[name=re_name]").val();
      if(title.length == 0){
         alert("신고 유형을 선택해주세요.");
         $("[name=re_name]").focus();
         return false;
      }
      let content = $("[name=re_content]").val();
      if(content.length = 0){
         alert("내용은 공백으로 남길 수 없습니다.")
         $("[name-su_content]").focus();
         return false;
      }
      
   });
   
   $('[name = re_content]').summernote({
         placeholder: '내용을 입력하세요',
         tabsize: 2,
         height: 400
      });
</script>
</body>
</html>