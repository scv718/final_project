<%@ page contentType="text/html; charset=utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/mypage.css">
	<script src="//cdn.jsdelivr.net/npm/sweetalert2@10"></script>

<title>마이페이지</title>
</head>
<body class="d-flex flex-column min-vh-100">
	<%@ include file="../../../header.jsp"%>

	<div class="wrap">
		<div class="greenContainer">
	
			<div class=".image-box">
				<div>
					<div>
						<c:if test='${mylevel != null}'>
							<c:if test="${mylevel eq 0}">
								<div class="name">
									등급 :<a href="subscribe.wp"> 찾기</a>
								</div>
							</c:if>
							<c:if test="${mylevel eq 1}">
								<div class="name">등급 : 와인 입문자</div>
							</c:if>
							<c:if test="${mylevel eq 2}">
								<div class="name">등급 : 와인 마니아</div>
							</c:if>
							<c:if test="${mylevel eq 3}">
								<div class="name">등급 : 와인 마스터</div>
							</c:if>
						</c:if>
					</div>

					<div class="name">
						<c:choose>
							<c:when test='${userID ne NULL}'>
								<div class="name">${userName}님 
								<c:if test='${product ne null}'>
								<a class = "mywine">추천와인</a>
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
						
				</div>
			</div>
		</div>
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

		<div class="shippingStatusContainer">
			<div class="title">마이페이지</div>

			<div class="status">

				<div class="col-md-3">
					<a href="confirmPassword.wp" role="button"> <svg id="amo"
							xmlns="http://www.w3.org/2000/svg" width="118px" height="103px"
							fill="currentColor" class="bi bi-person-square"
							viewBox="0 0 16 16">
  <path d="M11 6a3 3 0 1 1-6 0 3 3 0 0 1 6 0z" />
							<path
								d="M2 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H2zm12 1a1 1 0 0 1 1 1v12a1 1 0 0 1-1 1v-1c0-1-1-4-6-4s-6 3-6 4v1a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1h12z" /></svg>
						<div class="text">정보수정</div></a>
				</div>

				<div class="col-md-3">
					<a href="mysubscribe.wp" role="button">
						<div>
							<svg id="amo" xmlns="http://www.w3.org/2000/svg" width="118px"
								height="103px" fill="currentColor" class="bi bi-cup-straw"
								viewBox="0 0 16 16">
								<path
									d="M13.902.334a.5.5 0 0 1-.28.65l-2.254.902-.4 1.927c.376.095.715.215.972.367.228.135.56.396.56.82 0 .046-.004.09-.011.132l-.962 9.068a1.28 1.28 0 0 1-.524.93c-.488.34-1.494.87-3.01.87-1.516 0-2.522-.53-3.01-.87a1.28 1.28 0 0 1-.524-.93L3.51 5.132A.78.78 0 0 1 3.5 5c0-.424.332-.685.56-.82.262-.154.607-.276.99-.372C5.824 3.614 6.867 3.5 8 3.5c.712 0 1.389.045 1.985.127l.464-2.215a.5.5 0 0 1 .303-.356l2.5-1a.5.5 0 0 1 .65.278zM9.768 4.607A13.991 13.991 0 0 0 8 4.5c-1.076 0-2.033.11-2.707.278A3.284 3.284 0 0 0 4.645 5c.146.073.362.15.648.222C5.967 5.39 6.924 5.5 8 5.5c.571 0 1.109-.03 1.588-.085l.18-.808zm.292 1.756C9.445 6.45 8.742 6.5 8 6.5c-1.133 0-2.176-.114-2.95-.308a5.514 5.514 0 0 1-.435-.127l.838 8.03c.013.121.06.186.102.215.357.249 1.168.69 2.438.69 1.27 0 2.081-.441 2.438-.69.042-.029.09-.094.102-.215l.852-8.03a5.517 5.517 0 0 1-.435.127 8.88 8.88 0 0 1-.89.17zM4.467 4.884s.003.002.005.006l-.005-.006zm7.066 0-.005.006c.002-.004.005-.006.005-.006zM11.354 5a3.174 3.174 0 0 0-.604-.21l-.099.445.055-.013c.286-.072.502-.149.648-.222z" /></svg>

							<div class="text">구독/취향 설정</div>
						</div>
					</a>
				</div>

				<div class="col-md-3">
					<a href="cart.wp" role="button">
						<div>
							<svg id="amo" xmlns="http://www.w3.org/2000/svg" width="118px"
								height="103px" fill="currentColor" class="bi bi-basket3"
								viewBox="0 0 16 16">
						<path
									d="M5.757 1.071a.5.5 0 0 1 .172.686L3.383 6h9.234L10.07 1.757a.5.5 0 1 1 .858-.514L13.783 6H15.5a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5H.5a.5.5 0 0 1-.5-.5v-1A.5.5 0 0 1 .5 6h1.717L5.07 1.243a.5.5 0 0 1 .686-.172zM3.394 15l-1.48-6h-.97l1.525 6.426a.75.75 0 0 0 .729.574h9.606a.75.75 0 0 0 .73-.574L15.056 9h-.972l-1.479 6h-9.21z" /></svg>

							<div class="text">장바구니</div>
						</div>
					</a>
				</div>

				<div class="col-md-3">
					<a href="myorderList.wp" role="button">
						<div>
							<svg id="amo" xmlns="http://www.w3.org/2000/svg" width="118px"
								height="103px" fill="currentColor" class="bi bi-clipboard2-data"
								viewBox="0 0 16 16">
					<path
									d="M9.5 0a.5.5 0 0 1 .5.5.5.5 0 0 0 .5.5.5.5 0 0 1 .5.5V2a.5.5 0 0 1-.5.5h-5A.5.5 0 0 1 5 2v-.5a.5.5 0 0 1 .5-.5.5.5 0 0 0 .5-.5.5.5 0 0 1 .5-.5h3Z" />
					<path
									d="M3 2.5a.5.5 0 0 1 .5-.5H4a.5.5 0 0 0 0-1h-.5A1.5 1.5 0 0 0 2 2.5v12A1.5 1.5 0 0 0 3.5 16h9a1.5 1.5 0 0 0 1.5-1.5v-12A1.5 1.5 0 0 0 12.5 1H12a.5.5 0 0 0 0 1h.5a.5.5 0 0 1 .5.5v12a.5.5 0 0 1-.5.5h-9a.5.5 0 0 1-.5-.5v-12Z" />
					<path
									d="M10 7a1 1 0 1 1 2 0v5a1 1 0 1 1-2 0V7Zm-6 4a1 1 0 1 1 2 0v1a1 1 0 1 1-2 0v-1Zm4-3a1 1 0 0 0-1 1v3a1 1 0 1 0 2 0V9a1 1 0 0 0-1-1Z" /></svg>

							<div class="text">주문내역</div>
						</div>
					</a>
				</div>

			</div>
		</div>
	</div>


	<div class="listContainer">
		<a href="getReviewList.wp" class="item">
			<div class="text">상품 리뷰</div>
			<div class="right">></div>
		</a>
	</div>

	<div class="listContainer">
		<a href="getQnaList.wp" class="item">
			<div class="text">1:1 문의</div>
			<div class="right">></div>
		</a>
	</div>
	

	
</body>
<%@ include file="/footer.jsp"%>
</html>