<%@ page contentType="text/html; charset=utf-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/userinfofind.css" />
	<script type="text/javascript"
	src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript"
	src="https://cdn.iamport.kr/js/iamport.payment-1.1.8.js"></script>
</head>
<body class = "d-flex flex-column min-vh-100">
<%@ include file="/header.jsp"%>
<script type="text/javascript">
	$(document).ready(function(){
		var IMP = window.IMP; // 생략가능
		IMP.init('imp86310263'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
		$("#forgotpw").click(function(){
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
									url : 'forgotPw.wp',
									dataType : 'json',
									contentType: 'application/json',
									data : JSON.stringify ({
					        			  imp_uid: rsp.imp_uid	                
					        		}),
					        		success : function(val){
					        			console.log(val);
					        			if (val == 1){
					        				$('.pw').show();
					        			}else{
					        				alert("회원가입 후 진행해주세요");
					        				location.href = 'signUp.wp';
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
	<script type="text/javascript">
	
	function joinform_check() {
	  var pwd = document.getElementById("m_pw");
	  var repwd = document.getElementById("repassword");
	  
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
	  
	  document.userInfo.submit();
	};
	</script>
	<ul class="nav nav-tabs nav-justified" id = "menu">
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
								<button id = "forgotpw" class = "btn btn-dark">비밀번호 찾기</button>
								<div class = "pw">
								<form action="changePw.wp" id="userInfo" name="userInfo" method="post">
								<input type="password"  id="m_pw" name="m_pw" placeholder="비밀번호" /> 
								<input type="password"  id="repassword" placeholder="비밀번호 확인" />
								<button type="button" class = "btn btn-dark" onclick="joinform_check();" >확인</button>
								</form>
								</div>
							</div>
						</div>
						
						<%@ include file="/footer.jsp"%>
</body>
</html>