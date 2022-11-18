<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/faq_qna_List.css" />
<title>와이너리 | 1:1 문의</title>
<%@ include file="../../../header.jsp"%>

</head>

<body class="d-flex flex-column min-vh-100">

	<div id="qnaContainer">
		<!-- 제목 -->
		<h3 id="comtitle">1:1 문의게시판</h3>
		<p>자주 묻는 질문에서 답을 찾기 어려우시거나, 궁금한점을 남겨주세요.</p>
		<p>운영시간에 빠르게 확인하여 답변드리도록 하겠습니다.</p>
		
		<button type="button" class="qna_btn" onclick="location.href='insertQna_get.wp'">1:1 문의글 작성</button>
		<br>
<!-- 		<button type="button" onclick="location.href='admin_getQnaList.wp'">관리자 1:1 목록확인</button> -->

		<!-- 자주하는질문 보드 -->
			<div class="li_title">
				<ul>
				<li class="title_1">문의내용</li>
				</ul>
			</div>
		<div id="accordion">
			<c:forEach var="qna" items="${getQnaList}">
				<div class="accordion">
					<c:choose>
						<c:when test="${qna.faq_cat eq '0'}">
							<span>[주문/결제/배송]</span>
						</c:when>
						<c:when test="${qna.faq_cat eq '1'}">
							<span>[취소/교환/환불]</span>
						</c:when>
						<c:when test="${qna.faq_cat eq '2'}">
							<span>[구독서비스]</span>
						</c:when>
						<c:when test="${qna.faq_cat eq '3'}">
							<span>[회원]</span>
						</c:when>
						<c:otherwise>
							<span>[기타]</span>
						</c:otherwise>
					</c:choose>
					<span>${qna.commu_title}</span>
				</div>
				<div class="panel">
					<br>
					<p>${qna.commu_content}</p>
					<div>
						<c:if test="${qna.commu_photo1 ne NULL}">
							<img class="imgBoxImg" src="resources/img/qna/${qna.commu_photo1}" style="width: 200px; padding: 10px 0;">
								<c:if test="${qna.commu_photo2 ne NULL}">
								<img class="imgBoxImg" src="resources/img/qna/${qna.commu_photo2}" style="width: 200px; padding: 10px 0;">
									<c:if test="${qna.commu_photo3 ne NULL}">
									<img class="imgBoxImg" src="resources/img/qna/${qna.commu_photo3}" style="width: 200px; padding: 10px 0;">
									</c:if>
								</c:if>
						</c:if>
					</div>
					<c:choose>
						<c:when test="${qna.answer_status eq '답변대기'}">
							<br>
						<span>
							<a href="getQna.wp?commu_no=${qna.commu_no}"><span class="material-symbols-outlined">edit</span>수정</a>
							<a id="#conDel" href="deleteQna.wp?commu_no=${qna.commu_no}" onClick="alert('삭제하시겠습니까?')">
							<span class="material-symbols-outlined">delete</span>삭제</a>
						</span>
						</c:when>
						<c:when test="${qna.answer_status eq '답변완료'}">
							<br>
							<span>
							<a id="#conDel" href="deleteQna.wp?commu_no=${qna.commu_no}" onClick="alert('삭제하시겠습니까?')">
							<span class="material-symbols-outlined">delete</span>삭제</a>
							</span>
						</c:when>
					</c:choose>
					<c:choose>
						<c:when test="${qna.answer_status eq '답변완료'}">
							<hr>
							<span>관리자&nbsp;│</span><span>${qna.answer_date}</span>
							<textarea class="addr" disabled>${qna.answer_con}</textarea>
						</c:when>
					</c:choose>
				</div>
				</c:forEach>
		</div>

		<br>
		<!-- 페이징처리 -->
		<div id="btnBox">
			<!-- 반복처리할 태그 시작 -->
			<c:if test="${paging.nowPageBtn > 1 }">
				<a href="getQnaList.wp?nowPageBtn=${paging.nowPageBtn - 1}">&lt;</a>
			</c:if>
			<c:forEach begin="${paging.startBtn}" end="${paging.endBtn}" step="1"
				var="i">
				<c:choose>
					<c:when test="${paging.nowPageBtn == i}">
						<a class="aSel">${i}</a>
					</c:when>
					<c:otherwise>
						<a href="getQnaList.wp?nowPageBtn=${i}">${i}</a>
					</c:otherwise>
				</c:choose>
			</c:forEach>
			<c:if test="${paging.nowPageBtn < paging.totalBtnCnt}">
				<a href="getQnaList.wp?nowPageBtn=${paging.nowPageBtn + 1}">&gt;</a>
			</c:if>
			<!-- 끝 -->
		</div>
		<br> <br>
	</div>
	<%@ include file="../../../footer.jsp"%>
</body>
<script>
    var acc = document.getElementsByClassName("accordion");
    var i;
 
    for (i = 0; i < acc.length; i++) {
        acc[i].addEventListener("click", function () {
            this.classList.toggle("active");
            var panel = this.nextElementSibling;
            if (panel.style.maxHeight) {
                panel.style.maxHeight = null;
            } else {
                panel.style.maxHeight = panel.scrollHeight + "px";
            }
        });
    }
    
    var txtArea = $(".addr");
    if (txtArea) {
        txtArea.each(function(){
            $(this).height(this.scrollHeight);
        });
    }
    
  </script>

</html>