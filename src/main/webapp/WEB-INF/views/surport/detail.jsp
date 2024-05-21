<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<meta charset="UTF-8">
<title>고객지원 상세</title>
<link
	href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.js"></script>

<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<style>
.container-box {
	width: 100%;
	height: 430px;
	box-shadow: 0 1px 5px 0px rgba(0, 0, 0, 0.2);
	margin-bottom: 10px
}

.form-group {
	width: 100%;
}

.button_comment {
	display: inline-block;
	vertical-align: top;
	font-size: 13px;
}

.page-title {
	font-size: 28px;
	font-weight: 800;
	margin-top: 10px;
}

.content-box {
	width: 100%;
	height: auto;
	box-shadow: 0 1px 5px 0px rgba(0, 0, 0, 0.2);
	padding: 10px;
}
.comment-title{
	font-size: 22px; 
	margin-bottom: 5px;
}
</style>
</head>
<body>
<jsp:include page="/WEB-INF/views/common/sideBar.jsp"/>
	<div class="container">
		<h1 class="page-title">문의글 상세</h1>
		<div class="container-box">
			<div class="select-box col-12 mt-3">
				<label for="suport_manage">지원타입 선택</label> <input
					class="form-control" id="su_sm_name" name="su_sm_name" readonly
					value="${surport.su_sm_num}">
			</div>
			<div class="select-box col-12 mt-3">
				<label for="upHead">말머리 선택</label> <input class="form-control"
					id="su_uh_name" name="su_uh_name" readonly
					value="${surport.su_uh_num}">
			</div>
			<div class="form-group col-12 mt-3">
				<label for="su_title">제목</label> <input type="text"
					class="form-control" id="su_title" name="su_title" readonly
					value="${surport.su_title}">
			</div>
			<div class="form-group col-12 mt-3">
				<label for="id">작성자</label> <input type="text" class="form-control"
					id="id" name="id" readonly value="${surport.su_me_id}">
			</div>
			<div class="form-group col-12 mt-3">
				<label for="su_view">조회수</label> <input type="number"
					class="form-control" id="su_view" name="su_view" readonly
					value="${surport.su_view}">
			</div>
		</div>
		<div class="form-group">
			<label for="su_content">내용</label>
			<div class="content-box" id="su_content" name="content">${surport.su_content}</div>
		</div>
		<a href="/team1/surport/list" class="btn btn-outline-dark mb-4 mt-2">목록으로</a>
		<c:if test="${user.me_id == surport.su_me_id}">
			<a href="<c:url value="/surport/delete?suNum=${surport.su_num}"/>"
				class="btn btn-outline-success mb-3">삭제</a>
			<a href="<c:url value="/surport/update?suNum=${surport.su_num}"/>"
				class="btn btn-outline-warning mb-3">수정</a>
		</c:if>
		<!-- 댓글 기능 구현 START -->
		<div class="box-comment-insert">
			<div class="input-group mb-3">
				<textarea class="form-control textarea-comment"></textarea>
				<button class="btn btn-outline-success btn-comment-insert">댓글 등록</button>
			</div>
		</div>
		<div class="container-comment mt-3 mb-3">
			<div class="comment-title">댓글(<span class="comment-total"></span>)</div>
			<div class="box-comment-list">
				<div class="box-comment row">
					<div class="col-3">아이디</div>
					<div class="col-9">내용</div>
				</div>
			</div>
			<div class="box-pagination">
				<ul class="pagination justify-content-center mt-4 mb-4"></ul>
			</div>
		</div>
		<c:url value="/surport/list" var="url">
			<c:param name="page" value="${cris.page}" />
			<c:param name="type" value="${cris.type}" />
			<c:param name="search" value="${cris.search}" />
		</c:url>
		<!-- 댓글기능 구현 END -->
	</div>
<script type="text/javascript">	
//cris 객체의 댓글목록을 가져오기 위한 검색 조건
let cris = {
		page: 1,
		search: "${surport.su_num}"//검색조건
}
getCommentList(cris);
//getCommentList 의 정의
function getCommentList(cris){
	$.ajax({
		async: true,//비동기 요청
		url: '<c:url value="/comment/list"/>',
		type: 'post',//HTTP 요청 방식
		data: JSON.stringify(cris),//요청으로 전송할 데이터 (검색 조건을 JSON 형태로 변환하여 전송)
		contentType: "application/json; charset=utf-8",//요청 데이터 타입
		dataTtpe: "json",//응답 데이터 타입
		success: function(data){
			// 요청이 성공했을 때 실행될 콜백 함수
			// 반환된 데이터(data)에서 댓글 목록(data.list)을 가져와서 표시하는 함수를 호출합니다.
			displayCommentList(data.list);
			// 반환된 페이징 정보(data.pm)를 이용하여 댓글 목록의 페이지네이션을 표시하는 함수를 호출합니다.
			displayCommentPagination(data.pms);
			// 총 댓글 수를 화면에 표시합니다.
			$('.comment-total').text(data.pms.totalCount);
		},
		error: function(jqXHR, textStatus, errorThrown) {
		// 요청이 실패했을 때 실행될 콜백 함수, 에러 처리 코드를 작성할 수 있습니다.	
		}
	});
}

