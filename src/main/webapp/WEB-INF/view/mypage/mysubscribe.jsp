<%@ page contentType="text/html; charset=utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/mysubscribe..css">
<title>구독 확인 취향 설정</title>
</head>
<body class = "d-flex flex-column min-vh-100">
	<%@ include file="../../../header.jsp"%>

		<form action="${pageContext.request.contextPath}/mysubscribe.wp" method="post">
	<div class="content_subject"><h2 style="text-align: center;">구독 및 취향 설정</h2></div>
	<div class="container" id="coner">
			<div class="listContainer">
				<div class="mb-3 mt-3">
					<div class="text"><div class="greenContainer">
						<c:choose>
							<c:when test='${userID ne NULL}'>
								<div class="name">${userName}님의 구독 설정</div>
							</c:when>
						</c:choose>
					</div>
				</div>
				<div class="text">
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
			</div>
			
<div class="mt"><a href="javascript:void(0);" id ="mysubscribes" onclick="test();">
<button type="button"  id="colre" class="w-100 btn btn-lg btn-outline-primary">구독 수정</button></a></div>

			<div class="mb-3 mt-3">
				<c:choose>
					<c:when test='${userID ne NULL}'>
						<div class="name">${userName}님의 취향 설정</div>
					</c:when>
				</c:choose>
			</div>

	
<div class="mt">		
<a href="mypreference.wp">			
<button type="button"  id="colre" class="w-100 btn btn-lg btn-outline-primary">취향수정</button></a></div>

</div></div></form>
<script type="text/javascript">

function test() {
		var level = ${mylevel};
	   	if (level == 0){
			alert('구독 수정은 구독 후 가능합니다.');
			location.href  = "subscribe.wp";
		}
		else if (level > 0){
			alert('이미 구독한 계정입니다.\구독 수정은 구독 취소 후 가능합니다.');
			location.href = "subscribe-3.wp";
		}
	   	
}
</script>
<%@ include file="/footer.jsp"%>
</body>
</html>