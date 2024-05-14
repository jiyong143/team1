<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.js"></script>
<style type="text/css">
#product-content{
	width: 100%;
}
.count{
	float: right;
}
.jiyong{
	position : relative;
	margin-right : 5px;
}
.delete-button{
	position : absolute;
	top :0;
	right : 0;
	background: none;
	border: none;
	padding: 0;
}
</style>
</head>
<body>
	<div class="container">
		<form action="<c:url value="/product/insert"/>" method="post" enctype="multipart/form-data" id="productForm">
			<h1>상품 등록</h1>
			<div class="form-group">
				<label for="tg_title" style="display: block">카테고리</label>
				<select name="tg_title" class="form-control" style="width: 50%; display: inline;">
					<option id="title" value="x">대분류를 선택하세요.</option>
					<c:forEach items="${topGroupList}" var="tg">
						<option id="tg_title" value="${tg.tg_title}">${tg.tg_title}</option>
					</c:forEach>
				</select>
				<select name="mg_title" class="form-control mid-group" style="width: 50%; display: inline; float: right"></select>
			</div>
			<div class="form-group">
				<label for="pr_name">제목</label>
				<input type="text" class="form-control" id="pr_name" name="pr_name">
			</div>
			<div class="form-group">
				<label for="sido" style="display: block">주소</label>
				<select name="sido" class="form-control sido" style="width: 33%; display: inline;">
					<option id="sido" value="x">시/도를 선택하세요.</option>
					<c:forEach items="${sidoList}" var="sido">
						<option id="sido check" value="${sido.sido}">${sido.sido}</option>
					</c:forEach>
				</select>
				<select name="sigungu" class="form-control sigungu" style="width: 33%; display: inline;"></select>
				<select name="h_dong_nm" class="form-control h_dong_nm" style="width: 33%; display: inline;"></select>	
			</div>
			<div class="form-group">
				<label for="pr_content">내용</label>
				<div class="content-update">
					<textarea id="product-content" name="pr_content" class="px-4 py-3 items-center w-full rounded appearance-none transition duration-300 ease-in-out text-heading text-sm focus:outline-none focus:ring-0 bg-white border border-gray-300 focus:shadow focus:outline-none focus:border-heading placeholder-body inline-block w-full px-4 py-4 mt-6 outline-none align-middle overflow-x-scroll appearance-none resize-none border-solid border border-jnGray-300 placeholder:text-jnGray-500 h-[220px] text-sm" autocomplete="off" spellcheck="false" rows="20" data-gtm-form-interact-field-id="0"  placeholder="- 상품명(브랜드)																																																- 모델명																																																- 구매 시기																																																- 사용 기간																																																- 하자 여부																																																* 실제 촬영한 사진과 함께 상세 정보를 입력해주세요.																																																																																																 																																																안전하고 건전한 거래환경을 위해 과학기술정보통신부,                 한국인터넷진흥원, 가지가 함께합니다."></textarea>
					<p id="contentMessage" style="display: none;">상품설명은 최대 1000자까지 입력 가능합니다.</p>
					<div class="count">
						<span id="contentCount" class="contentCount absolute right-0 text-sm leading-5 text-gray-400">${count }</span>
						<span class="michael">/1000</span>
					</div>
				</div>
			</div>
			<div class="form-group">
				<label for="pr_price">가격</label>
				<div class="form-check">
					<label class="form-check-label">
						<input type="radio" class="form-check-input" value="0" checked name="optradio">무료 나눔
					</label>
				</div>
				<div class="form-check">
					<label class="form-check-label">
						<input type="radio" class="form-check-input" value="-10" name="optradio">가격 제안
					</label>
				</div>
				<div class="form-check">
					<label class="form-check-label">
						<input type="radio" class="form-check-input priceTag" value="" name="optradio">가격 등록
						<input type="text" class="form-control" id="pr_price" name="pr_price"
						 oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');"
						 autocomplete="off" value="0" style="visibility: hidden">
					</label>
				</div>
			</div>
			<div class="form-group">
				<div class="image-picker">
				    <input name="media" id="fileInput" type="file" accept="image/png, image/jpeg, image/jpg" class="hidden" style="display: none;" multiple>
					<button type="button" class="flex items-center justify-center w-20 h-20 mr-1.5 bg-jnGray-200 rounded" onclick="openFilePicker()">
						<div class="flex flex-col">
							<svg width="32px" height="32px" viewBox="0 0 32 32" fill="none" xmlns="http://www.w3.org/2000/svg" class="">
								<path fill-rule="evenodd" clip-rule="evenodd" d="M15.728 20.4461C13.6481 20.4461 11.9619 18.7599 11.9619 16.68C11.9619 14.6001 13.6481 12.9138 15.728 12.9138C17.8079 12.9138 19.4942 14.6001 19.4942 16.68C19.4942 18.7599 17.8079 20.4461 15.728 20.4461Z" fill="#C2C6CE"></path>
								<path fill-rule="evenodd" clip-rule="evenodd" d="M10.4564 7.32295C10.9376 6.00587 11.5097 5.15997 12.8118 5.15997H17.9241C19.2253 5.15997 19.7975 6.00463 20.2785 7.32003H20.7897C24.7543 7.32003 27.968 10.4192 27.968 14.2417V19.119C27.968 22.9409 24.7543 26.04 20.7897 26.04H10.6669C6.7023 26.04 3.48798 22.9409 3.48798 19.119V14.2417C3.48798 10.487 6.58918 7.4303 10.4564 7.32295ZM21.3772 16.68C21.3772 19.8001 18.8481 22.3292 15.728 22.3292C12.6079 22.3292 10.0788 19.8001 10.0788 16.68C10.0788 13.5599 12.6079 11.0308 15.728 11.0308C18.8481 11.0308 21.3772 13.5599 21.3772 16.68ZM21.5988 11.88C21.5988 12.4 22.0204 12.8216 22.5403 12.8216C23.0603 12.8216 23.4819 12.4 23.4819 11.88C23.4819 11.36 23.0603 10.9385 22.5403 10.9385C22.0204 10.9385 21.5988 11.36 21.5988 11.88Z" fill="#C2C6CE"></path>
							</svg>
							<p id="imageCount" class="mt-1 text-xs text-jnGray-500">0 / 5</p>
						</div>
					</button>
				</div>
				<div class="images-container" style="margin-left : 5px;">
					<ul class="file-list">
						<div class="jiyong add-li" style="display : flex;"></div>
					</ul> 
				</div>
			</div>
			<button class="btn btn-outline-success">상품 등록</button>
		</form>
	</div>
