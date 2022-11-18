<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!doctype html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<meta name="description" content="">
<meta name="author" content="Mark Otto, Jacob Thornton, 그리고 Bootstrap 기여자들">
<meta name="generator" content="Hugo 0.104.2">
<link rel="stylesheet"   href="${pageContext.request.contextPath}/resources/css/admin_insertNotice.css"/>
<title>공지사항 등록 - 관리자</title>
<!-- <link rel="canonical" href="https://getbootstrap.kr/docs/5.2/examples/carousel/">
<link href="https://getbootstrap.kr/docs/5.2/dist/css/bootstrap.min.css" rel="stylesheet"> -->
 <%@ include file="../../../header.jsp"%>
</head>

<body class="d-flex flex-column min-vh-100">
	<div id="communityContainer">
		<h1 id="comtitle">공지사항 글 등록</h1>

		<div class="container-fluid">
			<form action="admin_insertNotice.wp" method="post" id="dataForm">
				<input type="hidden" class="form-control" name="commu_cat" value="0">

				<div class="li_board">
					<ul>
						<li class="col1">작성자</li>
						<li class="col2"><input type="text" class="name" name="id" value="admin" readonly></li>
					</ul>

					<ul>
						<li class="col1">제목</li>
						<li class="col2"><input type="text" class="form-content" name="commu_title" required></li>
					</ul>

					<ul>
						<li class="col1">내용</li>
						<li class="col2"><textarea class="form-content" rows="10" id="comment" name="commu_content" required></textarea></li>
					</ul>
				</div>

				<div id="bottom_btn">
					<div id="se2_sample" style="margin: 10px 0;">
						<input type="submit" class="insertbtn" value="글 등록">
					</div>
				</div>

			</form>
		</div>
	</div>
</body>
</html>