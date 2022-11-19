<%@ page contentType="text/html; charset=utf-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>          
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결제페이지</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/order.css">
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<!-- 다음주소 -->
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script> 
</head>
<body class="d-flex flex-column min-vh-100">
<%@ include file="../../../header.jsp"%>
<script type="text/javascript">
function checkOnlyOne(element) {
	  
	  const checkboxes 
	      = document.getElementsByName("m_default");
	  
	  checkboxes.forEach((cb) => {
	    cb.checked = false;
	  })
	  
	  element.checked = true;
	}</script>
<div class="wrapper">
	<div class="wrap">
		<div class="content_area">
			<div class="content_subject"><span>결제하기</span></div>
			<div class="content_main">
				<!-- 회원 정보 -->
				<div class="member_info_div">
					<table class="table_text_align_center memberInfo_table">
						<tbody>
							<tr>
								<th style="width: 25%;">주문자</th>
								<td style="width: *">${userName}</td>
							</tr>
						</tbody>
					</table>
				</div>					
				<!-- 배송지 정보 -->
					<div class="addressInfo_div">
						<div class="addressInfo_button_div">
								<c:if test = "${defaultadd ne null}">
								<button class="address_btn address_btn_1"
								onclick="showAdress('1')" style="background-color: #3c3838;">기본
								배송지</button>
								</c:if>
								<c:if test = "${anotheradd ne null}">
								<button class="address_btn address_btn_2"
								onclick="showAdress('2')">저장된
								배송지</button>
								</c:if>
							<button class="address_btn address_btn_3"
								onclick="showAdress('3')">직접 입력</button>
						</div>
					
						<div class="addressInfo_input_div_wrap">
						<c:if test = "${defaultadd ne null}">
							<div class="addressInfo_input_div addressInfo_input_div_1"
								style="display: block">
								<table>
									<colgroup>
										<col width="25%">
										<col width="*">
									</colgroup>
									<tbody>
										<tr>
											<th>이름</th>
											<td>${defaultadd.m_name}</td>
										</tr>
										<tr>
											<th>주소</th>
											<td>${defaultadd.m_address}
												<input class="selectAddress" name="add" value="T"
												type="hidden"> <input class="addressee_input"
												name="add" value="${defaultadd.m_name}" type="hidden"> 
												<input
												class="m_add" name="m_add" type="hidden"
												value="${defaultadd.m_address}"> 
												<input
												class="m_phone" name="m_phone" type="hidden"
												value="${defaultadd.m_phone}"> 
												<input
												class="address1_input" name="m_address_1" type="hidden"
												value="${add.m_address_1}"> <input
												class="address2_input" name="m_address_2" type="hidden"
												value="${add.m_address_2}"> <input
												class="address3_input" name="m_address_3" type="hidden"
												value="${add.m_address_3}">
											</td>
										</tr>
										<tr>
										<th>전화번호</th>
										<td>${defaultadd.m_phone}</td>
										</tr>
									</tbody>
								</table>
							</div>
							</c:if>
							<div class="addressInfo_input_div_wrap">
							<c:choose>
							<c:when test="${anotheradd ne null}">
							<div class="addressInfo_input_div addressInfo_input_div_2">
								<table>
									<colgroup>
										<col width="25%">
										<col width="*">
									</colgroup>
									<tbody>
										<tr>
											<th>이름</th>
											<td>${anotheradd.m_name}</td>
										</tr>
										<tr>
											<th>주소</th>
											<td>${anotheradd.m_address}
												<input class="selectAddress" name="add" value="T"
												type="hidden"> <input class="addressee_input"
												name="add" value="${anotheradd.m_name}" type="hidden">
												 <input
												class="m_add" name="m_add" type="hidden"
												value="${anotheradd.m_address}">	
												 <input
												class="m_phone" name="m_phone" type="hidden"
												value="${anotheradd.m_phone}">							
												 <input
												class="address1_input" name="m_address_1" type="hidden"
												value="${add.m_address_1}"> <input
												class="address2_input" name="m_address_2" type="hidden"
												value="${add.m_address_2}"> <input
												class="address3_input" name="m_address_3" type="hidden"
												value="${add.m_address_3}">
											</td>
										</tr>
										<tr>
										<th>전화번호</th>
										<td>${anotheradd.m_phone}</td>
										</tr>
									</tbody>
								</table>
							</div>
							</c:when>
							<c:otherwise>
								<div class="addressInfo_input_div addressInfo_input_div_2">
								<a>없음</a>
								</div>
							</c:otherwise>
							</c:choose>
							<div class="addressInfo_input_div addressInfo_input_div_3">
								<form id = "addform" name = "addform" action = "m_add.wp">
									<table>
										<colgroup>
										<col id = "ordername" />
										<col id = "orderstatus"/>
										<col id = "orderprice" />
										</colgroup>
										<tbody>
											<tr>
												<th>이름</th>
												<td><input class="m_name_insert" name = "m_name"></td>
											</tr>
											<tr>
												<th>주소</th>
												<td><input class="selectAddress" value="F"
													type="hidden"> 
													<input class="m_address" name="m_address" value="" type="hidden">
													<input class="address1_input" readonly="readonly"> 
													<a class="address_search_btn" onclick="execution_daum_address()">주소 찾기</a><br> <input
													class="address2_input" readonly="readonly"><br>
													<input class="address3_input" readonly="readonly">
													</td>		
											</tr>
											<tr>
											<th>전화번호</th>
												<td><input class = "m_phone_insert" name = "m_phone"></td>
												
											</tr>
											<tr>
											<td id= "btncheck"><label><input type="checkbox" class = "m_default" name="m_default" onclick="checkOnlyOne(this)" value="0" checked="checked">기본배송지등록</label>
													<label><input type="checkbox" class = "m_default" name="m_default" onclick="checkOnlyOne(this)" value="1" >일반배송지등록</label>
													<button id = "insertadd" class="btn btn-secondary" type = "button">입력 완료</button></td>
											</tr>
										</tbody>
									</table>
								</form>
								<script type="text/javascript">
								
								$('#insertadd').on('click', function() {
						
									var add1 = $('.address1_input').val();
									var add2 = $('.address2_input').val();
									var add3 = $('.address3_input').val();
									var address = add1+"-"+add2+add3;
								
									let chekObj = document.getElementsByClassName("m_default");
									let lenth = chekObj.length;
									 let checked = 0;
									 
									 for (i = 0; i < lenth; i++) {
										    if (chekObj[i].checked === true) {
										      checked += 1;
										      checkboxTest = chekObj[i].getAttribute("value");
										    }
										  }
									 
									$('.m_address').val(address);
									
									var regPhone = /^01([0|1|6|7|8|9])-?([0-9]{3,4})-?([0-9]{4})$/
											
									if($('.m_name_insert').val() == ''){
										swal({
									      	  title: "이름을 입력해주세요.",
									      	  text: "",
									      	  icon: "error",
									      	  button: "닫기",
									      	});
										return false;
									}
									if($('.address1_input').val() == ''){
										swal({
									      	  title: "주소를 입력해주세요.",
									      	  text: "",
									      	  icon: "error",
									      	  button: "닫기",
									      	});
										return false;
									}
									if($('.address2_input').val() == ''){
										swal({
									      	  title: "주소를 입력해주세요.",
									      	  text: "",
									      	  icon: "error",
									      	  button: "닫기",
									      	});
										return false;
									}
									if($('.m_phone_insert').val() == ''){
										swal({
									      	  title: "휴대폰번호를 입력해주세요.",
									      	  text: "",
									      	  icon: "error",
									      	  button: "닫기",
									      	});
										return false;
									}
									if(!regPhone.test($('.m_phone_insert').val())){
										console.log($('.m_phone_insert').val());
										swal({
									      	  title: "휴대폰번호를 다시 입력해주세요.",
									      	  text: "",
									      	  icon: "error",
									      	  button: "닫기",
									      	});
										return false;
									}
									
									  $.ajax({
								            async: true,
								            type : 'POST',
								            url : "m_add.wp",
								            dataType : "json",
								            data : {
								            	m_name : $('.m_name_insert').val(),
								            	m_address : address,								            
								            	m_phone   :  $('.m_phone_insert').val(),
								            	m_default : checkboxTest
								            },
								            success : function(data) {
								            	history.go(0);
								            },
								            error : function(error) {
								            	swal({
											      	  title: "다시 진행해주세요.",
											      	  text: "",
											      	  icon: "error",
											      	  button: "닫기",
											      	});
								            }
								        });
									

// 									document.addform.submit();
									
								})
								</script>
							</div>
						</div>
					</div>
					
					<!-- 상품 정보 -->
				<div class="orderGoods_div">
					<!-- 상품 종류 -->
					<div class="goods_kind_div">
						주문상품 <span class="goods_kind_div_kind"></span>종 <span class="goods_kind_div_count"></span>개
					</div>
					<!-- 상품 테이블 -->
					<table class="goods_subject_table">
						<colgroup>
							<col width="15%">
							<col id = "nametable">
							<col width="13%">
							<col width="13%">
							<col width="13%">
						</colgroup>
						<tbody>
							<tr>
								<th></th>
								<th>상품 정보</th>
								<th>판매가</th>
								<th>갯수</th>
								<th>총 금액</th>
							</tr>
						</tbody>
					</table>
					<table class="goods_table">
						<colgroup>
							<col width="15%">
							<col id = "nametable">
							<col width="13%">
							<col width="13%">
							<col width="13%">
						</colgroup>					
						<tbody>
							<c:forEach items="${product}" var="ol">
								<tr>
									<td>

									</td>
									<td>${ol.w_nm_k}</td>
									<td class="goods_table_price_td">
										<fmt:formatNumber value="${ol.w_price}" pattern="#,### 원" />  
										
										<input type="hidden" class="individual_bookPrice_input" value="${ol.w_price}">
										<input type="hidden" class="individual_bookCount_input" value="${ol.ord_quan}">
										<input type="hidden" class="individual_totalPrice_input" value="${ol.w_price * ol.ord_quan}">
									
										<input type="hidden" class="individual_bookId_input" value="${ol.w_no}">
										<input type="hidden" name = "w_no" class="w_no" value="${ol.w_no}">
									</td>
									<td>수량 ${ol.ord_quan}개</td>
									<td><fmt:formatNumber value="${ol.w_price*ol.ord_quan}" pattern="#,### 원" /></td>
								</tr>							
								
								
							</c:forEach>

						</tbody>
					</table>
				</div>		
			
				<!-- 주문 종합 정보 -->
				<div class="total_info_div">
					<!-- 가격 종합 정보 -->
					<div class="total_info_price_div">
						<ul>
							<li>
								<span class="price_span_label">상품 금액</span>
								<span class="totalPrice_span">100000</span>원
							</li>
							<li>
								<span class="price_span_label">배송비</span>
