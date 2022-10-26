<%@ page contentType="text/html; charset=utf-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<link rel="stylesheet"
	href="//cdn.jsdelivr.net/gh/xpressengine/xeicon@2.3.1/xeicon.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/singUp.css" />
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>

<script src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script type="text/javascript"
	src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript"
	src="https://cdn.iamport.kr/js/iamport.payment-1.1.8.js"></script>
</head>

<body class="d-flex flex-column min-vh-100">
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

	<script>
function checkd() {
	var url = "service.jsp";
    var name = "check";
    var option = "width = 500, height = 500, top = 100, left = 200, location = no"
    window.open(url, name, option);

    var check = document.getElementById("sumbitcheck");
}

function joinform_check() {
	  //변수에 담아주기
	    
	
	  var uid = document.getElementById("id");
	  var pwd = document.getElementById("m_pw");
	  var repwd = document.getElementById("repassword");
	  var email_id = document.getElementById("m_email");
	  var agree = document.getElementById("agree");
	  console.log(uid);
	  console.log(pwd);

	  var idCheck = /^[a-zA-Z0-9_!?@]{4,11}$/;
		
	  
	  if (uid.value == "") { 
	    alert("아이디를 입력하세요.");
	    uid.focus(); //focus(): 커서가 깜빡이는 현상, blur(): 커서가 사라지는 현상
	    return false; //return: 반환하다 return false:  아무것도 반환하지 말아라 아래 코드부터 아무것도 진행하지 말것
	  };
	  
	  if (!idCheck.test(uid.value)) {
		    alert("아이디는 영문자 + 숫자, 특수문자(!?@_) 만 가능합니다.");
		    uid.focus();
		    return false;
		  };
		  

	  if (pwd.value == "") {
	    alert("비밀번호를 입력하세요.");
	    pwd.focus();
	    return false;
		  };

	  //비밀번호 영문자+숫자+특수조합(8~25자리 입력) 정규식
	  var pwdCheck = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,25}$/;

	  if (!pwdCheck.test(pwd.value)) {
	    alert("비밀번호는 영문자+숫자+특수문자 조합으로 8~25자리 사용해야 합니다.");
	    pwd.focus();
	    return false;
	  };

	  if (repwd.value !== pwd.value) {
	    alert("비밀번호가 일치하지 않습니다.");
	    repwd.focus();
	    return false;
	  };

	  var reg = /^[0-9]+/g; //숫자만 입력하는 정규식


	  if (email_id.value == "") {
	    alert("이메일 주소를 입력하세요.");
	    email_id.focus();
	    return false;
	  }
	  
	  var check = document.getElementById("checkservice").value;
	  
	  if(!check){
		  checkd();
	  }
		  if(check=='true'){
		  	  document.userInfo.submit();
		    }
	
	 	
	}


</script>


	<script type="text/javascript">
// 	$(document).ready(function(){
// 		var IMP = window.IMP; // 생략가능
// 		IMP.init('imp86310263'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
// 		$("#signUp").click(function(){
// 		IMP.certification(
// 						{
// 							merchant_uid : 'merchant_' + new Date().getTime(), //본인인증과 연관된 가맹점 내부 주문번호가 있다면 넘겨주세요
// 						},
// 						function(rsp) {

// 							if (rsp.success) {
// 								// 인증성공

// 								console.log(rsp.imp_uid);
// 								console.log(rsp.merchant_uid);
// 								console.log('인증성공');
// 								$.ajax({
// 									type : 'POST',
// 									url : 'certification.wp',
// 									dataType : 'json',
// 									contentType: 'application/json',
// 									data : JSON.stringify ({
// 					        			  imp_uid: rsp.imp_uid	                
// 					        		}),
// 					        		success : function(val){
// 					        			console.log(val);
// 					        			if (val == 1){
					        				
// 					        			}else{
// 					        				alert("나이 제한");
// 					        				location.href = 'index.jsp';
// 					        			}
// 					        		}
// 								}).done(function() {
// 									takeResponseAndHandle(rsp)
// 								});
								