<!-- 대분류 변경시 ajax로 중분류 실시간 변경 -->
<script type="text/javascript">
	$("[name=mg_title]").hide();
	
	$("[name=tg_title]").change(function(){
		$("[name=mg_title]").show();
		let title = $("[name=tg_title]").val();
		console.log(title);
		let obj = {
			tg_title : title
		}
		$.ajax({
			async : false,
			url : '<c:url value="/product/midGroup"/>', 
			type : 'get', 
			data : obj,
			dataType : "json", 
			success : function (data){
				console.log(data);
				displayMidGroup(data.data);
			},
			error : function(jqXHR, textStatus, errorThrown){

			}
		});
	})
	
	function displayMidGroup(list){
		let str = '';
		for(item of list){
			for(let mid of item.midGroupList){
				str += `<option value="\${mid.mg_title}">\${mid.mg_title}</option>`;
			}
		}
		$(".mid-group").html(str);
	}
</script>

<!-- 시/군/구 관련 -->
<script type="text/javascript">
	$("[name=sigungu]").hide();
	$("[name=h_dong_nm]").hide();
	
	$("[name=sido]").change(function(){
		
		$("[name=sigungu]").show();
		let sido = $("[name=sido]").val();
		
		// sido == 세종...
		if($("[name=sido]").val() == '세종특별자치시'){
			$("[name=h_dong_nm]").show();
			let obj = {
				sido : sido,
				sigungu : ""
			}
			dongAjax(obj);
		}
		
		// sido != 세종...
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
		let str = `<option id="sigungu" value="x">시/군/구를 선택하세요.</option>`;
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
		dongAjax(obj);
	})
	
	function dongAjax(obj){
		$.ajax({
			async : false,
			url : '<c:url value="/product/dong"/>', 
			type : 'get', 
			data : obj,
			dataType : "json", 
			success : function (data){
				console.log(data);
				displaydong(data.dongList);
			}, 
			error : function(jqXHR, textStatus, errorThrown){
	
			}
		});
	}

	function displaydong(list){
		let str = `<option id="h_dong_nm" value="x">동을 선택하세요.</option>`;
		for(item of list){
			str += `<option value="\${item.h_dong_nm}">\${item.h_dong_nm}</option>`;
		}
		$(".h_dong_nm").html(str);
	}
</script>

