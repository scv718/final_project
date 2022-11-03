<%@ page contentType="text/html; charset=utf-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/productdetailpage.css">
<title>Insert title here</title>
  <%@ include file="../../../header.jsp"%>

</head>
<body class = "d-flex flex-column min-vh-100">
<script>
var chk = false;
$(document).ready(function(){
	var IMP = window.IMP; // 생략가능
	IMP.init('imp86310263');
	$("#check_module").click(function () {
		console.log(${product.w_price});
		IMP.request_pay({
			pg: 'html5_inicis', // 자신이 설정한 pg사 설정
			pay_method: 'card',
			merchant_uid: 'merchant_' + new Date().getTime(),
			name: '주문명:결제테스트',
			amount: ${product.w_price},
			buyer_email: ${user.m_email},
			buyer_name: ${user.m_name},
			buyer_tel: ${user.m_phone},
			buyer_addr: $("#uaddr").val(),
			buyer_postcode: '123-456',
			m_redirect_url: 'http://localhost:8090/payments/complete'
			}, function (rsp) {
				console.log(rsp);
				if (rsp.success) {
					var msg = '결제가 완료되었습니다.';
					msg += '\n고유ID : ' + rsp.imp_uid;
					msg += '\n상점 거래ID : ' + rsp.merchant_uid;
					msg += '\n결제 금액 : ' + rsp.paid_amount;
					msg += '\n카드 승인번호 : ' + rsp.apply_num;
					
					$("#imp_uid").val(rsp.imp_uid);
					$("#merchant_uid").val(rsp.merchant_uid);
					chk = true;
				} else {
					var msg = '결제에 실패하였습니다.';
					msg += '\n에러내용 : ' + rsp.error_msg;
				}
				alert(msg);
				if(chk==true) orderList();
		});
	});
	
	
	$("#cancel_module").click(function () {
		$.ajax({
			url : "paycan.wp",
			data : {"mid": $("#merchant_uid").val()},
			method : "POST",
			success : function(val){
				console.log(val);
				if(val==1) alert("취소 완료");
				else alert("취소 실패\n이미 취소되었거나 잘못된 정보입니다.");
			},
			error :  function(request, status){
				alert("취소가 실패하였습니다.");
			}
		});
	});
	
	$("#list_module").click(function(){
		$.ajax({
			url : "payamount.wp",
			data : {"mid": $("#merchant_uid").val()},
			method : "GET",
			contentType : 'application/json; charset=UTF-8',
			success : function(val){
				console.log(val);
				$("#paylist").empty();
				if(val.msg!=null){
					$("#paylist").append(val.msg);
				}else{
					$("#paylist").append("고유ID: "+val.imp_uid);
					$("#paylist").append("<br>상점 거래ID: "+val.merchant_uid);
					$("#paylist").append("<br>주문상품: "+val.name);
					$("#paylist").append("<br>주문자: "+val.buyer_name);
					$("#paylist").append("<br>결제금액: "+val.amount);
				}
			},
			error :  function(request, status){
				alert("목록 가져오기를 할 수 없습니다.");
			}
		});
	});
	
	$("#all_module").click(function(){
		$.ajax({
			url : "paylist.wp",
			method : "GET",
			contentType : 'application/json; charset=UTF-8',
			success : function(val){
				console.log(val);
				$("#paylist").empty();
				$.each(val, function(i, v){
					$("#paylist").append("고유ID: "+v.imp_uid);
					$("#paylist").append("<br>상점 거래ID: "+v.merchant_uid);
					if(v.cancel_amount != 0 ) $("#paylist").append("<br><span style=\"color:red;font-weight:bold;\">주문취소</span>");
					else if(v.failed_at != 0 ) $("#paylist").append("<br><span style=\"color:pink;font-weight:bold;\">결제오류</span>");
					else $("#paylist").append("<br><span style=\"color:blue;font-weight:bold;\">결제완료</span>");
					$("#paylist").append("<br>주문상품: "+v.name);
					$("#paylist").append("<br>주문자: "+v.buyer_name);
					$("#paylist").append("<br>결제금액: "+v.amount+"<hr><br>");
				});
				
			},
			error :  function(request, status){
				alert("목록 가져오기를 할 수 없습니다.");
			}
		});
	});
	
});

function orderList(){
	alert('주문내역 처리할 곳. 컨트롤러 호출');
	let fm = document.fm;
	fm.action ="pay.wp";
	fm.method="post";
	fm.submit();
}

</script>

<div class="container">
  <div class="row" id = "firstrow">
    <div class="col" id = "productone">
      <img id =  "productimg" src = "resources/img/wine/${product.w_image1}">
    </div>
    <div class="col-5" id = "producttwo">
    <div class = "row" id = "productnm">
      <p class = "knm">${product.w_nm_k}</p>
    </div>
    <div class = "row" id = "productnm">
      <p class = "enm">${product.w_nm_e}</p>
    </div>
    <div class = "row" id = "productinfo">
     <p>${product.w_info}</p>     
    </div>  
    <div class = "row" id = "productprice">
     <p>${product.w_price}</p>     
    </div>  
    </div>
    <div class="col" id = "productthree">
    <div class = "buttondiv">
    <form action="addCart.wp">
    <input type="hidden" id="w_no" name="w_no" value="${product.w_no}">
    <input type="hidden" id=w_price name="w_price" value="${product.w_price}">
    <select name="ord_quan" id="quantity">
    <option value="">수량</option>
    <c:forEach items="${num}" var="option"  varStatus="status">
          	 <option value="${status.count}">${status.count}</option>
  	</c:forEach>
	</select>
      	<button type = "submit">장바구니</button>
      	<a type = "button" href = "payment.wp">결제하기</a>
      </form>
    </div>
    </div>
  </div>
</div>

</body>
</html>