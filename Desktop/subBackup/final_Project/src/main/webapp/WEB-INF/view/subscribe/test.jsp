<%@ page contentType="text/html; charset=utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>

<body>
	<%@ include file="../../../header.jsp"%>
	
	<a href="/cart.wp" role="button">cart.wp 테스트</a>

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