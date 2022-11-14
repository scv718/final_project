<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>공지사항 상세조회 - 관리자</title>
<!-- <link href="https://getbootstrap.kr/docs/5.2/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script> -->
	<%@ include file="../../../header.jsp"%>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/admin_getNotice.css" />
<script>
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
<body class="d-flex flex-column min-vh-100">
	<div id="communityContainer">
		<h1 id="comtitle">공지사항 상세조회</h1>

		<form name="fm" id="dataForm" action="admin_updateNotice.wp" method="post">

			<input type="hidden" name="commu_no" value="${community.commu_no}">

			<div class="li_board">
				<ul>
					<li class="col1">작성자</li>
					<li class="col2"><input type="text" class="name" name="id" value="${community.id}" readonly></li>
				</ul>

				<ul>
					<li class="col1">제목</li>
					<li class="col2"><input type="text" class="form-content" name="commu_title" value="${community.commu_title}" required></li>
				</ul>

				<ul>
					<li class="col1">문의내용</li>
					<li class="col2"><textarea class="form-content" rows="10"
							id="comment" name="commu_content" required>${community.commu_content}</textarea></li>
				</ul>

				<ul>
					<li class="col1">등록일</li>
					<li class="col2"><input type="text" class="form-content" name="commu_date" value="${community.commu_date}" style="background-color:Transparent; border:none;" readonly></li>
				</ul>

				<ul>
					<li class="col1">조회수</li>
					<li class="col2"><input type="text" class="form-content" name="commu_count" value="${community.commu_count}" style="background-color:Transparent; border:none;" readonly></li>
				</ul>

			</div>

			<div id="bottom_btn">
				<input class="updatebtn" type="submit" value="글 수정">
				<button type="button" class="delbtn" id="conDel">글 삭제</button>
				<button type="button" class="listbtn" id="conList">글 목록</button>
			</div>

		</form>
	</div>

	<%@ include file="../../../footer.jsp" %>
</body>
</html>