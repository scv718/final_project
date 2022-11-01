<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author"
	content="Mark Otto, Jacob Thornton, 그리고 Bootstrap 기여자들">
<meta name="generator" content="Hugo 0.104.2">
<title>와이너리란 수정하기</title>

<link rel="canonical"
	href="https://getbootstrap.kr/docs/5.2/examples/carousel/">

<link href="https://getbootstrap.kr/docs/5.2/dist/css/bootstrap.min.css"
	rel="stylesheet">
<body>
	<div class="jumbotron">
		<h1>공지사항 글쓰기</h1>
	</div>

	<div class="container-fluid">
		<form action="insertNotice.wp" method="post"
			enctype="multipart/form-data">
			<div class="input-group mb-3">
				<div class="input-group-prepend">
					<span class="input-group-text">구분번호</span>
				</div>
				<input type="text" class="form-control" name="commu_cat" placeholder="구분번호를 입력하세요" required>
			</div>
			<div class="input-group mb-3">
				<div class="input-group-prepend">
					<span class="input-group-text">항목내번호</span>
				</div>
				<input type="text" class="form-control" name="commu_cat_no" placeholder="항목내번호를 입력하세요" required>
			</div>
			<div class="input-group mb-3">
				<div class="input-group-prepend">
					<span class="input-group-text">제목</span>
				</div>
				<input type="text" class="form-control" name="commu_title" placeholder="제목을 입력하세요." required>
			</div>
			<div class="input-group mb-3">
				<div class="input-group-prepend">
					<span class="input-group-text">작성자</span>
				</div>
				<input type="text" class="form-control innm" name="id" value="관리자" readonly>
			</div>
			<div class="input-group mb-3">
				<div class="input-group-prepend">
					<span class="input-group-text">내용</span>
				</div>
				<textarea class="form-control" rows="10" id="comment" name="commu_content"></textarea>
			</div>
<!-- 			<div class="input-group mb-3"> -->
<!-- 				<div class="input-group-prepend"> -->
<!-- 					<span class="input-group-text">작성일자</span> -->
<!-- 				</div> -->
<!-- 				<input type="date" class="form-control innm" name="writer" value="작성일자"> -->
<!-- 			</div> -->
			<div class="input-group mb-3">
				<div class="input-group-prepend">
					<span class="input-group-text">파일등록</span>
				</div>
				<input type="file" class="form-control innm" name="uploadFile">
			</div>
			<div id="footer">
				<button id="conComplete" type="submit" class="btn btn-primary">새글등록</button>
				<button id="conList" type="button" class="btn btn-primary">글목록</button>
			</div>
		</form>
	</div>


</body>

</html>
