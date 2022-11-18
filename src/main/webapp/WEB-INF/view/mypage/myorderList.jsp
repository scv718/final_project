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
        	<div class = "row">
            <div class = "col-lg-12 col-sm-6">
            <table class="subject_table">
          		  <colgroup>
          		  						<col id ="orderbtn" />
										<col id = "ordername" />
										<col id = "orderstatus"/>
										<col id = "orderstatus"/>
										<col id = "orderprice" />
										<col id ="orderbtn" />
										<col id ="orderbtn" />
									</colgroup>
               <caption>표 제목 부분</caption>
               <tbody>

                  <tr>
<!--                      <th class="td_width_1"></th> -->
                     <th >이미지</th>
                     <th >상품명</th>
                     <th >배송현황</th>
                     <th >주문상태</th>
                     <th >가격</th>
                     <th >삭제</th>
                     <th >리뷰</th>
                  </tr>
               </tbody>
    
               <caption>표 내용 부분</caption>
               <tbody>
                  <c:forEach items="${cartInfo}" var="ci" varStatus="status"> 
                     <tr>
						<td id = "image_wrap"><img id ="w_image1" src = "${pageContext.request.contextPath}/resources/img/wine/${product[status.index].w_image1}"></td>
                        <td onclick="location.href='product.wp?w_no=${ci.w_no}';" style="text-align: center; cursor:pointer;">${ci.w_nm_k}</td>
                        <td  style = "text-align: center">${ci.ord_stat}</td>
                        <td  style = "text-align: center">${ci.cs_stat}</td>
                        <td  style = "text-align: center">
                          <fmt:formatNumber value="${ci.ord_t_price}" pattern="#,### 원" /><br>
                        </td>
  
                       <td>
                      <c:if test = '${ci.cs_stat ne "취소"}'>
                      <c:choose>
                      <c:when test ='${ci.ord_stat eq "배송준비중"}'>
                      <form id = "cancel_module" method="post">
                        	<input id = "ord_code" type="hidden" name="ord_code" value="${ci.ord_code}">
                        	<input id = "merchant_uid" type="hidden" name="merchant" value="${ci.merchant_uid}">
                           <button type="button" class="btn-hover color-9"  id="delete_btn">주문취소</button>
                       </form> 	
                      </c:when>                
                      <c:when test='${ci.cs_stat ne "취소요청"}'>
                      	 <input type = "hidden" id = "cs_stat${ci.ord_code}" value = "취소요청">
                     	 <input type = "hidden" id = "ord_stat${ci.ord_code}" value = "${ci.ord_stat}">
                      	  <button type="button" class="btn-hover color-9"  onclick="{updateOrder('${ci.ord_code}')}">취소요청</button>               
                      </c:when>
                      <c:otherwise>                    
                      </c:otherwise>
                       </c:choose>
                      </c:if>
                           <form action="deleteOrder.wp" method="post">
                        	<input type="hidden" name="ord_code" value="${ci.ord_code}">
                           <button  type="submit" class="btn-hover color-9" id="delete_btn">내역삭제</button>
                           </form>
                           
                          
                        </td>
                        
                       <td>
                      <button type="button" class="btn-hover color-9"  onclick="location.href = 'product.wp?w_no=${ci.w_no}#reviewdiv'">리뷰쓰기</button>
                     </td>
                     </tr>
                 
                
                
                  </c:forEach>
                
               </tbody>
            </table>
                </div>
                </div>
            </div>
         </div>
     </div>
   </div>   <!-- class="wrap" -->
</div>   <!-- class="wrapper" -->
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