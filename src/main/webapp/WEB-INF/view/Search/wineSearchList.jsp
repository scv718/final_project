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
*{
margin: 0;
padding: 0;
}


hr {
	margin: 0px;
}

.option {
	position: static;
	width: 100%;
}

h6 {
	text-align: center;
}
</style>
<body class = "d-flex flex-column min-vh-100">
	<%@ include file="../../../header.jsp"%>

	<div>
		<div class="left">
			<div class ="row">
			<div class = "row" id = "title">
			<div>
			<form class="form-inline" action="getWineSearch.wp" method="post">
<!-- 				<h1>와인 찾아보기</h1> -->
				<input class="form-control mr-sm-2" type="text" name="searchKeyword"
					placeholder="검색어를 입력하세요.">
				<button id ="searchbtn" class="btn-hover color-8" type="submit">검색</button>
				<p id = "totalresult"> 총 ${wineCount }개의 결과</p>
				<a id = "mobilemenubtn"><i class = "xi-bars"></i></a>
			</form>
		</div>
		<script type="text/javascript">
		$('#mobilemenubtn').click(function() {
			 if($('#mobilemenu').is(':visible')){
				 $('#mobilemenu').hide();
			 }else{
				 $('#mobilemenu').show();
			 }	
		})
		</script>
		<div class = "row" id = "mobilemenu">
		<div >
			<form class="form-inline" action="detaileSearch.wp" method="post">
				<div class="option">
					<h6>와인 종류</h6>
					<hr>
					<input type="radio" id="type1" name="type" value="0">레드와인<br>
					<input type="radio" id="type2" name="type" value="1">화이트와인 <br>
					<input type="radio" id="type3" name="type" value="2">스파클링와인 <br>
					<input type="radio" id="type4" name="type" value="3">로제와인<br>
				</div>
				<hr>
				<br>
				<div class="option">
					<h6>대륙</h6>
					<hr>
					<input type="radio" id="continental1" name="continental" value="유럽">유럽<br>
					<input type="radio" id="continental2" name="continental" value="북아메리카">북아메리카 <br>
					<input type="radio" id="continental3" name="continental" value="남아메리카">남아메리카 <br>
					<input type="radio" id="continental4" name="continental" value="오스트레일리아">오스트레일리아<br>
					<hr>
				</div>
				<hr>
				<br>
				<div class="option">
					<h6>나라</h6>
					<hr>
					<input type="radio" id="country1" name="country" value="미국">미국<br>
					<input type="radio" id="country2" name="country" value="스페인">스페인<br>
					<input type="radio" id="country3" name="country" value="아르헨티나">아르헨티나<br>
					<input type="radio" id="country4" name="country" value="이탈리아">이탈리아<br>
					<input type="radio" id="country5" name="country" value="칠레">칠레<br>
					<input type="radio" id="country6" name="country" value="캐나다">캐나다<br>
					<input type="radio" id="country7" name="country" value="프랑스">프랑스<br>
					<input type="radio" id="country8" name="country" value="호주">호주<br>
					<hr>
				</div>
				<hr>
				<br>
				<div class="typeoption">
					<h6>당도</h6>
					<hr>
					<input type="radio" class = "selectbtn" id = "w_sweet" name="w_sweet" value="1"><label for = "w_sweet"><i class = "xi-full-moon" id = "one"></i></label>
					<input type="radio" class = "selectbtn" id = "w_sweet2" name="w_sweet" value="2"><label for = "w_sweet2"><i class = "xi-full-moon" id = "two"></i></label>
					<input type="radio" class = "selectbtn" id = "w_sweet3" name="w_sweet" value="3"><label for = "w_sweet3"><i class = "xi-full-moon" id = "three"></i> </label>
					<input type="radio" class = "selectbtn" id = "w_sweet4" name="w_sweet" value="4"><label for = "w_sweet4"><i class = "xi-full-moon" id = "four"></i> </label>
					<input type="radio" class = "selectbtn" id = "w_sweet5" name="w_sweet" value="5"><label for = "w_sweet5"><i class = "xi-full-moon" id = "five"></i> </label>
					<hr>
				</div>
				<br>
				<hr>
				<div class="typeoption">
					<h6>바디감</h6>
					<hr>
					<input type="radio"  class = "selectbtn" id = "w_body" name="w_body" value="1"><label for = "w_body"><i class = "xi-full-moon" id = "one"></i></label>
					<input type="radio"  class = "selectbtn" id = "w_body2" name="w_body" value="2"><label for = "w_body2"><i class = "xi-full-moon" id = "two"></i></label>
					<input type="radio"  class = "selectbtn" id = "w_body3" name="w_body" value="3"><label for = "w_body3"><i class = "xi-full-moon" id = "three"></i></label>
					<input type="radio"  class = "selectbtn" id = "w_body4" name="w_body" value="4"><label for = "w_body4"><i class = "xi-full-moon" id = "four"></i></label>
					<input type="radio"  class = "selectbtn" id = "w_body5" name="w_body" value="5"><label for = "w_body5"><i class = "xi-full-moon" id = "five"></i></label>
						<br>
					<hr>
				</div>
				<br>
				<hr>
				<div class="typeoption">
					<h6>산미</h6>
					<hr>
					<input type="radio"  class = "selectbtn" id = "w_acidity" name="w_acidity" value="1"><label for = "w_acidity"><i class = "xi-full-moon" id = "one"></i></label>
					<input type="radio"  class = "selectbtn" id = "w_acidity2" name="w_acidity" value="2"><label for = "w_acidity2"><i class = "xi-full-moon" id = "two"></i></label>
					<input type="radio"  class = "selectbtn" id = "w_acidity3" name="w_acidity" value="3"><label for = "w_acidity3"><i class = "xi-full-moon" id = "three"></i></label>
					<input type="radio"  class = "selectbtn" id = "w_acidity4" name="w_acidity" value="4"><label for = "w_acidity4"><i class = "xi-full-moon" id = "four"></i></label>
					<input type="radio"  class = "selectbtn" id = "w_acidity5" name="w_acidity" value="5"><label for = "w_acidity5"><i class = "xi-full-moon" id = "five"></i></label>
					
					<hr>
				</div>
				<br>
				<hr>
				<div class=typeoption>
					<h6>타닌</h6>
					<hr>
					<input type="radio"  class = "selectbtn" id = "w_tannins" name="w_tannins" value="1"><label for = "w_tannins"><i class = "xi-full-moon" id = "one"></i></label>
					<input type="radio"  class = "selectbtn" id = "w_tannins2" name="w_tannins" value="2"><label for = "w_tannins2"><i class = "xi-full-moon" id = "two"></i></label>
					<input type="radio"  class = "selectbtn" id = "w_tannins3" name="w_tannins" value="3"><label for = "w_tannins3"><i class = "xi-full-moon" id = "three"></i></label>
					<input type="radio"  class = "selectbtn" id = "w_tannins4" name="w_tannins" value="4"><label for = "w_tannins4"><i class = "xi-full-moon" id = "four"></i></label>
					<input type="radio"  class = "selectbtn" id = "w_tannins5" name="w_tannins" value="5"><label for = "w_tannins5"><i class = "xi-full-moon" id = "five"></i></label>
					
					<hr>
				</div>
				<br> <br>
				<hr>
				<div style= "margin: 0 auto;">
					<hr>
					<button class="btn-hover color-9" type="submit">검색</button>
					<button class="btn-hover color-9" type="reset">초기화</button>
				</div>
			</form>

		</div>
		</div>
		</div>
			<div class = "row" id = "productlist">
			<c:forEach items="${wineList}" var="wine" varStatus="status">
							<div class="col-lg-3 col-sm-4" id = "card">
							<img class="card-img-top1" src="${pageContext.request.contextPath}/resources/img/wine/${wine.w_image1}" 
							alt="wine image">
								<p class="card-title">${wine.w_nm_k}</p>
									<p class="card-text">${wine.w_price}</p>
									<button onclick = 'location.href="product.wp?w_no=${wine.w_no}"'
										class="btn-hover color-8">상세보기</button>
							</div>							
			</c:forEach>
			</div>
			</div>
			<div id="js-btn-wrap" class="btn-wrap"><button id = "plus" class = "btn-hover color-9"><i class = "xi-plus-min"></i></button></div>
			<script type="text/javascript">
			$(window).on('load', function () {
			    load('#card', '9');
			    $("#plus").on("click", function () {
			        load('#card', '9', '#js-btn-wrap');
			    })
			});
			 
			function load(id, cnt, btn) {
			    var girls_list = id + "#card:not(.active)";
			    console.log(id);
			    console.log(girls_list);
			    var girls_length = $(girls_list).length;
			    console.log(girls_length);
			    var girls_total_cnt;
			    if (cnt < girls_length) {
			        girls_total_cnt = cnt;
			    } else {
			        girls_total_cnt = girls_length;
			        $('#plus').hide()
			    }
			    console.log(girls_total_cnt);
			    $(girls_list + ":lt(" + girls_total_cnt + ")").addClass("active");
			}
			</script>
		</div>
		<div class="right">
		<div class ="selectmenu">
			<form class="form-inline" action="detaileSearch.wp" method="post">
				<div class="option">
					<h6>와인 종류</h6>
					<hr>
					<input type="radio" id="type1" name="type" value="0">레드와인<br>
					<input type="radio" id="type2" name="type" value="1">화이트와인 <br>
					<input type="radio" id="type3" name="type" value="2">스파클링와인 <br>
					<input type="radio" id="type4" name="type" value="3">로제와인<br>
				</div>
				<hr>
				<br>
				<div class="option">
					<h6>대륙</h6>
					<hr>
					<input type="radio" id="continental1" name="continental" value="유럽">유럽<br>
					<input type="radio" id="continental2" name="continental" value="북아메리카">북아메리카 <br>
					<input type="radio" id="continental3" name="continental" value="남아메리카">남아메리카 <br>
					<input type="radio" id="continental4" name="continental" value="오스트레일리아">오스트레일리아<br>
					<hr>
				</div>
				<hr>
				<br>
				<div class="option">
					<h6>나라</h6>
					<hr>
					<input type="radio" id="country1" name="country" value="미국">미국<br>
					<input type="radio" id="country2" name="country" value="스페인">스페인<br>
					<input type="radio" id="country3" name="country" value="아르헨티나">아르헨티나<br>
					<input type="radio" id="country4" name="country" value="이탈리아">이탈리아<br>
					<input type="radio" id="country5" name="country" value="칠레">칠레<br>
					<input type="radio" id="country6" name="country" value="캐나다">캐나다<br>
					<input type="radio" id="country7" name="country" value="프랑스">프랑스<br>
					<input type="radio" id="country8" name="country" value="호주">호주<br>
					<hr>
				</div>
				<hr>
				<br>
				<div class="option">
					<h6>당도</h6>
					<hr>
					<input type="radio" class = "selectbtn" id = "w_sweet" name="w_sweet" value="1"><label for = "w_sweet"><i class = "xi-full-moon" id = "one"></i></label>
					<input type="radio" class = "selectbtn" id = "w_sweet2" name="w_sweet" value="2"><label for = "w_sweet2"><i class = "xi-full-moon" id = "two"></i></label>
					<input type="radio" class = "selectbtn" id = "w_sweet3" name="w_sweet" value="3"><label for = "w_sweet3"><i class = "xi-full-moon" id = "three"></i> </label>
					<input type="radio" class = "selectbtn" id = "w_sweet4" name="w_sweet" value="4"><label for = "w_sweet4"><i class = "xi-full-moon" id = "four"></i> </label>
					<input type="radio" class = "selectbtn" id = "w_sweet5" name="w_sweet" value="5"><label for = "w_sweet5"><i class = "xi-full-moon" id = "five"></i> </label>
					<hr>
				</div>
				<br>
				<hr>
				<div class="option">
					<h6>바디감</h6>
					<hr>
					<input type="radio"  class = "selectbtn" id = "w_body" name="w_body" value="1"><label for = "w_body"><i class = "xi-full-moon" id = "one"></i></label>
					<input type="radio"  class = "selectbtn" id = "w_body2" name="w_body" value="2"><label for = "w_body2"><i class = "xi-full-moon" id = "two"></i></label>
					<input type="radio"  class = "selectbtn" id = "w_body3" name="w_body" value="3"><label for = "w_body3"><i class = "xi-full-moon" id = "three"></i></label>
					<input type="radio"  class = "selectbtn" id = "w_body4" name="w_body" value="4"><label for = "w_body4"><i class = "xi-full-moon" id = "four"></i></label>
					<input type="radio"  class = "selectbtn" id = "w_body5" name="w_body" value="5"><label for = "w_body5"><i class = "xi-full-moon" id = "five"></i></label>
						<br>
					<hr>
				</div>
				<br>
				<hr>
				<div class="option">
					<h6>산미</h6>
					<hr>
					<input type="radio"  class = "selectbtn" id = "w_acidity" name="w_acidity" value="1"><label for = "w_acidity"><i class = "xi-full-moon" id = "one"></i></label>
					<input type="radio"  class = "selectbtn" id = "w_acidity2" name="w_acidity" value="2"><label for = "w_acidity2"><i class = "xi-full-moon" id = "two"></i></label>
					<input type="radio"  class = "selectbtn" id = "w_acidity3" name="w_acidity" value="3"><label for = "w_acidity3"><i class = "xi-full-moon" id = "three"></i></label>
					<input type="radio"  class = "selectbtn" id = "w_acidity4" name="w_acidity" value="4"><label for = "w_acidity4"><i class = "xi-full-moon" id = "four"></i></label>
					<input type="radio"  class = "selectbtn" id = "w_acidity5" name="w_acidity" value="5"><label for = "w_acidity5"><i class = "xi-full-moon" id = "five"></i></label>
					
					<hr>
				</div>
				<br>
				<hr>
				<div class="option">
					<h6>타닌</h6>
					<hr>
					<input type="radio"  class = "selectbtn" id = "w_tannins" name="w_tannins" value="1"><label for = "w_tannins"><i class = "xi-full-moon" id = "one"></i></label>
					<input type="radio"  class = "selectbtn" id = "w_tannins2" name="w_tannins" value="2"><label for = "w_tannins2"><i class = "xi-full-moon" id = "two"></i></label>
					<input type="radio"  class = "selectbtn" id = "w_tannins3" name="w_tannins" value="3"><label for = "w_tannins3"><i class = "xi-full-moon" id = "three"></i></label>
					<input type="radio"  class = "selectbtn" id = "w_tannins4" name="w_tannins" value="4"><label for = "w_tannins4"><i class = "xi-full-moon" id = "four"></i></label>
					<input type="radio"  class = "selectbtn" id = "w_tannins5" name="w_tannins" value="5"><label for = "w_tannins5"><i class = "xi-full-moon" id = "five"></i></label>
					
					<hr>
				</div>
				<br> <br>
				<hr>
				<div style= "margin: 0 auto;">
					<hr>
					<button class="btn-hover color-9" type="submit">검색</button>
					<button class="btn-hover color-9" type="reset">초기화</button>
				</div>
			</form>

		</div>
		</div>
	</div>
	<div>
	<div class = "btn-hover color-9" id = "topbtn"  onclick="window.scrollTo(0,0);">
	<a>TOP</a></div>
		<%@ include file="../../../footer.jsp"%>
	</div>
</body>
</html>
