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
<title>Carousel Template · Bootstrap v5.2</title>

<link rel="canonical"
	href="https://getbootstrap.kr/docs/5.2/examples/carousel/">





<link href="https://getbootstrap.kr/docs/5.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi"
	crossorigin="anonymous">

<%-- <%@ include file="header.jsp"%> --%>
<!-- Favicons -->
<!-- <link rel="apple-touch-icon" href="https://getbootstrap.kr/docs/5.2/assets/img/favicons/apple-touch-icon.png" sizes="180x180">
<link rel="icon" href="https://getbootstrap.kr/docs/5.2/assets/img/favicons/favicon-32x32.png" sizes="32x32" type="image/png">
<link rel="icon" href="https://getbootstrap.kr/docs/5.2/assets/img/favicons/favicon-16x16.png" sizes="16x16" type="image/png">
<link rel="manifest" href="https://getbootstrap.kr/docs/5.2/assets/img/favicons/manifest.json">
<link rel="mask-icon" href="https://getbootstrap.kr/docs/5.2/assets/img/favicons/safari-pinned-tab.svg" color="#712cf9">
<link rel="icon" href="https://getbootstrap.kr/docs/5.2/assets/img/favicons/favicon.ico"> -->
<meta name="theme-color" content="#712cf9">


<style>
.bd-placeholder-img {
	font-size: 1.125rem;
	text-anchor: middle;
	-webkit-user-select: none;
	-moz-user-select: none;
	user-select: none;
}

@media ( min-width : 768px) {
	.bd-placeholder-img-lg {
		font-size: 3.5rem;
	}
}

.b-example-divider {
	height: 3rem;
	background-color: rgba(0, 0, 0, .1);
	border: solid rgba(0, 0, 0, .15);
	border-width: 1px 0;
	box-shadow: inset 0 .5em 1.5em rgba(0, 0, 0, .1), inset 0 .125em .5em
		rgba(0, 0, 0, .15);
}

.b-example-vr {
	flex-shrink: 0;
	width: 1.5rem;
	height: 100vh;
}

.bi {
	vertical-align: -.125em;
	fill: currentColor;
}

.nav-scroller {
	position: relative;
	z-index: 2;
	height: 2.75rem;
	overflow-y: hidden;
}

.nav-scroller .nav {
	display: flex;
	flex-wrap: nowrap;
	padding-bottom: 1rem;
	margin-top: -1px;
	overflow-x: auto;
	text-align: center;
	white-space: nowrap;
	-webkit-overflow-scrolling: touch;
}

/* GLOBAL STYLES
-------------------------------------------------- */
/* Padding below the footer and lighter body text */
body {
	padding-top: 3rem;
	padding-bottom: 3rem;
	color: #5a5a5a;
}

/* CUSTOMIZE THE CAROUSEL
-------------------------------------------------- */

/* Carousel base class */
.carousel {
	margin-bottom: 4rem;
}
/* Since positioning the image, we need to help out the caption */
.carousel-caption {
	bottom: 3rem;
	z-index: 10;
}

/* Declare heights because of positioning of img element */
.carousel-item {
	height: 32rem;
}

/* MARKETING CONTENT
-------------------------------------------------- */

/* Center align the text within the three columns below the carousel */
.marketing .col-lg-4 {
	margin-bottom: 1.5rem;
	text-align: center;
}
/* rtl:begin:ignore */
.marketing .col-lg-4 p {
	margin-right: .75rem;
	margin-left: .75rem;
}
/* rtl:end:ignore */

/* Featurettes
------------------------- */
.featurette-divider {
	margin: 5rem 0; /* Space out the Bootstrap <hr> more */
}

/* Thin out the marketing headings */
/* rtl:begin:remove */
.featurette-heading {
	letter-spacing: -.05rem;
}

/* rtl:end:remove */

/* RESPONSIVE CSS
-------------------------------------------------- */
@media ( min-width : 40em) {
	/* Bump up size of carousel content */
	.carousel-caption p {
		margin-bottom: 1.25rem;
		font-size: 1.25rem;
		line-height: 1.4;
	}
	.featurette-heading {
		font-size: 50px;
	}
}