<!-- 가격 관련 -->
<script type="text/javascript">
	const pr_price = document.querySelector('#pr_price');
	pr_price.addEventListener('keyup', function(e) {
		let value = e.target.value;
		// 입력 값이 없으면 빈문자열로 설정
		if (value === "" || value === null || isNaN(Number(value))) {
		  value = "";
		} else {
		  value = Number(value.replaceAll(',', ''));
		}
		const formatValue = value.toLocaleString('ko-KR');
		pr_price.value = formatValue; 
	});

	$(".form-check-input").change(function(){
		let a = $(".priceTag").is(":checked");
		if(a == true){
			$("[name=pr_price]").css("visibility", "visible");
		}else{
			$("[name=pr_price]").css("visibility", "hidden");
		}
	});
</script>

<!-- 최소 글자 제한 + summernote -->
<script type="text/javascript">
	$("#productForm").submit(function(e){
		if($(".priceTag").is(":checked")){
			let a = $("[name=pr_price]").val();
			let maxPrice1 = a.replace(/,/g, '');
			a = parseInt(maxPrice1);
			$("[name=pr_price]").val(a);
			$(".priceTag").val(a);
		}
		
		addFilesToForm();
		
		if($(".sido").val() == 'x' || $(".h_dong_nm").val() == 'x' ||
			($(".sido").val() != '세종특별자치시' && $(".sigungu").val() == 'x' )){
			alert("주소를 입력해야 합니다.");
			$(".h_dong_nm").focus();
			return false;
		}
		
		if($("[name = tg_title]").val() == 'x'){
			alert("대분류를 선택해야합니다.");
			$("[name = tg_title]").focus();
			return false;
		}
		
		let title = $("[name = pr_name]").val();
		if(title.length == 0){
			alert("제목은 1글자 이상 입력해야 합니다.");
			$("[name = pr_name]").focus();
			return false;
		}
		
		let content = $("[name = pr_content]").val();
		if(content.length == 0){
			alert("내용은 1글자 이상 입력해야 합니다.");
			$("[name = pr_content]").focus();
			return false;
		}
		
		let res = false;
		for(let i = 0; i < 5; i++){
			let fileTag = document.getElementsByName("media")[i];
			if(fileTag.value.length != 0){
				res = true;
				return;
			}
		}
		if(res == false){
			alert("파일은 1개 이상 등록해야합니다.");
			return false;
		}
		return true;
	});

	
	document.getElementById("product-content").addEventListener("input", function() {
	    const span = document.getElementById('contentCount');
	    var contentMessage = document.getElementById("contentMessage");
	    var inputTextLength = this.value.length;
	    if (inputTextLength > 1000) {
	        this.value = this.value.slice(0, 1000);
	        contentMessage.style.display = "block";
	        span.textContent = 1000;
	    } else {
	        contentMessage.style.display = "none";  
	        span.textContent = inputTextLength;
	    }
	});
</script>

<!-- 파일 -->
<script type="text/javascript">
//이미지 갯수를 세어 화면에 표시하는 함수
function displayImageCount() {
    // ul 요소의 자식 노드 중 li 요소의 개수를 가져옴
    const imageCount = document.querySelectorAll('.file-list li').length;
    const containerCount = document.querySelectorAll('.add-img').length;
    const tatalCount = imageCount + containerCount;
    // 이미지 갯수를 표시할 요소를 가져옴
    const countElement = document.getElementById('imageCount');
    // 이미지 갯수를 화면에 표시
    countElement.textContent = tatalCount + '/5';
}

//이미지 삭제 버튼 클릭 시 실행될 함수
function deleteFile(button) {
    // 삭제 버튼이 속한 부모 요소의 부모 요소를 찾아서 제거 (즉, li 태그 제거)
    button.parentNode.parentNode.remove();
    // 이때, 개수 다시 리뉴얼
    displayImageCount(); 
}

function openFilePicker(){
    document.getElementById('fileInput').click();
}

document.getElementById('fileInput').addEventListener('change', handleFileSelect, false);

function handleFileSelect(event) {
    const files = event.target.files; // 선택된 파일들의 배열
    
    // 파일을 하나씩 반복하여 처리
    for (let i = 0; i < files.length; i++) {
        const file = files[i];
        displayFile(file);
    }
}

