﻿<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">

    <title>관리자페이지</title>

    <!-- Bootstrap CSS CDN -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css" integrity="sha384-9gVQ4dYFwwWSjIDZnLEWnxCjeSWFphJiwGPXr1jddIhOegiu1FwO5qRGvFXOdJZ4" crossorigin="anonymous">
    <!-- Our Custom CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/adminmain.css">

    <!-- Font Awesome JS -->
    <script defer src="https://use.fontawesome.com/releases/v5.0.13/js/solid.js" integrity="sha384-tzzSw1/Vo+0N5UhStP3bvwWPq+uvzCMfrN1fEFe+xBmv1C/AtVX5K0uZtmcHitFZ" crossorigin="anonymous"></script>
    <script defer src="https://use.fontawesome.com/releases/v5.0.13/js/fontawesome.js" integrity="sha384-6OIrr52G08NpOFSZdxxz1xdNSndlD4vdcf/q2myIUVO0VsqaGHJsB0RaBE01VTOY" crossorigin="anonymous"></script>
	
</head>

<style>
table {
    width: 700px;
    text-align: center;
    border: 1px solid #fff;
    border-spacing: 1px;
    font-family: 'Cairo', sans-serif;
  margin: auto;
}

caption {
    font-weight: bold;
}

table td {
    padding: 10px;
    background-color: #eee;
}

table th {
    background-color: #FCA5A5;
    color: #000000;
    padding: 10px;
}

img {
    width: 90px;
    height: 90px;
}

.view,
.delete {
    border: none;
    padding: 5px 10px;
    color: #fff;
    font-weight: bold;
}

.view {
    background-color: #03A9F4;
}

.delete {
    background-color: #E91E63;
}

.jumbotron {
    padding: 2rem 1rem;
    margin-bottom: 2rem;
    background-color: #FCA5A5;
    border-radius: 0.3rem;
}
</style>
<body>

    <div class="wrapper">
        <!-- Sidebar Holder -->
        <nav id="sidebar" >
            <div class="sidebar-header">
            	<h3><strong>winery</strong></h3>
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
                            <a href="admin_getIntro.wp">와이너리?페이지관리</a>
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
                    <a href="#pageSubmenu" data-toggle="collapse" aria-expanded="true" class="dropdown-toggle"><strong>커뮤니티</strong></a>
                    <ul class="collapse list-unstyled show" id="pageSubmenu">
                         <li>
                            <a href="admin_getNoticeList.wp">공지사항</a>
                        </li>
                        <li>
                            <a href="admin_getQnaList.wp">Q&A</a>
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
                                <a class="nav-link" href="logout.wp">로그아웃</a>
                            </li>
                        </ul>
                    </div>
                </div>
            </nav>
            <br>
            <h2 class="jumbotron" align="center">메인프로필(만든사람들)</h2>
            <br><br>
      <table style="background: #white;">
        <thead>
        	<tr>
                <th>프로필사진</th>
                <th>등급</th>
                <th>이름</th>
                <th>나이</th>
            </tr>
        </thead>
        <tbody>
            <tr >
                <td><img src="${pageContext.request.contextPath}/resources/img/profile/이승진.jpg" ></td>
                <td>Winery팀장</td>
                <td>이승진</td>
                <td>34</td>
            </tr>
			<tr>
                <td><img src="${pageContext.request.contextPath}/resources/img/profile/김경민.jpg" ></td>
                <td>Winery부팀장</td>
                <td>김경민</td>
                <td>32</td>
            </tr>
            <tr>
                <td><img src="${pageContext.request.contextPath}/resources/img/profile/김지나.jpg" ></td>
                <td>팀원</td>
                <td>김지나</td>
                <td>33</td>
            </tr>
            <tr>
                <td><img src="${pageContext.request.contextPath}/resources/img/profile/이기진.jpg" ></td>
                <td>팀원</td>
                <td>이기진</td>
                <td>27</td>
            </tr>
            <tr>
                <td><img src="${pageContext.request.contextPath}/resources/img/profile/박상현.png" ></td>
                <td>팀원</td>
                <td>박상현</td>
                <td>28</td>
            </tr>
            <tr>
                <td><img src="${pageContext.request.contextPath}/resources/img/profile/노유경.jpg" ></td>
                <td>팀원</td>
                <td>노유경</td>
                <td>24</td>
            </tr>
            <tr>
                <td><img src="${pageContext.request.contextPath}/resources/img/profile/양임호.jpg" ></td>
                <td>팀원</td>
                <td>양임호</td>
                <td>31</td>
            </tr>
        </tbody>
        <tfoot>
            <td colspan="5" class="tablefoot"></td>
        </tfoot>
    </table>
            <br><br><br><br><br><br><br>
        </div>
    </div>

    <!-- jQuery CDN - Slim version (=without AJAX) -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <!-- Popper.JS -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js" integrity="sha384-cs/chFZiN24E4KMATLdqdvsezGxaGsi4hLGOzlXwp5UZB1LY//20VyM2taTB4QvJ" crossorigin="anonymous"></script>
    <!-- Bootstrap JS -->
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js" integrity="sha384-uefMccjFJAIv6A+rW+L4AHf99KvxDjWSu1z9VI8SKNVmz4sk7buKt/6v9KI65qnm" crossorigin="anonymous"></script>

    <script type="text/javascript">
        $(document).ready(function () {
            $('#sidebarCollapse').on('click', function () {
                $('#sidebar').toggleClass('active');
                 $(this).toggleClass('active');
            });
        });
     
    </script>
</body>
</html>