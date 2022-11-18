<%@ page isErrorPage = "true" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page isErrorPage = "true" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
        integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<style>
@import url(//fonts.googleapis.com/earlyaccess/notosanskr.css);

.notosanskr * { 
 font-family: 'Noto Sans KR', sans-serif;
}

@font-face {
    font-family: 'SuseongDotum';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2205@1.0/SuseongDotum.woff2') format('woff2');
    font-weight: normal;
    font-style: normal;
}
p , h4 , form{text-align: center;}
</style>
<meta charset="UTF-8">
<title>404_error</title>
</head>
<body class = "d-flex flex-column min-vh-100">
<p style="font-family: 'SuseongDotum'; font-size:150px; margin-bottom:0px">ERROR</p>
<h4>NOT FOUND ..  </h4>
<br>
<form action="${pageContext.request.contextPath}/">
<input type="submit" value="메인 페이지로 돌아가기" class="btn btn-outline-dark" style="font-family: 'Noto Sans KR', sans-serif;">
</form>

</body>
</html>