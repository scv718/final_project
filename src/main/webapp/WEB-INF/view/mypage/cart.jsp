<%@ page contentType="text/html; charset=utf-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
        
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>cart</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/cart.css">
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>
<body>
<%@ include file="../../../header.jsp"%>
<div class="wrapper">
	<div class="wrap">	
		<div class="content_area">
			
			<div class="content_subject"><span>장바구니</span></div>
			<!-- 장바구니 리스트 -->
			<div class="content_middle_section"></div>
			<!-- 장바구니 가격 합계 -->
			<!-- cartInfo -->
			<div class="content_totalCount_section">
				
				<!-- 체크박스 전체 여부 -->
				<div class="all_check_input_div">
					<input type="checkbox" class="all_check_input input_size_20" checked="checked"><span class="all_chcek_span">전체선택</span>
				</div>				
				
				<table class="subject_table">
					<caption>표 제목 부분</caption>
					<tbody>

						<tr>
							<th class="td_width_1"></th>
							<th class="td_width_2"></th>
							<th class="td_width_3">상품명</th>
							<th class="td_width_4">가격</th>
							<th class="td_width_4">수량</th>
							<th class="td_width_4">합계</th>
							<th class="td_width_4">삭제</th>
						</tr>
					</tbody>
				</table>
				<table class="cart_table">
					<caption>표 내용 부분</caption>
					<tbody>
						<c:forEach items="${cartInfo}" var="ci">
							<tr>
								<td class="td_width_1 cart_info_td">
									<input type="checkbox" class="individual_cart_checkbox input_size_20" checked="checked">
									<input type="hidden" name="ord_cart_no" value="${ci.ord_cart_no}">
						
									<input type="hidden" value="${ci.ord_quan}">
									<input type="hidden" value="${ci.w_price}">
									<input type="hidden" value="${ci.pay_stat}">
									<input type="hidden" value="${ci.ord_code}">
									<input type="hidden" value="${ci.w_nm_k}">
									<input type="hidden" value="${ci.w_nm_e}">	
									<input type="hidden" value="${ci.quantity}">							
								</td>
								<td class="td_width_2">
<%-- 									<div class="image_wrap" data-bookid="${ci.imageList[0].bookId}" data-path="${ci.imageList[0].uploadPath}" data-uuid="${ci.imageList[0].uuid}" data-filename="${ci.imageList[0].fileName}"> --%>
<!-- 										<img> -->
<!-- 									</div>								 -->
								</td>
								<td class="td_width_3">${ci.w_nm_k}(${ci.w_nm_e})</td>
								<td class="td_width_4 price_td">
									상품금액 : <fmt:formatNumber value="${ci.w_price}" pattern="#,### 원" /><br>
								</td>
								<td class="td_width_4 table_text_align_center">
								<form action="modifyCount.wp" method="post" class="quantity_modify_btn">
									<div class="table_text_align_center quantity_div">
									
									<input type="hidden" value="${ci.ord_quan}">
									<input type="hidden" value="${ci.quantity}">	
									
										<input type="text" value="${ci.ord_quan}" name = "ord_quan" class="quantity_input" maxlength ="${ci.quantity}">	
										<button type = "button" class="quantity_btn plus_btn">+</button>
								    	<button  type = "button"  class="quantity_btn minus_btn">-</button>
									</div>
<!-- 									<a href="/modifyCount.wp" class="quantity_modify_btn">변경</a> -->
									<input type="hidden" name = "id" value="${ci.id}">
									<input type="hidden" name = "w_no" value="${ci.w_no}">
									<input type="hidden" name="ord_cart_no" value="${ci.ord_cart_no}">
									<button type = "submit" class="quantity_modify_btn">변경</button>
									</form>
