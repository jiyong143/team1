<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 정보 수정</title>
<style>

.product-update{
    position: relative;
    top: 30%;
    left: 50%;
    transform: translate(-50%, -50%);
}

.file-list {
    list-style-type: none; /* 항목 기호 없앰 */
    display: flex;
    justify-content: space-between; /* 각 항목 사이에 공간을 균등하게 분배 */
    padding: 0; /* 기본 패딩 제거 */
  }
  
  #productTitle {
    padding: 0.5rem 1rem; /* 내부 여백 설정 */
    width: 25%; /* 너비를 부모 요소에 맞게 설정 */
    border: 1px solid #ccc; /* 테두리 설정 */
    border-radius: 0.25rem; /* 둥근 모서리 설정 */
    font-size: 14px; /* 폰트 크기 설정 */
    color: #333; /* 폰트 색상 설정 */
    transition: border-color 0.2s ease-in-out; /* 테두리 색상 전환 효과 설정 */
    position : absolute;
    top : 170px;
    left : 700px;   
}

.price-update{
padding: 0.5rem 1rem; /* 내부 여백 설정 */
    width: 25%; /* 너비를 부모 요소에 맞게 설정 */
    border: 1px solid #ccc; /* 테두리 설정 */
    border-radius: 0.25rem; /* 둥근 모서리 설정 */
    font-size: 14px; /* 폰트 크기 설정 */
    color: #333; /* 폰트 색상 설정 */
    transition: border-color 0.2s ease-in-out; /* 테두리 색상 전환 효과 설정 */
    position : absolute;
    top : 495px;
    left : 700px; 

}

#productTitle:focus {
    outline: none; /* 포커스 시 기본 아웃라인 제거 */
    border-color: #007bff; /* 포커스 시 테두리 색상 변경 */
    box-shadow: 0 0 0 3px rgba(0, 123, 255, 0.25); /* 포커스 시 그림자 효과 설정 */
}

#product-content:focus {
    outline: none; /* 포커스 시 기본 아웃라인 제거 */
    border-color: #007bff; /* 포커스 시 테두리 색상 변경 */
    box-shadow: 0 0 0 3px rgba(0, 123, 255, 0.25); /* 포커스 시 그림자 효과 설정 */
}


 img {
  border-radius: 8px; /* 이미지 테두리의 둥글기를 설정합니다. */
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

.image-update{
top : 40px;
left : 700px;
position : absolute;
}

.category-update {
    position : absolute;
    top : 250px;
    left : 680px;
}

.topGroup-li , .midGroup-li{
list-style-type: none;
left : 0;
}

#topGroup button {
    border: none; /* 버튼의 테두리를 제거합니다. */
    background-color: transparent; /* 버튼의 배경색을 투명으로 설정합니다. */
   
}

#midGroup button {
    border: none; /* 버튼의 테두리를 제거합니다. */
    background-color: transparent; /* 버튼의 배경색을 투명으로 설정합니다. */
   
}

.price-update button{

    border: none; /* 버튼의 테두리를 제거합니다. */
    background-color: transparent; /* 버튼의 배경색을 투명으로 설정합니다. */
}

#topGroup , #midGroup {
    max-height: 200px; /* 최대 높이를 지정하여 스크롤이 나타나도록 합니다. */
    overflow-y: auto; /* 세로 스크롤이 필요할 때만 스크롤을 표시합니다. */
    width : 239px;
    
}

#topGroup::-webkit-scrollbar {
    display: none; /* 웹킷 브라우저에서 스크롤바를 숨깁니다. */
}

#midGroup::-webkit-scrollbar {
    display: none; /* 웹킷 브라우저에서 스크롤바를 숨깁니다. */
}

#product-content::-webkit-scrollbar {
    display: none; /* 웹킷 브라우저에서 스크롤바를 숨깁니다. */
}

.group-list{
display : flex;
 position : absolute;
 left : 18px;
}


.category-ul{
padding-left : 0;
}

