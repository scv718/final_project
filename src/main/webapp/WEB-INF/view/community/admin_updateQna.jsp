<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>1:1 답변 수정</title>
 <%@ include file="../../../header.jsp"%>
<link rel="canonical"
	href="https://getbootstrap.kr/docs/4.5.2/examples/carousel/">

<link
	href="https://getbootstrap.kr/docs/4.5.2/dist/css/bootstrap.min.css"
	rel="stylesheet">

    <!-- include libraries(jQuery, bootstrap) -->
<link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

</head>
<body class="d-flex flex-column min-vh-100">
	<div class="jumbotron">
		<h1>1:1 답변 수정</h1>
	</div>

	<div class="container-fluid">
		<div>
			<input type="hidden" class="form-control" name="commu_cat" value="2">
			<div class="input-group mb-3">
				<div class="input-group-prepend">
					<span class="input-group-text">문의자</span>
				</div>
				<input type="text" class="form-control" name="id" value="${community.id}" readonly>
			</div>
			
			<fieldset class="form-group">
				<div class="row">
					<legend class="col-form-label col-sm-2 pt-0">문의유형</legend>
					<div class="col-sm-10">
						<div class="form-check">
						 <c:choose>
						<c:when test="${community.faq_cat eq '0'}">
							<span>[주문/결제/배송]</span>
						</c:when>
						<c:when test="${community.faq_cat eq '1'}">
							<span>[취소/교환/환불]</span>
						</c:when>
						<c:when test="${community.faq_cat eq '2'}">
							<span>[구독서비스]</span>
						</c:when>
						<c:when test="${community.faq_cat eq '3'}">
							<span>[회원]</span>
						</c:when>
						<c:otherwise>
							<span>[기타]</span>
						</c:otherwise>
					</c:choose>
						</div>	
					</div>
				</div>
			</fieldset>
			<div class="input-group mb-3">
				<div class="input-group-prepend">
					<span class="input-group-text">제목</span>
				</div>
				<input type="text" class="form-control" name="commu_title" value="${community.commu_title}" readonly required>
			</div>
						<div class="input-group mb-3">
				<div class="input-group-prepend">
					<span class="input-group-text">내용</span>
				</div>
<%-- 				 <textarea id="summernote" name="commu_content" readonly>${community.commu_content}</textarea> --%>
				<textarea class="form-control" rows="10" id="comment" name="commu_content" disabled></textarea>
			</div>
			<form action="admin_updateQna.wp" method="post" enctype="multipart/form-data">
			<input type="hidden" class="form-control" name="commu_no" value="${community.commu_no}">
			<input type="text" class="form-control innm" name="id" value="<%=session.getAttribute("userID").toString() %>" readonly>
			<div class="input-group mb-3">
				<div class="input-group-prepend">
					<span class="input-group-text">답변내용</span>
				</div>
				<input type="text" class="form-control" name="answer_con" value="${community.answer_con}">
			</div>
			<div id="footer">
				<div id="se2_sample" style="margin: 10px 0;">
					<input type="submit" value="수정하기">
				</div>
			</div>
			</form>
		</div>
	</div>

  <%@ include file="../../../footer.jsp" %>
</body>
</html>