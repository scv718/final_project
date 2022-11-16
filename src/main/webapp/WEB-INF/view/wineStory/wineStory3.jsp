<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<title>와이너리 | 와인이야기</title>

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
<script>
	$(document).ready(function(){
		$(window).scroll(function(){
			$('.recipe-img, .semi-content').each(function(i){
				var bottom_of_element = $(this).offset().top + $(this).outerHeight() / 5;
				var bottom_of_window = $(window).scrollTop() + $(window).height();
				
				if(bottom_of_window > bottom_of_element) {
					$(this).animate({'opacity':'1'}, 700);
				}
			});
		});
	});
</script>
<body class="d-flex flex-column min-vh-100">

	<%@ include file="../../../header.jsp"%>
	
<<<<<<< HEAD
	<div id="myCarousel" class="carousel slide" data-bs-ride="carousel">

		<div class="row">
		<div class="s_t col-sm-12">
				<div class="s_t_i">
				<img class="bd-placeholder-img" id="t1"
					src="${pageContext.request.contextPath}/resources/img/story/${story3_t.story_back_img}"></div>
				<div class="s_t_c">
				<h1>${story3_t.story_title}</h1>
				</div><br><br><hr>
			</div>
			<c:forEach items="${story3_c}" var="story3" varStatus="status">
				<div>
					<h2 class="fw-normal">${story3.story_title}</h2>
					<br>
					<hr>
					<div class="s_c_i1 col-lg-4">
						<img class="bd-placeholder-img " width="200px" height="auto"
							src="${pageContext.request.contextPath}/resources/img/story/${story3.story_add_img}">
					</div>
					<div class="s_c_t1 col-lg-8">
						<p>${story3.story_semi_title}</p><br>
						<pre>${story3.story_content}</pre>
					</div>
				</div>
				<br>
				<hr>
				<br>
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
			</a> 
=======
	<div id="wineStoryContainer">
		<div class="top-background-img">
		<div class="image-box">
			<img class="image-background" id="t1" src="${pageContext.request.contextPath}/resources/img/story/${story3_t.story_back_img}">
		</div>
		</div>
		<div class="middle-contents">
			<c:forEach items="${story3_c}" var="story3" varStatus="status">
				<div class="col">
					<h4 class="title">${story3.story_title}</h4>
					<h6 class="subtitle">${story3.story_semi_title}</h6>
					<div class="recipe-img-box">
						<img class="recipe-img"
						src="${pageContext.request.contextPath}/resources/img/story/${story3.story_add_img}">
					</div>
					<div class="semi-content">
						<div class="inner-content">
						<p style="white-space:pre;"><c:out value="${story3.story_content}"/></p>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
		<div class="col">
			<h5 class="semititle">더 알아보기</h5>
			<div class="end-buttons">
				<button class="btn-hover color-7" type="button" onclick="location.href = 'wineStory1.wp'">와인이란?</button>
				<button class="btn-hover color-7" type="button" onclick="location.href = 'wineStory3.wp'">곁들이 레시피</button>
			</div>
>>>>>>> 3f7a509254cf1fc646bc2a123eabd00f1865ed6c
		</div>
	</div>
	<%@ include file="/footer.jsp"%>
</body>
<<<<<<< HEAD

=======
>>>>>>> 3f7a509254cf1fc646bc2a123eabd00f1865ed6c
</html>