.free-button{
left : 370px;
position : absolute;
color : green;
}

.suggest-button{
left : 270px;
position : absolute;
color : gray;
}

#product-content{
position : absolute;
left : 700px;
top : 587px;
width : 476px;

}

.contentCount{
position : absolute;
left : 1108px;
top : 1115px;
}

.michael{
position : absolute;
left : 1137px;
top : 1115px;
}

</style>
</head>
<body>
<div class="product-update">
	<div class="image-update" style="display : flex;">
	  <div class="image-picker">
	    <input name="media" id="fileInput" type="file" accept="image/png, image/jpeg, image/jpg" class="hidden" style="display: none;" multiple>
	    <button class="flex items-center justify-center w-20 h-20 mr-1.5 bg-jnGray-200 rounded" onclick="openFilePicker()">
	      <div class="flex flex-col">
	        <svg width="32px" height="32px" viewBox="0 0 32 32" fill="none" xmlns="http://www.w3.org/2000/svg" class="">
	          <path fill-rule="evenodd" clip-rule="evenodd" d="M15.728 20.4461C13.6481 20.4461 11.9619 18.7599 11.9619 16.68C11.9619 14.6001 13.6481 12.9138 15.728 12.9138C17.8079 12.9138 19.4942 14.6001 19.4942 16.68C19.4942 18.7599 17.8079 20.4461 15.728 20.4461Z" fill="#C2C6CE"></path>
	          <path fill-rule="evenodd" clip-rule="evenodd" d="M10.4564 7.32295C10.9376 6.00587 11.5097 5.15997 12.8118 5.15997H17.9241C19.2253 5.15997 19.7975 6.00463 20.2785 7.32003H20.7897C24.7543 7.32003 27.968 10.4192 27.968 14.2417V19.119C27.968 22.9409 24.7543 26.04 20.7897 26.04H10.6669C6.7023 26.04 3.48798 22.9409 3.48798 19.119V14.2417C3.48798 10.487 6.58918 7.4303 10.4564 7.32295ZM21.3772 16.68C21.3772 19.8001 18.8481 22.3292 15.728 22.3292C12.6079 22.3292 10.0788 19.8001 10.0788 16.68C10.0788 13.5599 12.6079 11.0308 15.728 11.0308C18.8481 11.0308 21.3772 13.5599 21.3772 16.68ZM21.5988 11.88C21.5988 12.4 22.0204 12.8216 22.5403 12.8216C23.0603 12.8216 23.4819 12.4 23.4819 11.88C23.4819 11.36 23.0603 10.9385 22.5403 10.9385C22.0204 10.9385 21.5988 11.36 21.5988 11.88Z" fill="#C2C6CE"></path>
	        </svg>
	        <p id="imageCount" class="mt-1 text-xs text-jnGray-500"></p>
	      </div>
	    </button>
	  </div>
	
	  <div class="images-container" style="margin-left : 5px;">
	    <ul class="file-list">
		<c:forEach items="${files}" var="file">
		    <li class="file-item">		        
		            <div class="jiyong flex w-full h-full overflow-hidden border border-solid border-jnGreen rounded-lg">
		                <img alt="productImage-0" src="<c:url value="/download${file.fi_name}"/>" width="80" height="80" decoding="async" data-nimg="1" class="object-cover w-full h-full bg-gray-200 rounded-lg" loading="lazy" style="color: transparent;">
		                <button class="delete-button" onclick="deleteFile(this)">
		                    <svg width="20px" height="20px" viewBox="0 0 20 20" fill="none" xmlns="http://www.w3.org/2000/svg">
		                        <path d="M10 18C14.4183 18 18 14.4183 18 10C18 5.58172 14.4183 2 10 2C5.58172 2 2 5.58172 2 10C2 14.4183 5.58172 18 10 18Z" fill="white"></path>
		                        <path d="M17.5 10C17.5 14.1421 14.1421 17.5 10 17.5V18.5C14.6944 18.5 18.5 14.6944 18.5 10H17.5ZM10 17.5C5.85786 17.5 2.5 14.1421 2.5 10H1.5C1.5 14.6944 5.30558 18.5 10 18.5V17.5ZM2.5 10C2.5 5.85786 5.85786 2.5 10 2.5V1.5C5.30558 1.5 1.5 5.30558 1.5 10H2.5ZM10 2.5C14.1421 2.5 17.5 5.85786 17.5 10H18.5C18.5 5.30558 14.6944 1.5 10 1.5V2.5Z" fill="#DADEE5"></path>
		                        <path d="M7 7L13 13M13 7L7 13" stroke="#363C45" stroke-linecap="round"></path>
		                    </svg>
		                </button>
		            </div>	        
		    </li>
		</c:forEach>
	       <div class="jiyong add-li" style="display : flex;">
	       </div>
	    </ul> 
	  </div>
	</div>
	<input value="${pro.pr_name }" id="productTitle" name="productTitle" type="text" placeholder="상품명" class="py-2 px-4 md:px-5 w-full appearance-none border text-input text-xs lg:text-sm font-body placeholder-body min-h-12 transition duration-200 ease-in-out bg-white border-gray-300 focus:border-heading h-11 md:h-12 focus:outline-none rounded-md" autocomplete="off" spellcheck="false" aria-invalid="false">
	<section class="category-update">
	<div class="group-list flex-row w-full overflow-hidden text-sm font-medium h-60">
	<div id="topGroup" class="w-1/2 h-full overflow-y-auto border border-solid rounded border-jnGray-300">
	<ul class="category-ul flex flex-col border-solid border-jnGray-300">
	<c:forEach items="${topList }" var="top">
	<li class="false h-10 p-3 topGroup-li">
	<button>
	<p class="truncate break-keep" style="font-weight : normal; font-size : 15px; color : initial;">${top.tg_title }</p>
	</button>
	</li>
	</c:forEach>
	</ul>
	</div>
	<div id="midGroup" class="w-1/2 h-full overflow-y-auto border border-solid rounded border-jnGray-300">
	<ul class="category-ul flex flex-col border-solid border-jnGray-300">
	<c:forEach items="${midList }" var="mid">
	<li class="false h-10 p-3 midGroup-li">
	<button>
	<p class="truncate break-keep" style="font-weight : normal; font-size : 15px; color : initial;">${mid.mg_title }</p>
	</button>
	</li>
	</c:forEach>
	</ul>
	</div>
	</div>
	</section>
	
	<div id="price-update" class="price-update flex items-center justify-between w-full border border-gray-300 border-solid rounded px-4  text-base scale-85 origin-top-left -mb-3  w-[117.65%] p-6  h-[60px] false">
		<label for="search" class="flex items-center py-0.5 w-2/3">
		<span id="won" style="color : <c:if test="${pro.pr_price == 0 }">green</c:if> <c:if test="${pro.pr_price == -10 }">gray</c:if>;">₩</span>
		<input id="price-input" name="productPrice" type="text" inputmode="numeric" class="ml-1 bg-white focus:outline-none h-11 md:h-12 placeholer-jnGray-500 w-2/3 disabled:opacity-100 placeholer-jnGray-500" placeholder="판매가격" value="${price}" autocomplete="off" oninput="this.value = this.value.replace(/[^0-9]/g, '').replace(/(\..*)\./g, '$1')" style="color : <c:if test="${pro.pr_price == 0 }">green</c:if> <c:if test="${pro.pr_price == -10 }">gray</c:if> ; border : none; outline : none;" <c:if test="${pro.pr_price ==0 || pro.pr_price == -10 }">disabled</c:if> >
		</label>
		<button class="free-button flex items-center justify-center text-center text-jnGray-900">
		<svg width="22" height="22" viewBox="0 0 22 22" fill="<c:if test="${pro.pr_price == 0 }">rgb(13, 204, 90)</c:if> <c:if test="${pro.pr_price != 0 }">#FFFFFF</c:if> " xmlns="http://www.w3.org/2000/svg" class="mr-1 ">
		<path d="M12 21C16.9706 21 21 16.9706 21 12C21 7.02944 16.9706 3 12 3C7.02944 3 3 7.02944 3 12C3 16.9706 7.02944 21 12 21Z" stroke="#9CA3AF" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"></path>
		<path d="M16 9L10.5 14.5L8 12" stroke="#C2C6CE" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"></path>
		</svg>
		무료나눔</button> 
		<button class="suggest-button flex items-center justify-center text-center text-jnGray-900">
		<svg width="22" height="22" viewBox="0 0 22 22" fill="<c:if test="${pro.pr_price == -10 }">rgb(13, 204, 90)</c:if> <c:if test="${pro.pr_price != -10 }">#FFFFFF</c:if>" xmlns="http://www.w3.org/2000/svg" class="mr-1 ">
		<path d="M12 21C16.9706 21 21 16.9706 21 12C21 7.02944 16.9706 3 12 3C7.02944 3 3 7.02944 3 12C3 16.9706 7.02944 21 12 21Z" stroke="#9CA3AF" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"></path>
		<path d="M16 9L10.5 14.5L8 12" stroke="#C2C6CE" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"></path>
		</svg>
		가격제안</button>
	</div>
	
	<div class="content-update">
	<textarea id="product-content" name="product-content" class="px-4 py-3 items-center w-full rounded appearance-none transition duration-300 ease-in-out text-heading text-sm focus:outline-none focus:ring-0 bg-white border border-gray-300 focus:shadow focus:outline-none focus:border-heading placeholder-body inline-block w-full px-4 py-4 mt-6 outline-none align-middle overflow-x-scroll appearance-none resize-none border-solid border border-jnGray-300 placeholder:text-jnGray-500 h-[220px] text-sm" autocomplete="off" spellcheck="false" rows="20" maxlength="1000" data-gtm-form-interact-field-id="0"  placeholder="- 상품명(브랜드)																																																- 모델명																																																- 구매 시기																																																- 사용 기간																																																- 하자 여부																																																* 실제 촬영한 사진과 함께 상세 정보를 입력해주세요.																																																																																																 																																																안전하고 건전한 거래환경을 위해 과학기술정보통신부,                 한국인터넷진흥원, 가지가 함께합니다.">${pro.pr_content }</textarea>
	<span id="contentCount" class="contentCount absolute right-0 text-sm leading-5 text-gray-400">${count }</span>
	<span class="michael">/1000</span>
	</div>	
		
	</div>

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

