<%@ page contentType="text/html; charset=utf-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
        
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결제 완료</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
   href="${pageContext.request.contextPath}/resources/css/cart.css">
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>
<style>
.modal_content{
  width:400px; height:625px;
  background:#fff; border-radius:10px;
  position:relative; top:25%; left:50%;
  margin-top:-100px; margin-left:-200px;
  text-align:center;
  box-sizing:border-box; padding:74px 0;
  line-height:23px; cursor:pointer;
}

img{
	height: 235px;
	margin-bottom: 20px;
}
.modal{ 
  position:absolute; width:100%; height:100%; background: rgba(0,0,0,0.8); top:0; left:0; display:none;
}
.before{
	margin-right: 10px;
}
.end{
	margin-top: 10px;
}
.mywine{
	font-size: 17px;
    text-decoration: none !important;
}
.image-box{
	width: 100%;
}
</style>
<body class = "d-flex flex-column min-vh-100">
<%@ include file="../../../header.jsp"%>

	<div class="sub4">
	<span class="sc">
	<h4>구독이 되었습니다.</h4>
	<P>구독 내역은 <a href = "subscribe-3.wp">구독 수정</a>에서 확인 할 수있습니다.</P>
	</span>
	</div>
	
						<div class="name" style= "margin: 0 auto;">
						<c:choose>
							<c:when test='${userID ne NULL}'>
								<div class="name">${userName}님께  
								<c:if test='${product ne null}'>
								<a class = "mywine">배송하는 와인</a>
								</c:if>
								</div>
							</c:when>
								
						</c:choose>
						
					</div>
<c:if test='${product ne null}'>
<div class="modal">
  <div class="modal_content" 
       title="클릭하면 창이 닫힙니다.">
    <div class = "product">
    <img src= "${pageContext.request.contextPath}/resources/img/wine/${product.w_image1}"><br>
    
    <p>${product.w_nm_k}</p>
    <p>${product.w_nm_e}</p>
    <p id = "w_content">${product.w_info}</p>
    <a class = "next">다음</a><br>
    <a class = "end">닫기</a>
    </div>
    <div class = "product2">
    <img src= "${pageContext.request.contextPath}/resources/img/wine/${product2.w_image1}"><br>
    
      <p>${product2.w_nm_k}</p>
    <p>${product2.w_nm_e}</p>
    <p id = "w_content">${product2.w_info}</p>
    <a class = "before">이전</a>
    <a class = "next1">다음</a><br>
    <a class = "end">닫기</a>
    </div>
     <div class = "product3">
    <img src= "${pageContext.request.contextPath}/resources/img/wine/${product3.w_image1}"><br>
    
       <p>${product3.w_nm_k}</p>
    <p>${product3.w_nm_e}</p>
    <p id = "w_content">${product3.w_info}</p>
      <a class = "before1">이전</a><br>
    <a class = "end">닫기</a>
     </div>
  </div>
</div>
</c:if>
						
	
		<script type="text/javascript">
		$(function(){ 
			$('.product2').hide();
			$('.product3').hide();
			
			$('.next').click(function () {
				$('.product2').show();
				$('.product').hide();
			})
			
			$('.before').click(function () {
				$('.product2').hide();
				$('.product').show();
			})
			$('.before1').click(function () {
				$('.product2').show();
				$('.product3').hide();
			})
			$('.next1').click(function () {
				$('.product2').hide();
				$('.product3').show();
			})

			  $(".mywine").click(function(){
			    $(".modal").fadeIn();
			  });
			  $(".next").click(function(){
				    $(".modal").fadeIn();
				  });
			  $(".end").click(function(){
			    $(".modal").fadeOut();
			  });
			  
			});
// 		$('.mywine').click(function() {
// 				Swal.fire({
// 					  title: 'Sweet!',
// 					  text: 'Modal with a custom image.',
// 					  imageUrl: '${pageContext.request.contextPath}/resources/img/wine/${product2.w_image1}',
// 					  imageWidth: 100,
// 					  imageHeight: 300,
// 					  imageAlt: 'Custom image',
					  
// 					})
			
// 		})
		</script>

		<%@ include file="/footer.jsp"%>

</body>
</html>