<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.SQLException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
Connection conn = null;
PreparedStatement pstmt = null;
ResultSet rs = null;
%>
<!DOCTYPE html>
<html>
<head>
<title>와인 정보 페이지</title>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<script>
	var request = new XMLHttpRequest();
	var para = document.location.href.split("=");
	var isbn = para[1]

	function outBookAction() {
		var url = "outbook.inout?isbn=" + isbn;
		try {
			request.onreadystatechange = function() {
				if (request.readyState == 4) {
					var val = request.responseText;
					document.getElementById('mylocation').innerHTML = val;
				}
			}//end of function  
			request.open("post", url, true);
			request.send();
		} catch (e) {
			alert("서버 연결 에러");
		}
	}

	function inBookAction() {
		var url = "inbook.inout?isbn=" + isbn;
		try {
			request.onreadystatechange = function() {
				if (request.readyState == 4) {
					var val = request.responseText;
					document.getElementById('mylocation').innerHTML = val;
				}
			}//end of function  
			request.open("post", url, true);
			request.send();

		} catch (e) {
			alert("서버 연결 에러");
		}
	}
	$(document).ready(function() {
		$('#btn_notlogin').click(notlogin);
	});
	function notlogin() {
		alert("로그인 후 진행 해 주시기 바랍니다.");
		location.href = "login.jsp"

	};
</script>

</head>
<body class="d-flex flex-column min-vh-100 search">
<%@ include file="../../../header.jsp"%>
	<div class="container">
		<%
		try {
			HttpSession session1 = request.getSession();
			String id1 = (String) session1.getAttribute("id");
			String isbn = request.getParameter("isbn");
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "test", "1111"); //username, password는 개인 Oracle 계정의 것으로 하면 됨

			String sql = "select * from books where isbn = " + isbn;
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			rs.next();

			out.print("<div class='row my-3 p-5 search-detail'><div class='col-lg-3'><img src=./images/" + rs.getString(9)
			+ " width='200' height='280'></div><div class='col-lg-9'><div class='row mb-3'>" + rs.getString(2)
			+ "</div><div class='row mb-3'>저자 : " + rs.getString(3) + "</div><div class='row mb-3'>출판사 : "
			+ rs.getString(4) + "</div><div class='row mb-3'>발행년도 : " + rs.getString(5).substring(0,10)
			+ "</div><div class='row mb-3'>ISBN : " + rs.getString(1) + "</div><div class='row'>대출상태 : ");
			int stock = Integer.parseInt(rs.getString(7));
			if (stock == 0) {
				out.print("대출 불가(재고 없음)");
			} else {
				out.print("대여 가능");
			}
			out.print("</div></div></div>");

			rs.close();
			pstmt.close();
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
			rs.close();
				if (pstmt != null)
			pstmt.close();
				if (conn != null)
			conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
// 		if (id != null) {
		%>
		<div class='row mx-5 search-detail-btn'>
			<div class='btn' role='group'>
				<button type='button' class='btn mr-2 borrow' id='btn_outbook'
					onclick='outBookAction()' style='font-size: 22px'>대여</button>
				<button type='button' class='btn return' id='btn_inbook'
					onclick='inBookAction()' style='font-size: 22px'>반납</button>
			</div>
		</div>
		<%
// 		} else {
		%>
		<div class='row mx-5 search-detail-btn'>
			<div class='btn' role='group'>
				<button type="button" class="btn mr-2 borrow" id="btn_notlogin"
					style="font-size: 22px;">대여</button>
				<button type="button" class="btn return" id="btn_notlogin"
					style="font-size: 22px;">반납</button>
			</div>
		</div>

		<%
// 		}
		%>

		<div>
			<span id="mylocation"></span>
		</div>

	</div>

	<div class="container">
		<nav aria-label="Page navigation">
			<ul class="pagination" id="pagination"></ul>
		</nav>
	</div>
<%@ include file="../../../footer.jsp" %>
</body>
</html>