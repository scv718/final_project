<%@ page contentType="text/html; charset=utf-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/productdetailpage.css">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.slim.js"></script>
<script src="resources/js/fileupload.js"></script>
<%@ include file="../../../header.jsp"%>
</head>
<body class="d-flex flex-column min-vh-100">
<script>
	$(document).ready(function() {
		$('#paymentone').click(function() {
			let fm = document.fm;
			fm.action = "payment.wp?cart=1";
			fm.method = "post";
			fm.submit();
		});
	});

	
	//리뷰쓰기 중복확인(유경)
	var userId = '${userID}';
	var w_no = ${product.w_no};
	function existReview() {
	
	$.ajax({
		type : "post",
		url : "existReview.wp",
		dataType : "text",
		data : {
				'w_no' : w_no,
				'id' : userId
				},
		error : function(request, error) {
				alert("통신 에러");
				//에러 원인
				alert("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
				},
		success : function(check) {
					if (check == '01') {
						$('#noneDiv').show();
					} else if (check == '00') {
						alert("구매한 회원만 작성이 가능합니다.\n(구매자일 경우, 배송완료 이후 가능)")
						location.reload();
					} else {
						alert("상품별 후기작성은 한 번만 가능합니다.");
						location.reload();
					}
				}
			});
		}
		//리뷰작성 닫기
		function offDisplay() {
			$('#noneDiv').hide();
		}
		
		$(window).scroll(function() {
		    let scrollTop = $(this).scrollTop();
		    console.log(scrollTop)
		    
		    if ( scrollTop < 100 ) {
		        scrollTop = 100;
		    }
		    else if ( scrollTop > 9600 ) {
		        scrollTop = 9600;
		    }
		    
		    let duration = 0;
		    $('#productthree').stop().animate({top:scrollTop-100}, duration);
		    
		});
		
	</script>
	<!-- <form name="fm"> -->
	<%-- <input name='w_nm_k' type='hidden' value='${product.w_nm_k}'> --%>
	<%-- <input name='w_nm_e' type='hidden' value='${ol.w_nm_e}'> --%>
	<%-- <input name='w_noList' type='hidden' value='${product.w_no}'> --%>
	<!-- </form> -->
	<div class="container">
		<div class="row" id="firstrow">
			<div class="col-4" id="productone">
				<img id="productimg" src="resources/img/wine/${product.w_image1}">
			</div>
			<div class="col-5" id="producttwo">
				<div class="row" id="productnm">
					<p class="knm">${product.w_nm_k}</p>
				</div>
				<div class="row" id="productnm">
					<p class="enm">${product.w_nm_e}</p>
				</div>
				<div class="row" id="productinfo">
					<p>${product.w_info}</p>
				</div>
				<div class="row" id="productprice">
					<p>${product.w_price}</p>
				</div>
			</div>
			<div class="col" id="productthree">
				<div class="buttondiv">
					<form action="addCart.wp" name="fm">
						<input type="hidden" id="w_no" name="w_no" value="${product.w_no}">
						<input type="hidden" id=w_price name="w_price"
							value="${product.w_price}"> <select name="ord_quan"
							id="quantity">
							<option value="">수량</option>
							<c:forEach items="${num}" var="option" varStatus="status">
								<option value="${status.count}">${status.count}</option>
							</c:forEach>
						</select>
						<button type="submit">장바구니</button>
						<button type="button" id="paymentone">결제하기</button>
					</form>
				</div>
			</div>

<div class ="row" >
	<div class="col-9">
	<img style = "width: 600px;" src = "${pageContext.request.contextPath}/resources/img/예시.png">
	</div>
</div>

			<!-- 유경 추가 시작 -->
			<div class="col-9">
				<div id="reviewdiv">

					<article class="blog-post">
						<h4 class="blog-post-title mb-1">REVIEW</h4>
						<div id="reviewContainer">
							<div id="filterdiv">
								<form action="getfilterList.wp" method="POST" id="filter">
									<input type="radio" name="filter" value="PHOTO"	onchange="this.form.submit()"
										<c:if test="${radiochk eq 'PHOTO'}">checked</c:if>>포토리뷰만 보기&nbsp; 
									<input type="radio" name="filter" value="NEW" onchange="this.form.submit()"
										<c:if test="${radiochk eq 'NEW'}">checked</c:if>>최신순&nbsp;
									<input type="radio" name="filter" value="LIKE" onchange="this.form.submit()"
										<c:if test="${radiochk eq 'LIKE'}">checked</c:if>>추천순
								</form>
							</div>
							<table id="reviewtab">
								<colgroup>
									<col style="width: 20px">
									<col style="width: 200px">
									<col style="width: 70px">
									<col style="width: 70px">
									<col style="width: 100px">
									<col style="width: 50px">
								</colgroup>
								<thead>
									<tr class="reviewhead">
										<th></th>
										<th>제목</th>
										<th>평점</th>
										<th>작성자</th>
										<th>작성일</th>
										<th>추천수</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${reviewList}" var="review">
										<tr>
											<td><c:if test="${review.re_photo1 ne NULL}">
													<i class="bi bi-image" style="color: gray;"></i>
												</c:if></td>
											<td style="text-align: left">
												<div>
													<a href="detailReview.wp?re_no=${review.re_no}"
														class="detailreview">${review.re_title}</a>
												</div>
											</td>
											<td class="tdCenter">${review.re_score}</td>
											<td class="tdCenter">${fn:substring(review.id,0,2)}<c:forEach
													begin="3" end="${fn:length(review.id)}" step="1">*</c:forEach>
											</td>
											<td class="tdCenter"><fmt:formatDate
													pattern="yyyy-MM-dd" value="${review.re_date}" /></td>
											<td class="tdCenter">${review.re_like}</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
							<c:if test="${userID ne null}">
								<div id="writebtn-div">
									<button type="button" class="writebtn"
										onclick="existReview(); return false">리뷰쓰기</button>
								</div>
							</c:if>

							<div id="btnBox">
								<!-- 반복처리할 태그 시작 -->
								<c:if test="${paging.nowPageBtn > 1 }">
									<a href="getReviewList.wp?nowPageBtn=${paging.nowPageBtn - 1}">&lt;</a>
								</c:if>
								<c:forEach begin="${paging.startBtn}" end="${paging.endBtn}"
									step="1" var="i">
									<c:choose>
										<c:when test="${paging.nowPageBtn == i}">
											<a class="aSel">${i}</a>
										</c:when>
										<c:otherwise>
											<a href="getReviewList.wp?nowPageBtn=${i}">${i}</a>
										</c:otherwise>
									</c:choose>
								</c:forEach>
								<c:if test="${paging.nowPageBtn < paging.totalBtnCnt}">
									<a href="getReviewList.wp?nowPageBtn=${paging.nowPageBtn + 1}">&gt;</a>
								</c:if>
								<!-- 반복 끝 -->
							</div>
							<br>
							<!-- 리뷰 작성 폼 -->
							<div id="noneDiv" style="display: none;">
								<h4 id="comtitle">후기작성</h4>
								<form method="post" id="myform" name="myform">
									<div id="writeContent">
										<fieldset>
											<input type="radio" name="re_score" value="5" id="rate1" required><label
												for="rate1">⭐</label> <input type="radio" name="re_score"
												value="4" id="rate2"><label for="rate2">⭐</label> <input
												type="radio" name="re_score" value="3" id="rate3"><label
												for="rate3">⭐</label> <input type="radio" name="re_score"
												value="2" id="rate4"><label for="rate4">⭐</label> <input
												type="radio" name="re_score" value="1" id="rate5"><label
												for="rate5">⭐</label>
										</fieldset>
										<span style="font-size: 14px;"> 평점을 선택해 주세요.</span>
										<div class="padding-div">
											<input type="hidden" class="form-control" name="w_no" value="${product.w_no}"> 
											<input type="text" class="form-control" name="re_title" placeholder="제목" required>
										</div>
										<div class="padding-div">
											<input type="text" class="form-control" name="id" value="${userID}" readonly>
										</div>
										<div class="padding-div">
											<button id="filebtn" type="button" name="re_photo1">파일추가</button>
											<input id="inputfile" type="file" multiple="multiple" accept=".jpg, .png">
											<span style="font-size:14px; color: gray;">※파일은 최대 3개까지 등록 가능합니다.</span>
											<div class="data_file_txt" id="data_file_txt">
												<div id="articlefileChange"></div>
											</div>
										</div>
										<div class="padding-div">
											<textarea class="form-control" rows="10" id="comment"
												name="re_content" style="resize: none"
												placeholder="작성할 내용을 입력하세요." required></textarea>
										</div>
										<button class="writebtn" type="button" onclick="insertAction()">작성</button>
										<button class="writebtn" type="button" onclick="offDisplay()">닫기</button>
									</div>
								</form>
							</div>
						</div>
					</article>
				</div>
			</div>
			<!-- 추가 끝 -->
		</div>
	</div>
	<%@ include file="../../../footer.jsp"%>
</body>
</html>