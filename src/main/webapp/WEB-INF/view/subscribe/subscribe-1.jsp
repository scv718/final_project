<%@ page contentType="text/html; charset=utf-8"%>
<%@ include file="../../../header.jsp"%>

<!DOCTYPE html>
<html>
<head>
<title>사이트 구독</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/subscribe.css">
</head>

<body class="d-flex flex-column min-vh-100">
	<div id="fofo">
		<div class="row" id="bookmark">
			<div class="col-md-4">
				<div class="thumbnail">
					<img src="resources/img/구독-2.jpg" alt="와인구독" />
					<div class="caption">
						<p style="font-size: 28px; font-weight: bolder; padding: 6px;">
							<br>와인 입문자<br>패키지<br>
						</p>
						<p>
							79,000원<br>
						</p>
						<p>
							<span style="font-size: 20px; font-weight: bolder;">결제일 :
							</span><span>매월 1일</span>
						</p>
						<p>
							<span style="font-size: 20px; font-weight: bolder;">도착일 :
							</span><span>매월 20일</span>
						</p>
						<p>
							<a href="subscribeP.wp">
								<button type="button" id="colre"
									class="w-100 btn btn-lg btn-outline-primary">와인 입문자로
									성장하기</button>
							</a>
					</div>
				</div>
			</div>



			<div class="col-md-4">
				<div class="thumbnail">
					<img src="resources/img/구독-5.jpg" alt="와인구독" />
					<div class="caption">
						<p style="font-size: 28px; font-weight: bolder; padding: 6px;">
							<br>와인 마니아<br>패키지<br>
						</p>
						<p>
							109,000원<br>
						</p>
						<p>
							<span style="font-size: 20px; font-weight: bolder;">결제일 :
							</span><span>매월 1일</span>
						</p>
						<p>
							<span style="font-size: 20px; font-weight: bolder;">도착일 :
							</span><span>매월 20일</span>
						</p>
						<p>
							<a href="subscribeM.wp">
								<button type="button" id="colre"
									class="w-100 btn btn-lg btn-outline-primary">와인 마니아로
									성장하기</button>
							</a>
						</p>
					</div>
				</div>
			</div>



			<div class="col-md-4">
				<div class="thumbnail">
					<img src="resources/img/구독-4.jpg" alt="와인구독" id="img-4" />
					<div class="caption">
						<p style="font-size: 28px; font-weight: bolder; padding: 6px;">
							<br>와인 마스터<br>패키지<br>
						</p>
						<p>
							309,000원<br>
						</p>
						<p>
							<span style="font-size: 20px; font-weight: bolder;">결제일 :
							</span><span>매월 1일</span>
						</p>
						<p>
							<span style="font-size: 20px; font-weight: bolder;">도착일 :
							</span><span>매월 20일</span>
						</p>
						<p>
							<a href="subscribeG.wp">
								<button type="button" id="colre"
									class="w-100 btn btn-lg btn-outline-primary">와인 마스터로
									성장하기</button>
							</a>
					</div>
				</div>
			</div>
		</div>
	</div>

	<%@ include file="/footer.jsp"%>
</body>

</html>