@media ( min-width : 62em) {
	.featurette-heading {
		margin-top: 7rem;
	}
}
</style>

<script>
	//                             // 이미지 업로드
	//                             $('#img').on('change', function() {
	//                             ext = $(this).val().split('.').pop().toLowerCase(); //확장자
	//                             //배열에 추출한 확장자가 존재하는지 체크
	//                             if($.inArray(ext, ['gif', 'png', 'jpg', 'jpeg']) == -1) {
	//                                 resetFormElement($(this)); //폼 초기화
	//                                 window.alert('이미지 파일이 아닙니다! (gif, png, jpg, jpeg 만 업로드 가능)');
	//                             } else {
	//                                 file = $('#img').prop("files")[0];
	//                                 blobURL = window.URL.createObjectURL(file);
	//                                 $('#image_preview img').attr('src', blobURL);
	//                                 $('#image_preview').slideDown(); //업로드한 이미지 미리보기 
	//                                 $(this).slideUp(); //파일 양식 감춤
	//                             }
	//                             });
</script>

<!-- Custom styles for this template -->
<link href="carousel.css" rel="stylesheet">
</head>
<body>

	<header> </header>

	<main>

		<div id="myCarousel" class="carousel slide" data-bs-ride="carousel">
			<form action="updateIntro.wp" method="post" enctype="multipart/form-data">
			<li class="img">
				<div class="carousel-inner">
					<div class="carousel-item active">
						
<!-- 							<div id="image_preview"> -->
								<img class="bd-placeholder-img" width="100%" height="100%"
									src="resources/img/${intro.intro_img}">
							
						

						<div class="container">
							<div class="carousel-caption text-start">
								<h1>
									<input type="text" name="intro_t1" value="${intro.intro_t1}" />
								</h1>
								<h1>
									<input type="text" class="form-control innm" name="intro_t1_2"
										value="${intro.intro_t1_2}">
								</h1>
								<p></p>
								<p>
									<!-- <a class="btn btn-lg btn-primary" href="#">알아보기</a> -->
								</p>
							</div>
						</div>
