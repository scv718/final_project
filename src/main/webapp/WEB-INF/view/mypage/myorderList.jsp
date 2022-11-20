<%@ page contentType="text/html; charset=utf-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
        
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>cart</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
   href="${pageContext.request.contextPath}/resources/css/cart.css">
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
 	<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" /> 
</head>
<body class = "d-flex flex-column min-vh-100">
<%@ include file="../../../header.jsp"%>
<div class="wrapper">
   <div class="wrap">   
      <div class="content_area">
         
         <div class="content_subject"><span>주문내역</span></div>
         <!-- 장바구니 리스트 -->
         <div class="content_middle_section"></div>
         <!-- 장바구니 가격 합계 -->
         <!-- cartInfo -->
         <div class="content_totalCount_section">
            
<!--             체크박스 전체 여부 -->
<!--             <div class="all_check_input_div"> -->
<!--                <input type="checkbox" class="all_check_input input_size_20" checked="checked"><span class="all_chcek_span">전체선택</span> -->
<!--             </div>             -->
            
            
            <div class ="container">
               	<div class = "row" >
            <div class = "col-lg-12 col-sm-6">
            <table class="subject_table">
          		  <colgroup>
          		  <col id ="mobileone" />
				  <col id = "mobiletwo" />
				  </colgroup>
                  <tr>
                     <th>이미지</th>
                     <th>상품정보</th>
                  </tr>
               <tbody>
                  <c:forEach items="${cartInfo}" var="ci" varStatus="status"> 
                     <tr id ="card">
						<td onclick="location.href='product.wp?w_no=${ci.w_no}';" style="text-align: center; cursor:pointer;"> <a id = "image_wrap"><img id ="w_image1" src = "${pageContext.request.contextPath}/resources/img/wine/${product[status.index].w_image1}"></a><td>
                        <a onclick="location.href='product.wp?w_no=${ci.w_no}';" style="text-align: center; cursor:pointer;">${ci.w_nm_k}</a><br>
                    배송상태: ${ci.ord_stat}<br>
                    주문상태: ${ci.cs_stat}<br>
                          <fmt:formatNumber value="${ci.ord_t_price}" pattern="#,### 원" /><br>
                      <c:if test = '${ci.cs_stat ne "취소"}'>
                      <c:choose>
                      <c:when test ='${ci.ord_stat eq "결제"}'>
                      <form id = "cancel_module" method="post" class = "mobileform">
                        	<input id = "ord_code" type="hidden" name="ord_code" value="${ci.ord_code}">
                        	<input id = "merchant_uid" type="hidden" name="merchant" value="${ci.merchant_uid}">
                           <button type="button" class="btn-hover1 color-9"  id="delete_btn">주문취소</button>
                       </form> 	
                      </c:when>
                      <c:when test='${ci.cs_stat eq "환불"}'>
                      
                      </c:when>             
                      <c:when test='${ci.cs_stat ne "취소요청"}'>
                      	 <input type = "hidden" id = "cs_stat${ci.ord_code}" value = "취소요청">
                     	 <input type = "hidden" id = "ord_stat${ci.ord_code}" value = "${ci.ord_stat}">
                      	  <button type="button" class="btn-hover1 color-9"  onclick="{updateOrder('${ci.ord_code}')}">취소요청</button>               
                      </c:when>
                      
                      <c:otherwise>                    
                      </c:otherwise>
                       </c:choose>
                      </c:if>
                           <form action="deleteOrder.wp" method="post" class = "mobileform">
                        	<input type="hidden" name="ord_code" value="${ci.ord_code}">
                           <button  type="submit" class="btn-hover1 color-9" id="delete_btn">내역삭제</button>
                           </form>
                      <button type="button" class="btn-hover1 color-9"  onclick="location.href = 'product.wp?w_no=${ci.w_no}#reviewdiv'">리뷰쓰기</button>
                     </td>
                     </tr>
                
                
                  </c:forEach>
                
               </tbody>
            </table>
            <div id="js-btn-wrap" class="btn-wrap"><button id = "plusbtn" class = "btn-hover color-9"><i class = "xi-plus-min"></i></button></div>
                </div>
                <a id="MOVE_TOP_BTN" href="#" onclick="window.scrollTo(0,0);" class="material-symbols-outlined">arrow_circle_up</a>
                </div>
                	<script type="text/javascript">
	$(function() {
        $(window).scroll(function() {
            if ($(this).scrollTop() > 300) {
                $('#MOVE_TOP_BTN').fadeIn();
            } else {
                $('#MOVE_TOP_BTN').fadeOut();
            }
        });
        
        $("#MOVE_TOP_BTN").click(function() {
            $('html, body').animate({
                scrollTop : 0
            }, 400);
            return false;
        });
    });
	</script>
<!--         	<div class = "row" id = "pctable"> -->
<!--             <div class = "col-lg-12 col-sm-6"> -->
<!--             <table class="subject_table"> -->
<%--           		  <colgroup> --%>
<%--           		  						<col id ="orderbtn" /> --%>
<%-- 										<col id = "ordername" /> --%>
<%-- 										<col id = "orderstatus"/> --%>
<%-- 										<col id = "orderstatus"/> --%>
<%-- 										<col id = "orderprice" /> --%>
<%-- 										<col id ="orderbtn" /> --%>
<%-- 										<col id ="orderbtn" /> --%>
<%-- 									</colgroup> --%>
<%--                <caption>표 제목 부분</caption> --%>
<!--                <tbody> -->

