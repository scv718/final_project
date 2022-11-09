<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>와이너리 | 상품후기</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"	href="${pageContext.request.contextPath}/resources/css/getReviewList.css"/>
<%@ include file="../../../header.jsp"%>
</head>
<body class = "d-flex flex-column min-vh-100">
	<div id="reviewContainer">
	<h3 id="comtitle">상품후기</h3>
	<nav id="searchNav">
		<form action="getReviewList.wp" method="POST" id="reviewform">
			<select name="searchCondition" class="searchsel" onchange="">
				<c:forEach items="${conditionMap}" var="option">
					<option value="${option.value}" <c:if test="${category eq option.value}">selected="selected"</c:if>>${option.key}</option>
				</c:forEach>
			</select>
			<input type="text" class="searchinput" name="searchKeyword" placeholder="검색어를 입력하세요." value="${search}">
			<button type="submit" class="searchbtn">검색</button>
		</form>
	</nav>
	<div id="filterdiv">
	<form action="getfilterList.wp" method="POST" id="filter">
		<input type="radio" name="filter" value="PHOTO" onchange="this.form.submit()" <c:if test="${radiochk eq 'PHOTO'}">checked</c:if>>포토리뷰만 보기&nbsp;
		<input type="radio" name="filter" value="NEW" onchange="this.form.submit()" <c:if test="${radiochk eq 'NEW'}">checked</c:if>>최신순&nbsp;
		<input type="radio" name="filter" value="LIKE" onchange="this.form.submit()" <c:if test="${radiochk eq 'LIKE'}">checked</c:if>>추천순
	</form>
	</div>
	<table id="reviewtab">
		<colgroup>
			<col style="width: 50px">
			<col style="width: 20px">
			<col style="width: 200px">
			<col style="width: 70px">
			<col style="width: 70px">
			<col style="width: 100px">
			<col style="width: 50px">
		</colgroup>
		<thead>
			<tr class="reviewhead">
				<th>번호</th>
				<th></th>
				<th>제목</th>
				<th>평점</th>
				<th>작성자</th>
				<th>작성일</th>
				<th>추천수</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${reviewList}" var="review">
				<tr>
					<td class="tdCenter">${review.re_no}</td>
					<td><c:if test="${review.re_photo1 ne NULL}"><i class="bi bi-image" style="color: gray;"></i></c:if></td>
					<td style="text-align:left"><div><a href="" class="productlink">${review.w_nm_k}</a>
						<br><a href="detailReview.wp?re_no=${review.re_no}" class="detailreview">${review.re_title}</a></div></td>
					<td class="tdCenter">${review.re_score}</td>
					<td class="tdCenter">
						${fn:substring(review.id,0,2)}<c:forEach begin="3" end="${fn:length(review.id)}" step="1">*</c:forEach>
					</td>
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
	</div>
	<%@ include file="../../../footer.jsp"%>
</body>
</html>