<!-- 					</div> -->
				</div>
				</div>
							<div class="f_box">
								<label for="img">사진첨부</label> <input type="file" id="img"
									name="uploadFile">
							</div>
				</li>

				<!-- Marketing messaging and featurettes
  ================================================== -->
				<!-- Wrap the rest of the page in another container to center all the content. -->

				<div class="container marketing">

					<div class="">
						<h1><input type="text" name="intro_t2" value="${intro.intro_t2}" /></h1>
						<h1 class="text-muted"><input type="text" name="intro_t2_2" value="${intro.intro_t2_2}" /></h1>
						<br> <br> <br>
					</div>
					<!-- Three columns of text below the carousel -->
					<div class="row">

						<div class="col-lg-4">
							<img class="bd-placeholder-img " width="140" height="140"
								src="resources/img/${intro.intro_s_img1}">
								<div class="f_box">
								<label for="img">사진첨부</label> <input type="file" id="img"
									name="uploadFile2">
							</div>
							<h2 class="fw-normal"><input type="text" name="intro_s_t1" value="${intro.intro_s_t1}" /></h2>
							<p>
								<input type="text" name="intro_s_c1" value="${intro.intro_s_c1}" /> <br> 
								<input type="text" name="intro_s_c1_2" value="${intro.intro_s_c1_2}" />
							</p>
							<p>
								<a class="btn btn-secondary" href="#">오시는 길 &raquo;</a>
							</p>
						</div>
						<!-- /.col-lg-4 -->
						<div class="col-lg-4">
							<img class="bd-placeholder-img" width="140" height="140"
								src="resources/img/${intro.intro_s_img2}">
								<div class="f_box">
								<label for="img">사진첨부</label> 
								<input type="file" id="img"	name="uploadFile3">
							</div>
							<h2 class="fw-normal"><input type="text" name="intro_s_t2" value="${intro.intro_s_t2}" /></h2>
							<p>
								<input type="text" name="intro_s_c2" value="${intro.intro_s_c2}" /> <br>
								<input type="text" name="intro_s_c2_2" value="${intro.intro_s_c2_2}" />
							</p>
							<p>
								<a class="btn btn-secondary" href="#">검색하기 &raquo;</a>
							</p>
						</div>
						<!-- /.col-lg-4 -->
						<div class="col-lg-4">
							<img class="bd-placeholder-img" width="140" height="140"
								src="resources/img/${intro.intro_s_img3}">
								<div class="f_box">
								<label for="img">사진첨부</label> 
								<input type="file" id="img"	name="uploadFile4">
							</div>
							<h2 class="fw-normal"><input type="text" name="intro_s_t3" value="${intro.intro_s_t3}" /></h2>
							<p>
								<input type="text" name="intro_s_c3" value="${intro.intro_s_c3}" /> <br> 
								<input type="text" name="intro_s_c3_2" value="${intro.intro_s_c3_2}" />
							</p>
							<p>
								<a class="btn btn-secondary" href="#">구독하기 &raquo;</a>
							</p>
						</div>
						<!-- /.col-lg-4 -->
					</div>
					<!-- /.row -->

					<div class="container my-5">
						<div class="bg-light p-5 rounded">
							<div class="col-sm-8 py-5 mx-auto">
								<h1 class="display-5 fw-normal">이용안내</h1>
								<p class="fs-5"><input type="text" name="intro_info1" value="${intro.intro_info1}" /></p>
								<p><input type="text" name="intro_info1_2" value="${intro.intro_info1_2}" /></p>
								<p>
									<!-- <a class="btn btn-primary" href="/docs/5.2/components/navbar/#offcanvas" role="button">Learn more about offcanvas navbars &raquo;</a> -->
								</p>
							</div>
						</div>
					</div>



					<!-- START THE FEATURETTES -->

					<hr class="featurette-divider">
					<!--  <div class="">
        <h1></h1>
        <h1 class="text-muted"></h1>
    </div> -->
					<div class="row featurette">
						<div class="col-md-7">
							<h2 class="featurette-heading fw-normal lh-1">
								<input type="text" name="intro_s_t4" value="${intro.intro_s_t4}" /><span class="text-muted"></span>
							</h2>
							<br>
							<p class="lead"><input type="text" name="intro_s_c4" value="${intro.intro_s_c4}" /></p>
							<p class="lead"><input type="text" name="intro_s_c4_2" value="${intro.intro_s_c4_2}" /></p>
							<p class="lead"><input type="text" name="intro_s_c4_3" value="${intro.intro_s_c4_3}" /></p>
							<br>
							<p class="lead"><input type="text" name="intro_s_c4_4" value="${intro.intro_s_c4_4}" /></p>
							<p class="lead"><input type="text" name="intro_s_c4_5" value="${intro.intro_s_c4_5}" /></p>
							<p class="lead"><input type="text" name="intro_s_c4_6" value="${intro.intro_s_c4_6}" /></p>
						</div>
						<div class="col-md-5">
<!-- 							<svg -->
<!-- 								class="bd-placeholder-img bd-placeholder-img-lg featurette-image img-fluid mx-auto" -->
<!-- 								width="500" height="500" xmlns="http://www.w3.org/2000/svg" -->
<!-- 								role="img" aria-label="Placeholder: 500x500" -->
<!-- 								preserveAspectRatio="xMidYMid slice" focusable="false"> -->
<!--                   <title>Placeholder</title><rect width="100%" -->
<!-- 									height="100%" fill="#eee" /> -->
<!--                   </svg> -->
                  <img class="bd-placeholder-img bd-placeholder-img-lg featurette-image img-fluid mx-auto" width="500" height="500" src="resources/img/${intro.intro_s_img4}">
                  <div class="f_box">
								<label for="img">사진첨부</label> <input type="file" id="img"
									name="uploadFile5">
							</div>

						</div>
					</div>
					<input type="submit" class="btn btn-outline-primary" value="수정">
					<hr class="featurette-divider">
			</form>
		</div>
		<!-- /.container -->


		<!-- FOOTER -->

		</footer>
		-->
	</main>


	<script
		src="https://getbootstrap.kr/docs/5.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
		crossorigin="anonymous"></script>

	<%-- 	<%@ include file="footer.jsp"%> --%>
</body>
</html>