<!-- 								<span class="delivery_price_span">   -->
                              <c:choose>
                              <c:when test="${level.level == 0}">
                               <span class="delivery_price_span">2500</span>원	
                              </c:when>
                              <c:otherwise>
                               <span class=delivery_price_span>0</span>원
                              </c:otherwise>
                              </c:choose>
<!--                             </span>원 -->
							</li>
																				
							<li class="price_total_li">
								<strong class="price_span_label total_price_label">최종 결제 금액</strong>
								<strong class="strong_red">
									<span class="total_price_red finalTotalPrice_span">
										1500000
									</span>원
								</strong>
							</li>
							
						</ul>
					</div>
					<!-- 버튼 영역 -->
					<div class="total_info_btn_div">
						<button id="check_module" class = "btn-hover color-9"type="button">결제하기</button>
					</div>
				</div>				
				
			</div>			

			<!-- 주문 요청 form -->
			<form class="order_form" action="/order" method="post">
				<!-- 주문자 회원번호 -->
				<input name="memberId" value="${memberInfo.memberId}" type="hidden">
				<!-- 주소록 & 받는이-->
				<input name="addressee" type="hidden">
				<input name="memberAddr1" type="hidden">
				<input name="memberAddr2" type="hidden">
				<input name="memberAddr3" type="hidden">
				
				<!-- 상품 정보 -->
			</form>
			
		</div>	
	</div>	<!-- class="wrap" -->
