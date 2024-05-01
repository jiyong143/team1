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
    position: absolute;
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
    width: 60%; /* 너비를 부모 요소에 맞게 설정 */
    border: 1px solid #ccc; /* 테두리 설정 */
    border-radius: 0.25rem; /* 둥근 모서리 설정 */
    font-size: 14px; /* 폰트 크기 설정 */
    color: #333; /* 폰트 색상 설정 */
    transition: border-color 0.2s ease-in-out; /* 테두리 색상 전환 효과 설정 */
    
}

#productTitle:focus {
    outline: none; /* 포커스 시 기본 아웃라인 제거 */
    border-color: #007bff; /* 포커스 시 테두리 색상 변경 */
    box-shadow: 0 0 0 3px rgba(0, 123, 255, 0.25); /* 포커스 시 그림자 효과 설정 */
}

 img {
  border-radius: 8px; /* 이미지 테두리의 둥글기를 설정합니다. */
}

.image-picker{
  margin-top : 15px;
}

.jiyong{
position : relative;
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

</script>
</body>
</html>