//페이지 로드시 이미지 갯수를 표시
window.addEventListener('load', displayImageCount);


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
        
        // 이미지를 담는 div 요소 생성
        const imgContainer = document.createElement('div');
        imgContainer.appendChild(img); // 이미지를 div에 추가
        
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


document.addEventListener('DOMContentLoaded', function() {
	var pNum = '${pro.pr_num}';
    var serverText = '${pro.pr_tg_name}';
    var serverText1 = '${pro.pr_mg_name}';
    var buttons = document.querySelectorAll('#topGroup button');
    var buttons1 = document.querySelectorAll('#midGroup button');
    
    buttons.forEach(function(button) {
        var buttonText = button.querySelector('p').textContent.trim();
        if (buttonText === serverText) {
            button.classList.add('selected');
            button.querySelector('p').style.fontWeight = 'bold'; // 진하게 만들기
            button.querySelector('p').style.color = 'black'; // 진하게 만들기
            button.closest('li').style.backgroundColor = '#ced4da';// 버튼 포함하는 li의 배경색을 회색으로 
        }
        
        button.addEventListener('click', function() {
            buttons.forEach(function(btn) {
                btn.classList.remove('selected');
                btn.querySelector('p').style.fontWeight = 'normal'; // 모든 버튼 스타일 초기화
                btn.closest('li').style.backgroundColor = ''; // 버튼 포함하는 li의 배경색을 기본으로 
                btn.querySelector('p').style.color = 'initial';
            });
            
            button.classList.add('selected');
            button.querySelector('p').style.fontWeight = 'bold'; // 클릭한 버튼 스타일 변경          
            button.querySelector('p').style.color = 'black';
            button.closest('li').style.backgroundColor = '#ced4da';
            console.log(pNum);
            sendTop(button);
        });      
    });
    
    
    buttons1.forEach(function(button) {
        var buttonText = button.querySelector('p').textContent.trim();
        
        if (buttonText === serverText1) {
            button.classList.add('selected');
            button.querySelector('p').style.fontWeight = 'bold'; // 진하게 만들기
            button.querySelector('p').style.color = 'black'; // 진하게 만들기            
            button.closest('li').style.backgroundColor = '#ced4da';// 버튼 포함하는 li의 배경색을 회색으로 
        }
        
        button.addEventListener('click', function() {
            buttons1.forEach(function(btn) {
                btn.classList.remove('selected');
                btn.querySelector('p').style.fontWeight = 'normal'; // 모든 버튼 스타일 초기화 
                btn.closest('li').style.backgroundColor = ''; // 버튼 포함하는 li의 배경색을 기본으로 
                btn.querySelector('p').style.color = 'initial';
            });
            
            button.classList.add('selected');
            button.querySelector('p').style.fontWeight = 'bold'; // 클릭한 버튼 스타일 변경          
            button.querySelector('p').style.color = 'black'; 
            button.closest('li').style.backgroundColor = '#ced4da';
        });      
    });
});


