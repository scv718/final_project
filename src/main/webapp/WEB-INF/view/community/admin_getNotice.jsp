<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.io.PrintWriter"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
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
	   <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/adminmain.css">

    <!-- Font Awesome JS -->
    <script defer src="https://use.fontawesome.com/releases/v5.0.13/js/solid.js" integrity="sha384-tzzSw1/Vo+0N5UhStP3bvwWPq+uvzCMfrN1fEFe+xBmv1C/AtVX5K0uZtmcHitFZ" crossorigin="anonymous"></script>
    <script defer src="https://use.fontawesome.com/releases/v5.0.13/js/fontawesome.js" integrity="sha384-6OIrr52G08NpOFSZdxxz1xdNSndlD4vdcf/q2myIUVO0VsqaGHJsB0RaBE01VTOY" crossorigin="anonymous"></script>
    <title>공지사항 상세조회 - 관리자</title>
<!-- <link href="https://getbootstrap.kr/docs/5.2/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script> -->
<script>
//관리자 페이지 사이드바
$(document).ready(function () {
        $('#sidebarCollapse').on('click', function () {
            $('#sidebar').toggleClass('active');
             $(this).toggleClass('active');
        });
    });
$(document).ready(function(){ 
   
   $("#conDel").click(function(){
      if(confirm("정말 삭제하시겠습니까?") == true){
         let v = document.fm.commu_no.value;
         location.href = "admin_deleteNotice.wp?commu_no="+v;
      }else{
      }
   });
   
   $("#conList").click(function(){
      location.href = "admin_getNoticeList.wp";
   });
});
</script>
</head>
<style>
@charset "UTF-8";

#noticeContainer {
	display: flex;
	flex-direction: column;
	justify-content: center;
	align-items: center;
}

/* 제목 */
#comtitle {
	margin: 25px 0;
}

/* 검색창 */
#noticeform {
	margin-bottom: 10px;
}

.searchsel {
	padding: 3px;
	border: none;
}

.searchinput {
	padding: 3px;
	border-top: none;
	border-left: none;
	border-right: none;
	border-bottom: 1px solid #707070;
}

.searchbtn {
	background-color: #707070;
	border: none;
	color: white;
	padding: 5px 15px;
}


/* 공지사항 board */
/* .noticetab { */
/* 	background-color: #fff; */
/* 	text-align: center; */
/* 	overflow: hidden; */
/* } */

.li_header li{
    font-weight: bold;
}

.li_board.noticetab {
	border-top: 2px solid black;
	border-bottom: none;
}

.noticehead li {
	background-color: #f0f0f0;
	padding: 5px;
}

.li_board {
    display: table;
    width: 55%;
}

.li_board ul li.no {
    width: 10%;
}
.li_board ul li.tit {
    width: 50%;
}
.li_board ul li.name {
    width: 15%;
}
.li_board ul li.date {
    width: 15%;
}
.li_board ul li.read {
    width: 10%;
}

.hidden-lg {
    display: none;
}


ul.notice_body li.name,
ul.notice_body li.date,
ul.notice_body li.read
 {
    color: rgba(0,0,0,0.4);
}
/* 페이징 */
a {
	text-decoration-line: none !important;
	color: white !important;
}

a:hover {
	text-decoration-line: none !important;
	color: black !important;
}

a:active {
	color: black !important;
}

/* 기존 */
.li_board ul {
	list-style: none;
	margin-bottom: 0;
	clear: both;
	display: table-row-group;
	padding-left: 0;
}

.li_board ul li {
	padding-top: 15px;
	padding-bottom: 15px;
	padding-left: 7px;
	padding-right: 7px;
}

.li_board ul li {
	border: 1px solid #D7D7D7;
}

.li_board ul li {
	text-align: center;
	display: table-cell;
	vertical-align: middle;
	padding-top: 10px;
	padding-bottom: 10px;
	border-width: 0 0 1px 0;
	border-style: solid;
}

/* 반응형 */
@media(max-width:720px){
.hidden-lg {
    display: inline;
     color: rgba(0,0,0,0.4);
}
}


@media(max-width:720px){
	.li_board ul li.no{
        display: none;
}
}

@media(max-width:720px){
	.li_board {
/* 	display: table; */
    width: 90%;
}
}