function displayFile(file) {
	
	const countElement = document.getElementById('imageCount');
	const value1 = countElement.textContent.trim();
	const value = value1.split('/')[0];

	if(value==5){
		alert("최대 5장까지 가능합니다.");
		return;
	}
	
    const reader = new FileReader();
    
    // 파일 읽기가 완료되면 호출되는 콜백 함수
    reader.onload = function(e) {
        // 이미지를 담는 div 요소 생성
        const container = document.createElement('div');
        container.classList.add('jiyong'); // 컨테이너에 클래스 추가
        
        // 이미지 요소 생성 및 설정
        const img = document.createElement('img');
        img.src = e.target.result; // 파일 데이터의 URL을 설정
        img.width = 80; // 이미지 너비 조절
        img.height = 80; // 이미지 높이 조절
        img.classList.add('add-img'); // 이미지에 클래스 추가
        
     	// 숨겨진 input 요소 생성 및 설정
        const input = document.createElement('input');
        input.type = 'hidden';
        input.name = 'media';
        input.value = e.target.result; // 파일의 데이터 URL을 설정 (Base64)
        
        // 이미지를 담는 div 요소 생성
        const imgContainer = document.createElement('div');
        imgContainer.appendChild(img); 	 // 이미지를 div에 추가
        imgContainer.appendChild(input); // input을 div에 추가
        
        // 버튼 요소 생성 및 설정
        const button = document.createElement('button');
        button.classList.add('delete-button'); // 버튼에 클래스 추가
        button.onclick = function() {
            container.remove(); // 버튼을 클릭하면 컨테이너 요소 삭제
            displayImageCount();
        };
        
        // SVG 아이콘 요소 생성 및 설정
        const svg = document.createElementNS('http://www.w3.org/2000/svg', 'svg');
        svg.setAttribute('width', '20px');
        svg.setAttribute('height', '20px');
        svg.setAttribute('viewBox', '0 0 20 20');
        svg.setAttribute('fill', 'none');
        
        const path1 = document.createElementNS('http://www.w3.org/2000/svg', 'path');
        path1.setAttribute('d', 'M10 18C14.4183 18 18 14.4183 18 10C18 5.58172 14.4183 2 10 2C5.58172 2 2 5.58172 2 10C2 14.4183 5.58172 18 10 18Z');
        path1.setAttribute('fill', 'white');
        
        const path2 = document.createElementNS('http://www.w3.org/2000/svg', 'path');
        path2.setAttribute('d', 'M17.5 10C17.5 14.1421 14.1421 17.5 10 17.5V18.5C14.6944 18.5 18.5 14.6944 18.5 10H17.5ZM10 17.5C5.85786 17.5 2.5 14.1421 2.5 10H1.5C1.5 14.6944 5.30558 18.5 10 18.5V17.5ZM2.5 10C2.5 5.85786 5.85786 2.5 10 2.5V1.5C5.30558 1.5 1.5 5.30558 1.5 10H2.5ZM10 2.5C14.1421 2.5 17.5 5.85786 17.5 10H18.5C18.5 5.30558 14.6944 1.5 10 1.5V2.5Z');
        path2.setAttribute('fill', '#DADEE5');
        
        const path3 = document.createElementNS('http://www.w3.org/2000/svg', 'path');
        path3.setAttribute('d', 'M7 7L13 13M13 7L7 13');
        path3.setAttribute('stroke', '#363C45');
        path3.setAttribute('stroke-linecap', 'round');
        
        svg.appendChild(path1);
        svg.appendChild(path2);
        svg.appendChild(path3);
        
        button.appendChild(svg);
        
        // 버튼을 담는 div 요소 생성
        const buttonContainer = document.createElement('div');
        buttonContainer.style.position = 'absolute'; // 상대적 위치 설정
        buttonContainer.style.top = '0'; // 이미지의 상단에 위치
        buttonContainer.style.right = '0'; // 이미지의 오른쪽에 위치
        buttonContainer.appendChild(button); // 버튼을 div에 추가
        
        // 이미지와 버튼을 담는 컨테이너에 이미지와 버튼 컨테이너 추가
        container.appendChild(imgContainer); 
        container.appendChild(buttonContainer);

        // 선택한 요소에 컨테이너 추가
        const addLiElement = document.querySelector('.add-li');
        addLiElement.appendChild(container);
        displayImageCount();
    };
    
    // 파일 읽기 시작
    reader.readAsDataURL(file);
}

//파일 추가 함수
function addFilesToForm() {
    // Form 요소 가져오기
    const form = document.getElementById('productForm'); // Form의 ID는 'productForm'입니다.
    // 파일을 추가할 UL 요소 가져오기
    const fileList = document.querySelector('.file-list');
    // 파일 요소들을 가져오기
    const fileInputs = fileList.querySelectorAll('.jiyong input[name="media"]');
    // 파일 요소들을 Form에 추가
    fileInputs.forEach(input => {
        const cloneInput = input.cloneNode(true); // 입력 요소 복제
        form.appendChild(cloneInput); // Form에 추가
    });
}
</script>
</body>
</html>