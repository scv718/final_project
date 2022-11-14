<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>와이너리 | 상품후기</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/detailReview.css" />
<script src="https://code.jquery.com/jquery-3.6.0.slim.js"></script>
<script src="resources/js/fileupload.js"></script>
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
<body>
<body class="d-flex flex-column min-vh-100">
		<div id="reviewContainer">
			<h3 id="comtitle">상품후기</h3>
<!-- 			<form name="dataForm" id="dataForm" onsubmit="return registerAction()" method="post"> -->
			<form name="dataForm" id="dataForm" method="post">
			<div id="reviewcontent">
				<div id="review-top">
					<input type="hidden" id="re_no" name="re_no" value="${detailReview.re_no}">
					<h5>
						<input type="text" name="re_title" id="updatetitle" placeholder="제목" value="${detailReview.re_title}">
					</h5>
					<dl class="review-info">
						<dt>평점</dt><dd>
						<fieldset id="starRate">
							<input type="radio" name="re_score" value="5" id="rate1" <c:if test="${rating eq 5}">checked</c:if>><label for="rate1">⭐</label> 
							<input type="radio" name="re_score" value="4" id="rate2" <c:if test="${rating eq 4}">checked</c:if>><label for="rate2">⭐</label> 
							<input type="radio"	name="re_score" value="3" id="rate3" <c:if test="${rating eq 3}">checked</c:if>><label for="rate3">⭐</label>
							<input type="radio" name="re_score" value="2" id="rate4" <c:if test="${rating eq 2}">checked</c:if>><label for="rate4">⭐</label> 
							<input type="radio" name="re_score" value="1" id="rate5" <c:if test="${rating eq 1}">checked</c:if>><label for="rate5">⭐</label>
						</fieldset></dd>
					</dl>
				</div>
				<div id="review-middle">
					<dl class="product">
						<dt>상품명</dt>
						<dd>${detailReview.w_nm_k}</dd>
					</dl>
					<button id="filebtn" type="button" name="re_photo1">파일추가</button>
					<input id="inputfile" type="file" multiple="multiple">
					<span style="font-size:14px; color: gray;">※파일은 최대 3개까지 등록 가능합니다.</span>
					
					<div class="data_file_txt" id="data_file_txt">
						<div id="existingFile" style="margin-right: 20px; float:left;">
							<c:if test="${detailReview.re_photo1 ne NULL}">
								<div id="exfile1" onclick="exfileDelete('exfile1')">
<%-- 									<font style="font-size:12px">${detailReview.re_photo1}</font> --%>
	<!-- 								<img src="마이너스사진" alt="삭제" style="width:15px; vertical-align: middle; cursor: pointer;"> -->
									<img src="../resources/img/review/${detailReview.re_photo1}" title="${detailReview.re_photo1}" style="width:80px; height:80px;">
									<img src="https://cdn-icons-png.flaticon.com/512/54/54373.png" alt="삭제" class="delBtn">
								</div>
								<c:if test="${detailReview.re_photo2 ne NULL}">
									<div id="exfile2" onclick="exfileDelete(exfile2)">
<%-- 									<font style="font-size:12px">${detailReview.re_photo1}</font> --%>
	<!-- 								<img src="마이너스사진" alt="삭제" style="width:15px; vertical-align: middle; cursor: pointer;"> -->
										<img src="../resources/img/review/${detailReview.re_photo2}" title="${detailReview.re_photo3}" style="width:80px; height:80px;">
										<img src="https://cdn-icons-png.flaticon.com/512/54/54373.png" alt="삭제" class="delBtn">
									</div>
								</c:if>
							</c:if>
						</div>
						<div id="articlefileChange" style="margin-top:10px; margin-right: 20px;"></div>
					</div>
				</div>
				<!-- 리뷰내용 -->
				<textarea name="re_content" id="updatecontent" rows="10" style="width:100%; margin-top:10px; resize:none;" placeholder="작성할 내용을 입력하세요.">${detailReview.re_content}</textarea>
			</div>
			<div id="review-bottom">
					<button type="button" onclick="registerAction()">확인</button>
					<button type="button" onclick="location.href='javascript:window.history.back();'">취소</button>
			</div>
			</form>
		</div>
		<%    
response.setHeader("Cache-Control","no-store");    
response.setHeader("Pragma","no-cache");    
response.setDateHeader("Expires",0);    
if (request.getProtocol().equals("HTTP/1.1"))  
        response.setHeader("Cache-Control", "no-cache");  
%>
	<%@ include file="../../../footer.jsp"%>
</body>
</html>