function sendTop(button) {
	var pNum = '${pro.pr_num}';
	var topName = button.querySelector('p').textContent.trim();
	console.log(pNum);
    var data = {
       "topName" : topName,
       "pNum" : pNum
    };

    console.log(data)
    // AJAX 요청
    $.ajax({
    	async : false,
        type: "get",
        url: '<c:url value="/product/update1"/>', 
        data: data, // 보낼 데이터 입력
        dataType : "json",
        success: function(data) {
        	console.log(data);
            // 성공적으로 응답을 받았을 때 실행할 코드
            addMid(data.mids, data.mName);
        },
        error: function(xhr, status, error) {
            // 요청이 실패했을 때 실행할 코드
            console.error("Error sending data:", error);
        }
    });
} 

function addMid(mids,mName){
	
	let str = '';
	str += `<ul class="category-ul flex flex-col border-solid border-jnGray-300">`;
	for(let i=0; i<mids.length; i++){
		const mid = mids[i];
		if(mName === mid.mg_title){
			str+=`<li class="false h-10 p-3 midGroup-li" style="background-color : #ced4da; ">
			      <button onClick="clickMid(this)">
			      <p class="truncate break-keep" style="font-weight : bold; color : black;">\${mid.mg_title }</p>
			      </button>
				  </li>`;
		}else{
			str+=`<li class="false h-10 p-3 midGroup-li">
			      <button onClick="clickMid(this)">
			      <p class="truncate break-keep" style="font-weight : normal; color : initial;">\${mid.mg_title }</p>
			      </button>
				  </li>`;
		}
	}
	str+=`</ul>`;
	 $("#midGroup").html(str);
}


