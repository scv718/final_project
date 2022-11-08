<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!doctype html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author"
	content="Mark Otto, Jacob Thornton, 그리고 Bootstrap 기여자들">
<meta name="generator" content="Hugo 0.104.2">
<title>공지사항 글쓰기</title>

<link rel="canonical"
	href="https://getbootstrap.kr/docs/5.2/examples/carousel/">

<link href="https://getbootstrap.kr/docs/5.2/dist/css/bootstrap.min.css"
	rel="stylesheet">
<!-- 네이버 스마트에디터  -->
<!-- <head> 안에 추가 -->
<script type="text/javascript"
	src="resources/static/smarteditor/js/HuskyEZCreator.js" charset="utf-8"></script>
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
<!-- head 안에 추가 -->

</head>
<body>
	<div class="jumbotron">
		<h1>공지사항 글쓰기</h1>
	</div>

	<div class="container-fluid">
		<form action="admin_insertNotice.wp" method="post">
		<!-- 			<div class="input-group mb-3"> -->
<!-- 				<div class="input-group-prepend"> -->
<!-- 					<span class="input-group-text">구분번호</span> -->
<!-- 				</div> -->
			<input type="hidden" class="form-control" name="commu_cat" value="0">
<!-- 			</div> -->
			<div class="input-group mb-3">
				<div class="input-group-prepend">
					<span class="input-group-text">항목내번호</span>
				</div>
				<input type="text" class="form-control" name="commu_cat_no"
					placeholder="항목내번호를 입력하세요" required>
			</div>
			<div class="input-group mb-3">
				<div class="input-group-prepend">
					<span class="input-group-text">제목</span>
				</div>
				<input type="text" class="form-control" name="commu_title"
					placeholder="제목을 입력하세요." required>
			</div>
			<div class="input-group mb-3">
				<div class="input-group-prepend">
					<span class="input-group-text">작성자</span>
				</div>
				<input type="text" class="form-control innm" name="id" value="관리자"
					readonly>
			</div>
			<div class="input-group mb-3">
				<div class="input-group-prepend">
					<span class="input-group-text">내용</span>
				</div>
				<!-- 				<textarea class="form-control" rows="10" id="comment" name="commu_content"></textarea> -->
								<textarea id="txtContent" name="commu_content" rows="10" cols="100" style="width: 100%;"></textarea>
				
			</div>
			<div id="footer">
				<div id="se2_sample" style="margin: 10px 0;">
					<input type="submit" value="등록하기">
				</div>
			</div>
		</form>
	</div>


</body>

</html>
