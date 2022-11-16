<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>와이너리 | 와인이야기 관리</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/detailReview.css" />
<script src="https://code.jquery.com/jquery-3.6.0.slim.js"></script>
<script src="resources/js/fileupload.js"></script>
<%@ include file="../../../header.jsp"%>
<style>
dd {
	float: center;
	padding-right: 10px;
	text-align: center;
}

dt {
	float: center;
	padding-right: 10px;
	text-align: center;
}
#review-bottom1 {
	padding-bottom: 25px !important;
	text-align : center
}

#review-bottom1 button {
	background-color: #fff;
	border: 1px solid lightgray;
	color: gray;
	padding: 5px 15px;
}

</style>
</head>
<body>
<body class="d-flex flex-column min-vh-100">
		<div id="reviewContainer">
			<h3 id="comtitle">레시피 내용 변경</h3>
	  <form action="admin_updateStory1_c.wp" method="post" enctype="multipart/form-data">   
			<div id="reviewcontent">
				<div id="review-top">
					<input type="hidden" id="story_no" name="story_no" value="${story1_c_b.story_no}">
					<input type="hidden" id="story_p_no" name="story_p_no" value="${story1_c_b.story_p_no}">
					<h4 style="text-align: center;"> 메뉴명  <br>
						<input type="text" style="width:80%" name="story_title" id="updatetitle" placeholder="메뉴이름" value="${story1_c_b.story_title}">
					</h4>
					<h4 style="text-align: center;"> 재료  <br>
						<input type="text" style="width:80%" name="story_semi_title" id="updatetitle" placeholder="준비물" value="${story1_c_b.story_semi_title}">
					</h4>
				</div>
				<div id="review-middle" style="text-align: center;">
					<h6> 현재 설정되어 있는 이미지 명 : ${story1_c_b.story_add_img}</h6>
					<input type="file" class="form-control innm" name="uploadFile2" style="width:50%; margin: 0 auto;"><br>
					<span style="font-size:14px; color: gray;">※1장의 이미지만 등록 가능합니다.</span>
		
				</div>
				<!-- 리뷰내용 -->
				<textarea name="story_content" id="updatecontent" rows="10" style="width:100%; margin-top:10px; resize:none;" placeholder="작성할 내용을 입력하세요.">${story1_c_b.story_content}</textarea>
			</div>
			<div id="review-bottom1">
					<button type="submit">수정</button>
					<button type="button" onclick="location.href='javascript:window.history.back();'">취소</button>
			</div>
			</form>
		</div>
	<%@ include file="../../../footer.jsp"%>
</body>
</html>