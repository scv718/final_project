<%@ page contentType="text/html; charset=utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/mypage.css">

<title>마이페이지</title>
</head>
<body class = "d-flex flex-column min-vh-100">
<%@ include file="../../../header.jsp"%>
	<div class="wrap">
		<div class="greenContainer">
		<div class=".image-box">
			<div>
				<div>
					<c:choose>
						<c:when test='${userID ne NULL}'>
							<div class="name">등급 : ${UsserVO.lavel}</div>
						</c:when>
					</c:choose>
				</div>

				<div class="name">
					<c:choose>
						<c:when test='${userID ne NULL}'>
							<div class="name">${userName}님</div>
						</c:when>
					</c:choose>
				</div>
			</div>
		</div>
		</div>

		<div class="shippingStatusContainer">
			<div class="title">마이페이지</div>
			
			<div class="status">
			
			<a href="confirmPassword.wp" role="button" >
				<div class="col-md-3">
					<div>
						<svg id="amo"xmlns="http://www.w3.org/2000/svg" width="118px"
							height="103px" fill="currentColor" class="bi bi-person-square"
							viewBox="0 0 16 16">
  <path d="M11 6a3 3 0 1 1-6 0 3 3 0 0 1 6 0z" /><path d="M2 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H2zm12 1a1 1 0 0 1 1 1v12a1 1 0 0 1-1 1v-1c0-1-1-4-6-4s-6 3-6 4v1a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1h12z" /></svg>
						<div class="text">정보수정</div>
					</div></a>
				</div>
				
				<a href="mysubscribe.wp" role="button" >
				<div class="col-md-3">
					<div>
						<svg id="amo"xmlns="http://www.w3.org/2000/svg" width="118px"
							height="103px" fill="currentColor" class="bi bi-cup-straw"
							viewBox="0 0 16 16"><path d="M13.902.334a.5.5 0 0 1-.28.65l-2.254.902-.4 1.927c.376.095.715.215.972.367.228.135.56.396.56.82 0 .046-.004.09-.011.132l-.962 9.068a1.28 1.28 0 0 1-.524.93c-.488.34-1.494.87-3.01.87-1.516 0-2.522-.53-3.01-.87a1.28 1.28 0 0 1-.524-.93L3.51 5.132A.78.78 0 0 1 3.5 5c0-.424.332-.685.56-.82.262-.154.607-.276.99-.372C5.824 3.614 6.867 3.5 8 3.5c.712 0 1.389.045 1.985.127l.464-2.215a.5.5 0 0 1 .303-.356l2.5-1a.5.5 0 0 1 .65.278zM9.768 4.607A13.991 13.991 0 0 0 8 4.5c-1.076 0-2.033.11-2.707.278A3.284 3.284 0 0 0 4.645 5c.146.073.362.15.648.222C5.967 5.39 6.924 5.5 8 5.5c.571 0 1.109-.03 1.588-.085l.18-.808zm.292 1.756C9.445 6.45 8.742 6.5 8 6.5c-1.133 0-2.176-.114-2.95-.308a5.514 5.514 0 0 1-.435-.127l.838 8.03c.013.121.06.186.102.215.357.249 1.168.69 2.438.69 1.27 0 2.081-.441 2.438-.69.042-.029.09-.094.102-.215l.852-8.03a5.517 5.517 0 0 1-.435.127 8.88 8.88 0 0 1-.89.17zM4.467 4.884s.003.002.005.006l-.005-.006zm7.066 0-.005.006c.002-.004.005-.006.005-.006zM11.354 5a3.174 3.174 0 0 0-.604-.21l-.099.445.055-.013c.286-.072.502-.149.648-.222z" /></svg>
						
						<div class="text">구독 및 취향 설정</div>
					</div></a>
				</div>
				
			<a href="payment.wp" role="button" >
				<div class="col-md-3">
					<div>
						<svg id="amo" xmlns="http://www.w3.org/2000/svg" width="118px"
							height="103px" fill="currentColor" class="bi bi-basket3"
							viewBox="0 0 16 16"><path d="M5.757 1.071a.5.5 0 0 1 .172.686L3.383 6h9.234L10.07 1.757a.5.5 0 1 1 .858-.514L13.783 6H15.5a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5H.5a.5.5 0 0 1-.5-.5v-1A.5.5 0 0 1 .5 6h1.717L5.07 1.243a.5.5 0 0 1 .686-.172zM3.394 15l-1.48-6h-.97l1.525 6.426a.75.75 0 0 0 .729.574h9.606a.75.75 0 0 0 .73-.574L15.056 9h-.972l-1.479 6h-9.21z" /></svg>
						
						<div class="text">장바구니</div>
					</div></a>
				</div>
				
				<a href="payment.wp" role="button">
				<div class="col-md-3">
					<div>
						<svg id="amo"xmlns="http://www.w3.org/2000/svg" width="118px"
							height="103px" fill="currentColor" class="bi bi-clipboard2-data"
							viewBox="0 0 16 16"><path d="M9.5 0a.5.5 0 0 1 .5.5.5.5 0 0 0 .5.5.5.5 0 0 1 .5.5V2a.5.5 0 0 1-.5.5h-5A.5.5 0 0 1 5 2v-.5a.5.5 0 0 1 .5-.5.5.5 0 0 0 .5-.5.5.5 0 0 1 .5-.5h3Z" /><path d="M3 2.5a.5.5 0 0 1 .5-.5H4a.5.5 0 0 0 0-1h-.5A1.5 1.5 0 0 0 2 2.5v12A1.5 1.5 0 0 0 3.5 16h9a1.5 1.5 0 0 0 1.5-1.5v-12A1.5 1.5 0 0 0 12.5 1H12a.5.5 0 0 0 0 1h.5a.5.5 0 0 1 .5.5v12a.5.5 0 0 1-.5.5h-9a.5.5 0 0 1-.5-.5v-12Z" /><path d="M10 7a1 1 0 1 1 2 0v5a1 1 0 1 1-2 0V7Zm-6 4a1 1 0 1 1 2 0v1a1 1 0 1 1-2 0v-1Zm4-3a1 1 0 0 0-1 1v3a1 1 0 1 0 2 0V9a1 1 0 0 0-1-1Z" /></svg>
						<div class="text">구매내역</div>
					</div></a>
				</div>
				
			</div>
		</div>

	<div class="listContainer">
		<a href="payment.wp" class="item">
			<div class="text">주문목록</div>
			<div class="right">></div>
		</a></div>
		
		<div class="listContainer">
		<a href="payment.wp" class="item">
			<div class="text">상품후기</div>
			<div class="right">></div>
		</a></div> 
		
		<div class="listContainer">
		<a href="payment.wp" class="item">
			<div class="text">상품문의</div>
			<div class="right">></div>
		</a></div> 
		
		<div class="listContainer">
		<a href="payment.wp" class="item">
			<div class="text">단골상점</div>
			<div class="right">></div>
		</a></div>


        <div class="listContainer">
		<a href="payment.wp" class="item">
			<div class="text">
				<span>내지갑</span> 
				<span class="smallLight"> 
				<span>|</span> 
				<span>보유 적립금</span>
				</span>
			</div>

			<div class="right">
				<span class="blct">175 BLCT</span> >
			</div>

		</a></div>
		
		 <div class="listContainer">
		<a href="payment.wp" class="item">

			<div class="text">설정</div>
			<div class="right">></div>
		</a></div>
	</div>
	</div>
	<%@ include file="/footer.jsp"%>
</body>
</html>