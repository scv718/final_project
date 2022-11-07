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
         
         <div class="content_subject"><span>주문내역</span></div>
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
                     <th class="td_width_6">상품명</th>
                     <th class="td_width_2">배송현황</th>
                     <th class="td_width_2">가격</th>
                     <th class="td_width_3">삭제</th>
                  </tr>
               </tbody>
            </table>
            
            <table class="cart_table">
               <caption>표 내용 부분</caption>
               <tbody>
                  <c:forEach items="${cartInfo}" var="ci">
                     <tr>
                        <td class="td_width_1 cart_info_td">
                           <input type="checkbox" name = "product_check" class="individual_cart_checkbox input_size_20" checked="checked">
<%--                       	   <input type="hidden" name = "id" value="${ci.id}"/> --%>
                        </td>

<%--   <div class="image_wrap" data-bookid="${ci.imageList[0].bookId}" data-path="${ci.imageList[0].uploadPath}" data-uuid="${ci.imageList[0].uuid}" data-filename="${ci.imageList[0].W_IMAGE1}"> --%>
<!--                               <img></div>                         -->
<!--                         </td> -->
<%-- 						<c:forEach items="${product}" var="product"> --%>
                        <td class="td_width_6" style="text-align: center
                        ">${ci.w_nm_k}</td>
<%--                         </c:forEach> --%>
                        <td class="td_width_2" style = "text-align: center">${ci.ord_stat}</td>
                        <td class="td_width_2 price_td" style = "text-align: center">
                          <fmt:formatNumber value="${ci.ord_t_price}" pattern="#,### 원" /><br>
                        </td>
  
                        <td class="td_width_3 table_text_align_center">
                           <form action="deleteOrder.wp" method="post">
                        <input type="hidden" name="ord_code" value="${ci.ord_code}">
                           <button  type="submit" class="delete_btn">삭제</button>
                           </form>
                        </td>
                     </tr>
                  </c:forEach>
               </tbody>
            </table>
            
         </div>
         
     
     </div>
   </div>   <!-- class="wrap" -->
</div>   <!-- class="wrapper" -->

			

<%@ include file="/footer.jsp"%>
</body>
</html>