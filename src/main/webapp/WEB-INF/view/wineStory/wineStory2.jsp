<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<title>와이너리 | 와인이야기</title>

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/story.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" /> 
<link rel="icon" href="/resources/img/파비콘3.ico">
</head>
<script>
	$(document).ready(function(){
		$(window).scroll(function(){
			$('.semi-img, .semi-content').each(function(i){
				var bottom_of_element = $(this).offset().top + $(this).outerHeight() / 5;
				var bottom_of_window = $(window).scrollTop() + $(window).height();
				
				if(bottom_of_window > bottom_of_element) {
					$(this).animate({'opacity':'1'}, 700);
				}
			});
		});
	});
</script>

<body class="d-flex flex-column min-vh-100">

	<%@ include file="../../../header.jsp"%>
	
	<div id="wineStoryContainer">
		<div class="top-background-img">
		<div class="image-box">
			<img class="image-background" id="t1" src="${pageContext.request.contextPath}/resources/img/story/${story2_t.story_back_img}">
		</div>
		</div>
		<div class="middle-contents">
			<c:forEach items="${story2_c}" var="story2" varStatus="status">
				<div class="col">
					<h4 class="title">${story2.story_semi_title}</h4>
					<div class="semi-img">
						<img class="" width="200px" height="auto" title="와인 잔 아이콘  제작자: iconixar - Flaticon" 
						src="${pageContext.request.contextPath}/resources/img/story/${story2.story_add_img}">
					</div>
					<div class="semi-content">
						<div class="inner-content">
						<p style="white-space:pre;"><c:out value="${story2.story_content}"/></p>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
		<div class="col">
			<h5 class="semititle">더 알아보기</h5>
			<div class="end-buttons">
				<button class="btn-hover color-7" type="button" onclick="location.href = 'wineStory1.wp'">와인이란?</button>
				<button class="btn-hover color-7" type="button" onclick="location.href = 'wineStory3.wp'">곁들이 레시피</button>
			</div>
		</div>
	</div>
	<a id="MOVE_TOP_BTN" href="header" class="material-symbols-outlined">arrow_circle_up</a>
	<script>
    $(function() {
        $(window).scroll(function() {
            if ($(this).scrollTop() > 300) {
                $('#MOVE_TOP_BTN').fadeIn();
            } else {
                $('#MOVE_TOP_BTN').fadeOut();
            }
        });
        
        $("#MOVE_TOP_BTN").click(function() {
            $('html, body').animate({
                scrollTop : 0
            }, 400);
            return false;
        });
    });
	</script>
	<%@ include file="/footer.jsp"%>
</body>

</html>
