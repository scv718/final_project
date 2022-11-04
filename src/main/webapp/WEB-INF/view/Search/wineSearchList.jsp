<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/story.css">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
<style>
#searchNav{-webkit-justify-content: flex-end; justify-content: flex-end; }
</style>
<body>
<%@ include file="../../../header.jsp" %>
<div class="jumbotron">
<img src="${pageContext.request.contextPath}/resources/img/winery_farm2.jpg" style="height:75px%; width:300px; item:center">
  <h1>와인 톱아보기</h1>      
</div>
<div>
<nav id="searchNav1" class="navbar navbar-dark">
  <form class="form-inline" action="getWineSearch.wp" method="post">
    <input class="form-control mr-sm-2" type="text" name="searchKeyword" placeholder="검색어를 입력하세요.">
    <button class="btn btn-success" type="submit">검색</button>
  </form>
</nav>
</div>
<table> 
<c:forEach items="${wineList}" var="wine">
<tr><td class="tdCenter">
 <div class="card" style="width:300px">
    <img class="card-img-top" src="${pageContext.request.contextPath}/resources/img/wine/${wine.w_image1}" alt="Card image" style="height: 200px; width:50px">
    <div class="card-body">
      <h4 class="card-title">${wine.w_nm_k}</h4>
      <p class="card-text">${wine.w_price}</p>
      <a href="#" class="btn btn-primary stretched-link">See Wine</a>
    </div>
  </div>
  </td></tr>
  </c:forEach>
  </table>


<!-- <div class="container-fluid"> -->
<!--   <table class="table table-hover"> -->
<!--     <thead class="btn-primary"> -->
<!--       <tr> -->
<!--         <th>이미지</th> -->
<!--         <th>번호</th> -->
<!--         <th>이름(한)</th> -->
<!--         <th>이름(영)</th> -->
<!--         <th>나라</th> -->
<!--         <th>타입</th> -->
        
<!--       </tr> -->
<!--     </thead> -->
<!--     <tbody> -->
<%-- <c:forEach items="${wineList}" var="wine"> --%>
<!-- 	<tr> -->
<%-- 	  <td><img class="img" src="../../../resources/img/wine/${wine.w_image1}">${wine.w_image1}</td> --%>
<%-- 	 <td class="tdCenter">${wine.w_no}</td> --%>
<%-- 	  <td class="tdCenter">${wine.w_nm_k}</td> --%>
<%-- 	  <td class="tdCenter">${wine.w_nm_e}</td> --%>
<%-- 	  <td class="tdCenter">${wine.country}</td> --%>
<%-- 	  <td class="tdCenter">${wine.type}</td> --%>
	
<!-- 	</tr> -->
<%-- </c:forEach> --%>
<!--     </tbody> -->
<!--   </table><br><br> -->
  <div id="footer">
  	<button type="button" id="conWrite" class="btn btn-primary">글쓰기</button>
  </div>
</div>

</body>
</html>
