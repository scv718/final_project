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
	<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
</head>

<body class="d-flex flex-column min-vh-100">
	<script type="text/javascript">
	function kakaoLogin() {

	    $.ajax({
	        url: '/getAuthUrl.wp',
	        type: 'get',
	        async: false,
	        dataType: 'text',
	        success: function (res) {
	            location.href = res;
	        }
	    });

	  }
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
	function nBtn(){
		location.href = "/getNaverAuthUrl.wp";
	}
</script>
	<script type="text/javascript">
	$(document).ready(function(){
		var IMP = window.IMP; // 생략가능
		IMP.init('imp86310263'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
		$("#signUp").click(function(){
		IMP.certification(
						{
							merchant_uid : 'merchant_' + new Date().getTime(), //본인인증과 연관된 가맹점 내부 주문번호가 있다면 넘겨주세요
						},
						function(rsp) {

							if (rsp.success) {
								// 인증성공

								console.log(rsp.imp_uid);
								console.log(rsp.merchant_uid);
								console.log('인증성공');
								$.ajax({
									type : 'POST',
									url : 'certification.wp',
									dataType : 'json',
									contentType: 'application/json',
									data : JSON.stringify ({
					        			  imp_uid: rsp.imp_uid	                
					        		}),
					        		success : function(val){
					        			console.log(val);
					        			if (val == 1){
					        				
					        			}else if(val = 2){
					        				alert("이미 가입된 사용자입니다.")
					        				location.href = 'index.wp';
					        			}else{
					        				alert("나이 제한");
					        				location.href = 'index.wp';
					        			}
					        		}
								}).done(function() {
									takeResponseAndHandle(rsp)
								});
								

							} else {
								// 인증취소 또는 인증실패
								var msg = '인증에 실패하였습니다.';
								msg += '에러내용 : ' + rsp.error_msg;
								alert(msg);
								location.href = 'index.wp';
								
							}
						})
	

		function takeResponseAndHandle(rsp) {
			if (rsp.success) {
				// 인증성공
				console.log(rsp.imp_uid);
				console.log(rsp.merchant_uid);
			} else {
				// 인증취소 또는 인증실패
				var msg = '인증에 실패하였습니다.';
				msg += '에러내용 : ' + rsp.error_msg;

				alert(msg);
			}
		}
		});
	});
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
					<a href="#" id = "btn-kakao-login" class="social" onclick="kakaoLogin();"><i class="xi-kakaotalk"></i></a>

					<a href="#" id="naver_id_login" onclick="nBtn()" class="social"><i class="xi-naver"></i></a>
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
							href="${pageContext.request.contextPath}/index.wp">Winery</a>
					</div>
			
					<button class="ghost" id="signIn">Sign In</button>
				</div>
				<div class="overlay-panel overlay-right">
					<div style="text-align: center;">
						<a class="navbar-brand"
							href="${pageContext.request.contextPath}/index.wp">Winery</a>
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