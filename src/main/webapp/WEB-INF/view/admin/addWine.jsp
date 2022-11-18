<%@ page language="java" contentType="text/html;"    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">

    <title>관리자페이지(판매등록,주문관리)</title>
    <link rel="stylesheet" href="http://cdn.datatables.net/1.10.2/css/jquery.dataTables.min.css">
    <!-- Bootstrap CSS CDN -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css" integrity="sha384-9gVQ4dYFwwWSjIDZnLEWnxCjeSWFphJiwGPXr1jddIhOegiu1FwO5qRGvFXOdJZ4" crossorigin="anonymous">
    <!-- Our Custom CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/adminmain.css">

    <!-- Font Awesome JS -->
    <script defer src="https://use.fontawesome.com/releases/v5.0.13/js/solid.js" integrity="sha384-tzzSw1/Vo+0N5UhStP3bvwWPq+uvzCMfrN1fEFe+xBmv1C/AtVX5K0uZtmcHitFZ" crossorigin="anonymous"></script>
    <script defer src="https://use.fontawesome.com/releases/v5.0.13/js/fontawesome.js" integrity="sha384-6OIrr52G08NpOFSZdxxz1xdNSndlD4vdcf/q2myIUVO0VsqaGHJsB0RaBE01VTOY" crossorigin="anonymous"></script>

</head>
<style>
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

div.all {
        width: 100%;
         display: flex;
    
    
    }

    div.left {
        width: 50%;
        margin:5px;
        border-right : solid 1px; color:gray; padding-left:5px;
    
    }
    div.right {
        width: 50%;
           margin:5px;
    }

.option hr{
  margin:5px;
}

</style>
<body>

    <div class="wrapper">
        <!-- Sidebar Holder -->
        <nav id="sidebar" >
            <div class="sidebar-header">
                <h3>관리자페이지</h3>
            </div>

            <ul class="list-unstyled components">
                <li class="active">
                    <a href="#homeSubmenu" data-toggle="collapse" aria-expanded="true" class="dropdown-toggle">데이터정보</a>
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
                            <a href="adminIntroduce.wp">소개페이지관리</a>
                        </li>
                       <li>
                            <a href="adminStory.wp">와인이야기 페이지 관리</a>
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
                    <a href="#pageSubmenu" data-toggle="collapse" aria-expanded="true" class="dropdown-toggle">커뮤니티</a>
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
            
			
   <form action="insertWine.wp" method="post" enctype="multipart/form-data">
         <h4 class="mb-3 add">와인 등록</h4>
         <div class="input-form col-md-12 mx-auto all"  style="width: 100%;">
        
            <br>
            <div class="left" >
               <div class="mb-3">
                  <label for="w_nm_k">와인명(한)</label> <input type="text"
                     class="form-control addb-input" name="w_nm_k" id="w_nm_k" placeholder="와인명(한국어)" required>
               </div>

               <div class="mb-3">
                  <label for="w_nm_e">와인명(영)</label> <input type="text"
                     class="form-control addb-input" name="w_nm_e" id="w_nm_e"
                     placeholder="와인명(알파벳)" required>
               </div>

               <div class="mb-3">
                  <label for="continental">대륙</label> <input type="text"
                     class="form-control addb-input" name="continental" id="continental"
                     placeholder="유럽, 북아메리카, 남아메리카 등" required>
               </div>
               
               <div class="mb-3">
                  <label for="country">생산 국가</label> <input type="text"
                     class="form-control addb-input" id="country" name="country"
                     placeholder="프랑스, 이탈리아, 미국, 칠레 등" required>
               </div>
               <div class="mb-3">
                  <label for="since">생산 년도</label> <input type="number"
                     class="form-control addb-input" id="since" name="since" placeholder="4자리 숫자를 입력해주세요" required>
               </div>
                <div class="mb-3">
                  <label for="quantity">입고 수량</label> <input type="number"
                     class="form-control addb-input" id="quantity" name="quantity" required>
               </div>
                  <div class="mb-3">
                  <label for="w_price">가격 설정</label> <input type="number"
                     class="form-control addb-input" id="w_price" name="w_price" required>
               </div>
               <div class="mb-3">
                  <label for="uploadFile"> 파일 첨부 </label>
					<input name="uploadFile" type="file"
						 id="uploadFile" multiple="multiple" required="required" />
               </div>
               </div>
                 <div class="right">
				    <div class="mb-3 option">
                 <h6> <label for="type">타입</label></h6><hr>
                    <input type="radio" id="type1" name="type" value="0" required>레드
					<input type="radio" id="type2" name="type" value="1">화이트
					<input type="radio" id="type3" name="type" value="2">스파클링
					<input type="radio" id="type4" name="type" value="3">로제
               </div>

				  <div class="mb-3 option">
                 <h6> <label for="type">당도</label></h6><hr>
                    <input type="radio" name="w_sweet" value="1" required>1 
					<input type="radio" name="w_sweet" value="2">2 
					<input type="radio" name="w_sweet" value="3">3 
					<input type="radio" name="w_sweet" value="4">4 
					<input type="radio" name="w_sweet" value="5">5 <br>
               </div>

					  <div class="mb-3 option">
                 <h6> <label for="type">바디감</label></h6><hr>
                    <input type="radio" name="w_body" value="1" required>1 
					<input type="radio" name="w_body" value="2">2 
					<input type="radio" name="w_body" value="3">3 
					<input type="radio" name="w_body" value="4">4 
					<input type="radio" name="w_body" value="5">5 <br>
               </div>
               	  <div class="mb-3 option">
                 <h6> <label for="type">산미</label></h6><hr>
                    <input type="radio" name="w_acidity" value="1" required>1 
					<input type="radio" name="w_acidity" value="2">2 
					<input type="radio" name="w_acidity" value="3">3 
					<input type="radio" name="w_acidity" value="4">4 
					<input type="radio" name="w_acidity" value="5">5 <br>
               </div>
               	  <div class="mb-3 option">
                 <h6> <label for="type">타닌</label></h6><hr>
                    <input type="radio" name="w_tannins" value="1" required>1 
					<input type="radio" name="w_tannins" value="2">2 
					<input type="radio" name="w_tannins" value="3">3 
					<input type="radio" name="w_tannins" value="4">4 
					<input type="radio" name="w_tannins" value="5">5 <br>
               </div>
               
				<div class="mb-3">
                  <label for="w_info">소개글 입력란</label>
                  <textarea name="w_info" id="w_info" rows="10" style="width:100%; margin-top:10px; resize:none;" placeholder="작성할 내용을 입력하세요."></textarea> 
               </div>
               </div>
           </div>
               <button class="btn btn-lg btn-block" type="submit"
                  >등록 완료</button>
           
          </form>
</div>

</div>

</body>
</html>