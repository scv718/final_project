<%@ page contentType="text/html; charset=utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/mypage.css">
</head>
<body class = "d-flex flex-column min-vh-100">
<%@ include file="/header.jsp"%>

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
		
		
</body>
</html>