<!-- 										<button  class="quantity_btn minus_btn">-</button> -->
									
								</td>
								<td class="td_width_4 table_text_align_center">
									<fmt:formatNumber value="${ci.w_price * ci.ord_quan}" pattern="#,### 원" />
								</td>
								<td class="td_width_4 table_text_align_center">
								<form action="deleteCart.wp" method="post">
								<input type="hidden" name="ord_cart_no" value="${ci.ord_cart_no}">
									<button  type="submit" class="delete_btn">삭제</button>
									</form>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
			
			<!-- 가격 종합 -->
			<div class="content_total_section">
				<div class="total_wrap">
					<table>
						<tr>
							<td>
								<table>
									<tr>
										<td>총 상품 가격</td>
										<td>
<%-- 											<span class="totalPrice_span"><fmt:formatNumber value="${ci.w_price * ci.ord_quan}" pattern="#,### 원" /></span>  --%>
										</td>
									</tr>
									<tr>
										<td>배송비</td>
										<td>
											<span class="delivery_price"></span>원
										</td>
									</tr>									
									<tr>
										<td>총 주문 상품수</td>
<%-- 										<td><span class="totalKind_span"></span>와인 <span class="totalCount_span">#{ci.ord_quan}</span>병</td> --%>
									</tr>
								</table>
							</td>
							<td>
								<table>
									<tr>
										<td></td>
										<td></td>
									</tr>
								</table>							
							</td>
						</tr>
					</table>
					<div class="boundary_div">구분선</div>
					<table>
						<tr>
							<td>
								<table>
									<tbody>
										<tr>
											<td>
												<strong>총 결제 예상 금액</strong>
											</td>
											<td>
												<span class="finalTotalPrice_span"></span> 원
											</td>
										</tr>
									</tbody>
								</table>
							</td>
							<td>
								<table>
									<tbody>
										<tr>
											<td>
												<strong>총 적립 예상 마일리지</strong>
											
											</td>
											<td>
												<span class="totalPoint_span"></span> 원
											</td>
										</tr>
									</tbody>
								</table>
							</td>
						</tr>
					</table>
				</div>
			</div>
			<!-- 구매 버튼 영역 -->
			<div class="content_btn_section">
				<a href="../../../pay2.jsp" role="button" >주문하기</a>
			</div>
			
<!-- 			<!-- 수량 조정 form --> -->
<!-- 			<form action="modifyCount.wp" method="post" class="quantity_update_form"> -->
<!-- 				<input type="hidden" name="cartId" class="update_cartId"> -->
<!-- 				<input type="hidden" name="bookCount" class="update_bookCount"> -->
<%-- 				<input type="hidden" name="cartInfo" value="${ci.id}"> --%>
<!-- 			</form>	 -->
			
<!-- 			<!-- 삭제 form -->
<!-- 			<form action="deleteCart.wp" method="post" class="quantity_delete_form"> -->
<!-- 				<input type="hidden" name="cartId" class="update_cartId"> -->
<!-- 				<input type="hidden" name="W_no" class="update_cartId"> -->
<%-- 				<input type="hidden" name="cartInfo" value="${ci.id}"> --%>
<!-- 			</form>		 -->
			<!-- 주문 form -->
			<form action="addCart.wp"method="post" class="order_form"></form>				
		</div>	
		
		
	</div>	<!-- class="wrap" -->
</div>	<!-- class="wrapper" -->

