<%@ page contentType="text/html; charset=utf-8" isELIgnored="false"%>
<%@ page import="java.util.Date"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/index.css">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" 
integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
<meta name="viewport" content="width=device-width, initial-scale=1">

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
    <div class="side-btns" style = "display: none;">
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
$('.slider-1 > .page-btns > div').click(function(){
    var $this = $(this);
    var index = $this.index();
    console.log("하이용");
    $this.addClass('active');
    $this.siblings('.active').removeClass('active');
    
    var $slider = $this.parent().parent();
    
    var $current = $slider.find(' > .slides > div.active');
    
    var $post = $slider.find(' > .slides > div').eq(index);
    
    $current.removeClass('active');
    $post.addClass('active');
});

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



</script>		


	<div class="container" id = "btncontainer">
		<div class="text-center" id = "typebtn">
		<button class = "WaterBtn" value = "2"><img class = "Btnimg" src = "resources/img/Sparkling.png"><br/><p>Sparkling</p></button>
		<button class = "WaterBtn" value = "1"><img class = "Btnimg" src = "resources/img/White.png"><p>White</p></button>
		<button class = "WaterBtn" value = "3"><img class = "Btnimg" src = "resources/img/Rose.png"><p>Rose</p></button>
	    <button class = "WaterBtn" value = "0"><img class = "Btnimg" src = "resources/img/Red.png"><p>Red</p></button>
		</div>
		<hr>
	</div>


<div class="typeSlider">
<div class = "type">
<div class="slider-2">
    <div class="slides">
        <div class="active">
           <c:forEach items="${typeMenuList}" var="option" begin="0" end ="3">
          	<div id = "typediv"  OnClick="location.href ='product.wp?w_no=${option.w_no}'" style="cursor:pointer;">
   				<img id = "imgwine" src= "resources/img/wine/${option.w_image1}">
   				<p id = "typeWineName">${option.w_nm_k}</p>
   				<p></p>
   			</div>
  			 </c:forEach>
		</div>
        <div>
    		<c:forEach items="${typeMenuList}" var="option" begin="4" end ="7">
          	<div id = "typediv"  OnClick="location.href ='product.wp?w_no=${option.w_no}'" style="cursor:pointer;">
   				<img id = "imgwine" src= "resources/img/wine/${option.w_image1}">
   				<p id = "typeWineName">${option.w_nm_k}</p>
   			</div>
  			 </c:forEach>
		</div>
        <div>
  			 <c:forEach items="${typeMenuList}" var="option" begin="8" end ="11">
          	<div id = "typediv"  OnClick="location.href ='product.wp?w_no=${option.w_no}'" style="cursor:pointer;">
   				<img id = "imgwine" src= "resources/img/wine/${option.w_image1}">
   				<p id = "typeWineName">${option.w_nm_k}</p>
   			</div>
  			 </c:forEach>
		</div>
    </div>
    <div class="page-btns" style = "display: none">
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
	
	<hr>
	</div>
		

<script>


