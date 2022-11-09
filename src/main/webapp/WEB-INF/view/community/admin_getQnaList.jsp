<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet"	href="${pageContext.request.contextPath}/resources/css/notice.css"/>
    <title>1:1 문의</title>
    <%@ include file="../../../header.jsp"%>
    
    <script>
    function selTr(val){
    	location.href = "admin_getQna.wp?commu_no="+val;
    }

    </script>
</head>

<body class = "d-flex flex-column min-vh-100">
	<div id="noticeContainer">
	<h3 id="comtitle">관리자 1:1 문의 답변</h3>
	<nav id="searchNav">
		<form action="admin_getQnaList.wp" method="POST" id="noticeform">
		<!-- 아이디 검색 기능 -->
			<select name="searchCondition" class="searchsel" >
				<c:forEach items="${conditionMap}" var="option">
					<option value="${option.value}" <c:if test="${category eq option.value}">selected="selected"</c:if>>${option.key}</option>
				</c:forEach>
			</select>
			<input type="text" class="searchinput" name="searchKeyword" placeholder="검색어를 입력하세요." value="${search}">
			<button type="submit" class="searchbtn">검색</button>
		</form>
	</nav>
	
	<!-- 카테고리 필터 -->
		<form action="admin_getQnaList.wp" method="POST" id="align">
			<ul>
				<li>
				<select name="alignlist" class="w-px100" onchange="$('form').submit()">
						<option>답변상태</option>
						<option value="waiting" ${paging.viewType eq 'zero' ? 'selected' : '' }>[답변대기]</option>
						<option value="completed" ${paging.viewType eq 'one' ? 'selected' : '' }>[답변완료]</option>
				</select>
				</li>
			</ul>
		</form>

    <div class="li_board noticetab">
        <ul class="li_header hidden-xs noticehead">
            <li class="no">문의유형</li>
            <li class="tit">제목</li>
            <li class="name">작성자</li>
            <li class="date">작성일</li>
            <li class="read">답변여부</li>
        </ul>

	<c:forEach var="qna" items="${admin_getQnaList}">
        <ul class="li_body notice_body" onclick="selTr(${qna.commu_no})" style="cursor:pointer;" >
            <li class="no">
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
            </li>
            <li class="tit">${qna.commu_title}</li>
            <li class="name">${qna.id}</li>
            <li class="date">${qna.commu_date}</li>
            <li class="read">${qna.answer_status}</li>
         </ul>
	</c:forEach>
    </div>
    
    <!-- 페이징처리 -->
    <div id="btnBox">
	<!-- 반복처리할 태그 시작 -->
	<c:if test="${paging.nowPageBtn > 1 }">
		<a href="admin_getQnaList.wp?nowPageBtn=${paging.nowPageBtn - 1}">&lt;</a>
	</c:if>
	<c:forEach begin="${paging.startBtn}" end="${paging.endBtn}" step="1" var="i">
		<c:choose>
			<c:when test="${paging.nowPageBtn == i}">
				<a class="aSel">${i}</a>
			</c:when>
			<c:otherwise>
				<a href="admin_getQnaList.wp?nowPageBtn=${i}">${i}</a>
			</c:otherwise>
		</c:choose>
	</c:forEach>
	<c:if test="${paging.nowPageBtn < paging.totalBtnCnt}">
		<a href="admin_getQnaList.wp?nowPageBtn=${paging.nowPageBtn + 1}">&gt;</a>
	</c:if>
	<!-- 끝 -->
	</div><br><br>
    
    </div>
    <%@ include file="../../../footer.jsp" %>
</body>

</html>