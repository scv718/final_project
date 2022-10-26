<%@ page language="java" contentType="text/html; charset=utf-8"
   pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!doctype html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author"
   content="Mark Otto, Jacob Thornton, 그리고 Bootstrap 기여자들">
<meta name="generator" content="Hugo 0.104.2">
<title>Carousel Template · Bootstrap v5.2</title>

<link rel="canonical"
   href="https://getbootstrap.kr/docs/5.2/examples/carousel/">





<link href="https://getbootstrap.kr/docs/5.2/dist/css/bootstrap.min.css"
   rel="stylesheet"
   integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi"
   crossorigin="anonymous">

<%-- <%@ include file="header.jsp"%> --%>
<!-- Favicons -->
<!-- <link rel="apple-touch-icon" href="https://getbootstrap.kr/docs/5.2/assets/img/favicons/apple-touch-icon.png" sizes="180x180">
<link rel="icon" href="https://getbootstrap.kr/docs/5.2/assets/img/favicons/favicon-32x32.png" sizes="32x32" type="image/png">
<link rel="icon" href="https://getbootstrap.kr/docs/5.2/assets/img/favicons/favicon-16x16.png" sizes="16x16" type="image/png">
<link rel="manifest" href="https://getbootstrap.kr/docs/5.2/assets/img/favicons/manifest.json">
<link rel="mask-icon" href="https://getbootstrap.kr/docs/5.2/assets/img/favicons/safari-pinned-tab.svg" color="#712cf9">
<link rel="icon" href="https://getbootstrap.kr/docs/5.2/assets/img/favicons/favicon.ico"> -->
<meta name="theme-color" content="#712cf9">


<style>
.bd-placeholder-img {
   font-size: 1.125rem;
   text-anchor: middle;
   -webkit-user-select: none;
   -moz-user-select: none;
   user-select: none;
}

@media ( min-width : 768px) {
   .bd-placeholder-img-lg {
      font-size: 3.5rem;
   }
}

.b-example-divider {
   height: 3rem;
   background-color: rgba(0, 0, 0, .1);
   border: solid rgba(0, 0, 0, .15);
   border-width: 1px 0;
   box-shadow: inset 0 .5em 1.5em rgba(0, 0, 0, .1), inset 0 .125em .5em
      rgba(0, 0, 0, .15);
}

.b-example-vr {
   flex-shrink: 0;
   width: 1.5rem;
   height: 100vh;
}

.bi {
   vertical-align: -.125em;
   fill: currentColor;
}

.nav-scroller {
   position: relative;
   z-index: 2;
   height: 2.75rem;
   overflow-y: hidden;
}

.nav-scroller .nav {
   display: flex;
   flex-wrap: nowrap;
   padding-bottom: 1rem;
   margin-top: -1px;
   overflow-x: auto;
   text-align: center;
   white-space: nowrap;
   -webkit-overflow-scrolling: touch;
}

/* GLOBAL STYLES
-------------------------------------------------- */
/* Padding below the footer and lighter body text */
body {
   padding-top: 3rem;
   padding-bottom: 3rem;
   color: #5a5a5a;
}

/* CUSTOMIZE THE CAROUSEL
-------------------------------------------------- */

/* Carousel base class */
.carousel {
   margin-bottom: 4rem;
}
/* Since positioning the image, we need to help out the caption */
.carousel-caption {
   bottom: 3rem;
   z-index: 10;
}

/* Declare heights because of positioning of img element */
.carousel-item {
   height: 32rem;
}

/* MARKETING CONTENT
-------------------------------------------------- */

/* Center align the text within the three columns below the carousel */
.marketing .col-lg-4 {
   margin-bottom: 1.5rem;
   text-align: center;
}
/* rtl:begin:ignore */
.marketing .col-lg-4 p {
   margin-right: .75rem;
   margin-left: .75rem;
}
/* rtl:end:ignore */

/* Featurettes
------------------------- */
.featurette-divider {
   margin: 5rem 0; /* Space out the Bootstrap <hr> more */
}

/* Thin out the marketing headings */
/* rtl:begin:remove */
.featurette-heading {
   letter-spacing: -.05rem;
}

/* rtl:end:remove */

/* RESPONSIVE CSS
-------------------------------------------------- */
@media ( min-width : 40em) {
   /* Bump up size of carousel content */
   .carousel-caption p {
      margin-bottom: 1.25rem;
      font-size: 1.25rem;
      line-height: 1.4;
   }
   .featurette-heading {
      font-size: 50px;
   }
}

@media ( min-width : 62em) {
   .featurette-heading {
      margin-top: 7rem;
   }
}
</style>


<!-- Custom styles for this template -->
<link href="carousel.css" rel="stylesheet">
</head>
<body>

   <header> </header>

   <main>

      <div id="myCarousel" class="carousel slide" data-bs-ride="carousel">
<!--         <form action="updateIntro.wp" method="post" enctype="multipart/form-data"> -->
        <form action="updateIntro.wp" >
         <input type="hidden" name="intro_no" value="1">
         <div class="carousel-inner">
            <div class="carousel-item active">

               <img class="bd-placeholder-img" width="100%" height="100%"
                  src="resources/img/${introList[1].intro_bg}">

               <div class="container">
                  <div class="carousel-caption text-start">
