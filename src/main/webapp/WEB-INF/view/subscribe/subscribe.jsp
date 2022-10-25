<%@ page contentType="text/html; charset=utf-8"%>

<!DOCTYPE html>
<html>
<head>
<title>사이트 구독</title>

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/subscribe.css">
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

	<div id="t1">
		<img class="down-arrow" src="resources/img/와인구독 test (2).jpg" />
		<div id="text-p">
			<p>
				<br>평<br>범<br>한<br>하<br>루 <br>
			</p>
			<span class="parent"><p class="child">와인과 떠나는 여행 궁금하다면</p></span> <span
				class="parent"><p class="child">
					<a href="loginForm.wp" role="button" id="bookmark">'구독'</a>을 눌러주세요
				</p></span>
		</div>
	</div>

	<div id="fofo">
		<div class="row">
			<div class="col-md-4">
				<div class="card mb-4 rounded-3 shadow-sm border-primary">
					<div class="card-header py-3 text-bg-primary border-primary"
						id="list-1">
						<h4 class="my-0 fw-normal">초급</h4>
					</div>
					<div class="card-body" id="cbo">
						<h1 class="card-title pricing-card-title">
							초심자<small class="text-muted fw-light">의 행운</small>
						</h1>
						<ul class="list-unstyled mt-3 mb-4">
							<li>와인 입문자를 위한 패키지</li>
							<li>79,000원</li>
							<li>결제일</li>
							<li>매월 1일</li>
							<li>도착일</li>
							<li>매월 20일</li>
						</ul>
						<a href="loginForm.wp">
							<button type="button" id="colre"
								class="w-100 btn btn-lg btn-outline-primary">초급자로 성장하기</button>
						</a>
					</div>
				</div>
			</div>

			<div class="col-md-4 ">
				<div class="card mb-4 rounded-3 shadow-sm border-primary">
					<div class="card-header py-3 text-bg-primary border-primary"
						id="list-2">
						<h4 class="my-0 fw-normal">중급</h4>
					</div>
					<div class="card-body" id="cbo">
						<h1 class="card-title pricing-card-title">
							중급자<small class="text-muted fw-light">의 풍미</small>
						</h1>
						<ul class="list-unstyled mt-3 mb-4">
							<li>와인 마니아를 위한 패키지</li>
							<li>109,000원</li>
							<li>결제일</li>
							<li>매월 1일</li>
							<li>도착일</li>
							<li>매월 20일</li>
						</ul>
						<a href="loginForm.wp">
							<button type="button" id="colre"
								class="w-100 btn btn-lg btn-outline-primary">중급자로 성장하기</button>
						</a>
					</div>
				</div>
			</div>


			<div class="col-md-4">
				<div class="card mb-4 rounded-3 shadow-sm border-primary">
					<div class="card-header py-3 text-bg-primary border-primary"
						id="list-3">
						<h4 class="my-0 fw-normal">고급</h4>
					</div>
					<div class="card-body" id="cbo">
						<h1 class="card-title pricing-card-title">
							고급자<small class="text-muted fw-light">의 일상</small>
						</h1>
						<ul class="list-unstyled mt-3 mb-4">
							<li>와인 소물리에를 위한 패키지</li>
							<li>309,000원</li>
							<li>결제일</li>
							<li>매월 1일</li>
							<li>도착일</li>
							<li>매월 20일</li>
						</ul>
						<a href="loginForm.do">
							<button type="button" id="colre"
								class="w-100 btn btn-lg btn-outline-primary">고급자로 성장하기</button>
						</a>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div class="col-md-12" id="jb-wrap">
		<img src="resources/img/구독-원.png" />
		<div id="jb-text">
			<div>
				<h1 class="my-0 fw-normal">패키지 구성</h1>
				<br>
			</div>
			<div>
				<h4>매월 등급에 맞는 3개의 와인</h4><br>
				<h4>결재일과 배송일</h4>
				<h4>결재일 : 매월 1일 결재</h4>
				<h4>배송일 : 매월 22일 순차 배송</h4>
				<hr>
				<br>
				<div class="blink">
					<h4>재구독률 86%</h4>
				</div>
			</div>
		</div>
	</div>

	<div class="center-block" id="fm">
		<div class="#jb-text">
			<h1>이제 &#x27;여행&#x27;을</h1>
			<h1>떠날 준비 되셨나요?</h1>
		</div>

		<div class="loate">
			<a href="#bookmark">
				<button type="button" class="btn btn-default btn-lg btn-block">
					구독을 눌러주세요</button>
			</a>
		</div>
	</div>

	<%@ include file="/footer.jsp"%>
</body>
 
</html>
