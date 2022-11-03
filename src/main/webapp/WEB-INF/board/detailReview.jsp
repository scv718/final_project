<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>와이너리 | 상품후기</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/detailReview.css" />
<%@ include file="../../../header.jsp"%>
<style>
dd {
	float: left;
	padding-right: 10px;
}

dt {
	float: left;
	padding-right: 10px;
}
</style>
<script>
	function likebtn(){
		let userid = "<c:out value='${userID}'/>";
		console.log(userid);
		if(userid == "null"){
			alert("로그인이 필요합니다.");
			location.href = "singUp.wp";
		} else {
			location.href = "likeController.wp";
		}
	}
	
	function modbtn(){
		location.href = "updateReview.jsp";
	}

	function delbtn(){
		let con = confirm("삭제하시겠습니까?");
		if(con == true){
			let re_no = "<c:out value='${detailReview.re_no}'/>";
			console.log(re_no);
			location.href = "deleteReview.wp?re_no="+re_no;
		}
		else if(con == false){
		  	return false;
		}
	}
</script>
</head>
<body class="d-flex flex-column min-vh-100">
	<div id="reviewContainer">
		<h3 id="comtitle">상품후기</h3>
		<div id="reviewcontent">
			<div id="review-top">
				<h5>${detailReview.re_title}</h5>
				<dl class="review-info">
					<dt>평점</dt>
					<dd>${detailReview.re_score}</dd>
					<dt>작성자</dt>
					<dd>${fn:substring(detailReview.id,0,2)}<c:forEach begin="3"
							end="${fn:length(detailReview.id)}" step="1">*</c:forEach>
					</dd>
					<dt>작성일</dt>
					<dd>
						<fmt:formatDate pattern="yyyy-MM-dd hh:MM"
							value="${detailReview.re_date}" />
					</dd>
				</dl>
				<a href="javascript:window.history.back();" style="float: right;"><i class="bi bi-arrow-return-left"></i>뒤로가기</a>
			</div>
			<form name="fm" method="post">
				<div id="review-middle">
					<dl class="product">
						<dt>상품보기</dt>
						<dd>
							<a href="" class="productlink">${detailReview.w_nm_k}</a>
						</dd>
					</dl>
					<div>
						<c:if test="${detailReview.re_photo1 ne NULL}">
							<img id="imgBoxImg"
								src="resources/img/review/${detailReview.re_photo1}"
								style="width: 200px; padding: 10px 0;">
						</c:if>
					</div>
					<!-- 리뷰내용 -->
					<p>${detailReview.re_content}</p>
				</div>
				<div id="review-bottom">
					<c:choose>
						<c:when test="${userID eq detailReview.id}">
							<button type="button" onclick="likebtn()"><i class="bi bi-hand-thumbs-up-fill"></i>추천</button>
							<button type="button" onclick="modbtn()">수정</button>
							<button type="button" onclick="delbtn()">삭제</button>
						</c:when>
						<c:otherwise>
							<button type="button" onclick="likebtn()"><i class="bi bi-hand-thumbs-up-fill"></i>추천</button>
						</c:otherwise>
					</c:choose>
				</div>
			</form>
		</div>
	</div>
	<%@ include file="../../../footer.jsp"%>
</body>
</html>