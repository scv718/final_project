<%@ page contentType="text/html; charset=utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품후기</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"	href="${pageContext.request.contextPath}/resources/css/detailReview.css"/>
<%@ include file="../../../header.jsp"%>
</head>
<body class = "d-flex flex-column min-vh-100">
	<div id="reviewContainer">
	<h3 id="comtitle">상품후기</h3>
	<div class="container-fluid">
		<form name="fm" action="updateReview.wp" method="post">
			<input type="hidden" name="re_no" value="${detailReview.re_no}">
			<div class="input-group mb-3">
				<div class="input-group-prepend">
					<span class="input-group-text">제목</span>
				</div>
				<input type="text" class="form-control innm" name="title"
					value="${detailReview.re_title}">
			</div>
			<div class="input-group mb-3">
				<div class="input-group-prepend">
					<span class="input-group-text">평점</span>
				</div>
			</div>
			<div class="input-group mb-3">
				<div class="input-group-prepend">
					<span class="input-group-text">작성자</span>
				</div>
				<input type="text" class="form-control innm" value="${detailReview.id}"
					readonly>
			</div>
			<div class="input-group mb-3">
				<div class="input-group-prepend">
					<span class="input-group-text">작성일</span>
				</div>
				<input type="text" class="form-control innm" name="re_date"
					value="${detailReview.re_date}" readonly>
			</div>
			<div class="input-group mb-3">
				<div class="input-group-prepend">
					<span class="input-group-text">내용</span>
				</div>
				<img id="imgBoxImg" src="resources/img/review/${detailReview.re_photo1}" style="width:200px">
				<textarea class="form-control innm" rows="10" id="comment"
					name="re_content">
					${detailReview.re_content}
				</textarea>
			</div>
		<div id="footer">
	  		<button type="submit" class="btn btn-primary">수정</button>
	  		<button id="conDel" type="button" class="btn btn-primary">삭제</button>
	  		<button id="conList" type="button" class="btn btn-primary">목록보기</button>
		</div>
		</form>
	</div>
	</div>
<%@ include file="../../../footer.jsp"%>
</body>
</html>