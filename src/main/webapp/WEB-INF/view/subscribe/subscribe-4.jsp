<%@ page contentType="text/html; charset=utf-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
        
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>cart</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
   href="${pageContext.request.contextPath}/resources/css/cart.css">
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>
<body class = "d-flex flex-column min-vh-100">
<%@ include file="../../../header.jsp"%>

	<div class="sub4">
	<span class="sc">
	<h4>구독이 되었습니다.</h4>
	<P>구독 내역은 <a href = "subscribe-3.wp">구독 수정</a>에서 확인 할 수있습니다.</P>
	</span>
	</div>
	

<%@ include file="/footer.jsp"%>	
</body>
</html>