<%@ page contentType="text/html; charset=utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/mypage.css">
</head>
<script type="text/javascript">
function joinform_check() {

	
	  var uid = document.getElementById("id");
	  var pwd = document.getElementById("m_pw");
	  var repwd = document.getElementById("repassword");
	  var email_id = document.getElementById("m_email");
	  
	  var idCheck = /^[a-zA-Z0-9_!?@]{4,11}$/;
		
	  
	  if (uid.value == "") { 
	    alert("아이디를 입력하세요.");
	    uid.focus(); 
	    return false;
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
	  
	  document.userInfo.submit();
	 	
	}

</script>
<script type="text/javascript">
	$(document).ready(function(){
		var IMP = window.IMP; // 생략가능
		IMP.init('imp86310263'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
		$("#phoneCertification").click(function(){
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
					        				location.href = 'index.jsp';
					        			}else{
					        				alert("나이 제한");
					        				location.href = 'index.jsp';
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
								location.href = 'index.jsp';
								
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
<body class = "d-flex flex-column min-vh-100">
<%@ include file="/header.jsp"%>

	<div class="greenContainer">
		<div class=".image-box">
			<div>
				<div>
					<div class="name">등급 : ${UsserVO.lavel}</div>
				</div>
				<div class="name">
					<div class="name">${userName}님</div>
				</div>
			</div>
		</div>
		</div>
		
		<div style = "width: 500px; margin: 0 auto; margin-top: 50px; margin-bottom: 50px;">
			<div class="mb-3">
			<form id="userInfo" name="userInfo">
  			<label class="form-label">아이디 </label>
  			<input class="form-control" id="id" name = "id" value = "${vo.id}" disabled="disabled">
  			<label class="form-label">비밀번호 </label>
  			<input type = "password" class="form-control" id="m_pw" name = "m_pw" value = "${vo.m_pw}">
  			<label class="form-label">비밀번호 확인 </label>
  			<input  type = "password" class="form-control" id="repassword" name = "repassword" value = "${vo.m_pw}">
  			<label class="form-label">휴대폰 </label>
  			<input type = "tel" class="form-control" id="m_phone" name = "m_phone" value = "${vo.m_phone}">
  			<button class "btn btn-danger" id ="phoneCertification">휴대폰 본인인증</button>
  			<label class="form-label">이메일 </label>
  			<input type = "tel" class="form-control" id="m_phone" name = "m_phone" value = "${vo.m_email}">
  			<button class="btn btn-danger" onclick="joinform_check();" style = "margin-top: 23px;">확인</button>
  			</form>
		</div>
		</div>
		
		<%@ include file="/footer.jsp"%>
</body>
</html>