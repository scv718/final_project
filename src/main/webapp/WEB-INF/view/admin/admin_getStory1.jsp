<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<title>와인이 들려주는 이야기를 들어보세요.</title>

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/story.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
</head>

<body class="d-flex flex-column min-vh-100">

	<%@ include file="../../../header.jsp"%>

	<div id="myCarousel" class="carousel slide" data-bs-ride="carousel">
		<form action="admin_updateStory1.wp" method="post"
			enctype="multipart/form-data">

			<div class="row">
				<div class="s_t col-sm-12">
					<div class="s_t_i">
						<img class="bd-placeholder-img" id="t1"
							src="${pageContext.request.contextPath}/resources/img/story/${story1_t.story_back_img}">
					</div>
					<div class="f_box">
						<label for="img"></label> <input type="file"
							class="form-control innm" id="img" name="uploadFile"><br>
					</div>
					<div class="s_t_c">
						<h1>
							<input type="text" class="form-control innm" name="story_title"
								value="${story1_t.story_title}">
						</h1>
					</div>
					<br> <br>
					<div class="d-grid gap-2 col-6 mx-auto">
						<button class="btn btn-primary" type="submit">수정하기</button>
					</div>
					<hr>
				</div>
				</div>
		</form>
		
			<c:forEach items="${story1_c}" var="story1" varStatus="status">
			<form action="admin_updateStory1.wp" method="post"
			enctype="multipart/form-data">
				<div>
					<h2 class="fw-normal">
						<input type="text" class="form-control innm" name="story_title"
							value="${story1.story_semi_title}">
					</h2>
					<br>
					<hr>
					<div class="s_c_i1 col-lg-4">
						<img class="bd-placeholder-img " width="200px" height="auto"
							src="${pageContext.request.contextPath}/resources/img/story/${story1.story_add_img}">
						<div class="f_box">
							<label for="img"></label> <input type="file"
								class="form-control innm" id="img" name="uploadFile2"><br>
						</div>
					</div>
					<div class="s_c_t1 col-lg-8">
						<textarea name="story_content">${story1.story_content}</textarea>
					</div>
				</div>
				<br>
				<hr>
					<div class="d-grid gap-2 col-6 mx-auto">
				<button class="btn btn-primary" type="submit">수정하기</button>
			</div>

		</form>
			</c:forEach>
		
	</div>
	<div class="row row1">
		<a
			href="https://terms.naver.com/list.naver?cid=58884&categoryId=58901">
			<button type="button" id="colre"
				class="btn btn-lg btn-outline-primary">와인 더 알아보기</button>
		</a> <a href="wineStory2.wp">
			<button type="button" id="colre"
				class="btn btn-lg btn-outline-primary">4가지 구분하기</button>
		</a> <a href="wineStory3.wp">
			<button type="button" id="colre"
				class="btn btn-lg btn-outline-primary">곁들일 레시피</button>
		</a>
	</div>
	<hr class="featurette-divider">


	
	<%@ include file="/footer.jsp"%>
</body>

</html>
