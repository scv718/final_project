<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">

    <title>관리자페이지</title>
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
                                <a class="nav-link" href="http://localhost:8090/user/adminmain.jsp#profile">관리자메인화면</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="http://localhost:8090/user/index.jsp">홈페이지메인이동</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="http://localhost:8090/user/index.jsp">로그아웃</a>
                            </li>
                        </ul>
                    </div>
                </div>
            </nav>
            
           <h2 align="center">고객목록조회</h2>
           <br><br>
      <div class="table-responsive">
    <table id="myTable" class="display table" width="100%">
        <thead>  
              <tr>
	        <th>no.</th>
			<th>아이디</th>
			<th>생년월일</th>
			<th>이름</th>
			<th>이메일</th>
			<th>로그인</th>
			<th>등급</th>
        </tr> 
        </thead>  
        <tbody> 
         
       <c:forEach items="${UserList}" var="users">                
       <tr>
      <td>${users.m_no}</td>
      <td>${users.id}</td>
      <td>${users.m_birth}</td>
      <td>${users.m_name}</td>
      <td>${users.m_email}</td>
      <td>${users.login}</td>
      <td>${users.level}</td>
       </tr>            
       </c:forEach>
       </tbody>
    </table>
    </div>
            <br><br><hr> <br><br>
            <h2 align="center">수정/삭제(공사중)임시적용</h2>
             <table class="member" align="center">
        <tr>
	        <th>no.</th>
			<th>아이디</th>
			<th>생년월일</th>
			<th>이름</th>
			<th>이메일</th>
			<th>로그인</th>
			<th>등급</th>
        </tr>
		<tbody>
       <c:forEach items="${UserList}" var="users">                
       <tr>
      <td>${users.m_no}</td>
      <td>${users.id}</td>
      <td>${users.m_birth}</td>
      <td>${users.m_name}</td>
      <td>${users.m_email}</td>
      <td>${users.login}</td>
      <td>${users.level}</td>
       </tr>            
       </c:forEach>
       </tbody>
    </table>
    <a href="http://localhost:8090/user/adminUser.wp" class="myButton">수정</a>
    <a href="http://localhost:8090/user/adminUser.wp" class="myButton">삭제</a>
    <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
        </div>
    </div>
    
    <!-- jQuery CDN - Slim version (=without AJAX) -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <!-- Popper.JS -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js" integrity="sha384-cs/chFZiN24E4KMATLdqdvsezGxaGsi4hLGOzlXwp5UZB1LY//20VyM2taTB4QvJ" crossorigin="anonymous"></script>
    <!-- Bootstrap JS -->
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js" integrity="sha384-uefMccjFJAIv6A+rW+L4AHf99KvxDjWSu1z9VI8SKNVmz4sk7buKt/6v9KI65qnm" crossorigin="anonymous"></script>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
    <script type="text/javascript"  src="http://cdn.datatables.net/1.10.2/js/jquery.dataTables.min.js"></script>
    <script type="text/javascript"  src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            $('#sidebarCollapse').on('click', function () {
                $('#sidebar').toggleClass('active');
//                 $(this).toggleClass('active');
            });
        });
        $(document).ready(function(){
            $('#myTable').dataTable();
        });
    </script>
</body>
</html>