<script>
$(document).ready(function(){
	
	/* 종합 정보 섹션 정보 삽입 */
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

/* 체크여부에따른 종합 정보 변화 */
$(".individual_cart_checkbox").on("change", function(){
	/* 총 주문 정보 세팅(배송비, 총 가격, 마일리지, 물품 수, 종류) */
	setTotalInfo($(".cart_info_td"));
});

/* 체크박스 전체 선택 */
$(".all_check_input").on("click", function(){

	/* 체크박스 체크/해제 */
	if($(".all_check_input").prop("checked")){
		$(".individual_cart_checkbox").attr("checked", true);
	} else{
		$(".individual_cart_checkbox").attr("checked", false);
	}
	
	/* 총 주문 정보 세팅(배송비, 총 가격, 마일리지, 물품 수, 종류) */
	setTotalInfo($(".cart_info_td"));	
	
});


/* 총 주문 정보 세팅(배송비, 총 가격, 마일리지, 물품 수, 종류) */
function setTotalInfo(){
	
// 	 var totalPrice = document.getElementById("ci.w_price * ci.ord_quan");
	 
// 	let totalPrice = document.getElementById("ci.w_price * ci.ord_quan");// 총 가격
	let totalCount = 0;				// 총 갯수
	let totalKind = 0;				// 총 종류
	let totalPoint = 0;				// 총 마일리지
	let deliveryPrice = 0;			// 배송비
	let finalTotalPrice = 0; 		// 최종 가격(총 가격 + 배송비)

	
	$(".cart_info_td").each(function(index, element){
		
		if($(element).find(".individual_cart_checkbox").is(":checked") === true){	//체크여부
			// 총 가격
			totalPrice += parseInt($(element).find(".individual_totalPrice_input").val());
			// 총 갯수
			totalCount += parseInt($(element).find(".individual_bookCount_input").val());
			// 총 종류
			totalKind += 1;
			// 총 마일리지
			totalPoint += parseInt($(element).find(".individual_totalPoint_input").val());			
		}

	});
	
	
	/* 배송비 결정 */
	if(totalPrice >= 2500){
		deliveryPrice = 0;
	} else if(totalPrice == 0){
		deliveryPrice = 0;
	} else {
		deliveryPrice = 3000;	
	}
	
		finalTotalPrice = totalPrice + deliveryPrice;
	
	/* ※ 세자리 컴마 Javscript Number 객체의 toLocaleString() */
	
	// 총 가격
	$(".totalPrice_span").text(totalPrice.toLocaleString());
	// 총 갯수
	$(".totalCount_span").text(totalCount);
	// 총 종류
	$(".totalKind_span").text(totalKind);
	// 총 마일리지
	$(".totalPoint_span").text(totalPoint.toLocaleString());
	// 배송비
	$(".delivery_price").text(deliveryPrice);	
	// 최종 가격(총 가격 + 배송비)
	$(".finalTotalPrice_span").text(finalTotalPrice.toLocaleString());		
}

/* 수량버튼 */
$(".plus_btn").on("click", function(){
	let quantity = $(this).parent("div").find("input").val();
	$(this).parent("div").find("input").val(++quantity);
});
$(".minus_btn").on("click", function(){
	let quantity = $(this).parent("div").find("input").val();
	if(quantity > 1){
		$(this).parent("div").find("input").val(--quantity);		
	}
});


/* 수량 수정 버튼 */
// $(".quantity_modify_btn").on("click", function(){
// 	let cartId = $(this).data("Cid");
// 	let bookCount = $(this).parent("td").find("input").val();
// 	$(".update_cartId").val("Cid");
// 	$(".quantity_update_form").submit();
	
// });

/* 장바구니 삭제 버튼 */
// $(".delete_btn").on("click", function(e){
// 	e.preventDefault();
// 	const cartId = $(this).data("Cid");
// 	$(".delete_cartId").val(Cid);
// 	$(".quantity_delete_form").submit();
// });
	
/* 주문 페이지 이동 */	
$(".order_btn").on("click", function(){
	
	let form_contents ='';
	let orderNumber = 0;
	
	$(".cart_info_td").each(function(index, element){
		
		if($(element).find(".individual_cart_checkbox").is(":checked") === true){	//체크여부
			
			let bookId = $(element).find(".individual_bookId_input").val();
			let bookCount = $(element).find(".individual_bookCount_input").val();
			
			let bookId_input = "<input name='orders[" + orderNumber + "].bookId' type='hidden' value='" + bookId + "'>";
			form_contents += bookId_input;
			
			let bookCount_input = "<input name='orders[" + orderNumber + "].bookCount' type='hidden' value='" + bookCount + "'>";
			form_contents += bookCount_input;
			
			orderNumber += 1;
			
		}
	});	

	$(".order_form").html(form_contents);
	$(".order_form").submit();
	
});
		

</script>
<%@ include file="/footer.jsp"%>
</body>
</html>