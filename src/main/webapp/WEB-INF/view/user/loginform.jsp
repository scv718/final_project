<%@ page contentType="text/html; charset=utf-8"%>
<html>
<head>
<title>로그인(loginMember)</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>

<script src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script
   src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/loginform.css" />
<style>
#naverIdLogin_loginButton {
	background: url(img/btnG_축약형.png);
	background-size: cover;
	width: 140px;
	
	height: 50px;
	margin-top: 0.5rem;
	margin-left: 190px;
}
#btn-kakao-login{
	background: url(img/kakao_login_medium.png);
	background-size: cover;
	background-position:center;
	width: 140px;
	height: 50px;
	margin-top: 1.5rem;
	margin-left: 190px;
}

</style>

<script>
	function info_chk2(frm) {
		frm.action = 'find.main';
		frm.submit();
		return true;
	}
</script>

</head>
<body class = "d-flex flex-column min-vh-100">
	<jsp:include page="/header.jsp" />
	<div id="bestbooks">
		<div class="container">
			
				<div class="col">
					<div class="row" id="titlemenu">
						<a>로그인</a>
					</div>
					<hr>
					<div class="row">

<%
	if(request.getParameter("error") != null){
		out.println("<div class = 'alert alert-danger'>");
		out.println("아이디와 비밀번호를 확인해 주세여");
		out.println("</div");
	}
%>
	
							<form class="form-signin" name="loginform"
								action="login.do" method="post"
								>


								<div class="form-group">
									<label for="USERID" class="sr-only">아이디</label> <input
										type="text" class="form-control" placeholder="ID"
										name='id' required autofocus>
								</div>
								<div class="form-group">
									<label for="PASSPW" class="sr-only">비밀번호</label> <input
										type="password" class="form-control" placeholder="PASSPW"
										name='password' required>
								</div>
								<button class="btn btn-lg1 btn-block btn-dark" type="submit">로그인</button>
								<button class="btn btn-lg1 btn-block btn-dark"
									onclick='return info_chk2(this.form);' type="button">아이디/비밀번호
									찾기</button>
									
									
									
									
									
									
									
									
									
									
									
<!-- 									---소셜로그인--- -->
								<a type = button class = "btn" id="btn-kakao-login" href="kakao/login">
							</a> 
							<a type="button" class="btn" id="naverIdLogin_loginButton"
								href="javascript:void(0)"></a>
								<%-- 								<a href="${pageContext.request.contextPath}/find.main" id = "find">아이디/비밀번호 찾기</a> --%>

							</form>

						
					</div>
					<form id="form-kakao-login" method="post" action="kakaoLogin.main">
						<input type="hidden" name="email" /> <input type="hidden"
							name="name" />

					</form>



					<script
						src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.2.js"></script>

					<script>
						var hostIndex = location.href.indexOf(location.host)
								+ location.host.length;
						var contextPath = location.href.substring(hostIndex,
								location.href.indexOf('/', hostIndex + 1));

						var naverLogin = new naver.LoginWithNaverId({
							clientId : "mpebH7I_1_5FrYFniKcZ", //내 애플리케이션 정보에 cliendId를 입력해줍니다.
							callbackUrl : "http://localhost:8090/"
									+ contextPath + "/collback.jsp", // 내 애플리케이션 API설정의 Callback URL 을 입력해줍니다.
							isPopup : false,
							callbackHandle : true
						});

						naverLogin.init();

						window.addEventListener('load', function() {
							naverLogin.getLoginStatus(function(status) {
								if (status) {
									var email = naverLogin.user.getEmail(); // 필수로 설정할것을 받아와 아래처럼 조건문을 줍니다.
									var name = naverLogin.user.getName();
									// 			var mobile = naverLogin.user.getMobile();

									console.log(naverLogin.user);

									if (email == undefined || email == null) {
										alert("이메일은 필수정보입니다. 정보제공을 동의해주세요.");
										naverLogin.reprompt();
										return;
									}
									//             if( mobile == undefined || mobile == null) {
									// 				alert("이메일은 필수정보입니다. 정보제공을 동의해주세요.");
									// 				naverLogin.reprompt();
									// 				return;
									// 			}
									if (name == undefined || name == null) {
										alert("이메일은 필수정보입니다. 정보제공을 동의해주세요.");
										naverLogin.reprompt();
										return;
									}
								} else {
									console.log("callback 처리에 실패하였습니다.");
								}
							});
						});

						var testPopUp;
						function openPopUp() {
							testPopUp = window
									.open(
											"https://nid.naver.com/nidlogin.logout",
											"_blank",
											"toolbar=yes,scrollbars=yes,resizable=yes,width=1,height=1");
						}
						function closePopUp() {
							testPopUp.close();
						}

						function naverLogout() {
							openPopUp();
							setTimeout(function() {
								closePopUp();
							}, 1000);

						}
					</script>

				</div>

			</div>
		</div>
	</div>


</body>
</html>