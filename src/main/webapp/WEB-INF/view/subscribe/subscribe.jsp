
<%@ page contentType="text/html; charset=utf-8"%>

	<%@ include file="../../../header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<title>사이트 구독</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/subscribe.css">
<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css"> -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
</head>

<body class="d-flex flex-column min-vh-100">
<input type="hidden" name="mylevel" value="${mylevel}"/>
<input type="hidden" name="userID" value="${userID}"/>
	<div id="t1">
		<img class="down-arrow" src="resources/img/와인구독 test (2).jpg" />
		<div id="text-p">
			<p>
				<br>평<br>범<br>한<br>하<br>루<br>
			</p>
			<span class="parent"><p class="child">와인과 떠나는 여행 궁금하다면</p></span> 
			<span class="parent"><p class="child">
<a href="javascript:void(0);" id ="subscribes" onclick="levelConfirm();">구독</a>을 눌러주세요</p></span>
		</div>
	</div>
	<div id="fofo">
				<div class="row" id="bookmark">
			<div class="col-md-4">
				<div class="thumbnail">
					<img src="resources/img/구독-2.jpg" alt="와인구독" />
					<div class="caption">
						<h1>
							<br>와인 입문자<br>패키지<br>
							<br>
						</h1>
						<h2>
							79,000원<br>
						</h2>
						<h2>
							결제일 : <span>매월 1일</span>
						</h2>
						<h2>
							도착일 : <span>매월 20일</span>
						</h2>
						<p>

<a href="javascript:void(0);" id ="subscribes1" onclick="levelConfirm1();">
								<button type="button" id="colre"
									class="w-100 btn btn-lg btn-outline-primary">와인 입문자로 성장하기</button>
							</a>
					</div>
				</div>
			</div>
		

		
			<div class="col-md-4">
				<div class="thumbnail">
					<img src="resources/img/구독-5.jpg" alt="와인구독" />
					<div class="caption">
						<h1>
							<br>와인 마니아<br>패키지<br>
							<br>
						</h1>
						<h2>
							109,000원<br>
						</h2>
						<h2>
							결제일 : <span>매월 1일</span>
						</h2>
						<h2>
							도착일 : <span>매월 20일</span>
						</h2>
						<p>
<a href="javascript:void(0);" id ="subscribes2" onclick="levelConfirm2();">
								<button type="button" id="colre"
									class="w-100 btn btn-lg btn-outline-primary">와인 마니아로 성장하기</button>
							</a>
						</p>
					</div>
				</div>
			</div>
	

	
		<div class="col-md-4">
				<div class="thumbnail">
					<img src="resources/img/구독-4.jpg" alt="와인구독" id="img-4"/>
					<div class="caption">
						<h1>
							<br>와인 마스터<br>패키지<br>
							<br>
						</h1>
						<h2>
							309,000원<br>
						</h2>
						<h2>
							결제일 : <span>매월 1일</span>
						</h2>
						<h2>
							도착일 : <span>매월 20일</span>
						</h2>
						<p>
