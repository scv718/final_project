<%@ page contentType="text/html; charset=utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script type="text/javascript">
	function check() {
		var uid = document.getElementById("userID");
		 if (userID.LEVEL > 0) {
			alert("이미 구독 중입니다.");
			alert("구독 취소 후 다시 구독해 주세요.");
			return false;
		}			
	}
</script>
</head>

<body>
	<%@ include file="../../../header.jsp"%>

	<form action="insertSubscribe1.wp" method="post">
		<button  type="submit" class="btn btn-primary"
			onclick='check()'>입문자 구독</button>
	</form>

	<form action="insertSubscribe2.wp" method="post">
		<button type="submit" class="btn btn-primary"
			onclick='check()'>마니아 구독</button>
	</form>

	<form action="insertSubscribe3.wp" method="post">
		<button  type="submit" class="btn btn-primary"
			onclick='check()'>마스터 구독</button>
	</form>

	<form action="updateSubscribe.wp" method="post">
		<button  type="submit" class="btn btn-primary"
			onclick='check()'>구독 취소</button>
	</form>


	<%@ include file="/footer.jsp"%>
</body>
</html>