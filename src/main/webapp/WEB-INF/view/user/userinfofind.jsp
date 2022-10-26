<%@ page contentType="text/html; charset=utf-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
</head>
<body class = "d-flex flex-column min-vh-100">
<%@ include file="/header.jsp"%>

	<ul class="nav nav-tabs nav-justified">
							<li class="nav-item"><a id="tabfont" class="nav-link active"
								data-toggle="tab" href="#explain">아이디 찾기</a></li>
							<li class="nav-item"><a id="tabfont" class="nav-link"
								data-toggle="tab" href="#contents">비밀번호 찾기</a></li>
						</ul>
						<div class="tab-content">
							<div class="tab-pane active" id="explain">
								<p>가입시 등록한 e-mail을 입력해주세요</p>
								<form action="forgotid.wp" method="post">
									<input type = "text" name = "m_email" placeholder="이메일 입력">
								<button class = "btn btn-dark" type ="submit" >아이디찾기</button>
								</form>
							</div>
							<div class="tab-pane fade" id="contents">
								<p>가나다라</p>
							</div>
						</div>
						
						<%@ include file="/footer.jsp"%>
</body>
</html>