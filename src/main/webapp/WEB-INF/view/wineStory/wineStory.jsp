<%@ page contentType="text/html; charset=utf-8"%>
<!DOCTYPE html>
<html>
<head>
<title>와이너리 | 와인이야기</title>
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
		<img class="down-arrow" src="resources/img/와인스토리-1(와인셀러3).jpg"/>
		<div id="text-p">
			<p>
				와인을 잘 모르시겠다구요? <br> <br> <br>와인에 대한 이야기를 들려 드립니다. <br>
				<br> <br> 와인 어렵지 않아요.
			</p>
			<a href="wineStory1.wp">
				<button type="button" id="colre"
					class="btn btn-lg btn-outline-primary">와인이란?</button>
			</a> <a href="wineStory2.wp">
				<button type="button" id="colre"
					class="btn btn-lg btn-outline-primary">구분하는법</button>
			</a> <a href="wineStory3.wp">
				<button type="button" id="colre"
					class="btn btn-lg btn-outline-primary">곁들일 레시피</button>
			</a>
			
			
		</div>
		
	</div>

	<%@ include file="/footer.jsp"%>
</body>

</html>
