<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.io.PrintWriter"%>


<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>

<script src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>


<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/header.css">

	<ul class="navbar-nav" id="loginform">
		<c:choose>
			<c:when test='${userID ne NULL}'>
				<ul class="navbar-nav nav-right">
					<li class="nav-item"><a class="nav-link">${userName}님</a></li>
					<li class="nav-item"><a id = "loginLang" class="nav-link" href="logout.do">Logout</a>
					</li>
				</ul>
			</c:when>
			<c:otherwise>
				<ul class="navbar-nav nav-right">
					<li class="nav-item"><a id = "loginLang" class="nav-link" href="loginForm.do">Login</a>
					</li>
				</ul>
			</c:otherwise>
		</c:choose>
	</ul>
<div style = "text-align: center;">
<a class="navbar-brand" href="${pageContext.request.contextPath}/index.jsp">Woody</a>

</div>

<nav class="navbar navbar-expand-sm bg-white navbar-light ">

	<ul class="navbar-nav" id="upmenu">
		<li><a id = "menuBtn" class="dropdown-item" href="introDuce.do" >와인소개</a></li>
		<li><a id = "menuBtn" class="dropdown-item" href="wineSearch.do">와인검색</a></li>
		<li><a id = "menuBtn" class="dropdown-item" href="subscribe.do">구독하기</a></li>
		<li><a id = "menuBtn" class="dropdown-item" href="member.jsp">커뮤니티</a></li>
	</ul>





</nav>


