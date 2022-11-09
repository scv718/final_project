<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ page session="false" %>

<html>

<head>

<title>Home</title>

<script type="text/javascript" src="<c:url value="/resources/js/jquery-1.11.3.min.js"/>"></script>
<script type="text/javascript" src="<c:url value="/resources/smarteditor/js/HuskyEZCreator.js"/>" charset="utf-8"></script>

<script type="text/javascript" charset="utf-8" src="<c:url value="/resources/js/test.js"/>"></script>

<%-- <link rel="stylesheet" href="<c:url value="/resources/css/common.css"/>"/> --%>

<script type="text/javascript" charset="utf-8">

		sessionStorage.setItem("contextpath", "${pageContext.request.contextPath}");

	</script>

</head>

<body>

<form action="write" method="post" id="frm">

<table>

	<tr>

	<td>제목</td>

		<td><input type="text" name="title" id="title" placeholder="제목"></td>

	</tr>

	<tr>

			<td style="margin:0; padding:0;" colspan="2"><textarea name="smarteditor" id="smarteditor" rows="10" cols="100" style="width:100%; height:412px;"></textarea></td>

	</tr>

	</table>

	<input id="addBtn" type="submit" value="전송">

 </form>

 </body>

 </html>