$(document).on('click', '.slider-2 > .page-btns > div', function(){
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

$(document).on('click', ' .slider-2 > .side-btns > div',function(){
    var $this = $(this);
    var $slider = $this.closest('.slider-2');
    
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

</script>

<script type="text/javascript">
$('.WaterBtn').on('click', function () {
	 var watertype = this.value;
	
	 if($('.typeSlider').is(':visible')){
		 $('.typeSlider').hide();
	 }else{
			console.log(watertype)
			$.ajax({
				type : 'POST',
				url : 'typeMenu.wp',
				dataType : 'json',
				data : {
					  typeMenu: watertype        
				},
				success : function(val){
					 $('.typeSlider').show();
					 $('.type').load(location.href+' .type>*', "");
				
				}
			})
	 }
	

})

</script> 

<div class="bestSlider" style= "text-align: center;">

<a id = "menutitle">#BestWine</a>

<div class="slider-2">
    <div class="slides">
        <div class="active">
           <c:forEach items="${bestMenuList}" var="option" begin="0" end ="3">
          	<div id = "typediv" OnClick="location.href ='product.wp?w_no=${option.w_no}'" style="cursor:pointer;">
   				<img id = "imgwine" src= "resources/img/wine/${option.w_image1}">
   				<p id = "typeWineName">${option.w_nm_k}</p>
   				<p></p>
   			</div>
  			 </c:forEach>
		</div>
        <div>
    		<c:forEach items="${bestMenuList}" var="option" begin="4" end ="7">
          	<div id = "typediv" OnClick="location.href ='product.wp?w_no=${option.w_no}'" style="cursor:pointer;">
   				<img id = "imgwine" src= "resources/img/wine/${option.w_image1}">
   				<p id = "typeWineName">${option.w_nm_k}</p>
   			</div>
  			 </c:forEach>
		</div>
        <div>
  			 <c:forEach items="${bestMenuList}" var="option" begin="8" end ="11">
          	<div id = "typediv" OnClick="location.href ='product.wp'" style="cursor:pointer;">
   				<img id = "imgwine" src= "resources/img/wine/${option.w_image1}">
   				<p id = "typeWineName">${option.w_nm_k}</p>
   			</div>
  			 </c:forEach>
		</div>
    </div>
    <div class="page-btns" style = "display: none">
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


<div class = "container">
<div class = "row" style = "margin-bottom: 150px;">
<div class = "col" id = "noticecol">
<p id = "boardtitle">공지사항</p>
<a href = "getNoticeList.wp" id = "plus">더보기</a>
<div class ="col" id = "notice">
<c:forEach items="${notice}" var = "notice"> 
<p><a  onclick="location.href = 'getNotice.wp?commu_no=${notice.commu_no}'" style = "cursor:pointer;">${notice.commu_title}</a></p>
</c:forEach>
</div>
</div>

<div class = "col">
<p  id = "boardtitle">포토리뷰</p>
<a href = "getReviewList.wp" id = "plus">더보기</a>
<div class ="col" id = "review">
<div class="slider-3">
 <div class="slides3">
 <div class="active">
<c:forEach items="${review}" var = "review" begin = "0" end ="2"> 
<div id = "reviewmain" class = "row" OnClick="location.href ='detailReview.wp?re_no=${review.re_no}'" style="cursor:pointer;" >
<img id = "reviewphoto" src = "resources/img/review/${review.re_photo1}">
<div id = "textbox">
<p id = "titlename">${review.re_title}</p>
<p>${review.re_content}</p>
</div>
</div>
</c:forEach>
</div>
<div>
<c:forEach items="${review}" var = "review" begin = "3" end ="5"> 
<div id = "reviewmain" class = "row" OnClick="location.href ='detailReview.wp?re_no=${review.re_no}'" style="cursor:pointer;" >
<img id = "reviewphoto" src = "resources/img/review/${review.re_photo1}">
<div id = "textbox">
<p id = "titlename">${review.re_title}</p>
<p>${review.re_content}</p>
</div>
</div>
</c:forEach>
</div>
<div>
<c:forEach items="${review}" var = "review" begin = "6" end ="9"> 
<div id = "reviewmain" class = "row" OnClick="location.href ='detailReview.wp?re_no=${review.re_no}'" style="cursor:pointer;" >
<img id = "reviewphoto" src = "resources/img/review/${review.re_photo1}">
<div id = "textbox">
<p id = "titlename">${review.re_title}</p>
<p>${review.re_content}</p>
</div>
</div>
</c:forEach>
</div>
<!-- <div> -->
<%-- <c:forEach items="${review}" var = "review" begin = "6" end ="7">  --%>
<!-- <div id = "reviewmain" class = "row"> -->
<%-- <img id = "reviewphoto" src = "resources/img/review/${review.re_photo1}"> --%>
<%-- <p>${review.re_title}</p> --%>
<!-- </div> -->
<%-- </c:forEach> --%>
<!-- </div> -->
<!-- <div> -->
<%-- <c:forEach items="${review}" var = "review" begin = "8" end ="9">  --%>
<!-- <div id = "reviewmain" class = "row"> -->
<%-- <img id = "reviewphoto" src = "resources/img/review/${review.re_photo1}"> --%>
<%-- <p>${review.re_title}</p> --%>
<!-- </div> -->
<%-- </c:forEach> --%>
<!-- </div> -->
</div>
<div class="page-btns" style = "display: none">
        <div class="active"></div>
        <c:forEach  begin = "1" end = "${fn:length(review)/3}">
        <div></div>
        </c:forEach>
    </div>
    <div class="side-btns" style = "display : none">
        <div>
            <span><i class="fas fa-angle-left"></i></span>
        </div>
        <div>
            <span><i class="fas fa-angle-right"></i></span>
        </div>
    </div>
</div>
</div>
</div>
</div>
</div>
<script>
$( document ).ready(function() {
	var error = '${error}';
	console.log(error);
    if(error != '' && error === '1'){
    	swal ( "장바구니에 제품이 없습니다." ,  "" ,  "error" );
    	 $.ajax({
 	        url: '/errorsession.wp',
 	        type: 'post'
 	    });
    }
});

setInterval(function(){
    $('.slider-3 > .side-btns > div').eq(1).click();
}, 5000);

$(document).on('click', '.slider-3 > .page-btns > div', function(){
    var $this = $(this);
    var index = $this.index();
    
    $this.addClass('active');
    $this.siblings('.active').removeClass('active');
    
    var $slider = $this.parent().parent();
    
    var $current = $slider.find(' > .slides3 > div.active');
    
    var $post = $slider.find(' > .slides3 > div').eq(index);
    
    $current.removeClass('active');
    $post.addClass('active');
});

$(document).on('click', ' .slider-3 > .side-btns > div',function(){
    var $this = $(this);
    var $slider = $this.closest('.slider-3');
    
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

</script>
	<%@ include file="footer.jsp"%>
</body>
</html>