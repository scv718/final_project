<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>1:1 문의 수정하기</title>
 <%@ include file="../../../header.jsp"%>
<script src="resources/js/qna_update_fileupload.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/qna.css" />
</head>
<body class="d-flex flex-column min-vh-100">
	<div id="communityContainer">
		<h3 id="comtitle">1:1문의 수정</h3>
		<p>문의하신 사항은 성실하게 답변드리겠습니다.</p>
		<p>문의하시기 전에 FAQ를 참고해주세요.</p>
		
			<form name="dataForm" id="dataForm">
				<input type="hidden" class="form-control" name="commu_cat" value="2">
				<input type="hidden" class="form-control" name="commu_no" value="${community.commu_no}">
			<div class="li_board">
				<ul>
					<li class="col1">작성자</li>
					<li class="col2"><input type="text" class="name" name="id"
						value="<%=session.getAttribute("userID").toString() %>" readonly></li>
				</ul>

				<ul>
					<li class="col1">문의유형</li>
					<li class="col2"><c:choose>
							<c:when test="${community.faq_cat eq '0'}">
								<label><input class="" type="radio" name="faq_cat"
									id="gridRadios1" value="0" checked>주문/결제/배송</label>
								<label><input class="" type="radio" name="faq_cat"
									id="gridRadios2" value="1">취소/교환/환불</label>
								<label><input class="" type="radio" name="faq_cat"
									id="gridRadios3" value="2">구독서비스</label>
								<label><input class="" type="radio" name="faq_cat"
									id="gridRadios4" value="3">회원</label>
								<label><input class="" type="radio" name="faq_cat"
									id="gridRadios5" value="4">기타</label>
							</c:when>
							<c:when test="${community.faq_cat eq '1'}">
								<label><input class="" type="radio" name="faq_cat"
									id="gridRadios1" value="0">주문/결제/배송</label>
								<label><input class="" type="radio" name="faq_cat"
									id="gridRadios2" value="1" checked>취소/교환/환불</label>
								<label><input class="" type="radio" name="faq_cat"
									id="gridRadios3" value="2">구독서비스</label>
								<label><input class="" type="radio" name="faq_cat"
									id="gridRadios4" value="3">회원</label>
								<label><input class="" type="radio" name="faq_cat"
									id="gridRadios5" value="4">기타</label>
							</c:when>
							<c:when test="${community.faq_cat eq '2'}">
								<label><input class="" type="radio" name="faq_cat"
									id="gridRadios1" value="0">주문/결제/배송</label>
								<label><input class="" type="radio" name="faq_cat"
									id="gridRadios2" value="1">취소/교환/환불</label>
								<label><input class="" type="radio" name="faq_cat"
									id="gridRadios3" value="2" checked>구독서비스</label>
								<label><input class="" type="radio" name="faq_cat"
									id="gridRadios4" value="3">회원</label>
								<label><input class="" type="radio" name="faq_cat"
									id="gridRadios5" value="4">기타</label>
							</c:when>
							<c:when test="${community.faq_cat eq '3'}">
								<label><input class="" type="radio" name="faq_cat"
									id="gridRadios1" value="0">주문/결제/배송</label>
								<label><input class="" type="radio" name="faq_cat"
									id="gridRadios2" value="1">취소/교환/환불</label>
								<label><input class="" type="radio" name="faq_cat"
									id="gridRadios3" value="2">구독서비스</label>
								<label><input class="" type="radio" name="faq_cat"
									id="gridRadios4" value="3" checked>회원</label>
								<label><input class="" type="radio" name="faq_cat"
									id="gridRadios5" value="4">기타</label>
							</c:when>
							<c:when test="${community.faq_cat eq '4'}">
								<label><input class="" type="radio" name="faq_cat"
									id="gridRadios1" value="0">주문/결제/배송</label>
								<label><input class="" type="radio" name="faq_cat"
									id="gridRadios2" value="1">취소/교환/환불</label>
								<label><input class="" type="radio" name="faq_cat"
									id="gridRadios3" value="2">구독서비스</label>
								<label><input class="" type="radio" name="faq_cat"
									id="gridRadios4" value="3">회원</label>
								<label><input class="" type="radio" name="faq_cat"
									id="gridRadios5" value="4" checked>기타</label>
							</c:when>
						</c:choose></li>
				</ul>
				<ul>
					<li class="col1">제목</li>
					<li class="col2"><input type="text" class="form-content"
						name="commu_title" value="${community.commu_title}" required>
					</li>
				</ul>
				<ul>
					<li class="col1">문의내용</li>
					<li class="col2"><textarea class="form-content" rows="10"
							id="comment" name="commu_content">${community.commu_content}</textarea>
					</li>
				</ul>
				<ul>
					<li class="col1">파일첨부</li>
					<li class="col2">
						<button id="filebtn" type="button" name="commu_photo1">파일추가</button>
						<input id="inputfile" type="file" multiple="multiple"> <span
						style="font-size: 14px; color: gray;">※파일은 최대 3개까지 등록
							가능합니다.</span>
						<div class="data_file_txt" id="data_file_txt">
							<div id="articlefileChange"></div>
						</div>
					</li>
				</ul>
			</div>
			<div id="bottom_btn">
					<button type="button" class="backbtn" onclick="location.href='javascript:window.history.back();'">취소하기</button>
					<button type="button" class="insertbtn" onclick="registerAction()">수정하기</button>
				</div>
			</form>
		</div>

	<%@ include file="../../../footer.jsp" %>
</body>
</html>