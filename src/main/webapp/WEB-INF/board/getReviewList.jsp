<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰게시판</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</head>
<body>
	<h1>리뷰게시판</h1>
	<!-- 포토리뷰 이모지 -->
	<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-card-image" viewBox="0 0 16 16">
 		 <path d="M6.002 5.5a1.5 1.5 0 1 1-3 0 1.5 1.5 0 0 1 3 0z"/>
 		 <path d="M1.5 2A1.5 1.5 0 0 0 0 3.5v9A1.5 1.5 0 0 0 1.5 14h13a1.5 1.5 0 0 0 1.5-1.5v-9A1.5 1.5 0 0 0 14.5 2h-13zm13 1a.5.5 0 0 1 .5.5v6l-3.775-1.947a.5.5 0 0 0-.577.093l-3.71 3.71-2.66-1.772a.5.5 0 0 0-.63.062L1.002 12v.54A.505.505 0 0 1 1 12.5v-9a.5.5 0 0 1 .5-.5h13z"/>
	</svg>
	<nav id="searchNav">
		<form action="getReviewList.wp" method="POST">
			<select name="searchCondition">
				<c:forEach items="${conditionMap}" var="option">
					<option value="${option.value}">${option.key}</option>
				</c:forEach>
			</select>
			<input type="text" name="searchKeyword" placeholder="검색어를 입력하세요.">
			<button type="submit">검색</button>
		</form>
	</nav>
	<table>
		<thead>
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>평점</th>
				<th>작성자</th>
				<th>작성일</th>
				<th>추천수</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${reviewList}" var="review">
				<tr onclick="selTr(${review.w_no})" style="cursor:pointer;">
					<td class="tdCenter">${review.re_no}</td>
					<td>${review.re_title}</td>
					<td class="tdCenter">${review.re_score}</td>
					<td class="tdCenter">${review.id}</td>
					<td class="tdCenter"><fmt:formatDate pattern="yyyy-MM-dd" value="${review.re_date}"/></td>
					<td class="tdCenter">${review.re_like}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table><br><br>
	
	<div id="btnBox">
	<!-- 반복처리할 태그 시작 -->
	<c:if test="${paging.nowPageBtn > 1 }">
		<a href="getReviewList.wp?nowPageBtn=${paging.nowPageBtn - 1}">&lt;</a>
	</c:if>
	<c:forEach begin="${paging.startBtn}" end="${paging.endBtn}" step="1" var="i">
		<c:choose>
			<c:when test="${paging.nowPageBtn == i}">
				<a class="aSel">${i}</a>
			</c:when>
			<c:otherwise>
				<a href="getReviewList.wp?nowPageBtn=${i}">${i}</a>
			</c:otherwise>
		</c:choose>
	</c:forEach>
	<c:if test="${paging.nowPageBtn < paging.totalBtnCnt}">
		<a href="getReviewList.wp?nowPageBtn=${paging.nowPageBtn + 1}">&gt;</a>
	</c:if>
	<!-- 끝 -->
	</div><br><br>

</body>
</html>