function displayCommentList(list) {
	//빈 문자열을 선언하여 댓글목록을 저장할 변수를 초기화
	let str = '';
	//null 처리
	if(list == null || list.length == 0){
		str = '<h3>등록된 댓글이 없습니다.</h3>';
		$('.box-comment-list').html(str);//댓글목록을 화면에 표시
		return;
	}
	//댓글이 목록에 있을 경우, 화면에 표시
	for(item of list){
		// 댓글 작성자와 현재 사용자의 아이디를 비교하여 버튼을 표시할지 여부를 결정합니다.
		let boxBtns = `
			<span class="box-btn float-right">
				<button class="btn btn-outline-danger btn-comment-remove" data-num="${item.co_num}">삭제</button>
				<button class="btn btn-outline-danger btn-comment-update" data-num="${item.co_num}">수정</button>
			</span>`;
		let btns = '${user.me_id}' == item.co_me_id ? boxBtns : ''; // 작성자와 현재 사용자의 아이디가 일치하면 버튼을 표시합니다.->권한에 따라 버튼표시로 변경
		
		// 댓글을 HTML 문자열로 구성하여 변수에 추가합니다.
		str += `
			<div class="box-comment row">
				<div class="col-3">\${item.co_me_id}</div> <!-- 댓글 작성자 -->
				<div class="col-9 clearfix input-group">
					<span class="text-comment">\${item.co_content}</span> <!-- 댓글 내용 -->
					${btns} <!-- 작성자와 현재 사용자의 아이디가 일치하면 버튼 표시 -->
				</div>
			</div>
		`;
	}
	// 완성된 댓글 목록 HTML을 화면에 삽입합니다.
	$('.box-comment-list').html(str);
}

function displayCommentPagination(pms) {
	//페이지네이션을 저장할 변수를 초기화
	let str = '';
	//이전 페이지 링크 표시
	if(pms.prev){
		str += `
		<li class="page-item">
			<a class="page-link" href="javascript:void(0);" data-page="${pms.startPage - 1}">이전</a>
		</li>`
	}
	//페이지네이션 구성
	for(let i = pms.startPage; i <= pms.endPage; i++){
		// 현재 페이지인 경우 active 클래스를 추가하여 활성화된 상태로 표시합니다.
		let active = pms.cris.page == i ? 'active' : '';
		str += `
			<li class="page-item ${active}">
				<a class="page-link" href="javascript:void(0);" data-page="${i}">${i}</a>
			</li>`;
	}
	//다음 페이지 링크 표시
	if(pms.next){
		str +=  `
		<li class="page-item">
			<a class="page-link" href="javascript:void(0);" data-page="${pms.endPage + 1}">다음</a>
		</li>`;
}

	// 페이지네이션 HTML을 화면에 삽입합니다.
	$('.box-pagination>ul').html(str);
}

// 페이지네이션 클릭 이벤트를 처리하는 부분
$(document).on('click', '.box-pagination .page-link', function() {
	// 클릭된 페이지 번호를 가져와서 검색 조건(cri)의 페이지 번호를 변경합니다.
	cris.page = $(this).data('page');
	// 변경된 검색 조건으로 댓글 목록을 다시 불러옵니다.
	getCommentList(cris);
});
</script>
<script type="text/javascript">
//댓글 등록 버튼의 클릭 이벤트 활성화 
$(".btn-comment-insert").click(function() {
	//로그인 여부 확인
	if(!checkLogin()){
		return;//로그인이 되어 있지 않으면 종료
	}
	// 서버에 전송할 데이터를 생성합니다. 댓글 내용과 게시글 번호를 포함합니다.
	let comment = {
		co_content: $('.textarea-comment').val(), // 댓글 내용을 가져옵니다.
		co_su_num: '${surport.su_num}' // 게시글 번호를 가져옵니다.
	}
	
	// 댓글 내용이 비어있는지 확인합니다.
	if (comment.co_content.length == 0) {
		alert('댓글 내용을 작성하세요.'); // 내용이 비어있다면 알림을 표시하고 함수를 종료합니다.
		return;
	}
	
	// 서버에 데이터를 전송합니다.
	$.ajax({
		async: true,
		url: '<c:url value="/comment/insert"/>', // 요청을 보낼 URL
		type: 'post', // HTTP 요청 방식 (POST)
		data: JSON.stringify(comment), // JSON 형태로 데이터 전송
		contentType: "application/json; charset=utf-8", // 요청 데이터의 타입
		dataType: "json", // 응답 데이터의 타입
		success: function(data) {
			if (data.result) { // 요청이 성공하면
				alert('댓글을 등록했습니다.'); // 성공 메시지를 표시합니다.
				$('.textarea-comment').val(''); // 댓글 입력창을 초기화합니다.
				cri.page = 1; // 댓글 목록을 다시 불러오기 위해 페이지 번호를 1로 설정합니다.
				getCommentList(cri); // 변경된 페이지 번호로 댓글 목록을 다시 불러옵니다.
			} else {
				alert('댓글을 등록하지 못했습니다.'); // 실패 메시지를 표시합니다.
			}
		},
		error: function(xhr, textStatus, errorThrown) {
			console.log(xhr); // 에러가 발생한 경우 콘솔에 에러를 출력합니다.
			console.log(textStatus);
		}
	});
});

