<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/wineSerch.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
<style>
#searchNav {
	-webkit-justify-content: flex-end;
	justify-content: flex-end;
}

div.left {
	width: 70%;
	float: left;
	box-sizing: border-box;
	background: #EED0CD;
	overflow: auto;
}

div.right {
	width: 30%;
	float: right;
	background: #fff;
}

hr {
	margin: 0px;
}

div.option {
	position: static;
	width: 100%;
}

h6 {
	text-align: center;
}
</style>
<body class = "d-flex flex-column min-vh-100">
	<%@ include file="../../../header.jsp"%>
	<div class="jumbotron1">
		<img class="img_box"
			src="${pageContext.request.contextPath}/resources/img/winery_farm2.jpg"
			style="width: 100%; item: center">
	</div>
	<div>

		<nav id="searchNav1" class="navbar navbar-dark">
			<form class="form-inline" action="getWineSearch.wp" method="post">
				<h1>와인 찾아보기</h1>
				<input class="form-control mr-sm-2" type="text" name="searchKeyword"
					placeholder="검색어를 입력하세요.">
				<button class="btn btn-success" type="submit">검색</button>
				
				<p> 총 ${wineCount }개의 결과</p>
			</form>
		</nav>
	</div>
	<div>
		<div class="left"
			style="overflow: scroll; overflow-x: hidden; height: 80%;">

			<table>
				<c:forEach items="${wineList}" var="wine" varStatus="status">
					<tr>
						<td class="tdCenter">
							<div class="card" style="width: 150px">
								<img class="card-img-top1"
									src="${pageContext.request.contextPath}/resources/img/wine/${wine.w_image1}"
									alt="wine image">
								<div class="card-body">
									<h4 class="card-title">${wine.w_nm_k}</h4>
									<p class="card-text">${wine.w_price}</p>
									<a href="product.wp?w_no=${wine.w_no}"
										class="btn btn-primary stretched-link">상세보기</a>
								</div>
							</div>
						</td>
					</tr>
				</c:forEach>
			</table>
		</div>
		<div class="right"
			style="height: 80%; overflow: scroll; overflow-x: hidden;">
			<form class="form-inline" action="detaileSearch.wp" method="post">
				<div class="option">
					<h6>와인 종류</h6>
					<hr>
					<input type="radio" id="type1" name="type" value="0">레드와인 
					<input type="radio" id="type2" name="type" value="1">화이트와인 
					<input type="radio" id="type3" name="type" value="2">스파클링와인 
					<input type="radio" id="type4" name="type" value="3">로제와인
				</div>
				<hr>
				<br>
				<div class="option">
					<h6>대륙</h6>
					<hr>
					<input type="radio" id="continental1" name="continental" value="유럽">유럽
					<input type="radio" id="continental2" name="continental" value="북아메리카">북아메리카 
					<input type="radio" id="continental3" name="continental" value="남아메리카">남아메리카 
					<input type="radio" id="continental4" name="continental" value="오스트레일리아">오스트레일리아<br>
					<hr>
				</div>
				<hr>
				<br>
				<div class="option">
					<h6>나라</h6>
					<hr>
					<input type="radio" id="country1" name="country" value="미국">미국
					<input type="radio" id="country2" name="country" value="스페인">스페인
					<input type="radio" id="country3" name="country" value="아르헨티나">아르헨티나
					<input type="radio" id="country4" name="country" value="이탈리아">이탈리아
					<input type="radio" id="country5" name="country" value="칠레">칠레
					<input type="radio" id="country6" name="country" value="캐나다">캐나다
					<input type="radio" id="country7" name="country" value="프랑스">프랑스
					<input type="radio" id="country8" name="country" value="호주">호주
					<hr>
				</div>
				<hr>
				<br>
				<div class="option">
					<h6>당도</h6>
					<hr>
					<input type="radio" name="w_sweet" value="1">1 
					<input type="radio" name="w_sweet" value="2">2 
					<input type="radio" name="w_sweet" value="3">3 
					<input type="radio" name="w_sweet" value="4">4 
					<input type="radio" name="w_sweet" value="5">5 <br>
					<hr>
				</div>
				<br>
				<hr>
				<div class="option">
					<h6>바디감</h6>
					<hr>
					<input type="radio" name="w_body" value="1">1 <input
						type="radio" name="w_body" value="2">2 <input type="radio"
						name="w_body" value="3">3 <input type="radio"
						name="w_body" value="4">4 <input type="radio"
						name="w_body" value="5">5 <br>
					<hr>
				</div>
				<br>
				<hr>
				<div class="option">
					<h6>산미</h6>
					<hr>
					<input type="radio" name="w_acidity" value="1">1 <input
						type="radio" name="w_acidity" value="2">2 <input
						type="radio" name="w_acidity" value="3">3 <input
						type="radio" name="w_acidity" value="4">4 <input
						type="radio" name="w_acidity" value="5">5 <br>
					<hr>
				</div>
				<br>
				<hr>
				<div class="option">
					<h6>타닌</h6>
					<hr>
					<input type="radio" name="w_tannins" value="1">1 <input
						type="radio" name="w_tannins" value="2">2 <input
						type="radio" name="w_tannins" value="3">3 <input
						type="radio" name="w_tannins" value="4">4 <input
						type="radio" name="w_tannins" value="5">5 <br>
					<hr>
				</div>
				<br> <br>
				<hr>
				<div>
					<hr>
					<button class="btn btn-success" type="submit">검색</button>
					<button class="btn btn-success" type="reset">초기화</button>
				</div>
			</form>

		</div>
	</div>
	<div>
		<%@ include file="../../../footer.jsp"%>
	</div>
</body>
</html>
