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
<title>FAQ</title>
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
	function selTr(val) {
		location.href = "getFaq.wp?commu_no=" + val;
	}
</script>
</head>

<body class="d-flex flex-column min-vh-100">

	<div id="faqContainer">
		<!-- 제목 -->
		<h3 id="comtitle">FAQ 자주하는질문</h3>
		<button type="button" onclick="location.href='insertFaq.wp'">1:1
			문의하기</button>
		<button type="button" onclick="location.href='admin_getFaqList.wp'">관리자FAQ목록확인</button>
		<!-- 검색창 -->
		<nav id="searchNav">
			<form action="getFaqList.wp" method="POST" id="faqform">
				<select name="searchCondition" class="searchsel">
					<c:forEach items="${conditionMap}" var="option">
						<option value="${option.value}"
							<c:if test="${category eq option.value}">selected="selected"</c:if>>${option.key}</option>
					</c:forEach>
				</select> <input type="text" class="searchinput" name="searchKeyword"
					placeholder="검색어를 입력하세요." value="${search}">
				<button type="submit" class="searchbtn">검색</button>
			</form>
		</nav>
		<!-- 카테고리필터 -->
	<%-- 	<form action="getFaqList.wp" method="POST" id="align">
			<select name="alignlist" onchange="$('form').submit()">
				<c:forEach items="${conditionMap2}" var="option2">
					<option value="${option2.value}"
						<c:if test="${category eq option2.value}">selected="selected"</c:if>>${option2.key}</option>
				</c:forEach>
			</select>
		</form> --%>

		<!-- 카테고리 필터 -->
		<form action="getFaqList.wp" method="POST" id="align">
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
			<c:forEach var="faq" items="${FaqList}">
				<button class="accordion">
					<c:choose>
						<c:when test="${faq.faq_cat eq '0'}">
							<span>[주문/결제/배송]</span>
						</c:when>
						<c:when test="${faq.faq_cat eq '1'}">
							<span>[취소/교환/환불]</span>
						</c:when>
						<c:when test="${faq.faq_cat eq '2'}">
							<span>[구독서비스]</span>
						</c:when>
						<c:when test="${faq.faq_cat eq '3'}">
							<span>[회원]</span>
						</c:when>
						<c:otherwise>
							<span>[기타]</span>
						</c:otherwise>
					</c:choose>
					<span>${faq.commu_title}</span>
				</button>
				<div class="panel">
					<p>${faq.commu_content}</p>

				</div>
			</c:forEach>
		</div>


		<!-- 페이징처리 -->
		<div id="btnBox">
			<!-- 반복처리할 태그 시작 -->
			<c:if test="${paging.nowPageBtn > 1 }">
				<a href="getFaqList.wp?nowPageBtn=${paging.nowPageBtn - 1}">&lt;</a>
			</c:if>
			<c:forEach begin="${paging.startBtn}" end="${paging.endBtn}" step="1"
				var="i">
				<c:choose>
					<c:when test="${paging.nowPageBtn == i}">
						<a class="aSel">${i}</a>
					</c:when>
					<c:otherwise>
						<a href="getFaqList.wp?nowPageBtn=${i}">${i}</a>
					</c:otherwise>
				</c:choose>
			</c:forEach>
			<c:if test="${paging.nowPageBtn < paging.totalBtnCnt}">
				<a href="getFaqList.wp?nowPageBtn=${paging.nowPageBtn + 1}">&gt;</a>
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