// 로그인 여부를 확인하는 함수
function checkLogin() {
	// 로그인 여부를 확인하여 로그인되어 있으면 true를 반환합니다.
	if ('${user.me_id}' != '') {
		return true;
	}
	// 로그인되어 있지 않으면 로그인 페이지로 이동할지 확인하는 알림을 표시합니다.
	if (confirm("로그인이 필요한 기능입니다.\n로그인 페이지로 이동하겠습니까?")) {
		location.href = '<c:url value="/member/login"/>'; // 로그인 페이지로 이동합니다.
	}
	return false; // 로그인되어 있지 않음을 반환합니다.
}
</script>
<script type="text/javascript">
$(document).on('click', '.btn-comment-remove', function(){
    let comment = {
        co_num: $(this).data('num')
    };
    $.ajax({
        async: true,
        url: '<c:url value="/comment/delete"/>',
        type: "post",
        data: JSON.stringify(comment), // stringfy가 아니라 stringify로 수정
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function(data){
            if(data.result){
                alert("댓글을 삭제합니다.");
                getComment(cris); // cris가 어디서 정의되었는지 확인해야 합니다.
            } else {
                alert("댓글 삭제에 실패했습니다.");
            }
        }, 
        error: function(xhr, status, error){
            console.log(xhr);
            console.log(status); // textStatus가 정의되지 않았으므로 status로 수정
            console.log(error);
        }
    });
});
</script>
<script type="text/javascript">
$(document).on('click', '.btn-comment-update', function(){
//'btn-comment-update' 클래스를 가진 버튼이 클릭되었을 때
	// initComment() 함수를 호출하여 이전에 수정된 댓글을 초기화합니다.
	initComment();
	
	// 수정 중인 댓글의 내용 상자를 찾습니다.
	let contentBox = $(this).parents(".box-comment").find(".text-comment");
	
	// 현재 댓글의 내용을 가져옵니다.
	let content = contentBox.text();
	
	// 현재 내용을 포함한 textarea 요소를 생성합니다.
	let str = `<textarea class="form-control">${content}</textarea>`;
	contentBox.after(str); // 내용 상자 뒤에 textarea를 삽입합니다.
	contentBox.hide(); // 내용 상자를 숨깁니다.
	
	// 수정/삭제 버튼을 숨깁니다.
	$(this).parents(".box-comment").find('.box-btn').hide();
	
	// "수정 완료" 버튼을 추가합니다.
	let cm_num = $(this).data("num"); // 댓글 번호를 가져옵니다.
	str = `<button class="btn btn-outline-warning btn-complete" data-num="${co_num}">수정 완료</button>`;
	$(this).parents(".box-comment").find('.box-btn').after(str); // 수정/삭제 버튼 뒤에 버튼을 삽입합니다.
});

// "수정 완료" 버튼이 클릭되었을 때
$(document).on('click', '.btn-complete', function(){
	// 서버에 전송할 댓글 내용과 번호를 포함하는 객체를 생성합니다.
	let comment = {
		cm_content : $('.box-comment').find('textarea').val(), // textarea에서 내용을 가져옵니다.
		cm_num : $(this).data("num") // 버튼의 데이터 속성에서 댓글 번호를 가져옵니다.
	}
	
	// AJAX를 사용하여 댓글 데이터를 서버에 전송합니다.
	$.ajax({
		async : true,
		url : '<c:url value="/comment/update"/>', // 댓글을 업데이트할 URL입니다.
		type : 'post', // HTTP 메서드 (POST)
		data : JSON.stringify(comment), // 댓글 객체를 JSON 형식으로 변환합니다.
		contentType : "application/json; charset=utf-8", // 콘텐츠 유형을 설정합니다.
		dataType : "json", // 서버에서 기대되는 데이터 유형입니다.
		success : function (data){
			// 서버가 성공을 반환하면 알림을 표시하고 댓글 목록을 새로 고칩니다.
			if(data.result){
				alert('댓글을 수정했습니다.');
				getCommentList(cri);
			}else{
				alert('댓글을 수정하지 못했습니다.');
			}
		}, 
		error : function(jqXHR, textStatus, errorThrown){
			// 에러를 처리합니다.
		}
	});
})

// 댓글을 원래 상태로 되돌리는 함수
function initComment(){
	$('.btn-complete').remove(); // "수정 완료" 버튼을 제거합니다.
	$('.box-comment').find('textarea').remove(); // textarea를 제거합니다.
	$('.box-btn').show(); // 수정/삭제 버튼을 표시합니다.
	$('.text-comment').show(); // 내용 상자를 표시합니다.
}

</script>
</body>
</html>