</div>	<!-- class="wrapper" -->
</div>
<form name="fm">
<c:forEach items="${product}" var="ol">
<input name='ord_cart_noList' type='hidden' value='${ol.ord_cart_no}'>
<input name='w_nm_k_List' type='hidden' value='${ol.w_nm_k}'>
<input name='w_nm_k' type='hidden' value='${ol.w_nm_k}'>
<input name='w_nm_e_List' type='hidden' value='${ol.w_nm_e}'>
<input name='w_nm_e' type='hidden' value='${ol.w_nm_e}'>
<input name='w_noList' type='hidden' value='${ol.w_no}'>
</c:forEach>
	<input type="hidden" name="unm" id="unm" value = "${user.m_name}" ><br>
    <input type="hidden" name="amount" id="amount"><br>	
    <input type="hidden" name="imp_uid" id="imp_uid"><br>
    <input type="hidden" name="merchant_uid" id="merchant_uid"><br>
    <input type="hidden" name="ord_addr" id="ord_addr"><br>
    <input type="hidden" name="ord_phone" id="ord_phone"><br>
    <input type="hidden" name="ord_name" id="ord_name"><br>
</form>
<%@ include file="/footer.jsp"%>

<script type="text/javascript">


var chk = false;
$(document).ready(function(){
	var IMP = window.IMP; // 생략가능
	IMP.init('imp86310263');
	let totalPrice = 0;				// 총 가격
	let totalCount = 0;				// 총 갯수
	let totalKind = 0;				// 총 종류
	let deliveryPrice = 0;	// 배송비
	let finalTotalPrice = 0; 		// 최종 가격(총 가격 + 배송비)	
	

	// 총 가격
	$(".totalPrice_span").text(totalPrice.toLocaleString());
	// 총 갯수
	$(".totalCount_span").text(totalCount);
	// 배송비
	$(".delivery_price_span").text(deliveryPrice);	
	// 최종 가격(총 가격 + 배송비)
	$(".finalTotalPrice_span").text(finalTotalPrice.toLocaleString());		
	
	$(".goods_table_price_td").each(function(index, element){
		// 총 가격
		totalPrice += deliveryPrice;
		totalPrice += parseInt($(element).find(".individual_totalPrice_input").val());
		
		// 총 갯수
		totalCount += parseInt($(element).find(".individual_bookCount_input").val());
		// 총 종류
		totalKind += 1;  

		// 총합
		finalTotalPrice = totalPrice;
		finalTotalPrice += parseInt($(element).find(".finalTotalPrice_span").val());		
		
	});	

	/* 배송비 결정 */
// 	if(totalPrice >= 30000){
// 		deliveryPrice = 0;
// 	} else if(totalPrice == 0){
// 		deliveryPrice = 0;
// 	} else {
// 		deliveryPrice = 3000;	
// 	}
	
	finalTotalPrice = totalPrice + deliveryPrice;	
	finalTotalPrice = totalPrice;
	
$("#check_module").click(function () {
	var m_address;
	var postcode;
	var phone;
	var name;
	
	let deliveryPrice = 0;
	var level = "${level.level}";
	if(level == 0){
		deliveryPrice = 2500;
	} else {
		deliveryPrice = 0;	
	}
	finalTotalPrice += deliveryPrice;
	
	$('#amount').val(finalTotalPrice);
	
	$(".addressInfo_input_div").each(function(i, obj){
		if($(obj).find(".selectAddress").val() == 'T'){
			m_address = $(obj).find(".m_add").val();
			postcode =  m_address.split('-');
			phone = $(obj).find(".m_phone").val();
			name = $(obj).find(".addressee_input").val();
			$('#ord_addr').val(m_address);
			$('#ord_phone').val(phone);
			$('#ord_name').val(name);
// 			m_address = $('.m_add').val();
// 			postcode = $('.address1_input').val();
		}
	});	
	if(m_address == undefined){
	   	swal({
      	  title: "등록된 주소가 없습니다.",
      	  text: "",
      	  icon: "error",
      	  button: "닫기",
      	});
		return false;
	}
	var formValues = $("form[name=fm]").serialize() ;
	IMP.request_pay({
		pg: 'html5_inicis', // 자신이 설정한 pg사 설정
		pay_method: 'card',
		merchant_uid: 'merchant_' + new Date().getTime(),
		name: '주문명:결제테스트',
		amount: finalTotalPrice,
		buyer_email: '${user.m_email}',
		buyer_name: '${user.m_name}',
		buyer_tel: phone,
		buyer_addr: m_address,
		buyer_postcode: postcode[0],
		m_redirect_url: "http://winerycop.tk/mobilepay.wp?formValues="+formValues
		}, function (rsp) {
			if (rsp.success) {
				
				var msg = '결제가 완료되었습니다.';
				
				var icon = 'success';
				
				$("#imp_uid").val(rsp.imp_uid);
				$("#merchant_uid").val(rsp.merchant_uid);
				chk = true;
			} else {
				var msg = '결제에 실패하였습니다.';
				var icon = 'error';
			}
			swal({
		      	  title: msg,
		      	  text: "",
		      	  icon: icon,
		      	  button: "닫기",
		      	});
			if(chk==true) orderList();
	})
})

function orderList(){
	let fm = document.fm;
	fm.action ="pay.wp";
	fm.method="post";
	fm.submit();
}


});
</script>
<script>

