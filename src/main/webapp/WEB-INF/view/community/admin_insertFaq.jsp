<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>FAQ 글쓰기</title>
<%@ include file="../../../header.jsp"%>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/admin_insertFaq.css" />

</head>
<body class="d-flex flex-column min-vh-100">
	<div id="communityContainer">
		<h1 id="comtitle">FAQ 글쓰기</h1>

		<form action="admin_insertFaq.wp" method="post" enctype="multipart/form-data" id="dataForm">
			<input type="hidden" class="form-control" name="commu_cat" value="1">
			<div class="li_board">
				<ul>
					<li class="col1">문의유형</li>
					<li class="col2"><label><input class="" type="radio"
							name="faq_cat" id="gridRadios1" value="0" checked>주문/결제/배송</label>
						<label><input class="" type="radio" name="faq_cat"
							id="gridRadios2" value="1">취소/교환/환불</label> <label><input
							class="" type="radio" name="faq_cat" id="gridRadios3" value="2">구독서비스</label>
						<label><input class="" type="radio" name="faq_cat"
							id="gridRadios4" value="3">회원</label> <label><input
							class="" type="radio" name="faq_cat" id="gridRadios5" value="4">기타</label>
					</li>
				</ul>
				<ul>
					<li class="col1">제목</li>
					<li class="col2"><input type="text" class="form-content"
						name="commu_title" id="insert_tit" placeholder="제목을 입력하세요."
						required></li>
				</ul>
				<ul>
					<li class="col1">작성자</li>
					<li class="col2"><input type="text" class="name" name="id"
						value="<%=session.getAttribute("userID").toString() %>" readonly></li>
				</ul>

				<ul>
					<li class="col1">내용</li>
					<li class="col2"><textarea class="form-content" rows="10"
							id="insert_con" name="commu_content" placeholder="내용을 입력하세요."
							required></textarea></li>
				</ul>
			</div>
			<div id="bottom_btn">
					<button type="button" class="backbtn" onclick="location.href='javascript:window.history.back();'">취소하기</button>
					<button type="submit" class="insertbtn" >등록하기</button>
				</div>
		
		</form>
	</div>

  <%@ include file="../../../footer.jsp" %>
</body>
</html>