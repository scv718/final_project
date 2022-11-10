<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/faq.css" />
<title>1:1 문의 목록</title>
<%@ include file="../../../header.jsp"%>
<style>
.accordion {
	background-color: #ffffff;
	cursor: pointer;
	padding: 16px;
	width: 100%;
	outline: none;
	border: none;
	text-align: left;
	font-size: 16px;
	transition: 0.4s;
}

.active, .accordion:hover {
	background-color: #f5f5f5;
	font-weight: bold;
}

.accordion:after {
	content: '\002B';
	font-weight: bold;
	float: right;
	margin-left: 5px;
}

.active:after {
	content: "\2212";
}

.panel {
	padding: 0 16px;
	background-color: #ffffff;
	max-height: 0;
	overflow: hidden;
	transition: max-height 0.2s ease-out;
	border-bottom: 1px solid #eeeeee;
}
</style>
<script>
	
</script>
</head>

<body class="d-flex flex-column min-vh-100">

	<div id="faqContainer">
		<!-- 제목 -->
		<h3 id="comtitle">1:1 문의</h3>
		<button type="button" onclick="location.href='insertQna_get.wp'">1:1
			문의하기</button>
		<button type="button" onclick="location.href='admin_getQnaList.wp'">관리자 1:1 목록확인</button>

		<!-- 필터 -->
		<form action="getQnaList.wp" method="POST" id="align">
			<ul>
				<li>
				<select name="alignlist" class="w-px100" onchange="$('form').submit()">
						<option>자주 찾는 검색어</option>
						<option value="zero" ${paging.viewType eq 'zero' ? 'selected' : '' }>[주문/결제/배송]</option>
						<option value="one" ${paging.viewType eq 'one' ? 'selected' : '' }>[취소/교환/환불]</option>
						<option value="two" ${paging.viewType eq 'two' ? 'selected' : '' }>[구독서비스]</option>
						<option value="three" ${paging.viewType eq 'three' ? 'selected' : '' }>[회원]</option>
						<option value="four" ${paging.viewType eq 'four' ? 'selected' : '' }>[기타]</option>
				</select>
				</li>
			</ul>
		</form>
		
		<!-- 자주하는질문 보드 -->
		<div id="accordion">
				<div class="">
					<p>유형</p>
				</div>
				<div class="">
					<p>문의내용</p>
				</div>
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
							<span>
							<a href="getQna.wp?commu_no=${qna.commu_no}">수정</a>
							<a id="#conDel" href="deleteQna.wp?commu_no=${qna.commu_no}" onClick="alert('삭제하시겠습니까?')">삭제</a>
							</span>
						</c:when>
						<c:when test="${qna.answer_status eq '답변완료'}">
							<span>
							<a id="#conDel" href="deleteQna.wp?commu_no=${qna.commu_no}" onClick="alert('삭제하시겠습니까?')">삭제</a>
							</span>
						</c:when>
					</c:choose>
					<p>${qna.answer_con}</p>
				</div>
				</c:forEach>
		</div>


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
</script>

</html>