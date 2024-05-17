<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://cdn.iamport.kr/v1/iamport.js"></script>
<style type="text/css">
* {
	padding: 0;
	margin: 0;
	box-sizing: border-box;
}

#btnWrap {
	width: 500px;
	margin: 100px auto;
}

#modalWrap, #paymentList {
	position: fixed; /* 화면에 고정 */
	z-index: 1; /* 상위에 위치 */
	padding-top: 100px;
	left: 0;
	top: 0;
	width: 100%;
	height: 100%;
	overflow: auto;
	background-color: rgba(0, 0, 0, 0.7); /* 반투명한 배경색 */
	display: none; /* 초기에는 숨김 */
}

#modalBody {
	width: 500px;
	height: 500px;
	padding: 30px 30px;
	margin: 0 auto;
	border: 1px solid #777;
	background-color: #fff;
}

#closeBtn, #closeBtn2 {
	float: right;
	font-weight: bold;
	color: #777;
	font-size: 25px;
	cursor: pointer;
}

.close::before {
	content: "\00d7";
	font-size: 30pt;
}
.px-0 {
	padding-left: 0;
	padding-right: 0;
}

.max-w-\[1024px\] {
	max-width: 1024px;
}

*, :after, :before {
	box-sizing: border-box;
	border: 0 solid #f9f9f9;
}

div {
	display: block;
	unicode-bidi: isolate;
}

body, html {
	font-family: Pretendard Variable, sans-serif; -
	-tw-text-opacity: 1;
	color: rgb(90, 90, 90/ var( - -tw-text-opacity));
	-webkit-font-smoothing: antialiased;
	-moz-osx-font-smoothing: grayscale;
}

body {
	margin: 0;
	line-height: inherit;
}

