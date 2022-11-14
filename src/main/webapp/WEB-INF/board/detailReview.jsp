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
<script src="https://code.jquery.com/jquery-3.6.0.slim.js"></script>
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

	// 추천하기
	var re_no = ${detailReview.re_no};
	var id = '${userID}';
	function updateLike(){
		if(id == ""){
			alert("로그인 후 이용가능합니다.");
			location.href = "signUp.wp";
		} else {
			$.ajax({
				type : "POST",
				url : "likeReview.wp",
				dataType : "json",
				data : {'re_no' : re_no, 'id' : id},
				error : function() {
					alert("통신 에러");
				},
				success : function(likeCheck) {
					if(likeCheck == 0) {
						console.log("추천완료");
						location.reload();
					} else if(likeCheck == 1) {
						console.log("추천취소");
						location.reload();
					}
				}
			});
			
		}
		
	}
	
	//추천 표시
	var likeCheck = ${likeCheck};
	$(function(){
		if(likeCheck == 1) {
			$(".bi-hand-thumbs-up").attr("class", "bi-hand-thumbs-up-fill");
		} else {
			$(".bi-hand-thumbs-up-fill").attr("class", "bi-hand-thumbs-up");
		}
	});
	
	function modbtn(){
		location.href = "updateReviewPage.wp?re_no="+re_no;
	}

	function delbtn(){
		let con = confirm("삭제하시겠습니까?");
		if(con == true){
// 			let re_no = "<c:out value='${detailReview.re_no}'/>";
// 			console.log(re_no);
			location.href = "deleteReview.wp?re_no="+re_no;
			alert("삭제 완료");
		}
		else if(con == false){
		  	return false;
		}
		location.href = "getReviewList.wp";
	}
	
	$(function(){
		var rating = $('.rating');
		
		rating.each(function(){
			var targetScore = $(this).attr('data-rate');
			console.log(targetScore);
			$(this).find('svg:nth-child(-n+'+targetScore+')').css({color:'#f5d142'});
		});
	});
</script>
</head>
<body class="d-flex flex-column min-vh-100">
	<div id="reviewContainer">
		<h3 id="comtitle">상품후기</h3>
		<div id="reviewcontent">
			<div id="review-top">
				<h5>${detailReview.re_title}</h5>
					<span style="font-weight:700; padding-right: 20px;">평점</span>
					<span class="rating" data-rate="${detailReview.re_score}">
						<svg xmlns="http://www.w3.org/2000/svg" width="19" height="19" fill="currentColor" class="bi bi-star-fill" viewBox="0 0 16 16">
						  <path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z"/>
						</svg>
						<svg xmlns="http://www.w3.org/2000/svg" width="19" height="19" fill="currentColor" class="bi bi-star-fill" viewBox="0 0 16 16">
						  <path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z"/>
						</svg>
						<svg xmlns="http://www.w3.org/2000/svg" width="19" height="19" fill="currentColor" class="bi bi-star-fill" viewBox="0 0 16 16">
						  <path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z"/>
						</svg>
						<svg xmlns="http://www.w3.org/2000/svg" width="19" height="19" fill="currentColor" class="bi bi-star-fill" viewBox="0 0 16 16">
						  <path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z"/>
						</svg>
						<svg xmlns="http://www.w3.org/2000/svg" width="19" height="19" fill="currentColor" class="bi bi-star-fill" viewBox="0 0 16 16">
						  <path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z"/>
						</svg>
					</span>
				<dl class="review-info">
					<dt>작성자</dt>
					<dd>${fn:substring(detailReview.id,0,2)}<c:forEach begin="3"
							end="${fn:length(detailReview.id)}" step="1">*</c:forEach>
					</dd>
					<dt>작성일</dt>
					<dd>
						<fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${detailReview.re_date}" />
					</dd>
				</dl>
				<a href="getReviewList.wp" style="float: right;" class="alist"><i class="bi bi-list"></i>목록보기</a>
			</div>
			<form name="fm" method="post">
				<div id="review-middle">
					<div class="product">
						<div class="product-title">
							<div class="img-box" style="float: left;">
								<a href="product.wp?w_no=${detailReview.w_no}" class="productlink">
									<img src="${pageContext.request.contextPath}/resources/img/wine/${detailReview.w_image1}" class="img-thumbnail">
								</a>
							</div>
							<div class="product-content">
								<div>
									<a href="product.wp?w_no=${detailReview.w_no}" class="productlink">${detailReview.w_nm_k}<span style="font-size:14px;">(${detailReview.w_nm_e})</span></a>
								</div>
								<div>
									<span><fmt:formatNumber value="${detailReview.w_price}" pattern="#,###"/>원</span>
								</div>
							</div>
						</div>
					</div>
					<div>
						<c:if test="${detailReview.re_photo1 ne NULL}">
							<div class="img-div">
							<img class="imgBoxImg" src="resources/img/review/${detailReview.re_photo1}">
							</div>
								<c:if test="${detailReview.re_photo2 ne NULL}">
								<div class="img-div">
								<img class="imgBoxImg" src="resources/img/review/${detailReview.re_photo2}">
								</div>	
									<c:if test="${detailReview.re_photo3 ne NULL}">
									<div class="img-div">
									<img class="imgBoxImg" src="resources/img/review/${detailReview.re_photo3}">
									</div>
									</c:if>
								</c:if>
						</c:if>
					</div>
					<!-- 리뷰내용 -->
					<p style="white-space:pre;"><c:out value="${detailReview.re_content}"/></p>
				</div>
				<div id="review-bottom">
					<c:choose>
						<c:when test="${userID eq detailReview.id}">
							<button class="btn-radius" type="button" onclick="updateLike(); return false;"><i class="bi bi-hand-thumbs-up"></i>추천 ${detailReview.re_like}</button>
							<button class="btn-radius" type="button" onclick="modbtn()">수정</button>
							<button class="btn-radius" type="button" onclick="delbtn()">삭제</button>
						</c:when>
						<c:otherwise>
							<button class="btn-radius" type="button" onclick="updateLike()"><i class="bi bi-hand-thumbs-up"></i>추천 ${detailReview.re_like}</button>
						</c:otherwise>
					</c:choose>
				</div>
			</form>
		</div>
	</div>
	<%@ include file="../../../footer.jsp"%>
</body>
</html>