$(document).ready(function(){
	
	var defaultadd = '${defaultadd}'; 	
	var anotheradd = '${anotheradd}';
	 if(defaultadd == '[]'){
	}else{
	}
	 if(anotheradd == '[]'){
	}else{
		
	}
	 
	
	/* 주문 조합정보란 최신화 */
	setTotalInfo();
	
	/* 이미지 삽입 */
	$(".image_wrap").each(function(i, obj){
		
		const bobj = $(obj);
		
		if(bobj.data("bookid")){
			const uploadPath = bobj.data("path");
			const uuid = bobj.data("uuid");
			const fileName = bobj.data("filename");
			
			const fileCallPath = encodeURIComponent(uploadPath + "/s_" + uuid + "_" + fileName);
			
			$(this).find("img").attr('src', '/display?fileName=' + fileCallPath);
		} else {
			$(this).find("img").attr('src', '/resources/img/goodsNoImage.png');
		}
		
	});		
	
	
});


/* 주소입력란 버튼 동작(숨김, 등장) */
function showAdress(className){
	/* 컨텐츠 동작 */
		/* 모두 숨기기 */
		$(".addressInfo_input_div").css('display', 'none');
		/* 컨텐츠 보이기 */
		$(".addressInfo_input_div_" + className).css('display', 'block');		
	
	/* 버튼 색상 변경 */
		/* 모든 색상 동일 */
			$(".address_btn").css('backgroundColor', '#555');
		/* 지정 색상 변경 */
			$(".address_btn_"+className).css('backgroundColor', '#3c3838');	
	/* selectAddress T/F */
		/* 모든 selectAddress F만들기 */
			$(".addressInfo_input_div").each(function(i, obj){
				$(obj).find(".selectAddress").val("F");
			});
		/* 선택한 selectAdress T만들기 */
			$(".addressInfo_input_div_" + className).find(".selectAddress").val("T");		
		
}