<!--                   <tr> -->
<!-- <!--                      <th class="td_width_1"></th> --> 
<!--                      <th >이미지</th> -->
<!--                      <th >상품명</th> -->
<!--                      <th >배송현황</th> -->
<!--                      <th >주문상태</th> -->
<!--                      <th >가격</th> -->
<!--                      <th >삭제</th> -->
<!--                      <th >리뷰</th> -->
<!--                   </tr> -->
<!--                </tbody> -->
    
<%--                <caption>표 내용 부분</caption> --%>
<!--                <tbody> -->
<%--                   <c:forEach items="${cartInfo}" var="ci" varStatus="status">  --%>
<!--                      <tr> -->
<%-- 						<td id = "image_wrap"><img id ="w_image1" src = "${pageContext.request.contextPath}/resources/img/wine/${product[status.index].w_image1}"></td> --%>
<%--                         <td onclick="location.href='product.wp?w_no=${ci.w_no}';" style="text-align: center; cursor:pointer;">${ci.w_nm_k}</td> --%>
<%--                         <td  style = "text-align: center">${ci.ord_stat}</td> --%>
<%--                         <td  style = "text-align: center">${ci.cs_stat}</td> --%>
<!--                         <td  style = "text-align: center"> -->
<%--                           <fmt:formatNumber value="${ci.ord_t_price}" pattern="#,### 원" /><br> --%>
<!--                         </td> -->
  
<!--                        <td> -->
<%--                       <c:if test = '${ci.cs_stat ne "취소"}'> --%>
<%--                       <c:choose> --%>
<%--                       <c:when test ='${ci.cs_stat eq "결제"}'> --%>
<!--                       <form id = "cancel_module" method="post"> -->
<%--                         	<input id = "ord_code" type="hidden" name="ord_code" value="${ci.ord_code}"> --%>
<%--                         	<input id = "merchant_uid" type="hidden" name="merchant" value="${ci.merchant_uid}"> --%>
<!--                            <button type="button" class="btn-hover1 color-9"  id="delete_btn">주문취소</button> -->
<!--                        </form> 	 -->
<%--                       </c:when>                 --%>
<%--                       <c:when test='${ci.cs_stat ne "취소요청"}'> --%>
<%--                       	 <input type = "hidden" id = "cs_stat${ci.ord_code}" value = "취소요청"> --%>
<%--                      	 <input type = "hidden" id = "ord_stat${ci.ord_code}" value = "${ci.ord_stat}"> --%>
<%--                       	  <button type="button" class="btn-hover1 color-9"  onclick="{updateOrder('${ci.ord_code}')}">취소요청</button>                --%>
<%--                       </c:when> --%>
<%--                       <c:otherwise>                     --%>
<%--                       </c:otherwise> --%>
<%--                        </c:choose> --%>
<%--                       </c:if> --%>
<!--                            <form action="deleteOrder.wp" method="post"> -->
<%--                         	<input type="hidden" name="ord_code" value="${ci.ord_code}"> --%>
<!--                            <button  type="submit" class="btn-hover1 color-9" id="delete_btn">내역삭제</button> -->
<!--                            </form> -->
                           
                          
<!--                         </td> -->
                        
<!--                        <td> -->
<%--                       <button type="button" class="btn-hover1 color-9"  onclick="location.href = 'product.wp?w_no=${ci.w_no}#reviewdiv'">리뷰쓰기</button> --%>
<!--                      </td> -->
<!--                      </tr> -->
                 
                
                
<%--                   </c:forEach> --%>
                
<!--                </tbody> -->
<!--             </table> -->
<!--                 </div> -->
<!--                 </div> -->
            </div>
         </div>
     </div>
   </div>   <!-- class="wrap" -->
</div>   <!-- class="wrapper" -->
<script type="text/javascript">
			$(window).on('load', function () {
			    load('#card', '3');
			    $("#plusbtn").on("click", function () {
			        load('#card', '3', '#js-btn-wrap');
			    })
			});
			 
			function load(id, cnt, btn) {
			    var girls_list = id + "#card:not(.active)";
			    console.log(id);
			    console.log(girls_list);
			    var girls_length = $(girls_list).length;
			    console.log(girls_length);
			    var girls_total_cnt;
			    if (cnt < girls_length) {
			        girls_total_cnt = cnt;
			    } else {
			        girls_total_cnt = girls_length;
			        $('#plusbtn').hide()
			    }
			    console.log(girls_total_cnt);
			    $(girls_list + ":lt(" + girls_total_cnt + ")").addClass("active");
			}
			</script>
<script type="text/javascript">
function updateOrder(val){
	
	var ord_code = val;
  	var cs_stat = '취소요청';
  	var ord_stat =  $('#ord_stat'+ord_code).val();

  	console.log(ord_code);
  	console.log(cs_stat);
  	console.log(ord_stat);
  	 if (confirm("이미 배송중입니다 취소요청 하시겠습니까?") == true){    //확인

  		location.href = 'cancleorderrequest.wp?ord_code='+ord_code+'&cs_stat='+cs_stat+'&ord_stat='+ord_stat;

  	 }else{  
  	     return false;
  	 }
}

$("#cancel_module").click(function () {
	$.ajax({
		url : "paycan.wp",
		method : "POST",
    	data : {"mid": $("#merchant_uid").val(),
				"imp": $("#ord_code").val()
			},
		success : function(val){
			if(val==1) {
				alert("취소 완료");
				location.href = "myorderList.wp";
			}	
			else {
				alert("취소 실패\n이미 취소되었거나 잘못된 정보입니다.");
			}
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