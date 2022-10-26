<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.util.Date"%>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/index.css">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" 
integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">



<style>
video {
	width: 100%;
	display: block;
	height: 610px;
}
.Btnimg{
	width: 60px;
}
.WaterBtn{
	
	background-color: white;
	border: none;
	margin-right: 50px;
}
.WaterBtn p{
	font-family: Parisienne !important;
	font-size: 20px;

}
#btncontainer{
	margin-top: 30px;
}
</style>
<body class = "d-flex flex-column min-vh-100">
<%@ include file="header.jsp"%>
<div class="imgSlide">
<div class="slider-1">
    <div class="slides">
        <div class="active">
        <video muted autoplay loop>
			<source src="resources/img/와인메인3.mp4" type="video/mp4">
		</video>
		</div>
        <div>
        <video muted autoplay loop>
			<source src="resources/img/와인메인2.mp4" type="video/mp4">
		</video></div>
        <div>
        <video muted autoplay loop>
			<source src="resources/img/와인메인.mp4" type="video/mp4">
		</video></div>
    </div>
    <div class="page-btns">
        <div class="active"></div>
        <div></div>
        <div></div>
    </div>
    <div class="side-btns">
        <div>
            <span><i class="fas fa-angle-left"></i></span>
        </div>
        <div>
            <span><i class="fas fa-angle-right"></i></span>
        </div>
    </div>
</div>
	
	</div>
<script>
//기존 버튼형 슬라이더
$('.slider-1 > .page-btns > div').click(function(){
    var $this = $(this);
    var index = $this.index();
    
    $this.addClass('active');
    $this.siblings('.active').removeClass('active');
    
    var $slider = $this.parent().parent();
    
    var $current = $slider.find(' > .slides > div.active');
    
    var $post = $slider.find(' > .slides > div').eq(index);
    
    $current.removeClass('active');
    $post.addClass('active');
});

// 좌/우 버튼 추가 슬라이더
$('.slider-1 > .side-btns > div').click(function(){
    var $this = $(this);
    var $slider = $this.closest('.slider-1');
    
    var index = $this.index();
    var isLeft = index == 0;
    
    var $current = $slider.find(' > .page-btns > div.active');
    var $post;
    
    if ( isLeft ){
        $post = $current.prev();
    }
    else {
        $post = $current.next();
    };
    
    if ( $post.length == 0 ){
        if ( isLeft ){
            $post = $slider.find(' > .page-btns > div:last-child');
        }
        else {
            $post = $slider.find(' > .page-btns > div:first-child');
        }
    };
    
    $post.click();
});

// setInterval(function(){
//     $('.slider-1 > .side-btns > div').eq(1).click();
// }, 3000);

</script>		


	<div class="container" id = "btncontainer">
		<div class="text-center">
		<button class = "WaterBtn"><img class = "Btnimg" src = "resources/img/물방울이미지스파클링.png"><br/><p>Sparkling</p></button>
		<button class = "WaterBtn"><img class = "Btnimg" src = "resources/img/물방울이미지화이트.png"><p>White</p></button>
			<button class = "WaterBtn"><img class = "Btnimg" src = "resources/img/물방울이미지로제.png"><p>Rose</p></button>
			<button class = "WaterBtn"><img class = "Btnimg" src = "resources/img/물방울이미지레드.png"><p>Red</p></button>
		</div>
	
		<hr>
	</div>
	<%@ include file="footer.jsp"%>
</body>
</html>