<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="Mark Otto, Jacob Thornton, 그리고 Bootstrap 기여자들">
<meta name="generator" content="Hugo 0.104.2">
<title>Winery 수정 - 관리자</title>
<link rel="canonical" href="https://getbootstrap.kr/docs/5.2/examples/carousel/">
<link href="https://getbootstrap.kr/docs/5.2/dist/css/bootstrap.min.css" rel="stylesheet">
<%@ include file="../../../header.jsp"%>
<link rel="stylesheet"	href="${pageContext.request.contextPath}/resources/css/intro.css"/> 
<style>
.f_box{
width: 60%;
    margin: 0 auto;
    }
</style>
</head>

<body class="d-flex flex-column min-vh-100">

	<main>

	<div id="myCarousel" class="carousel slide" data-bs-ride="carousel">
		<form action="admin_updateIntro.wp" method="post" enctype="multipart/form-data">
		
		<div class="img">
			<div class="carousel-inner">
				<div class="carousel-item active">
					<img class="bd-placeholder-img" width="100%" height="100%" src="resources/img/intro/${intro.intro_img}">
											
				<div class="container">
					<div class="carousel-caption text-start">
						<h1>
							<input type="text" class="form-control innm" name="intro_t1" value="${intro.intro_t1}">
						</h1>
						<h1>
							<input type="text" class="form-control innm" name="intro_t1_2" value="${intro.intro_t1_2}">
						</h1>							
					</div>
				</div>

				</div>
			</div>
			
			<div class="f_box">
				<label for="img"></label> <input class="form-control innm" type="file" id="img" name="uploadFile"><br>
			</div>
		</div>


			<div class="container marketing">

				<div>
					<h1><input type="text" class="form-control innm" name="intro_t2" value="${intro.intro_t2}" /></h1>
					<h1 class="text-muted"><input type="text" class="form-control innm" name="intro_t2_2" value="${intro.intro_t2_2}" /></h1>
					<br> <br> <br>
				</div>
				
				<div class="row">

					<div class="col-lg-4">
						<img class="bd-placeholder-img" width="140" height="140" src="resources/img/intro/${intro.intro_s_img1}">
						<div class="f_box">
							<label for="img"></label> 
							<input type="file" class="form-control innm" id="img" name="uploadFile2"><br>
						</div>
						<h2 class="fw-normal"><input type="text" class="form-control innm" name="intro_s_t1" value="${intro.intro_s_t1}" /></h2>
						<p>
							<input type="text" class="form-control innm" name="intro_s_c1" value="${intro.intro_s_c1}" /> 
							<input type="text" class="form-control innm" name="intro_s_c1_2" value="${intro.intro_s_c1_2}" />
						</p>
						<p>
							<button type="button" class="btn btn-secondary" disabled>오시는 길</button>
						</p>
					</div>
					
					<div class="col-lg-4">
						<img class="bd-placeholder-img" width="140" height="140" src="resources/img/intro/${intro.intro_s_img2}">
						<div class="f_box">
							<label for="img"></label> 
							<input type="file" class="form-control innm" id="img" name="uploadFile3"><br>
						</div>
						<h2 class="fw-normal"><input type="text" class="form-control innm" name="intro_s_t2" value="${intro.intro_s_t2}" /></h2>
						<p>
							<input type="text" class="form-control innm" name="intro_s_c2" value="${intro.intro_s_c2}" /> 
							<input type="text" class="form-control innm" name="intro_s_c2_2" value="${intro.intro_s_c2_2}" />
						</p>
						<p>
							<button type="button" class="btn btn-secondary" disabled>검색하기</button>
						</p>
					</div>
					
					<div class="col-lg-4">
						<img class="bd-placeholder-img" width="140" height="140" src="resources/img/intro/${intro.intro_s_img3}">
						<div class="f_box">
							<label for="img"></label> 
							<input type="file" class="form-control innm" id="img" name="uploadFile4"><br>
						</div>
						<h2 class="fw-normal"><input type="text" class="form-control innm" name="intro_s_t3" value="${intro.intro_s_t3}" /></h2>
						<p>
							<input type="text" class="form-control innm" name="intro_s_c3" value="${intro.intro_s_c3}" /> 
							<input type="text" class="form-control innm" name="intro_s_c3_2" value="${intro.intro_s_c3_2}" />
						</p>
						<p>
							<button type="button" class="btn btn-secondary" disabled>구독하기</button>
						</p>
					</div>
					
				</div>
				

				<div class="container my-5">
					<div class="bg-light p-5 rounded">
						<div class="col-sm-8 py-5 mx-auto">
							<h1 class="display-5 fw-normal">이용안내</h1>
							<p class="fs-5"><input type="text" class="form-control innm" name="intro_info1" value="${intro.intro_info1}" /></p>
							<p><input type="text" class="form-control innm" name="intro_info1_2" value="${intro.intro_info1_2}" /></p>	
						</div>
					</div>
				</div>

				<hr class="featurette-divider">
	
				<div class="row featurette">
					<div class="col-md-7">
						<h2 class="featurette-heading fw-normal lh-1">
							<input type="text" class="form-control innm" name="intro_s_t4" value="${intro.intro_s_t4}" />
						</h2>
						<br>
						<p class="lead"><input type="text" class="form-control innm" name="intro_s_c4" value="${intro.intro_s_c4}" /></p>
						<p class="lead"><input type="text" class="form-control innm" name="intro_s_c4_2" value="${intro.intro_s_c4_2}" /></p>
						<p class="lead"><input type="text" class="form-control innm" name="intro_s_c4_3" value="${intro.intro_s_c4_3}" /></p>
						<br>
						<p class="lead"><input type="text" class="form-control innm" name="intro_s_c4_4" value="${intro.intro_s_c4_4}" /></p>
						<p class="lead"><input type="text" class="form-control innm" name="intro_s_c4_5" value="${intro.intro_s_c4_5}" /></p>
						<p class="lead"><input type="text" class="form-control innm" name="intro_s_c4_6" value="${intro.intro_s_c4_6}" /></p>
					</div>
					<div class="col-md-5">

                 		<img class="bd-placeholder-img bd-placeholder-img-lg featurette-image img-fluid mx-auto" width="500" height="500" src="resources/img/intro/${intro.intro_s_img4}">
                 		<div class="f_box">
							<label for="img"></label> 
							<input type="file" id="img" class="form-control innm" name="uploadFile5">
						</div>

					</div>
				</div>
				<hr class="featurette-divider">

				<div class="d-grid gap-2 col-6 mx-auto">
 					<button class="btn btn-dark" type="submit">수정하기</button>
				</div>
				
			</div>
		</form>
		
	</div>		
</main>

<script src="https://getbootstrap.kr/docs/5.2/dist/js/bootstrap.bundle.min.js"></script>

<%@ include file="../../../footer.jsp"%>
</body>
</html>