// 							} else {
// 								// 인증취소 또는 인증실패
// 								var msg = '인증에 실패하였습니다.';
// 								msg += '에러내용 : ' + rsp.error_msg;
// 								alert(msg);
// 								location.href = 'index.jsp';
								
// 							}
// 						})
	

// 		function takeResponseAndHandle(rsp) {
// 			if (rsp.success) {
// 				// 인증성공
// 				console.log(rsp.imp_uid);
// 				console.log(rsp.merchant_uid);
// 			} else {
// 				// 인증취소 또는 인증실패
// 				var msg = '인증에 실패하였습니다.';
// 				msg += '에러내용 : ' + rsp.error_msg;

// 				alert(msg);
// 			}
// 		}
// 		});
// 	});
	</script>

	<div class="container" id="container">
		<div class="form-container sign-up-container">
			<form id="userInfo" name="userInfo" action="insertUser.wp"
				method="post">
				<h1>회원 가입</h1>
				<div class="social-container">
					<a href="#" class="social"><i class="fab fa-facebook-f"></i></a> <a
						href="#" class="social"><i class="fab fa-google-plus-g"></i></a>
				</div>
				<input type="text" id="id" name="id" placeholder="아이디"> <input
					type="button" id="idck" value="아이디 중복 확인" /> <input
					type="password" id="m_pw" name="m_pw" placeholder="비밀번호" /> <input
					type="password" id="repassword" placeholder="비밀번호 확인" /> <input
					type="email" id="m_email" name="m_email" placeholder="이메일" /> <input
					type='hidden' id='checkservice' name='checkservice' value='' />
				<button type="button" id="singupbtn" onclick="joinform_check();"
					disabled>가입하기</button>
			</form>
		</div>
		<div class="form-container sign-in-container">
			<form class="form-signin" name="loginform" action="login.wp"
				method="post">

				<h1>Sign in</h1>
				<div class="social-container">
					<a href="#" class="social"><i class="xi-kakaotalk"></i></a> <a
						href="#" class="social"><i class="xi-kakaotalk"></i></a>
				</div>
<!-- 				<span>or use your account</span>  -->
				<input name='id' placeholder="아이디" />
				<input type="password" name='m_pw' placeholder="Password" /> <a
					href="forgotinfo.wp">아이디/비밀번호 찾기</a>
				<button>Sign In</button>
			</form>
		</div>
		<div class="overlay-container">
			<div class="overlay">
				<div class="overlay-panel overlay-left">
					<div style="text-align: center;">
						<a class="navbar-brand"
							href="${pageContext.request.contextPath}/index.jsp">Winery</a>
					</div>
			
					<button class="ghost" id="signIn">Sign In</button>
				</div>
				<div class="overlay-panel overlay-right">
					<div style="text-align: center;">
						<a class="navbar-brand"
							href="${pageContext.request.contextPath}/index.jsp">Winery</a>
					</div>
			
					<button class="ghost" id="signUp">Sign Up</button>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
var idck = 0;
const target = document.getElementById('singupbtn');
$(function() {
    //idck 버튼을 클릭했을 때 
    $("#idck").click(function() {
        
        //userid 를 param.
        var id =  $("#id").val(); 
        $.ajax({
            async: true,
            type : 'POST',
            data : id,
            url : "idCheck.wp",
            dataType : "json",
            contentType: "application/json; charset=UTF-8",
            success : function(data) {
                if (data.cnt > 0) {
                	alert("아이디가 존재합니다. 다른 아이디를 입력해주세요.");
                	target.disabled = true;
                	
                } else {
                    alert("사용가능한 아이디입니다.");
                    target.disabled = false;
                    idck = 1;
                }
            },
            error : function(error) {
                
                alert("error : " + error);
            }
        });
    });
});

</script>
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


	<script type="text/javascript">
const signUpButton = document.getElementById('signUp');
const signInButton = document.getElementById('signIn');
const container = document.getElementById('container');

signUpButton.addEventListener('click', () => {
  container.classList.add("right-panel-active");
});

signInButton.addEventListener('click', () => {
  container.classList.remove("right-panel-active");
});
</script>
<%-- 	<%@ include file="/footer.jsp"%> --%>
</body>
</html>