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
<body class = "d-flex flex-column min-vh-100">
<%@ include file="../../../header.jsp"%>
<div class="wrapper">
   <div class="wrap">   
      <div class="content_area">
         
         <div class="content_subject"><span>구독내역</span></div>
         <!-- 장바구니 리스트 -->
         <div class="content_middle_section"></div>
         <!-- 장바구니 가격 합계 -->
         <!-- cartInfo -->
         <div class="content_totalCount_section">

            <table class="subject_table">
               <caption>표 제목 부분</caption>
               <tbody>

                  <tr>
                     <th class="td_width_6">구독명</th>
                     <th class="td_width_2">배송현황</th>
                     <th class="td_width_2">가격</th>
                     <th class="td_width_3">삭제</th>
                  </tr>
               </tbody>
            </table>
            
            <table class="cart_table">
               <caption>표 내용 부분</caption>
               <tbody>
                     <tr><td class="td_width_6" style="text-align:center">${subscribe.w_nm_k}</td>

                        <td class="td_width_2" style = "text-align: center">${subscribe.ord_stat}</td>
                        <td class="td_width_2 price_td" style = "text-align: center">
                          <fmt:formatNumber value="${subscribe.ord_t_price}" pattern="#,### 원" /><br>
                        </td>
  
                        <td class="td_width_3 table_text_align_center">
                         <form action="deletesubscribe.wp" method="post">
                        	<input type="hidden" name="ord_code" value="${subscribe.ord_code}">
                           <button  type="submit" class="delete_btn">구독 내역삭제</button>
                           </form>
                      
                
                      	<c:if test="${subscribe.cs_stat ne '취소'}">
                      	    <form id = "cancel_module" method="post">
                        	<input id = "ord_code" type="hidden" name="ord_code" value="${subscribe.ord_code}">
                        	<input id = "merchant_uid" type="hidden" name="merchant" value="${subscribe.merchant_uid}">
                           <button  type="button" class="delete_btn">구독 취소</button>
                           </form>
                      	</c:if>
                        </td>
                     </tr>
               </tbody>
            </table>
         </div>
     </div>
   </div>   <!-- class="wrap" -->
   <a href="javascript:void(0);" id ="subscribes2" onclick="cancellation();">
								<button type="button" id="colre"
									class="w-100 btn btn-lg btn-outline-primary">재구독</button>
							</a>
</div>   <!-- class="wrapper" -->

<script type="text/javascript">
function cancellation() {
	var level = ${mylevel};
	 if (level > 0){
		alert('구독 내역 삭제 후 구독 가능 합니다.');
	}else if (level == 0){
		alert('재구독 가능 합니다.');
		confirm("구독하겠습니까?")
		if(confirm("구독하겠습니까?")){
			location.href = "subscribe-1.wp";
		}else{
			location.href = "subscribe-3.wp";
		}
	}
}
$("#cancel_module").click(function () {
	$.ajax({
		url : "paycan1.wp",
		data : {"mid": $("#merchant_uid").val(),
				"imp": $("#ord_code").val()
		},
		method : "POST",
		success : function(val){
			console.log(val);
			if(val==1) {
				alert("취소 완료");
				location.reload();
			}
			else alert("취소 실패\n이미 취소되었거나 잘못된 정보입니다.");
		},
		error :  function(request, status){
			alert("취소가 실패하였습니다.");
		}
	});
});
</script>

<%@ include file="/footer.jsp"%>
</body>
</html>