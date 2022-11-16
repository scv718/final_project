<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.io.PrintWriter"%>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<link rel="stylesheet"
	href="//cdn.jsdelivr.net/gh/xpressengine/xeicon@2.3.1/xeicon.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.8.js"></script>
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/header.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
	<link rel="icon" href="/resources/img/파비콘3.ico">
	<ul class="navbar-nav" id="loginform">
		<c:choose>
			<c:when test='${userID ne NULL}'>
				<ul class="navbar-nav nav-right">
					<li class="nav-item" id = "loginMenu"><a class="nav-link" href = "preference.wp">${userName}님</a> 
					<a id = "loginLang" class="nav-link" href="mypage.wp">MyPage</a>
					<c:choose>
						<c:when test="${userType eq 'kakao'}">
								<a id = "loginLang" class="nav-link" href="#" onclick="kakaoLogout();">Logout</a>
						</c:when>
						<c:when test="${userType eq 'naver'}">
								<a id = "loginLang" class="nav-link" href="naverLogout.wp" >Logout</a>
						</c:when>
						<c:otherwise>
							<a id = "loginLang" class="nav-link" href="logout.wp">Logout</a>
						</c:otherwise>
					</c:choose>	
					</li>
					</ul>
						</c:when>
						<c:otherwise>
					<li class="nav-item" id = "loginMenu"><a id = "loginLang" class="nav-link" href="signUp.wp">Login</a></li>
						</c:otherwise>
					</c:choose>
				</ul>
		
	
					
			
		
		
	
									<script>
function kakaoLogout() {

    $.ajax({
        url: '/logOutkakaoUrl.wp',
        type: 'get',
        async: false,
        dataType: 'text',
        success: function (res) {
            location.href = res;
        }
    });

  }
</script>
			
<div style = "text-align: center;">
<a class="navbar-brand" href="${pageContext.request.contextPath}/index.wp">Winery</a>

</div>

<nav id = "header" class="navbar navbar-expand-sm  navbar-light">
	<ul class="navbar-nav" id="upmenu">

		<li class="nav-item">
		<a id = "menuBtn" class ="dropdown-item" href="getIntro.wp" >Winery?</a></li>
		<li class="nav-item" id = "btntwo" >
		<a id = "menuBtn" >와인이야기</a></li>
		<li class="nav-item">	
		<a id = "menuBtn" class="dropdown-item" href="wineSearch.wp">와인검색</a></li>
		<li class="nav-item">	


		<a id = "menuBtn" class="dropdown-item" href="subscribe.wp">구독하기</a></li>
		<li class="nav-item"  id = "btnone"><a id = "menuBtn" >커뮤니티</a></li>

	</ul>
</nav>

<div class = "box" id = "box">
<a  id = "secondMenu" href="getNoticeList.wp">공지사항</a>
<a  id = "secondMenu" href="getFaqList.wp">FAQ</a> 
<a id = "secondMenu" href="getReviewList.wp">상품후기</a>
</div>

	
<div class = "box1" id = "box">
	<a id = "secondMenu" href="wineStory1.wp">와인이 뭐예요?</a> 
	<a id = "secondMenu" href="wineStory2.wp">어떻게 고르죠?</a>
	<a id = "secondMenu" href="wineStory3.wp">어떻게 먹어요?</a> 
</div>


<script type="text/javascript">
// const header = document.querySelector("#header");
// const headerHeight = header.getBoundingClientRect().height;
 
// window.addEventListener("scroll", () => {
//       if (window.scrollY > headerHeight) {
//       header.setAttribute("style", "background-color: white !important;");
//    } else {    
// header.setAttribute("style", "background-color: transparent;");
//    }
// });
</script>


<script>
// 	var element = document.getElementsByClassName("box")[0]
// 	var style = getComputedStyle(element)
// 	var display = style.display
	
// 	var element1 = document.getElementsByClassName("box1")[0]
// 	var style1 = getComputedStyle(element1)
// 	var display1 = style1.display
	
	
// $('#btnone').hover(function() {
// 	if (display1.indexOf('block') == 0){
// 	}else{
// 		$('.box').show();
// 		 $('.box').css("display", "block");
// 		  	 display = style.display

// 	}
// });
	
	// let box = document.querySelector('.box');
	// box.addEventListener('mouseleave',function(){

//	 	$('#box').css("display", "none");
//	 	display = style.display
	// });

	// $('#btntwo').hover(function() {
//	 	if (display.indexOf('block') == 0){
			
//	 	}else{
//	 		$('.box1').css("display", "block");
//	 		display1 = style1.display
		
//	 	}
	// });
//	 	let box1 = document.querySelector('.box1');
//	 	box1.addEventListener('mouseleave',function(){
//	 		$('.box1').css("display", "none");
//	 		display1 = style1.display
//	 	});
$('#btnone').mouseover(function() {
	$('.box1').hide();
	$('.box').show();
});

$('.box').mouseleave(function(){
	$('.box').hide();
});

$('#btntwo').mouseover(function() {
	$('.box').hide();
	$('.box1').show();
});

$('.box1').mouseleave(function(){
	$('.box1').hide();
});


	



</script>