function clickMid(button){
	 var buttons1 = document.querySelectorAll('#midGroup button');
	 buttons1.forEach(function(btn) {
     btn.classList.remove('selected');
     btn.querySelector('p').style.fontWeight = 'normal'; // 모든 버튼 스타일 초기화                
     btn.querySelector('p').style.color = 'initial';
     btn.closest('li').style.backgroundColor = ''; // 버튼 포함하는 li의 배경색을 기본으로 
     });
	 
	 button.classList.add('selected');
     button.querySelector('p').style.fontWeight = 'bold'; // 클릭한 버튼 스타일 변경          
     button.querySelector('p').style.color = 'black'; 	
     button.closest('li').style.backgroundColor = '#ced4da'; // 버튼 포함하는 li의 배경색을 회색으로
}

	const container = document.getElementById('price-update');
	const inputField = document.getElementById('price-input');
	
	inputField.addEventListener('focus', function() {
		container.style.outline = 'none';  /* 포커스 시 기본 아웃라인 제거 */
	    container.style.borderColor = '#007bff'; // 클릭했을 때 테두리 색상 변경
	    container.style.boxShadow = '0 0 0 3px rgba(0, 123, 255, 0.25)'; /* 포커스 시 그림자 효과 설정 */
	});
	
	inputField.addEventListener('blur', function() {
		container.style.outline = '';  /* 기본 아웃라인 복원 */
		container.style.borderColor = ''; // 테두리 색상 초기화
		container.style.boxShadow = ''; /* 그림자 효과 초기화 */
	});

	const freeButton = document.querySelector('.free-button');
	const freeIcon = freeButton.querySelector('svg');
	const suggestButton = document.querySelector('.suggest-button');
	const suggestIcon = suggestButton.querySelector('svg');
	const priceInput = document.getElementById("price-input");
	const won = document.getElementById("won");
	
	freeButton.addEventListener('click', function() {
		const freeValue = freeIcon.getAttribute('fill');
		if(freeValue === 'rgb(13, 204, 90)'){
			freeIcon.setAttribute('fill', '#FFFFFF'); // 아이콘의 색상을 기본으로 변경
			won.style.color=""; // 색 기본으로
			priceInput.style.color="";
			priceInput.value = ""; // 가격입력창 비우기
			priceInput.disabled= false;
		}else{
			freeIcon.setAttribute('fill', 'rgb(13, 204, 90)'); // 아이콘의 색상을 초록색으로 변경
			priceInput.value = "무료나눔"; // 가격입력창에 무료나눔이라고 뜨게 하기
			priceInput.disabled= true;
			priceInput.style.color = "green"; // 색은 초록색으로
			won.style.color="green"; // 마찬가지로 초록색으로
			suggestIcon.setAttribute('fill', '#FFFFFF'); // 아이콘의 색상을 기본으로 변경
		}    
	});
	
	suggestButton.addEventListener('click', function() {
		const suggestValue = suggestIcon.getAttribute('fill');
		if(suggestValue === 'rgb(13, 204, 90)'){
			suggestIcon.setAttribute('fill', '#FFFFFF'); // 아이콘의 색상을 기본으로 변경
			priceInput.value = ""; // 가격입력창 비우기
			won.style.color=""; // 색 기본으로
			priceInput.style.color="";
			priceInput.disabled= false;
		}else{
			suggestIcon.setAttribute('fill', 'rgb(13, 204, 90)'); // 아이콘의 색상을 초록색으로 변경
			priceInput.value = "가격제안"; // 가격입력창에 무료나눔이라고 뜨게 하기
			priceInput.style.color = "gray"; // 색은 회색으로
			won.style.color="gray"; // 마찬가지로 회색으로
			freeIcon.setAttribute('fill', '#FFFFFF'); // 아이콘의 색상을 기본으로 변경
			priceInput.disabled= true;
		}   
	});
	
	<!--가격 입력시 작용 -->
	priceInput.addEventListener('keyup', function(e) {
		  let value = e.target.value;
		  // 입력 값이 없으면 빈문자열로 설정
		  if (value === "" || value === null || isNaN(Number(value))) {
		    value = "";
		  } else {
		    value = Number(value.replaceAll(',', ''));
		  }
		  const formatValue = value.toLocaleString('ko-KR');
		  priceInput.value = formatValue; 
		});
	
	
	const textarea = document.getElementById('product-content');
	const span = document.getElementById('contentCount');
	
	textarea.addEventListener('input', function() {
        const charCount = textarea.value.length;
        span.textContent =  charCount;
    });
	
</script>
</body>
</html>