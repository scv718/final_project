<%@ page contentType="text/html; charset=utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/mypage.css">
</head>
<body class = "d-flex flex-column min-vh-100">
<%@ include file="/header.jsp"%>

	<div class="greenContainer1">
		<div class=".image-box">
				<div>
					<div class="name">정보수정</div>
				</div>
		</div>
		</div>
		
		<div style = "margin: 0 auto; margin-top: 50px;">
			<div class="mb-3">
			<form action="confirm.wp" method="post">
  			<label class="form-label">비밀번호 입력</label>
  			<input type="password" class="form-control" id="m_pw" name = "m_pw" placeholder="비밀번호 입력">
  			<button class="btn btn-danger" style = "margin-top: 23px;">확인</button>
  			</form>
		</div>
		</div>
		
		
</body>
</html>