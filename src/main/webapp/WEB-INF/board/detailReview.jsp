<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품후기</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.7.0/css/all.css"
	integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ"
	crossorigin="anonymous">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>
<body>
	<div class="jumbotron">
		<h1>상세 보기</h1>
	</div>
	<div class="container-fluid">
		<form name="fm" action="updateReview.wp" method="post">
			<input type="hidden" name="re_no" value="${review.re_no}">
			<div class="input-group mb-3">
				<div class="input-group-prepend">
					<span class="input-group-text">제목</span>
				</div>
				<input type="text" class="form-control innm" name="title"
					value="${review.re_title}">
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
				<input type="text" class="form-control innm" value="${review.id}"
					readonly>
			</div>
			<div class="input-group mb-3">
				<div class="input-group-prepend">
					<span class="input-group-text">작성일</span>
				</div>
				<input type="text" class="form-control innm" name="re_date"
					value="${review.re_date}" readonly>
			</div>
			<div class="input-group mb-3">
				<div class="input-group-prepend">
					<span class="input-group-text">내용</span>
				</div>
				<textarea class="form-control innm" rows="10" id="comment"
					name="re_content">${review.re_content}</textarea>
			</div>
			<div class="input-group mb-3">
				<div class="input-group-prepend">
					<span class="input-group-text">파일</span>
				</div>
				<c:if test="${review.re_photo1 ne NULL}">
					<span style="cursor:pointer; padding:0 20px;" onclick="seeImg()">파일보기</span>
					<script type="text/javascript">
						function seeImg(){
							$("#imgBox").show();
						}
					</script>
				</c:if>
			</div>
		<div id="footer">
	  		<button type="submit" class="btn btn-primary">수정</button>
	  		<button id="conDel" type="button" class="btn btn-primary">삭제</button>
	  		<button id="conList" type="button" class="btn btn-primary">목록보기</button>
		</div>
		</form>
	</div>
	
	<!-- 이미지 표시 -->
	<div id="imgBox" class="container-fluid">
		<div id="imgContentBox">
			<div id="imgBoxTitleBar">
				<span id="closeX" onclick="closeX()">x</span>
				<script>
					function closeX() {
						$("#imgBox").hide();
					}
				</script>
			</div>
			<img id="imgBoxImg" src="resources/img/review/${review.re_photo1}">
		</div>
	</div>
</body>
</html>