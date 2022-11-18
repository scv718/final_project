	<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
/*그리드 scss*/
[type=search] {
    outline-offset: -2px;
    -webkit-appearance: none;
    border-radius: 5px;
    outline: none;
}
.table thead th {
    vertical-align: middle;
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
                            <a href="admin_getIntro.wp">소개페이지관리</a>
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
            
           <h2 class="jumbotron" align="center">판매,주문상태</h2>
      <div class="table-responsive">
    <table id="myTable" class="display table" width="100%">
        <thead>  
         <tr style="background-color: #FCA5A5" align="center">
	        <th>주문코드(PK)</th>
			<th>주문일자</th>
			<th>주문자(ID)</th>
			<th>주문상태</th>
			<th>배송상태</th>
			<th>총 상품 금액</th>
			<th>총 주문 금액</th>
			<th>주문상품이름(K)</th>
			<th>수정</th>
			<th></th>
        </tr> 
        </thead>  
        <tbody> 
         
       <c:forEach items="${OrderListAd}" var="order">                
       <tr align="center">
        	<th>${order.ord_code}</th>
			<th>${order.ord_date}</th>
			<th>${order.id}</th>
<%-- 			<th><input style="width:50px;" name="cs_stat" id="cs_stat${order.ord_code}" value="${order.cs_stat}"></th> --%>
			<th><select name="cs_stat" id="cs_stat${order.ord_code}" class="type-1">
                    <option value="${order.cs_stat}">${order.cs_stat}</option>
                    <option value="결제">결제</option>
                    <option value="취소">취소</option>
                    <option value="교환">교환</option>
                    <option value="환불">환불</option>
                    <option value="취소요청">취소요청</option>
                </select></th>
<%-- 			<th><input style="width:50px;" name="ord_stat" id="ord_stat${order.ord_code}" value="${order.ord_stat}"></th> --%>
			<th><select name="ord_stat" id="ord_stat${order.ord_code}" class="type-1">
                    <option value="${order.ord_stat}">${order.ord_stat}</option>
                    <option value="취소">취소</option>
                    <option value="배송준비중">배송준비중</option>
                    <option value="배송중">배송중</option>
                    <option value="배송완료">배송완료</option>
                </select></th>
			<th>${order.prod_price}</th>
			<th>${order.ord_t_price}</th>
			<th>${order.w_nm_k}</th>
			<th><a style="color: white" class="myButton1" onclick="{updateOrder('${order.ord_code}')}">수정</a></th>
			<th></th>
       </tr>  
                 
       </c:forEach>
       </tbody>
    </table>
    <script type="text/javascript">
    function updateOrder(val){
    	
    	var ord_code = val;
      	var cs_stat = $('#cs_stat'+ord_code).val();
      	var ord_stat =  $('#ord_stat'+ord_code).val();

      	 if (confirm("" + cs_stat + "" + ord_stat + "으로 수정하시겠습니까?") == true){    //확인

      		location.href = 'updateorder.wp?ord_code='+ord_code+'&cs_stat='+cs_stat+'&ord_stat='+ord_stat;

      	 }else{  
      		 
      	     return false;

      	 }
      	
    }
    </script>
    <br>
    <div class='btnSet' align="center">
		<a class='myButton' href="adminSalesdelivery.wp">전체목록</a>
            <br><br><hr> <br><br>
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
                $(this).toggleClass('active');
            });
        });
        $(document).ready(function(){
            $('#myTable').dataTable();
        });
    function updateAd(param){
    	var m_name = $('#m_name'+param).val();
    	var id =  $('#id'+param).val();
    	console.log('testad');
    	location.href = 'updateAd.wp?id='+id+'&&m_name='+m_name;
    	document.userInfo.submit();
    }
    function deleteAd(param){
    	var id = param;
    	console.log('testad');
    	location.href = 'deleteAd.wp?id='+id;
    	document.userInfo.submit();
    }
    </script>
</body>
</html>