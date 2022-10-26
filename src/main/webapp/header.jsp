<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.io.PrintWriter"%>


<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>

<script src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>


<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/header.css">

	<ul class="navbar-nav" id="loginform">
		<c:choose>
			<c:when test='${userID ne NULL}'>
				<ul class="navbar-nav nav-right">
					<li class="nav-item" id = "loginMenu"><a class="nav-link">${userName}님</a> <a id = "loginLang" class="nav-link" href="logout.wp">Logout</a></li>
					</li>
				</ul>
			</c:when>
			<c:otherwise>
				<ul class="navbar-nav nav-right">
					<li class="nav-item" id = "loginMenu"><a id = "loginLang" class="nav-link" href="singUp.wp">Login</a>
					</li>
				</ul>
			</c:otherwise>
		</c:choose>
	</ul>
<div style = "text-align: center;">
<a class="navbar-brand" href="${pageContext.request.contextPath}/index.jsp">Winery</a>

</div>

<nav id = "header" class="navbar navbar-expand-sm  navbar-light">
	<ul class="navbar-nav" id="upmenu">

		<li class="nav-item">
		<a id = "menuBtn" class ="dropdown-item" href="phone.jsp" >Winery?</a></li>
		<li class="nav-item" id = "btntwo" >
		<a id = "menuBtn"  class ="dropdown-item" href = "adminMain.wp" >와인이야기</a></li>
		<li class="nav-item">	
		<a id = "menuBtn" class="dropdown-item" href="test.jsp">와인검색</a></li>
		<li class="nav-item">	


		<a id = "menuBtn" class="dropdown-item" href="subscribe.wp">구독하기</a></li>
		<li class="nav-item"  id = "btnone"><a id = "menuBtn" class="dropdown-item" href="ajaxFile.jsp">커뮤니티</a></li>

	</ul>
</nav>

<div class = "box" id = "box">
<a  id = "secondMenu" href="#">공지사항</a>
<a  id = "secondMenu"  href="#">이벤트</a>
<a  id = "secondMenu" href="#">QnA</a> 
<a  id = "secondMenu"  href="#">리뷰</a> 
</div>


<div class = "box1" id = "box">
	<a id = "secondMenu" href="#">와인소개</a> 
	<a id = "secondMenu" href="#">맛있게 와인 마시는법</a> 
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