li {
	list-style: none;
}
</style>
</head>
<body>
	<div
		class="mt-3 mx-auto box-content max-w-[1024px] min-[1600px]:max-w-[1280px] basis-[calc(100%-180px)] flex-grow px-0 md:px-0 2xl:px-0">
		<div class="block mt-8 lg:mt-[72px] mb-5 lg:mb-0">
			<div
				class="relative w-full h-full col-span-2 text-black grid grid-cols-1 gap-y-4 gap-x-0 lg:grid-cols-2 lg:gap-x-8 lg:gap-y-6 lg:min-w-[800px]">
				<div class="flex flex-col space-y-2 justify-start">
					<div class="flex items-center">
						<div>
							<h2>${myUser.me_id}</h2> 
							<c:if test="${user.me_id == myUserCheck}"> 
								<a href="<c:url value='/member/update'/>">회원정보수정</a>
								<a href="<c:url value='/'/>" id="memberDelete">회원탈퇴</a>
							</c:if>
						</div>
						<!-- 프로필 이미지 -->
						<div class="flex items-center translate-x-3 lg:hidden">
							<img alt="" src="">
						</div>
					</div>
				</div>
				<!-- 신뢰지수(온도) -->
				<span class="font-medium text-base">신뢰지수</span>
				<div class="progress mt-3">
					<div class="progress-bar" style="width:${myUser.me_manner}%">${myUser.me_manner}</div>
				</div>
				<div
					class="mt-3 relative flex justify-evenly border border-gray-300 rounded-lg py-4 lg:py-6">
					<table class="w-100">
						<thead>
							<tr style="width: auto">
								<td style="text-align: center;">안전거래</td>
								<td id="popupBtn1" style="text-align: center; cursor: pointer;">거래후기</td>
								<c:if test="${user.me_id == myUserCheck}">
									<td style="text-align: center;"><a href="<c:url value='/review/write'/>">후기작성</a></td>
								</c:if>
							</tr>
						</thead>
						<tbody>
							<tr>
								<!-- 거래횟수 -->
								<td style="text-align: center;">${tradeNum}</td>
								<!-- 거래후기개수 -->
								<td id="popupBtn2" style="text-align: center; cursor: pointer;">${reviewNum}</td>
								<!-- 작성 가능한 후기 개수 -->
								<c:if test="${user.me_id == myUserCheck}">
									<td style="text-align: center;"><a href="<c:url value='/review/write'/>">${tradeReviewNum}</a></td>
								</c:if>
							</tr>
						</tbody>
					</table>
				</div>
				<div>
					<c:if test="${user.me_id == myUserCheck}">
						<!-- 자신일 경우에만 보유 포인트를 조회할 수 있음 -->
						<p class="mt-3 w-25 float-left">보유중인 포인트 : ${user.me_point}</p>
						<div>
							<input type="text" placeholder="포인트 입력" name="point" id="point"
								style="border-color: red"
								oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" 
								value=0 />
							<a type="button" onclick="requestPayCheck()" class="w-25 ml-3 mt-3"
								style="text-decoration: none;">포인트 충전</a>
							<a type="button" id="paymentCheck" class="w-25 ml-3 mt-3" 
								style="text-decoration: none;">결제내역확인</a>
							
						</div>
					</c:if>
				</div>
			</div>
		</div>
		<!--$-->
		<div class="px-0 mt-8 lg:mt-[60px]">
			<div class="flex-col mb-4 lg:mb-5">
				<h3 class="text-lg font-bold md:text-[22px] text-jnBlack">내 상품</h3>
				<ul style="cursor: pointer;"
					class="list-group list-group-horizontal">
					<li id="all" class="list-group-item w-25 all" value="all">전체</li>
					<li id="sale" class="list-group-item w-25" value="sale">판매중</li>
					<li id="reservation" class="list-group-item w-25"
						value="reservation">예약중</li>
					<li id="saleCompleted" class="list-group-item w-25"
						value="saleCompleted">판매완료</li>
				</ul>
				<div class="mt-3">
					<p class="list-size"></p>
					<ul class="float-right" style="width: 30%">
						<li><button id="latest" class="float-left price-list-item">최신순</button></li>
						<li><button id="lowPrice" class="float-left price-list-item">낮은가격순</button></li>
						<li><button id="highPrice" class="float-left price-list-item">높은가격순</button></li>
					</ul>
				</div>
				<div class="mt-3">
					<!-- 내 판매글 출력 -->
					<table class="table table-hover">
						<thead>
							<tr>
								<th>번호</th>
								<th>대분류</th>
								<th>중분류</th>
								<th>제목</th>
								<th>작성자</th>
								<th>찜수</th>
								<th>가격</th>
								<th>거래 희망 장소</th>
								<th>작성일</th>
								<th>조회수</th>
								<th>판매상태</th>
							</tr>
						</thead>
						<tbody class="addPro">
							<tr>
								<td>${pro.pr_num }</td>
								<td>${pro.tg_title }</td>
								<td>${pro.mg_title }</td>
								<td>
								<a href="<c:url value="/post/detail?pNum=${pro.pr_num }"/>">${pro.pr_name}</a>
								</td>
								<td>${pro.pr_me_id }</td>
								<td>${pro.pr_basket }</td>
								<td>${pro.pr_price }</td>
								<td>${pro.pr_place }</td>
								<td>${pro.pr_date }</td>
								<td>${pro.pr_view }</td>
								<td>${pro.pr_ps_state }</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</div>
		<div id="modalWrap">
			<!-- 모달 창을 감싸는 div -->
			<div id="modalBody">
				<!-- 모달을 닫는 X 버튼 -->
				<span id="closeBtn">&times;</span>
				<!-- 모달 창 내용 -->
				<fieldset>
					<legend>이런점이 좋았어요</legend>
					<table class="table table-hover">
						<thead>
							<tr>
								<th class="w-75">받은 후기</th>
								<th class="w-25">개수</th>
							</tr>
						</thead>
						<tbody class="addPro1">
						<c:forEach items="${reviewList}" var="reviewList">	
							<tr>
								<td>${reviewList.rt_type}</td>
								<td>${reviewList.count}</td>
							</tr>
						</c:forEach>
						</tbody>
					</table>
				</fieldset>
			</div>
		</div>
		
		<div id="paymentList">
			<!-- payment 모달창 -->
			<div id="modalBody">
				<!-- 모달을 닫는 X 버튼 -->
				<span id="closeBtn2">&times;</span>
				<!-- 모달 창 내용 -->
				<fieldset>
					<legend>결제내역</legend>
					<table class="table table-hover">
						<thead>
							<tr>
								<th class="w-50">결제일</th>
								<th class="w-25">결제금액</th>
								<th class="w-25">환불</th>
							</tr>
						</thead>
						<tbody class="addPro1">
						<c:forEach items="${paymentList}" var="paymentList">	
							<tr style="font-size: 15px;">
								<td>${paymentList.pd_date}</td>
								<td>${paymentList.pd_price}</td>
								<td><span id="refund" style="font-size:30px; cursor:pointer;"><input id="pd_num" type="hidden" value="${paymentList.pd_num}">
																							  <input id="pd_price" type="hidden" value="${paymentList.pd_price}">&times;</span></td>
							</tr>
						</c:forEach>
						</tbody>
					</table>
				</fieldset>
			</div>
		</div>
		
	</div>
	
	
	
	<script type="text/javascript">
		const modal = document.getElementById("modalWrap"); // 모달 창 요소 가져오기
		const paymentList = document.getElementById("paymentList");
		
		$("#popupBtn1, #popupBtn2").click(function() {
			modal.style.display = "block"; // 버튼을 클릭하면 모달을 보이게 함
		});

		$("#closeBtn").click(function() {
			modal.style.display = "none"; // 모달을 닫는 버튼(X)을 클릭하면 모달을 숨김
		});

		window.onclick = function(event) {
			if (event.target == modal || event.target == paymentList) {
				modal.style.display = "none"; // 모달 외부를 클릭하면 모달을 숨김
				paymentList.style.display = "none";
			}
		};

		
		
		$("#paymentCheck").click(function() {
			paymentList.style.display = "block";
		});
		
		$("#closeBtn2").click(function() {
			paymentList.style.display = "none"; // 모달을 닫는 버튼(X)을 클릭하면 모달을 숨김
		});
		
		$("#memberDelete").click(function() {
			if(confirm("탈퇴하시겠습니까?")){
				$.ajax({
					async : false,
					url : '<c:url value="/member/delete"/>', 
					type : 'get',
					dataType : "json",
					success : function (){
						
					}, 
					error : function(jqXHR, textStatus, errorThrown){
			
					}
				});
			}
		})
		$("#refund").click(function() {
			let pdNum = $("#pd_num").val();
			let pdPrice = $("#pd_price").val();
			let obj = {
				pdNum, pdPrice
			};
			$.ajax({
				async : false,
				url : '<c:url value="/payment/refund"/>', 
				type : 'post',
				dataType : "json",
				data : obj,
				success : function (res){
					if(res=="fail") {
						alert("이미 사용하신 포인트는 환불될 수 없습니다.");
					} else {
						
					}
				}, 
				error : function(jqXHR, textStatus, errorThrown){
					
				}
			});
		});
		
		
	</script>
	
	<!-- 결제 api 스크립트 -->
	<script type="text/javascript">
		var IMP = window.IMP;
	    IMP.init("imp45810541"); //포트원에서 발급받은 고유 값
	    var point;
		$('[name=point]').on('input',function(){
			point = $('[name=point]').val();
			if(point>5000) {
				alert("5000원이 넘는 금액은 입력할 수 없습니다.");
				$("#point").val(0);
				point = 0;
			}
		})
		
		function orderUidCreate(orderId) {
			var id = orderId;
			let num;
			let obj = {
				id
			};
			$.ajax({
				async : false,
				url : '<c:url value="/member/createNum"/>', 
				type : 'post', 
				data : obj, 
				dataType : "json", 
				success : function (data){
					num = data.orderUID;
				}, 
				error : function(jqXHR, textStatus, errorThrown){

				}
			});
			return num;
		}
		
		function requestPayCheck() {
			if(point<=0 || point == null) {
        		alert("0원 이하의 금액은 입력할 수 없습니다.");
        	} else {
        		requestPay();
        	}
		}
		
        function requestPay() {
        	
            var orderUid = orderUidCreate("${user.me_id}"); //중복되지 않은 무작위 값 << 구매자 아이디 + 무작위 값으로 + db에 저장해두고 무작위 값 만들때마다 확인
            var itemName = "포인트 충전"; // 결제 수단은 포인트 충전 외에 없음
            var paymentPrice = point; //가격 <-- 사고 방지를 위해 최대 5000으로
            var buyerName = '${user.me_name}'; //구매자 이름
            var buyerEmail = '${user.me_email}'; //구매자 이메일
            var buyerAddress = '${user.me_addr}'; //구매자 주소
            var userId = '${user.me_id}';
            var userPhone = '${user.me_phone}';
            var now = new Date();
            let obj = {
            	orderUid,
            	userId,
            	itemName,
            	paymentPrice,
            	buyerName,
            	buyerEmail,
            	buyerAddress,
            	userPhone,
            	now
            }
            
            IMP.request_pay({
                    pg : 'html5_inicis.INIpayTest',
                    pay_method : 'card',
                    merchant_uid: orderUid, // 주문 번호
                    name : itemName, // 상품 이름
                    amount : paymentPrice, // 상품 가격
                    buyer_email : buyerEmail, // 구매자 이메일
                    buyer_name : buyerName, // 구매자 이름
                    buyer_tel : userPhone, // 임의의 값
                    buyer_addr : buyerAddress, // 구매자 주소
                    buyer_postcode : '123-456', // 임의의 값
                },
                function(rsp) {
                    if (/*rsp.success*/true) { //테스트시에는 결제 취소되도 성공으로 처리되게
                        alert('결제 성공! : ' + JSON.stringify(rsp));
                        // 결제 성공 시: 결제 승인 또는 가상계좌 발급에 성공한 경우
                        // jQuery로 HTTP 요청
                        $.ajax({
                			async : false,
                			url : '<c:url value="/member/payment"/>', 
                			type : 'POST',
                			data : obj,
                			dataType : "json",
                			success : function (data){
                				alert("결제 성공");
                			}, 
                			error : function(jqXHR, textStatus, errorThrown){
                	
                			}
                		});
                    } else {
                        alert("success? "+ rsp.success+ ", 결제에 실패하였습니다. 에러 내용: " + JSON.stringify(rsp));
                    }
                });
        }    
    </script>