@media ( max-width : 720px) {
	.li_board ul {
		padding: 10px 15px 15px 15px;
		display: block;
		border-width: 0 0 1px 0;
		border-style: solid;
	}
}

@media ( max-width : 720px){
    .li_board ul li {
	border-width: 0;
	text-align: left;
}
}

@media ( max-width : 720px) {
	.li_board ul li.read, .li_board ul li.date, .li_board ul li.name,
		.li_board ul li.time, .li_board ul li.like {
		display: table-cell;
		width: auto !important;
		padding: 5px 10px 0 0;
		font-size: 12px;
		height: 12px;
		line-height: 12px !important;
		margin-top: 8px;
	}
}

@media ( max-width : 720px) {
	.li_board ul li.tit {
		display: block;
		float: none;
		width: 100%;
		font-size: 15px;
		position: relative;
		padding: 0 !important;
		line-height: 1.4;
	}
}

@media ( max-width : 720px) {
	.hidden-xs {
		display: none !important;
	}
}
[type=search] {
    outline-offset: 0;
}

/*목록버튼*/
.myButton {
	background:linear-gradient(to bottom, #e0e0e0 5%, #fffaff 100%);
	background-color:#e0e0e0;
	border-radius:15px;
	border:1px solid #d6bcd6;
	display:inline-block;
	cursor:pointer;
	color:#2496b3;
	font-family:Trebuchet MS;
	font-size:17px;
	padding:7px 25px;
	text-decoration:none;
	text-shadow:0px 1px 0px #e1e2ed;
}
.myButton:hover {
	background:linear-gradient(to bottom, #fffaff 5%, #e0e0e0 100%);
	background-color:#fffaff;
}
.myButton:active {
	position:relative;
	top:1px;
}


.myButton1 {
	box-shadow:inset 0px 1px 0px 0px #97c4fe;
	background:linear-gradient(to bottom, #3d94f6 5%, #1e62d0 100%);
	background-color:#3d94f6;
	border-radius:6px;
	border:1px solid #337fed;
	display:inline-block;
	cursor:pointer;
	color:#ffffff;
	font-family:Impact;
	font-size:15px;
	font-weight:bold;
	padding:6px 7px;
	text-decoration:none;
	text-shadow:0px 1px 0px #1570cd;
}
.myButton1:hover {
	background:linear-gradient(to bottom, #1e62d0 5%, #3d94f6 100%);
	background-color:#1e62d0;
}
.myButton1:active {
	position:relative;
	top:1px;
}
.myButton2 {
	box-shadow:inset 0px 1px 0px 0px #f5978e;
	background:linear-gradient(to bottom, #f24537 5%, #c62d1f 100%);
	background-color:#f24537;
	border-radius:6px;
	border:1px solid #d02718;
	display:inline-block;
	cursor:pointer;
	color:#ffffff;
	font-family:Impact;
	font-size:15px;
	font-weight:bold;
	padding:6px 7px;
	text-decoration:none;
	text-shadow:0px 1px 0px #810e05;
}
.myButton2:hover {
	background:linear-gradient(to bottom, #c62d1f 5%, #f24537 100%);
	background-color:#c62d1f;
}
.myButton2:active {
	position:relative;
	top:1px;
}
/*공지 글 등록*/
.jumbotron {
    padding: 2rem 1rem;
    margin-bottom: 2rem;
    background-color: #FCA5A5;
    border-radius: 0.3rem;
}
/*등록*/
.input-group-text {
    display: -ms-flexbox;
    display: flex;
    -ms-flex-align: center;
    align-items: center;
    padding: 0.375rem 0.75rem;
    margin-bottom: 0;
    font-size: 1rem;
    font-weight: 400;
    line-height: 1.5;
    color: #495057;
    text-align: center;
    white-space: nowrap;
    background-color: ##f1f1f1;
    border: 1px solid #ced4da;
    border-radius: 0.25rem;
}
/*작성자*/
.form-control:disabled, .form-control[readonly] {
    background-color: ##f1f1f1;
    opacity: 1;
}
</style>
<body class="d-flex flex-column min-vh-100">
  <div class="wrapper">
        <!-- Sidebar Holder -->
        <nav id="sidebar" >
            <div class="sidebar-header">
                <h3><strong>관리자페이지</strong></h3>
            </div>

            <ul class="list-unstyled components">
                <li class="active">
                    <a href="#homeSubmenu" data-toggle="collapse" aria-expanded="true" class="dropdown-toggle"><strong>데이터정보</strong></a>
					<ul class="collapse list-unstyled show" id="homeSubmenu">
                     	<li>
                            <a href="adminMain.wp">만든사람들(메인)</a>
                        </li>
                        <li>
                            <a href="adminUser.wp">회원관리</a>
                        </li>
                        <li>
                            <a href="adminWine.wp">와인관리</a>
                        </li>
                        <li>
                            <a href="adminIntroduce.wp">와이너리</a>
                        </li>
                        <li>
                            <a href="adminSubscription.wp">구독관리</a>
                        </li>
                         <li>
                            <a href="adminSalesdelivery.wp">판매,배송관리</a>
                        </li>
                    </ul>
                </li>
                <li>
                    <a href="#pageSubmenu" data-toggle="collapse" aria-expanded="true" class="dropdown-toggle"><strong>커뮤니티</strong></a>
                    <ul class="collapse list-unstyled show" id="pageSubmenu">
                         <li>
                            <a href="adminNotice.wp">공지사항</a>
                        </li>
                        <li>
                            <a href="adminQna.wp">Q&A</a>
                        </li>
                        <li>
                            <a href="adminReview.wp">리뷰</a>
                        </li>
                    </ul>
                </li>
            
            </ul>

           
        </nav>

        <!-- Page Content Holder -->
        <div id="content">

            <nav class="navbar navbar-expand-lg navbar-light bg-light">
                <div class="container-fluid">

                    <button type="button" id="sidebarCollapse" class="navbar-btn">
                        <span></span>
                        <span></span>
                        <span></span>
                    </button>
                    <button class="btn btn-dark d-inline-block d-lg-none ml-auto" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                        <i class="fas fa-align-justify"></i>
                    </button>

                    <div class="collapse navbar-collapse" id="navbarSupportedContent">
                        <ul class="nav navbar-nav ml-auto">
                            <li class="nav-item active">
                                <a class="nav-link" href="adminMain.wp">관리자메인화면</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="index.wp">홈페이지메인이동</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="index.wp">로그아웃</a>
                            </li>
                        </ul>
                    </div>
                </div>
            </nav>
   <div class="jumbotron">
      <h1>공지사항 수정/삭제</h1>      
   </div>
   
   <div class="container-fluid">      
     <form name="fm" action="admin_updateNotice.wp" method="post">
     
     <input type="hidden" name="commu_no" value="${community.commu_no}">
     
       <div class="input-group mb-3">
         <div class="input-group-prepend">
           <span class="input-group-text">제목</span>
         </div>
         <input type="text" class="form-control innm" name="commu_title" value="${community.commu_title}">      
       </div>
       
       <div class="input-group mb-3">
         <div class="input-group-prepend">
           <span class="input-group-text">작성자</span>
         </div>
         <input type="text" class="form-control innm" name="id" value="${community.id}" readonly>      
       </div>
       
       <div class="input-group mb-3">
         <div class="input-group-prepend">
           <span class="input-group-text">내용</span>
         </div>
         <textarea class="form-control innm" rows="10" id="comment" name="commu_content">${community.commu_content}</textarea>      
       </div>  
       
       <div class="input-group mb-3">
         <div class="input-group-prepend">
           <span class="input-group-text">등록일</span>
         </div>
         <input type="text" class="form-control innm" name="commu_date" value="${community.commu_date}" readonly >      
       </div>
       
       <div class="input-group mb-3">
         <div class="input-group-prepend">
           <span class="input-group-text">조회수</span>
         </div>
         <input type="text" class="form-control innm" name="commu_count" value="${community.commu_count}" readonly>      
       </div>
       
       <div id="footer">
          <input class="myButton" type="submit" value="글수정하기" >
          
           <button id="conDel" type="button" class="myButton" >글삭제</button>
           <button id="conList" type="button" class="myButton">사용자목록</button>
      </div>
      
     </form>  
   </div>
</body>
</html>