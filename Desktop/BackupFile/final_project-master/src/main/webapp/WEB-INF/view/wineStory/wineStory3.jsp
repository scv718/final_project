<%@ page contentType="text/html; charset=utf-8"%>

<!DOCTYPE html>
<html>
<head>
<title>와인이 들려주는 이야기를 들어보세요.</title>

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/story.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
</head>

<body class="d-flex flex-column min-vh-100">

	<%@ include file="../../../header.jsp"%>

	<div id="t1">
		<img class="down-arrow" src="resources/img/rosewine1.jpg" />
		<div id="text-p">
			<p>
				레시피를 소개 합니다. 
			</p>
			
		</div>
	</div>

	

	<%@ include file="/footer.jsp"%>
</body>
 
</html>
