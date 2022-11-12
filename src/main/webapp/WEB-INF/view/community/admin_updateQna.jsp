<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>1:1 답변 수정</title>
 <%@ include file="../../../header.jsp"%>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/admin_insertQna.css" />

</head>
<body class="d-flex flex-column min-vh-100">
	<div id="communityContainer">
		<h1 id="comtitle">1:1 답변 수정</h1>
		<form action="admin_updateQna.wp" method="post" enctype="multipart/form-data" id="dataForm">
			<input type="hidden" name="commu_no" value="${community.commu_no}">
<!-- 			<input type="hidden" name="commu_cat" value="2"> -->
			<div class="li_board">
				<ul>
					<li class="col1">문의자</li>
					<li class="col2">${community.id}</li>
				</ul>
				<ul>
					<li class="col1">문의유형</li>
					<li class="col2"><c:choose>
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
						</c:choose></li>
				</ul>
				<ul>
					<li class="col1">제목</li>
					<li class="col2">${community.commu_title}</li>
				</ul>
				<ul>
					<li class="col1">문의내용</li>
					<li class="col2"><textarea class="form-none" rows="10"
							disabled>${community.commu_content}</textarea></li>
				</ul>

				<ul>
					<li class="col1">파일첨부</li>
					<li class="col2"><c:if
							test="${community.commu_photo1 ne NULL}">
							<img class="imgBoxImg"
								src="resources/img/qna/${community.commu_photo1}"
								style="width: 200px; padding: 10px 0;">
							<c:if test="${community.commu_photo2 ne NULL}">
								<img class="imgBoxImg"
									src="resources/img/qna/${community.commu_photo2}"
									style="width: 200px; padding: 10px 0;">
								<c:if test="${community.commu_photo3 ne NULL}">
									<img class="imgBoxImg"
										src="resources/img/qna/${community.commu_photo3}"
										style="width: 200px; padding: 10px 0;">
								</c:if>
							</c:if>
						</c:if></li>
				</ul>


				<ul>
					<li class="col1">작성자</li>
					<li class="col2"><input type="text" class="form-none"
						name="id" value="<%=session.getAttribute("userID").toString() %>"
						readonly></li>
				</ul>
				<ul>
					<li class="col1">답변내용</li>
					<li class="col2"><textarea class="form-content" rows="10"
							name="answer_con" placeholder="답변을 입력하세요." required>${community.answer_con}</textarea>
					<li>
				</ul>
			</div>
			<div id="bottom_btn">
				<button type="button" class="backbtn" onclick="location.href='admin_getQnaList.wp'">취소하기</button>
				<button type="submit" class="insertbtn">답변수정</button>
			</div>
		</form>
	</div>

  <%@ include file="../../../footer.jsp" %>
</body>
</html>