</body>
<script type="text/javascript">
	$(function(){
		$("#all").click();
		$("#latest").click();
	});

	$(".list-group-item").click(function() {
		$(".list-group-item").removeClass("bg-info");
		
	})
	
	$("#all").click(function() {
		$("#all").addClass("bg-info");
		clickAll("all");
	})
	
	$("#sale").click(function() {
		$("#sale").addClass("bg-info");
		clickAll("sale");
	})
	
	$("#reservation").click(function() {
		$("#reservation").addClass("bg-info");
		clickAll("reservation");
	})
	
	$("#saleCompleted").click(function() {
		$("#saleCompleted").addClass("bg-info");
		clickAll("saleCompleted");
	})
	
	/*----------------------------------------------*/
	
	$(".price-list-item").click(function(){
		$(".price-list-item").removeClass("bg-info");
	})
	
	$("#latest").click(function(){
		$("#latest").addClass("bg-info");
		clickType("latest");
		
	})
	
	$("#lowPrice").click(function(){
		$("#lowPrice").addClass("bg-info");
		clickType("lowPrice");
		
	})
	
	$("#highPrice").click(function(){
		$("#highPrice").addClass("bg-info");
		clickType("highPrice");
	})

	function clickAll(str1) {
		let str2;
		let userId;
		if($("#latest").hasClass("bg-info") === true) {
			str2 = "latest";
		} else if ($("#lowPrice").hasClass("bg-info") === true) {
			str2 = "lowPrice";
		} else {
			str2 = "highPrice";
		}
		
		let clickData;
		let type;
		let obj = { 
			clickData : str1,
			type : str2,
			userId : '${myUser.me_id}'
		};
		$.ajax({
			async : false,
			url : '<c:url value="/member/mypage/all"/>', 
			type : 'get',
			data : obj,
			dataType : "json",
			success : function (data){
				addMethod(data.list);
			}, 
			error : function(jqXHR, textStatus, errorThrown){
	
			}
		});
		return clickData;
	}
	
	function clickType(str2) {
		let str1;
		let userId;
		if($("#all").hasClass("bg-info") === true) {
			str1 = "all";
		} else if ($("#sale").hasClass("bg-info") === true) {
			str1 = "sale";
		} else if ($("#reservation").hasClass("bg-info") === true) {
			str1 = "reservation";
		} else {
			str1 = "saleCompleted";
		}
		
		let clickData;
		let type;
		
		let obj = { 
			clickData : str1,
			type : str2,
			userId : '${myUser.me_id}'
		};
		
		$.ajax({
			async : false,
			url : '<c:url value="/member/mypage/all"/>', 
			type : 'get',
			data : obj,
			dataType : "json",
			success : function (data){
				addMethod(data.list);
			}, 
			error : function(jqXHR, textStatus, errorThrown){
	
			}
		});
		return clickData;
	}

function addMethod(list) {
	addListSize(list);
	let str='';
	for(item of list) {
		str += 
			`
			<tr>
				<td>\${item.pr_num }</td>
				<td>\${item.tg_title }</td>
				<td>\${item.mg_title }</td>
				<td>
					<a href="<c:url value="/product/detail?pNum= \${item.pr_num} "/>"> \${item.pr_name} </a>
				</td>
				<td>\${item.pr_me_id }</td>
				<td>\${item.pr_basket }</td>
				<td>\${item.pr_price }</td>
				<td>\${item.pr_place }</td>
				<td>\${item.pr_date2 }</td>
				<td>\${item.pr_view }</td>
				<td>\${item.pr_ps_state }</td>	
			</tr>
			`
	}
	$(".addPro").html(str);
}

function addListSize(list) {
	$(".list-size").empty();
	let str = "";
	if(list.length<=0) {
		str += "총 0개";
	} else {
		str += `총 \${list[0].listSize}개`;	
	}
	$(".list-size").html(str);
}

</script>
</html>