/* 다음 주소 연동 */
function execution_daum_address(){
 		console.log("동작");
	   new daum.Postcode({
	        oncomplete: function(data) {
	            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.
	            
	        	// 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수
 
                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }
 
                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                 	// 추가해야할 코드
                    // 주소변수 문자열과 참고항목 문자열 합치기
                      addr += extraAddr;
                
                } else {
                	addr += ' ';
                }
 
             	// 제거해야할 코드
                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                $(".address1_input").val(data.zonecode);
                $(".address2_input").val(addr);				
                // 커서를 상세주소 필드로 이동한다.
                $(".address3_input").attr("readonly", false);
                $(".address3_input").focus();	 
	            
	            
	        }
	    }).open();  	
	
}






/* 총 주문 정보 세팅(배송비, 총 가격, 마일리지, 물품 수, 종류) */
function setTotalInfo(){
	
			
	let totalPrice = 0;				// 총 가격
	let totalCount = 0;				// 총 갯수
	let totalKind = 0;				// 총 종류
	let finalTotalPrice = 0; 		// 최종 가격(총 가격 + 배송비)	
	let deliveryPrice = 0;
	var level = "${level.level}";
	if(level == 0){
		deliveryPrice = 2500;
	} else {
		deliveryPrice = 0;	
	}
	$(".goods_table_price_td").each(function(index, element){
		// 총 가격
		deliveryPrice;
		totalPrice ;
		totalPrice += parseInt($(element).find(".individual_totalPrice_input").val());
		// 총 갯수
		totalCount += parseInt($(element).find(".individual_bookCount_input").val());
		// 총 종류
		totalKind += 1; 	
		
		finalTotalPrice = totalPrice + deliveryPrice;
		console.log(deliveryPrice +"배송비");console.log(finalTotalPrice +"최종 가격");
	});	

	
	

	
	/* 값 삽입 */
	// 총 가격
	$(".totalPrice_span").text(totalPrice.toLocaleString());
	// 총 갯수
	$(".goods_kind_div_count").text(totalCount);
	// 총 종류
	$(".goods_kind_div_kind").text(totalKind);
	// 배송비
	$(".delivery_price_span").text(deliveryPrice.toLocaleString());	
	// 최종 가격(총 가격 + 배송비)
	$(".finalTotalPrice_span").text(finalTotalPrice.toLocaleString());		

	
}

