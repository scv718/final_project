<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!doctype html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author"
	content="Mark Otto, Jacob Thornton, 그리고 Bootstrap 기여자들">
<meta name="generator" content="Hugo 0.104.2">
<title>Winery - 사용자</title>

<link rel="canonical" href="https://getbootstrap.kr/docs/5.2/examples/carousel/">
<link href="https://getbootstrap.kr/docs/5.2/dist/css/bootstrap.min.css"rel="stylesheet">
<link rel="icon" href="/resources/img/파비콘3.ico">

<%@ include file="../../../header.jsp"%>
<link rel="stylesheet"	href="${pageContext.request.contextPath}/resources/css/intro.css"/> 

</head>
<body class="d-flex flex-column min-vh-100">

	<main>

		<div id="myCarousel" class="carousel slide" data-bs-ride="carousel">

			<div class="carousel-inner">
				<div class="carousel-item active">

					<img class="bd-placeholder-img" width="100%" height="100%"
						src="resources/img/intro/${intro.intro_img}">

					<div class="container">
						<div class="carousel-caption text-start">
							<h1>${intro.intro_t1}</h1>
							<h1>${intro.intro_t1_2}</h1>

						</div>
					</div>
				</div>
			</div><br>


			<div class="container marketing">
				<div>
					<h1>${intro.intro_t2}</h1>
					<h1 class="text-muted">${intro.intro_t2_2}</h1>
					<br> <br> <br>
				</div>

				<div class="row">

					<div class="col-lg-4">
						<img class="bd-placeholder-img " width="140" height="140"
							src="resources/img/intro/${intro.intro_s_img1}">
						<h2 class="fw-normal">${intro.intro_s_t1}</h2>
						<p>${intro.intro_s_c1}</p>
						<p>${intro.intro_s_c1_2}</p>
						<p>
							<a class="btn btn-secondary" href="#">오시는 길</a>
						</p>
					</div>

					<div class="col-lg-4">
						<img class="bd-placeholder-img" width="140" height="140"
							src="resources/img/intro/${intro.intro_s_img2}">
						<h2 class="fw-normal">${intro.intro_s_t2}</h2>
						<p>${intro.intro_s_c2}</p>
						<p>${intro.intro_s_c2_2}</p>
						<p>
							<a class="btn btn-secondary" href="#">검색하기</a>
						</p>
					</div>

					<div class="col-lg-4">
						<img class="bd-placeholder-img" width="140" height="140"
							src="resources/img/intro/${intro.intro_s_img3}">
						<h2 class="fw-normal">${intro.intro_s_t3}</h2>
						<p>${intro.intro_s_c3}</p>
						<p>${intro.intro_s_c3_2}</p>
						<p>
							<a class="btn btn-secondary" href="#">구독하기</a>
						</p>
					</div>

				</div>


				<div class="container my-5">
					<div class="bg-light p-5 rounded">
						<div class="col-sm-8 py-5 mx-auto">
							<h1 class="display-5 fw-normal">이용안내</h1>
							<p class="fs-5">${intro.intro_info1}</p>
							<p>${intro.intro_info1_2}</p>
						</div>
					</div>
				</div>





				<hr class="featurette-divider">

				<div class="row featurette">
					<div class="col-md-7">
						<h2 class="featurette-heading fw-normal lh-1">
							${intro.intro_s_t4}</h2>
						<br>
						<p class="lead">${intro.intro_s_c4}</p>
						<p class="lead">${intro.intro_s_c4_2}</p>
						<p class="lead">${intro.intro_s_c4_3}</p>
						<br>
						<p class="lead">${intro.intro_s_c4_4}</p>
						<p class="lead">${intro.intro_s_c4_5}</p>
						<p class="lead">${intro.intro_s_c4_6}</p>
					</div>
					<div class="col-md-5">
						<img
							class="bd-placeholder-img bd-placeholder-img-lg featurette-image img-fluid mx-auto"
							width="500" height="500"
							src="resources/img/intro/${intro.intro_s_img4}">


					</div>
				</div>

				<hr class="featurette-divider">

			</div>
		</div>
			
	</main>


	<script
		src="https://getbootstrap.kr/docs/5.2/dist/js/bootstrap.bundle.min.js"></script>

	<%@ include file="../../../footer.jsp" %>
</body>
</html>