<%--                      <h1><input type="text" value="${introList[1].intro_title}"/></h1> --%>
                      <h1><input type="text" class="form-control innm" name="intro_title" value="${introList[1].intro_title}" ></h1>
                     <p></p>
                     <p>
                        <!-- <a class="btn btn-lg btn-primary" href="#">알아보기</a> -->
                     </p>
                  </div>
               </div>
            </div>
      </div>


      <!-- Marketing messaging and featurettes
  ================================================== -->
      <!-- Wrap the rest of the page in another container to center all the content. -->

      <div class="container marketing">
    
         <div class="">
            <h1>와인을 경험하고 싶은데 잘 몰라서 고민이라면?</h1>
            <h1 class="text-muted">와이너리에서 시작해보세요.</h1><br>
            <br>
            <br>
         </div>
         <!-- Three columns of text below the carousel -->
         <div class="row">

            <div class="col-lg-4">
               <img class="bd-placeholder-img " width="140" height="140"
                   src="resources/img/${introList[0].intro_bg}">
               <h2 class="fw-normal">나만의 커스터마이징</h2>
               <p>
                  한 명을 위한 1:1 전담 소믈리에와 <br> 함께 취향을 찾아보세요.
               </p>
               <p>
                  <a class="btn btn-secondary" href="#">오시는 길 &raquo;</a>
               </p>
            </div>
            <!-- /.col-lg-4 -->
            <div class="col-lg-4">
               <img class="bd-placeholder-img" width="140" height="140"
                  src="resources/img/${introList[1].intro_bg}">
               <h2 class="fw-normal">상세한 필터서비스</h2>
               <p>
                  방문 전 나만의 취향을 <br>사이트에서 검색해보세요.
               </p>
               <p>
                  <a class="btn btn-secondary" href="#">검색하기 &raquo;</a>
               </p>
            </div>
            <!-- /.col-lg-4 -->
            <div class="col-lg-4">
               <img class="bd-placeholder-img" width="140" height="140"
                   src="resources/img/${introList[2].intro_bg}">
               <h2 class="fw-normal">와인 구독서비스</h2>
               <p>
                  매월 새로운 나만의 와인을 <br> 다양하게 집에서 즐겨보세요.
               </p>
               <p>
                  <a class="btn btn-secondary" href="#">구독하기 &raquo;</a>
               </p>
            </div>
            <!-- /.col-lg-4 -->
         </div>
         <!-- /.row -->
         
         <div class="container my-5">
    <div class="bg-light p-5 rounded">
      <div class="col-sm-8 py-5 mx-auto">
        <h1 class="display-5 fw-normal">이용안내</h1>
        <p class="fs-5">※첫 1회 매장 방문 고객에 한해서 와인 버틀러 서비스 신청이 가능합니다.</p>
        <p>(최초 구매 시 픽업 또는 현장 구매만 가능합니다.)</p>
        <p>
         <!-- <a class="btn btn-primary" href="/docs/5.2/components/navbar/#offcanvas" role="button">Learn more about offcanvas navbars &raquo;</a> -->
        </p>
    </div>
    </div>
  </div>



         <!-- START THE FEATURETTES -->

         <hr class="featurette-divider">
         <!--  <div class="">
        <h1></h1>
        <h1 class="text-muted"></h1>
    </div> -->
         <div class="row featurette">
            <div class="col-md-7">
               <h2 class="featurette-heading fw-normal lh-1">
                  Key Point<span class="text-muted"></span>
               </h2>
               <br>
               <p class="lead">매장에서 만나보세요!</p>
               <p class="lead">전 직원 소믈리에가 기다리고 있는 매장에서</p>
               <p class="lead">대중적인 와인부터 내추럴, 빈티지와인까지 좀 더 깊게 취향을 경험해보세요.</p>
               <br>
               <p class="lead">세상에는 맛있는 와인이 너무 많아!</p>
               <p class="lead">와이너리가 직접 선별하고 유통과정까지</p>
               <p class="lead">꼼꼼히 검수합니다.</p>
            </div>
            <div class="col-md-5">
               <svg
                  class="bd-placeholder-img bd-placeholder-img-lg featurette-image img-fluid mx-auto"
                  width="500" height="500" xmlns="http://www.w3.org/2000/svg"
                  role="img" aria-label="Placeholder: 500x500"
                  preserveAspectRatio="xMidYMid slice" focusable="false">
                  <title>Placeholder</title><rect width="100%" height="100%"
                     fill="#eee" />
                  <text x="50%" y="50%" fill="#aaa" dy=".3em">500x500</text></svg>

            </div>
         </div>
 <input type="submit" class="btn btn-outline-primary" value="수정">
         <hr class="featurette-divider">
</form>
      </div>
      <!-- /.container -->


      <!-- FOOTER -->

      </footer>
      -->
   </main>


   <script
      src="https://getbootstrap.kr/docs/5.2/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
      crossorigin="anonymous"></script>

<%-- 	<%@ include file="footer.jsp"%> --%>
</body>
</html>