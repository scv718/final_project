<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head> 
<meta charset="UTF-8">
<title>와이너리 | 상품후기</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"	href="${pageContext.request.contextPath}/resources/css/detailReview.css"/>
<%@ include file="../../../header.jsp"%>
</head>
<body>
<div>
	<form action="insertReview.wp" method="post" enctype="multipart/form-data">
	</form>
</div>

<%@ include file="../../../footer.jsp"%>
</body>
</html>