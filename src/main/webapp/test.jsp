<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<style>
span.doubleChk {
	display:inline-block;
 	padding: 6px 10px; 
	background-color: #328da8;
	color: #fff;
	border-radius: 5px;
	cursor: pointer;
	vertical-align: bottom;
}
span.doubleChk:hover, span.doubleChk:active{background-color: red;}

input[type="text"] {height: 33px; margin-top: 10px;box-sizing: border-box;}
input[type="text" i] {padding: 0px;}
</style>
<script>
$(function () {
	//휴대폰 번호 인증 
	var code2 = ""; 
	$("#phoneChk").click(function(){ 
		alert("인증번호 발송이 완료되었습니다.\n휴대폰에서 인증번호 확인을 해주십시오."); 
		var phone = $("#phone").val(); 
		
		$.ajax({ 
			type:"GET", 
			url:"phoneCheck.do?phone=" + phone, 
			cache : false, 
			success:function(data){ 
				if(data == "error"){ 
					alert("휴대폰 번호가 올바르지 않습니다.") 
					$(".successPhoneChk").text("유효한 번호를 입력해주세요."); 
					$(".successPhoneChk").css("color","red"); 
					$("#phone").attr("autofocus",true); 
				}else{ 
					$("#phone2").attr("disabled",false); 
					$("#phoneChk2").css("display","inline-block"); 
					$(".successPhoneChk").text("인증번호를 입력한 뒤 본인인증을 눌러주십시오."); 
					$(".successPhoneChk").css("color","green"); 
					$("#phone").attr("readonly",true); 
					code2 = data; 
				} 
			} 
		}); 
	});
	
	$("#phoneChk2").click(function(){ 
		if($("#phone2").val() == code2){ 
			$(".successPhoneChk").text("인증번호가 일치합니다."); 
			$(".successPhoneChk").css("color","green"); 
			$("#phoneDoubleChk").val("true"); 
			$("#phone2").attr("disabled",true); 
		}else{ $(".successPhoneChk").text("인증번호가 일치하지 않습니다. 확인해주시기 바랍니다."); 
			$(".successPhoneChk").css("color","red"); 
			$("#phoneDoubleChk").val("false"); 
			$(this).attr("autofocus",true); 
		} 
	});

});
</script>
</head>
<body>
	<tr class="mobileNo">
		<th><label for="phone">휴대폰 번호</label></th>
		<td>
			<p>
				<input id="phone" type="text" name="phone" title="전화번호 입력" value="01029952928" required />
				<span id="phoneChk" class="doubleChk">인증번호 보내기</span><br /> 
				<input id="phone2" type="text" name="phone2" title="인증번호 입력" disabled required /> 
				<span id="phoneChk2" class="doubleChk">인증확인</span> 
				<span class="point successPhoneChk">휴대폰 번호 입력후 인증번호 보내기를 해주십시오.</span>
				<input type="hidden" id="phoneDoubleChk" />
			</p>
		</td>
	</tr>
</body>
</html>