<a href="javascript:void(0);" id ="subscribes3" onclick="levelConfirm3();">
								<button type="button" id="colre"
									class="w-100 btn btn-lg btn-outline-primary">와인 마스터로 성장하기</button>
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
				<h2>매월 등급에 맞는 3개의 와인</h2>
				<br>
				<h2>
				최대한 자신이 선택한 취향에서<br>
				선별된 최고의 와인을 배송해 드립니다<br>
				아름 다운 여행이 되기를</h2>
				<hr>
				<br>
				<div class="blink">
					<h4>재구독률 86%</h4>
				</div>
			</div>
		</div>
	</div>

	<hr><br>

	<div class="row featurette">
		<div class="col-md-7 " id="aa">
			<h1 class="featurette-heading">
				와인 입문자를 위한 패키지 
			</h1>
			<p class="lead">
			<h2><br><br>저희 <span class="cll">Winery</span>에서 제공하는 취향 선택 시스템을 이용하여.</h2>
			<h3>구독자 여러분들의 취향을 최대한 반영해 매월 3가지의 와인을 배송해 드립니다.<br>
			   배송 되는 와인은 레드 2개 화이트 1개로 구성되어 있습니다.<br>
			와인을 처음 접하시는 분들이나 와인을 잘모르지만 깊게 배우고 싶은 분들을 위한 패키지로<br>
			취향을 많이 가리거나 부담되는 와인은 선별하지 않기에 위와 같은 사항인 구독자 분들께 안성 맞춤입니다!!</h3>
			</p>
		</div>
		<div class="col-md-5">
			<img class="featurette-image img-responsive center-block"
				src="resources/img/구독-10.jpg"
				alt="Generic placeholder image">
		</div>
	</div>

	<hr><br>

	<div class="row featurette">
		<div class="col-md-7 col-md-push-5" id="aa">
			<h1 class="featurette-heading">
				와인 마니아를 위한 패키지 
			</h1>
			<p class="lead">
			<h2><br><br>저희 <span class="cll">Winery</span>에서 제공하는 취향 선택 시스템을 이용하여.</h2>
			<h3>구독자 여러분들의 취향을 최대한 반영해 매월 3가지의 와인을 배송해 드립니다.<br>
			   배송 되는 와인은 레드 2개 화이트 1개로 구성되어 있습니다.<br>
			내의 취향을 잘모르시는 분들이나 여러 분야의 와인을 맛보고 견식을 높이고 싶은 분들을 위한 패키지로<br>
			좋아하는 취향의 와인과 여러 분야의 와인을 맛보고 싶은 분들께 안성 맞춤입니다!! </h3>
			</p>
		</div>
		<div class="col-md-5 col-md-pull-7">
			<img class="featurette-image img-responsive center-block"
				src="resources/img/구독-8.jpg"
				alt="Generic placeholder image">
		</div>
	</div>

	<hr><br>

	<div class="row featurette">
		<div class="col-md-7" id="aa">
		<h1 class="featurette-heading">
			와인 마스터를 위한 패키지 
			</h1>
			<p class="lead">
			<h2  style="line-height: 24px  !important;"><br><br>저희 <span class="cll">Winery</span>에서 제공하는 취향 선택 시스템을 이용하여.</h2>
			<h3>구독자 여러분들의 취향을 최대한 반영해 매월 3가지의 와인을 배송해 드립니다.<br>
			   배송 되는 와인은 레드 1개 화이트 1개 로제 1개로 구성되어 있습니다.<br>
			와인을 사랑하고 좋아하는 분들을 위한, 다양성 있는 맛과 풍미가 준비된 패키지로<br>
			매월 자신의 취향으로 엄선된 고품격 와인과 새로운 취향에 눈을 뜨고 싶은 분들에게 안성 맞춤입니다!!</h3>
			</p>
		</div>
		<div class="col-md-5">
			<img class="featurette-image img-responsive center-block"
				src="resources/img/구독-11.jpg"
				alt="Generic placeholder image">
		</div>
	</div>

	<hr><br>

	<div class="center-block" id="fm">
		<div class="#jb-text">
			<h1>이제 &#x27;여행&#x27;을</h1>
			<h1>떠날 준비가 되셨나요?</h1>
		</div>

		<div>
		<br>
			<a href="#bookmark">
				<button type="button" class="btn-lg btn-block" id ="loate">
					구독을 눌러주세요</button>
			</a>
		</div>
	</div>
	
<script type="text/javascript">
function levelConfirm() {
		var id = '${userID}';
		var level = '${mylevel}';
		
		if(level > 0){
			alert('이미 구독한 계정입니다.\ 구독은 취소 후 재구독 가능합니다.');
		location.href = "subscribe-3.wp";
		}
		if(id == null){
			alert('로그인 후 구독이 가능 합니다.');
			location.href = "singUp.wp";
		}else if (level == 0){
		alert('구독 가능한 계정입니다.');
		}if(confirm("구독하시겠습니가?")){
			location.href = "subscribe-1.wp";
		}else{
			location.href = "subscribe.wp";
		}		 
}

function levelConfirm1() {
	var id = '${userID}';
	var level = '${mylevel}';
	
	if(level > 0){
		alert('이미 구독한 계정입니다.\ 구독은 취소 후 재구독 가능합니다.');
	location.href = "subscribe-3.wp";
	}
	if(id == null){
		alert('로그인 후 구독이 가능 합니다.');
		location.href = "singUp.wp";
	}else if (level == 0){
	}if(confirm("구독하시겠습니가?")){
		location.href = "subscribeP.wp";
	}else{
		location.href = "subscribe.wp";
	}
}
function levelConfirm2() {
	var id = '${userID}';
	var level = '${mylevel}';
	
	if(level > 0){
		alert('이미 구독한 계정입니다.\ 구독은 취소 후 재구독 가능합니다.');
	location.href = "subscribe-3.wp";
	}
	if(id == null){
		alert('로그인 후 구독이 가능 합니다.');
		location.href = "singUp.wp";
	}else if (level == 0){
	}if(confirm("구독하시겠습니가?")){
			location.href = "subscribeM.wp";
		}else{
			location.href = "subscribe.wp";
		}
	
}
function levelConfirm3() {
	var id = '${userID}';
	var level = '${mylevel}';
	
	if(level > 0){
		alert('이미 구독한 계정입니다.\ 구독은 취소 후 재구독 가능합니다.');
	location.href = "subscribe-3.wp";
	}
	if(id == null){
		alert('로그인 후 구독이 가능 합니다.');
		location.href = "singUp.wp";
	}else if (level == 0){
	}if(confirm("구독하시겠습니가?")){
		location.href = "subscribeG.wp";
	}else{
		location.href = "subscribe.wp";
	}
}

</script>


	<%@ include file="/footer.jsp"%>
</body>

</html>
