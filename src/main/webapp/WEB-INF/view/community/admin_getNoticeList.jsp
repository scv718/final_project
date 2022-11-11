<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet"   href="${pageContext.request.contextPath}/resources/css/communityList.css"/>
<title>공지사항 목록 - 관리자</title>
<%@ include file="../../../header.jsp"%>

<script>
function selTr(val){
   location.href = "admin_getNotice.wp?commu_no="+val;
}
</script>
</head>

<body class = "d-flex flex-column min-vh-100">
   <div id="communityContainer">
   
   <h3 id="comtitle">공지사항</h3>
   
   <!-- 검색창 - 공통 -->
   <nav id="searchNav">
      <form action="admin_getNoticeList.wp" method="POST" id="communityform">
         <select name="searchCondition" class="searchsel" >
            <c:forEach items="${conditionMap}" var="option">
               <option value="${option.value}" <c:if test="${category eq option.value}">selected="selected"</c:if>>${option.key}</option>
            </c:forEach>
         </select>
         <input type="text" class="searchinput" name="searchKeyword" placeholder="검색어를 입력하세요." value="${search}">
         <button type="submit" class="searchbtn">검색</button>
      </form>
   </nav>

   <button id="conWrite" type="button" class="btn btn-primary" onclick="location.href='admin_insertNotice.wp'">글쓰기</button>
   
    <div class="li_board communitytab">
        <ul class="li_header hidden-xs communityhead">
            <li class="no"></li>
            <li class="tit">제목</li>
            <li class="name">작성자</li>
            <li class="date">작성일</li>
            <li class="read">조회수</li>
        </ul>

      <c:forEach var="notice" items="${noticeList}">
           <ul class="li_body community_body" onclick="selTr(${notice.commu_no})" style="cursor:pointer;" >
               <li class="no">[안내]</li>
               <li class="tit">${notice.commu_title}</li>
               <li class="name">${notice.id}</li>
               <li class="date">${notice.commu_date}</li>
               <li class="read">
                <span class="hidden-lg hidden-md hidden-sm ">조회수</span>${notice.commu_count}
               </li>
           </ul>
      </c:forEach>
    </div>
    
    <!-- 페이징 - 공통 -->
    <div id="btnBox">
    
      <!-- 반복처리할 태그 시작 -->
      <c:if test="${paging.nowPageBtn > 1 }">
         <a href="admin_getNoticeList.wp?nowPageBtn=${paging.nowPageBtn - 1}">&lt;</a>
      </c:if>
      <c:forEach begin="${paging.startBtn}" end="${paging.endBtn}" step="1" var="i">
         <c:choose>
            <c:when test="${paging.nowPageBtn == i}">
               <a class="aSel">${i}</a>
            </c:when>
            <c:otherwise>
               <a href="admin_getNoticeList.wp?nowPageBtn=${i}">${i}</a>
            </c:otherwise>
         </c:choose>
      </c:forEach>
      <c:if test="${paging.nowPageBtn < paging.totalBtnCnt}">
         <a href="admin_getNoticeList.wp?nowPageBtn=${paging.nowPageBtn + 1}">&gt;</a>
      </c:if>
      <!-- 끝 -->
   </div><br><br>
    
    </div>
    <%@ include file="../../../footer.jsp" %>
</body>
</html>