
<%@ page contentType="text/html; charset=utf-8"%>

	<%@ include file="../../../header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<title>사이트 구독</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
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
		<img class="down-arrow" src="resources/img/구독 메인-4-2.png" />
		<div id="text-p">
			<p style="font-size: 24px;text-align: left;padding: 85px;vertical-align: top;vertical-align: text-top;line-height: 42px;vertical-align: top;">
와인 한 잔의 여유<br>그 한 잔이 안겨주는 즐거움<br>그 또 다른 여행이 아닐까?</p></div>
			<div id="btnan">
			<span class="parent"><p class="child">와인과 떠나는 미각 여행 궁금하다면.</p></span> 
</div>
		<div id="btnann"><a href="javascript:void(0);" id ="subscribes" onclick="levelConfirm();"><button type="button" id="colre"
									class="btn-hover color-7">구독하기</button></a></div>
	</div>
	<div id="fofo">
				<div class="row" id="bookmark">
			<div class="col-md-4">
				<div class="thumbnail">
					<img src="resources/img/구독-2.jpg" alt="와인구독" />
					<div class="caption">
						<p style="font-size: 28px;font-weight: bolder;padding: 6px;">
							<br>와인 입문자<br>패키지<br>
						</p>
						<p>
							79,000원<br>
						</p>
						<p>
							<span style="font-size: 20px;font-weight: bolder;">결제일 : </span><span>매월 1일</span>
						</p>
						<p>
						<span style="font-size: 20px;font-weight: bolder;">도착일 : </span><span>매월 20일</span>
						</p>
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
						<p style="font-size: 28px;font-weight: bolder;padding: 6px;">
							<br>와인 마니아<br>패키지<br>
						</p>
						<p>
							109,000원<br>
						</p>
						<p>
							<span style="font-size: 20px;font-weight: bolder;">결제일 : </span><span>매월 1일</span>
						</p>
						<p>
						<span style="font-size: 20px;font-weight: bolder;">도착일 : </span><span>매월 20일</span>
						</p>
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
						<p style="font-size: 28px;font-weight: bolder;padding: 6px;">
							<br>와인 마스터<br>패키지<br>
						</p>
						<p>
							309,000원<br>
						</p>
						<p>
							<span style="font-size: 20px;font-weight: bolder;">결제일 : </span><span>매월 1일</span>
						</p>
						<p>
						<span style="font-size: 20px;font-weight: bolder;">도착일 : </span><span>매월 20일</span>
						</p>
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
		<img src="resources/img/베너-3.png" />
		<div id="jb-wrap1">
<!-- 			<img src="resources/img/베너 -32.jpg" /> -->
			</div>
		<div id="jb-text">
				<p class="win">winery</p>
				<p class="win1">패키지 구성</p>
				<br>
			</div>
			<div class="lead">
				<p>매월 등급에 맞는 3가지의 와인을<br>
				자신이 설정한 취향을 최대한 반영하여<br>
				선별된 최고의 와인을 배송해 드립니다<br></p>
			</div>
		
	</div>

	<hr><br>
<div id="wirow">
	<div class="row featurette" style="margin-left: 43px">
		<div class="col-md-7 " id="aa">
			<h1 class="featurette-heading">
				와인 입문자 패키지 
			</h1>
			<div class="lead">
			<h2>저희 <span class="cll">Winery</span>에서 <span class="cll1">제공하는 취향 선택 시스템을 적용해</span></h2>
			<h3>구독자 분들의 취향을 최대한 반영하여 매월 3가지의 와인을 배송해 드립니다.<br>
			    배송 되는 와인은 레드 2개 , 화이트 1개로 구성되어 있습니다.<br>
				와인을 처음 접하시는 분들이나 와인을 잘모르지만 깊게 배우고 싶은 분들을 위한 패키지로<br>
				취향을 많이 가리거나 부담되는 와인은 선별하지 않기에 위와 같은 사항인 구독자 분들께 안성 맞춤입니다!!</h3>
			</div>
		</div>
		<div class="col-md-5">
			<img style="margin-right: 55;border-radius: 8%"class="featurette-image img-responsive center-block"
				src="resources/img/구독-10.jpg"
				alt="Generic placeholder image">
		</div>
	</div>

	<hr><br>

	<div class="row featurette"style="margin-left: 43px">
		<div class="col-md-7 col-md-push-5" id="aa">
			<h1 class="featurette-heading">
				와인 마니아 패키지 
			</h1>
			<div class="lead">
			<h2>저희 <span class="cll">Winery</span>에서 <span class="cll1">제공하는 취향 선택 시스템을 적용해</span></h2>
			<h3>구독자 분들의 취향을 최대한 반영하여 매월 3가지의 와인을 배송해 드립니다.<br>
			    배송되는 와인의 레드 2개 , 화이트 1개로 구성되어 있습니다.<br>
				내의 취향을 잘모르시는 분들이나 여러 분야의 와인을 맛보고 견식을 높이고 싶은 분들을 위한 패키지로<br>
				좋아하는 취향의 와인과 여러 분야의 와인을 맛보고 싶은 분들께 안성 맞춤입니다!!</h3>
			</div>
		</div>
		<div class="col-md-5 col-md-pull-7">
			<img style="border-radius: 8%"class="featurette-image img-responsive center-block"
				src="resources/img/구독-8.jpg"
				alt="Generic placeholder image">
		</div>
	</div>

	<hr><br>

	<div class="row featurette"style="margin-left: 43px">
		<div class="col-md-7" id="aa">
		<h1 class="featurette-heading">
			와인 마스터 패키지 
			</h1>
			<div class="lead">
			<h2>저희 <span class="cll">Winery</span>에서 <span class="cll1">제공하는 취향 선택 시스템을 적용해</span></h2>
			<h3>구독자 분들의 취향을 최대한 반영하여 매월 3가지의 와인을 배송해 드립니다.<br>
				배송되는 와인의 레드 1개 , 화이트 1개 , 로제 1개로 구성되어 있습니다.<br>
				와인을 사랑하고 좋아하는 분들을 위한, 다양성 있는 맛과 풍미가 준비된 패키지로<br>
				매월 자신의 취향으로 엄선된 고품격 와인과 새로운 취향에 눈을 뜨고 싶은 분들에게 안성 맞춤입니다!!</h3>
			</div>
		</div>
		<div class="col-md-5">
			<img style="border-radius: 8%"class="featurette-image img-responsive center-block"
				src="resources/img/구독-11.jpg"
				alt="Generic placeholder image">
		</div>
	</div>

	<hr><br>
</div>

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
			location.href = "signUp.wp";
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
		location.href = "signUp.wp";
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
		location.href = "signUp.wp";
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
		location.href = "signUp.wp";
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