/* 주문 요청 */
$(".order_btn").on("click", function(){

	/* 주소 정보 & 받는이*/
	$(".addressInfo_input_div").each(function(i, obj){
		if($(obj).find(".selectAddress").val() === 'T'){
			$("input[name='addressee']").val($(obj).find(".addressee_input").val());
			$("input[name='memberAddr1']").val($(obj).find(".address1_input").val());
			$("input[name='memberAddr2']").val($(obj).find(".address2_input").val());
			$("input[name='memberAddr3']").val($(obj).find(".address3_input").val());
		}
	});	
	
	
	
	/* 상품정보 */
	let form_contents = ''; 
	$(".goods_table_price_td").each(function(index, element){
		let bookId = $(element).find(".individual_bookId_input").val();
		let bookCount = $(element).find(".individual_bookCount_input").val();
		let bookId_input = "<input name='orders[" + index + "].bookId' type='hidden' value='" + bookId + "'>";
		form_contents += bookId_input;
		let bookCount_input = "<input name='orders[" + index + "].bookCount' type='hidden' value='" + bookCount + "'>";
		form_contents += bookCount_input;
	});	
	$(".order_form").append(form_contents);	
	
	/* 서버 전송 */
	$(".order_form").submit();	
	
});	


</script>
	<script type="text/javascript">
	

						console.log('${anotheradd}');
						if('${defaultadd}' != ''){
							$('.addressInfo_input_div_1').show();
							$('.address_btn_1').css("background-color", "#3c3838");
						}else{
							if('${anotheradd}' != ''){
								$('.addressInfo_input_div_2').show();
								$('.address_btn_2').css("background-color", "#3c3838");
							}else{
								$('.addressInfo_input_div_3').show();	
								$('.address_btn_3').css("background-color", "#3c3838");
							}
						}
</script>
						
<%    
response.setHeader("Cache-Control","no-store");    
response.setHeader("Pragma","no-cache");    
response.setDateHeader("Expires",0);    
if (request.getProtocol().equals("HTTP/1.1"))  
        response.setHeader("Cache-Control", "no-cache");  
%>
</body>
</html>