<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style>
#searchNav{-webkit-justify-content: flex-end; justify-content: flex-end; }
</style>
<body>
<%@ include file="../../../header.jsp" %>
<div class="jumbotron">
   <h1>와인 톱아보기</h1>      
</div>

<nav id="searchNav" class="navbar navbar-expand-sm navbar-dark">
  <form class="form-inline" action="getBoardList.do" method="post">
  	<select class="form-control" id="sel1" name="searchCondition" style="display:inline-block!important;margin-right:10px;">
        <c:forEach items="${conditionMap}" var="option">
	        <option value="${option.value}">${option.key}</option>
        </c:forEach>
<%-- 		<option value="${conditionMap['제목']}">${conditionMap['제목']}</option> --%>
<%-- 		<option value="${conditionMap['내용']}">${conditionMap['내용']}</option> --%>
    </select>
    <input class="form-control mr-sm-2" type="text" name="searchKeyword" placeholder="검색어를 입력하세요.">
    <button class="btn btn-success" type="submit">검색</button>
  </form>
</nav>
<div class="container-fluid">
  <table class="table table-hover">
    <thead class="btn-primary">
      <tr>
        <th>번호</th>
        <th>이름(한)</th>
        <th>이름(영)</th>
        <th>대륙</th>
        <th>나라</th>
        <th>생산년도</th>
        <th>타입</th>
        <th>당도</th>
        <th>바디감</th>
        <th>산도</th>
        <th>타닌</th>
        <th>재고</th>
        <th>가격</th>
        <th>소개글</th>
        <th>이미지</th>
      </tr>
    </thead>
    <tbody>
<c:forEach items="${wineList}" var="wine">
	<tr onclick="selTr(${wine.w_no})" style="cursor:pointer;">
	 <td class="tdCenter">${wine.w_no}</td>
	  <td class="tdCenter">${wine.w_nm_k}</td>
	  <td class="tdCenter">${wine.w_nm_e}</td>
	  <td class="tdCenter">${wine.continental}</td>
	  <td class="tdCenter">${wine.country}</td>
	  <td class="tdCenter">${wine.since}</td>
	  <td class="tdCenter">${wine.type}</td>
	  <td class="tdCenter">${wine.w_sweet}</td>
	  <td class="tdCenter">${wine.w_body}</td>
	  <td class="tdCenter">${wine.w_acidity}</td>
	  <td class="tdCenter">${wine.w_tannins}</td>
	  <td class="tdCenter">${wine.quantity}</td>
	  <td class="tdCenter">${wine.w_price}</td>
	  <td class="tdCenter">${wine.w_info}</td>
	  <td class="tdCenter">${wine.w_image1}</td>
	</tr>
</c:forEach>
    </tbody>
  </table><br><br>
  <div id="footer">
  	<button type="button" id="conWrite" class="btn btn-primary">글쓰기</button>
  </div>
</div>

</body>
</html>
