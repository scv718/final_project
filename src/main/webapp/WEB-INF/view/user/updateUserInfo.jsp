<%@ page contentType="text/html; charset=utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/mypage.css">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script type="text/javascript"
	src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript"
	src="https://cdn.iamport.kr/js/iamport.payment-1.1.8.js"></script>
</head>
<style>
.btn{
	margin-bottom: 20px;
	margin-top: 20px;
	background-color: #F87171 !important;
	color: white !important;
}
.btn-danger {
    color: #fff;
    background-color: #dc3545 !important;
    border-color: #dc3545 !important;
}
.btn-danger:hover {
    color: #fff;
    background-color: #c82333 !important;
    border-color: #bd2130 !important;
}

.btn:hover{
	background-color: #ff6060 !important;
}
</style>
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
									url : 'phoneCertification.wp',
									dataType : 'json',
									contentType: 'application/json',
									data : JSON.stringify ({
					        			  imp_uid: rsp.imp_uid,
					        			  m_phone : document.getElementById("m_phone").value
					        		}),
					        		success : function(val){
					        			console.log(val);
					        			if (val == 1){
					        				 $('#phone_check').val('true');
					        			}else{
					        				alert('본인 명의 휴대폰으로 진행해주세요.');
					        				 $('#m_phone').val(${vo.m_phone});
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



<body class="d-flex flex-column min-vh-100">
	<script type="text/javascript">

$(document).ready(function(){
	 var new_email = document.getElementById("m_email");
	 $("#m_email").keydown(function(e){
		 new_email = document.getElementById("m_email");
		});
	 
	 var new_phone = document.getElementById("m_phone");
	 
	 $("#m_phone").keydown(function(e){
		 new_phone = document.getElementById("m_phone");
		});
	 
$('#update').click(function() {

	  var uid = document.getElementById("id");
	  var pwd = document.getElementById("m_pw");
	  var repwd = document.getElementById("repassword");
	  var phone = '${vo.m_phone}';
	  var email_id = '${vo.m_email}';
	  var email_check = document.getElementById("email_check");
	  var phone_check = document.getElementById("phone_check"); 
	  var regPhone = /^01([0|1|6|7|8|9])-?([0-9]{3,4})-?([0-9]{4})$/;
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
		  
		  if(phone_check.value == ''){
			  if (!regPhone.test(new_phone.value) ) {
				    alert("휴대폰번호 11자리 혹은 숫자 및 - 만 가능합니다.");
				    console.log(phone);
				    console.log(new_phone);
				    document.getElementById("m_phone").focus();
				    return false;
				};
		  }
	
		 
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
	    document.getElementById("m_email").focus();
	    return false;
	  }
	  
	  if(phone !== new_phone.value){
		  console.log(phone+'원래값');
		  console.log(new_phone.value+'새로받은값');
 
		  if(phone_check.value == ''){
			  alert("인증 후 진행해주세요");
			  console.log(phone_check.value);
			  return false;
		  }
	  }
	  
	  if(email_id !== new_email.value){
		  console.log(email_id+'원래값');
		  console.log(new_email.value+'새로받은값');
 
		  if(email_check.value == ''){
			  alert("인증 후 진행해주세요");
			  console.log(email_check.value);
			  return false;
		  }
	  }
	  

	  
	  document.userInfo.submit();
	 	
	});
});
</script>
	<script>
$(function() {
    var emailRegex = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
    var email = $("#m_email");
    $("#sendMail").on( "click", function() {
        if (email == "") {
           alert("이메일을 입력하지 않았습니다.");
        } else {
           if (!(emailRegex.test(email.val()))) {
              alert("이메일 입력이 제대로 되지 않았습니다.");
              return false;
           }
           $.ajax({
              type : 'POST',
              url : 'email_Send.wp',
              dataType : 'json',
			  contentType: 'application/json',
			  data : JSON.stringify({
            	   m_email : document.getElementById("m_email").value
            	  }),
              success : function(data) {
            	  if(data==1){
            		  alert("인증번호를 발송했습니다.");
            		  $("#emailCheck").removeAttr("disabled");
            	  }else{
            		  alert("인증번호가 발송되지 않았습니다.");
            	  }
              },
              error : function(request, status) {
                 alert("오류가 발생했습니다.");
              }
           });
        }
     });
 });
 
$(document).ready(function(){
$("#check").on("click", function() {
    var emailCheck = $("#emailCheck").val();
    var email_check = false;
    if (emailCheck == "") {
       alert("인증번호를 입력하지 않았습니다.");
    } else {
       $.ajax({
          type : 'POST',
          url : 'email_Check.wp',
          data : { emailCheck : emailCheck},
          success : function(data) {
             if (data == true) {
                alert("인증되었습니다.");
                $('#email_check').val('true');
             } else {
                alert("인증번호가 일치하지 않습니다.");
             }
          },
          error : function(request, status) {
             alert("오류가 발생했습니다.");
          }
       });
    };
 });
});
</script>


	<%@ include file="/header.jsp"%>

	<div class="greenContainer">
		<div class=".image-box">
			<div>
				<div class="name">
					<div class="name">${userName}님</div>
				</div>
			</div>
		</div>
	</div>

	<div id = "updateform">
		<div class="mb-3">
			<form id="userInfo" id = "userInfo" name="userInfo" action="userEdit.wp"
				method="post">
				<label class="form-label">아이디 </label> <input class="form-control"
					id="id" name="id" value="${vo.id}" disabled="disabled"> <label
					class="form-label">비밀번호 </label> <input type="password"
					class="form-control" id="m_pw" name="m_pw" value="${vo.m_pw}">
				<label class="form-label">비밀번호 확인 </label> <input type="password"
					class="form-control" id="repassword" name="repassword"
					value="${vo.m_pw}"> <label class="form-label">휴대폰 </label>
				<input type="tel" class="form-control" id="m_phone" name="m_phone"
					value="${vo.m_phone}">
				<button type="button" class="btn" id="phoneCertification">휴대폰
					본인인증</button>
				<br> <label class="form-label">이메일 </label><br> <input
					type="tel" class="form-control" id="m_email" name="m_email"
					value="${vo.m_email}">
				<button type="button" class="btn" id="sendMail">이메일
					본인인증</button>
				<div class="text_box" id="cert">
					<input id='emailCheck' class='text_box' type='text' required
						disabled>
					<button type="button" id='check' class="btn">인증확인</button>
					<input type="hidden" id="email_check" name="email_check">
					<input type="hidden" id="phone_check" name="email_check">
				</div>

				<button type="button" id = "update" class="btn"  style="margin-top: 23px;">확인</button>
				<button type="button" id = "deleteUser" class="btn btn-danger"  style="margin-top: 23px; float: right;">탈퇴하기</button>
			</form>
		</div>
	</div>
<script type="text/javascript">

$('#deleteUser').on('click', function () {
	var delete_check = confirm("탈퇴 하시겠습니까?");
	if(delete_check == true){
	  location.href = 'deleteUser.wp';
	}
	else if(delete_check == false){
	  
	};
	
});

</script>
	<%@ include file="/footer.jsp"%>
</body>
</html>