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
$(document).ready(function(){


$('#paymentone').click(function () {
	let fm = document.fm;
	fm.action ="payment.wp?cart=1";
	fm.method="post";
	fm.submit();
});
});


$(window).scroll(function() {
    let scrollTop = $(this).scrollTop();
    console.log(scrollTop)
    
    if ( scrollTop < 100 ) {
        scrollTop = 100;
    }
    else if ( scrollTop > 9600 ) {
        scrollTop = 9600;
    }
    
    let duration = 0;
    $('#productthree').stop().animate({top:scrollTop-100}, duration);
    
});

</script>
<!-- <form name="fm"> -->
<%-- <input name='w_nm_k' type='hidden' value='${product.w_nm_k}'> --%>
<%-- <input name='w_nm_e' type='hidden' value='${ol.w_nm_e}'> --%>
<%-- <input name='w_noList' type='hidden' value='${product.w_no}'> --%>
<!-- </form> -->

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
    <div class="col-md-3" id = "productthree">
    <div class = "buttondiv">
    <form action="addCart.wp" name = "fm">
    <input type="hidden" id="w_no" name="w_no" value="${product.w_no}">
    <input type="hidden" id=w_price name="w_price" value="${product.w_price}">
    <select name="ord_quan" id="quantity">
    <option value="">수량</option>
    <c:forEach items="${num}" var="option"  varStatus="status">
          	 <option value="${status.count}">${status.count}</option>
  	</c:forEach>
	</select>
      	<button class = "btn" type = "submit">장바구니</button>
      	<button class = "btn" type = "button" id = "paymentone">결제하기</button>
      </form>
    </div>
    </div>
  </div>
<div class ="row" >
	<img style = "width: 600px;" src = "${pageContext.request.contextPath}/resources/img/예시.png">
</div>

</div>

</body>
</html>