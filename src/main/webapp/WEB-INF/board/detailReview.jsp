<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head> 
<meta charset="UTF-8">
<title>와이너리 | 상품후기</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"	href="${pageContext.request.contextPath}/resources/css/detailReview.css"/>
<%@ include file="../../../header.jsp"%>
<style>
			dd {
				float: left;
				padding-right: 10px;
			}
			
			dt {
				float: left;
				padding-right: 10px;
			}
</style>
</head>
<body class = "d-flex flex-column min-vh-100">
	<div id="reviewContainer">
	<h3 id="comtitle">상품후기</h3>
	<div id="reviewcontent">
		<div id="review-top">
		<h5>${detailReview.re_title}</h5>
		<dl class="review-info">
			<dt>평점</dt>
			<dd>${detailReview.re_score}</dd>
			<dt>작성자</dt>
			<dd>${fn:substring(detailReview.id,0,2)}<c:forEach begin="3" end="${fn:length(detailReview.id)}" step="1">*</c:forEach></dd>
			<dt>작성일</dt>
			<dd><fmt:formatDate pattern="yyyy-MM-dd hh:MM" value="${detailReview.re_date}"/></dd>
		</dl>
		<a href="javascript:window.history.back();" style="float:right;"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-arrow-return-left" viewBox="0 0 16 16">
  		<path fill-rule="evenodd" d="M14.5 1.5a.5.5 0 0 1 .5.5v4.8a2.5 2.5 0 0 1-2.5 2.5H2.707l3.347 3.346a.5.5 0 0 1-.708.708l-4.2-4.2a.5.5 0 0 1 0-.708l4-4a.5.5 0 1 1 .708.708L2.707 8.3H12.5A1.5 1.5 0 0 0 14 6.8V2a.5.5 0 0 1 .5-.5z"/>
		</svg>뒤로가기</a>
		</div>
	<form name="fm" action="updateReview.wp" method="post">
	<div id="review-middle">
		<dl class="product">
		<dt>상품보기</dt>
		<dd><a href="" class="productlink">${detailReview.w_nm_k}</a></dd>
		</dl>
		<div>
			<c:if test="${detailReview.re_photo1 ne NULL}"><img id="imgBoxImg" src="resources/img/review/${detailReview.re_photo1}" style="width:200px; padding:10px 0;"></c:if>
		</div>
		<!-- 리뷰내용 -->
		<p>${detailReview.re_content}</p>
	</div>
	<div id="review-bottom">
		<button type="submit" class="modbtn">수정</button>
		<button id="conDel" type="button" class="delbtn">삭제</button>
	</div>
	</form>
	</div>
	</div>
<%@ include file="../../../footer.jsp"%>
</body>
</html>