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
	href="${pageContext.request.contextPath}/resources/css/loginform.css" />
<style>
#naverIdLogin_loginButton {
	background: url(resources/img/btnG_축약형.png);
	background-size: cover;
	width: 140px;
	
	height: 50px;
	margin-top: 0.5rem;
	margin-left: 190px;
}
#btn-kakao-login{
	background: url(resources/img/kakao_login_medium.png);
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
		frm.action = 'find.wp';
		frm.submit();
		return true;
	}
	
	function info_chk3(frm) {
		frm.action = 'userCertification.wp';
		frm.submit();
		return true;
	}
</script>

<script type="text/javascript">
	$(
			function() {

				$("#btn-kakao-login")
						.click(
								function(event) {
									// a태그 기능 실행멈춤.
									event.preventDefault();
									// 카카오 로그인 실행시 오류메시지를 표시하는 경고창을 화면에 보이지 않게 한다.
									$("alert-kakao-login").addClass("d-none");
									// 사용자 키를 전달, 카카오 로그인 서비스 초기화.
									Kakao.init('db6431198fa45dc73997d274adc51435');
									// 카카오 로그인 서비스 실행하기 및 사용자 정보 가져오기.
									Kakao.Auth
											.login({
												success : function(auth) {
													Kakao.API
															.request({
																url : '/v2/user/me',
																success : function(
																		response) {
																	// 사용자 정보를 가져와서 폼에 추가.
																	var account = response.kakao_account;

																	$('#form-kakao-login input[name=email]').val(
																					account.email);
																	$('#form-kakao-login input[name=name]').val(
																					account.profile.nickname);
																	// 사용자 정보가 포함된 폼을 서버로 제출한다.
																	document.querySelector('#form-kakao-login')
																			.submit();
																},
																fail : function(
																		error) {
																	// 경고창에 에러메시지 표시
																	$('alert-kakao-login').removeClass("d-none").text("카카오 로그인 처리 중 오류가 발생했습니다.")
																}
															}); // api request
												}, // success 결과.
												fail : function(error) {
													// 경고창에 에러메시지 표시
													$('alert-kakao-login')
															.removeClass(
																	"d-none")
															.text(
																	"카카오 로그인 처리 중 오류가 발생했습니다.")
												}
											}); // 로그인 인증.
								}) // 클릭이벤트
			})// 카카오로그인 끝.
</script>
</head>
<body class = "d-flex flex-column min-vh-100">
	<jsp:include page="/header.jsp" />
	<div id="bestbooks">
	
					<div class="row">

						<section id="loginformArea" style="margin: 0 auto;">
								<form class="form-signin" name="loginform"
								action="login.wp" method="post"
								>

								<div class="form-group">
									<label for="USERID" class="sr-only">아이디</label> <input
										type="text" class="form-control" placeholder="ID"
										name='id' required autofocus>
								</div>
								<div class="form-group">
									<label for="PASSPW" class="sr-only">비밀번호</label> <input
										type="m_pw" class="form-control" placeholder="PASSPW"
										name='m_pw' required>
								</div>
								<button class="btn btn-lg1 btn-block btn-dark" type="submit">로그인</button>
								<button class="btn btn-lg1 btn-block btn-dark"
									onclick='return info_chk3(this.form);' type="button">회원가입
									</button>
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
						src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.2.js"
						charset="utf-8"></script>

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

	<%@ include file="/footer.jsp"%>
</body>
</html>