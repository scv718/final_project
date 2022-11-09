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
    <title>공지사항</title>
    <%@ include file="../../../header.jsp"%>
    
    <script>
    function selTr(val){
    	location.href = "getNotice.wp?commu_no="+val;
    }

    </script>
</head>

<body class = "d-flex flex-column min-vh-100">
	<div id="noticeContainer">
	<h3 id="comtitle">공지사항</h3>
	<nav id="searchNav">
		<form action="getNoticeList.wp" method="POST" id="noticeform">
			<select name="searchCondition" class="searchsel" >
				<c:forEach items="${conditionMap}" var="option">
					<option value="${option.value}" <c:if test="${category eq option.value}">selected="selected"</c:if>>${option.key}</option>
				</c:forEach>
			</select>
			<input type="text" class="searchinput" name="searchKeyword" placeholder="검색어를 입력하세요." value="${search}">
			<button type="submit" class="searchbtn">검색</button>
		</form>
	</nav>
<!-- 	<form action="getReviewList.wp" method="POST" id="align"> -->
<!-- 		<select name="alignlist" onchange="this.form.submit()"> -->
<%-- 			<c:forEach items="${conditionMap2}" var="option"> --%>
<%-- 					<option value="${option.value}" <c:if test="${category eq option.value}">selected="selected"</c:if>>${option.key}</option> --%>
<%-- 			</c:forEach> --%>
<!-- 		</select> -->
<!-- 	</form> -->
    <div class="li_board noticetab">
        <ul class="li_header hidden-xs noticehead">
            <li class="no">No</li>
            <li class="tit">제목</li>
            <li class="name">작성자</li>
            <li class="date">작성일</li>
            <li class="read">조회수</li>
        </ul>

	<c:forEach var="notice" items="${noticeList}">
        <ul class="li_body notice_body" onclick="selTr(${notice.commu_no})" style="cursor:pointer;" >
            <li class="no">${notice.commu_cat_no}</li>
            <li class="tit">${notice.commu_title}</li>
            <li class="name">${notice.id}</li>
            <li class="date">${notice.commu_date}</li>
            <li class="read">
             <span class="hidden-lg hidden-md hidden-sm ">조회수</span>${notice.commu_count}
             </li>
            </ul>
	</c:forEach>
    </div>
    
    <!-- 페이징처리 -->
    <div id="btnBox">
	<!-- 반복처리할 태그 시작 -->
	<c:if test="${paging.nowPageBtn > 1 }">
		<a href="getNoticeList.wp?nowPageBtn=${paging.nowPageBtn - 1}">&lt;</a>
	</c:if>
	<c:forEach begin="${paging.startBtn}" end="${paging.endBtn}" step="1" var="i">
		<c:choose>
			<c:when test="${paging.nowPageBtn == i}">
				<a class="aSel">${i}</a>
			</c:when>
			<c:otherwise>
				<a href="getNoticeList.wp?nowPageBtn=${i}">${i}</a>
			</c:otherwise>
		</c:choose>
	</c:forEach>
	<c:if test="${paging.nowPageBtn < paging.totalBtnCnt}">
		<a href="getNoticeList.wp?nowPageBtn=${paging.nowPageBtn + 1}">&gt;</a>
	</c:if>
	<!-- 끝 -->
	</div><br><br>
    
    </div>
    <%@ include file="../../../footer.jsp" %>
</body>

</html>