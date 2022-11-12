<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>공지사항 상세조회 - 사용자</title>
<!-- <link href="https://getbootstrap.kr/docs/5.2/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script> -->
	<%@ include file="../../../header.jsp"%>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/getNotice.css" />
</head>

<body class="d-flex flex-column min-vh-100">
	
	<div id="communityContainer">
		
		<h3 id="comtitle">공지사항 상세조회</h3>
		<br>

		<div id="communityContent">
			<div class="container-fluid">
			<br>
			
				<div id="community-top">
					<input type="hidden" name="commu_no" value="${community.commu_no}">
					<h5>${community.commu_title}</h5>
									
					<dl class="community-info">
						<dt>작성자</dt>
						<dd>${community.id}</dd>

						<dt>등록일</dt>
						<dd>${community.commu_date}</dd>

						<dt>조회수</dt>
						<dd>${community.commu_count}</dd>
					</dl>
								
					<div id="media_768">
						<a href="getNoticeList.wp" style="float: right;"><i class="bi bi-list"></i>목록보기</a>
					</div>
					
				</div>
				<br>

				<div id="community-middle">
					<textarea class="form-control innm" id="comment" name="commu_content" style="background-color: transparent" disabled>${community.commu_content}</textarea>
				</div>

			</div>
		</div>
	</div>

	<script>
	 $(document).ready(function() {
	  $("#community-middle").on("keyup", "textarea", function(e) {
	    $(this).css("height", "auto");
	    $(this).height(this.scrollHeight);
	  });
	  $("#community-middle").find("textarea").keyup();
	})
 </script>

	<%@ include file="../../../footer.jsp" %>
</body>
</html>