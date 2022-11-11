<%@ page contentType="text/html; charset=utf-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/productdetailpage.css">
<title>와이너리 | 와인검색</title>
  <%@ include file="../../../header.jsp"%>

</head>
<body class="d-flex flex-column min-vh-100">
<script>
	$(document).ready(function() {
		$('#paymentone').click(function() {
			if($('#quantity').val() == ''){
				swal ( "수량을 선택해주세요" ,  "" ,  "error" )
				return false;
			}
			
			let fm = document.fm;
			fm.action = "payment.wp?cart=1";
			fm.method = "post";
			fm.submit();
		});
		$('#cart').click(function() {
			if($('#quantity').val() == ''){
				swal ( "수량을 선택해주세요" ,  "" ,  "error" )
				return false;
			}
			
			let fm = document.fm;
			fm.action = "addCart.wp";
			fm.method = "post";
			fm.submit();
		});
		
		$('#paymentonemobile').click(function() {
			if($('#quantitym').val() == ''){
				swal ( "수량을 선택해주세요" ,  "" ,  "error" )
				return false;
			}
			
			let fmm = document.fmm;
			fmm.action = "payment.wp?cart=1";
			fmm.method = "post";
			fmm.submit();
		});
		$('#cartm').click(function() {
			if($('#quantitym').val() == ''){
				swal ( "수량을 선택해주세요" ,  "" ,  "error" )
				return false;
			}
			
			let fm = document.fmm;
			fmm.action = "addCart.wp";
			fmm.method = "post";
			fmm.submit();
		});
		
		//리뷰내용 표시 (유경)
		$('#viewhidden').click(function(){
			status = $('#reviewblock').css("display");
			if(status == 'none') {
				$('#reviewblock').css('display', '');
			} else {
				$('#reviewblock').css('display', 'none');
			}
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
						alert("구매한 회원만 작성가능합니다.\n(구매자일 경우, 배송완료 이후 가능)")
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
		    
		    if ( scrollTop < 100 ) {
		        scrollTop = 100;
		    }
		    else if ( scrollTop > 9600 ) {
		        scrollTop = 9600;
		    }
		    
		    let duration = 0;
		    $('#productthree').stop().animate({top:scrollTop-100}, duration);
		    
		});
		
		//별점 표시
		$(function(){
			var rating = $('.rating');
			rating.each(function(){
				var targetScore = $(this).attr('data-rate');
				console.log(targetScore);
				$(this).find('svg:nth-child(-n+'+targetScore+')').css({color:'#f5d142'});
			});
		});
	</script>
	<!-- <form name="fm"> -->
	<%-- <input name='w_nm_k' type='hidden' value='${product.w_nm_k}'> --%>
	<%-- <input name='w_nm_e' type='hidden' value='${ol.w_nm_e}'> --%>
	<%-- <input name='w_noList' type='hidden' value='${product.w_no}'> --%>
	<!-- </form> -->
	<div class="container">
		<div class="row" id="firstrow">
			<div class="col-lg-4 col-sm-2" id = "productimgdiv">
				<div id="productone">
					<img id="productimg" src="${pageContext.request.contextPath}/resources/img/wine/${product.w_image1}">
				</div>
			</div>
			<div class="col-lg-4 col-md-6" id="producttwo">
				<div class="row" id="productnm">
					<p class="knm">${product.w_nm_k}
					<a href="#reviewdiv" style="color: #e2373f !important; font-size:12px;">[ 리뷰 ${reviewCount} ]</a>
					</p>
				</div>
				<div class="row" id="productnm">
					<p class="enm">${product.w_nm_e}</p>
				</div>
				<div class="row" id="productinfo">
					<p>${product.w_info}</p>
				</div>
				<div id = "winetaste"> 
				<div class ="row">
				<a id = "typename">당도  </a>
				<c:forEach var = "i" begin="1" end="${product.w_sweet}">
					<c:if test="${i == 1}">
					<a> <i class = "xi-full-moon" id = "one"></i></a>
				</c:if>
				<c:if test="${i == 2}">
					<a> <i class = "xi-full-moon" id = "two"></i></a>
				</c:if>
				<c:if test="${i == 3}">
					<a> <i class = "xi-full-moon" id = "three"></i></a>
				</c:if>
				<c:if test="${i == 4}">
					<a> <i class = "xi-full-moon" id = "four"></i></a>
				</c:if>
				<c:if test="${i == 5}">
					<a> <i class = "xi-full-moon" id = "five"></i></a>
				</c:if>
				</c:forEach>
				</div>
				<div class ="row">
				<a id = "typename">바디  </a>
				<c:forEach var = "i" begin="1" end="${product.w_body}">
						<c:if test="${i == 1}">
					<a> <i class = "xi-full-moon" id = "one"></i></a>
				</c:if>
				<c:if test="${i == 2}">
					<a> <i class = "xi-full-moon" id = "two"></i></a>
				</c:if>
				<c:if test="${i == 3}">
					<a> <i class = "xi-full-moon" id = "three"></i></a>
				</c:if>
				<c:if test="${i == 4}">
					<a> <i class = "xi-full-moon" id = "four"></i></a>
				</c:if>
				<c:if test="${i == 5}">
					<a> <i class = "xi-full-moon" id = "five"></i></a>
				</c:if>
				</c:forEach>
				</div>
				<div class ="row">
				<a id = "typename">산미  </a>
				<c:forEach var = "i" begin="1" end="${product.w_acidity}">
				<c:if test="${i == 1}">
					<a> <i class = "xi-full-moon" id = "one"></i></a>
				</c:if>
				<c:if test="${i == 2}">
					<a> <i class = "xi-full-moon" id = "two"></i></a>
				</c:if>
				<c:if test="${i == 3}">
					<a> <i class = "xi-full-moon" id = "three"></i></a>
				</c:if>
				<c:if test="${i == 4}">
					<a> <i class = "xi-full-moon" id = "four"></i></a>
				</c:if>
				<c:if test="${i == 5}">
					<a> <i class = "xi-full-moon" id = "five"></i></a>
				</c:if>
				</c:forEach>
				</div>
				<div class ="row">
				<a id = "typename">타닌  </a>
				<c:forEach var = "i" begin="1" end="${product.w_tannins}">
						<c:if test="${i == 1}">
					<a> <i class = "xi-full-moon" id = "one"></i></a>
				</c:if>
				<c:if test="${i == 2}">
					<a> <i class = "xi-full-moon" id = "two"></i></a>
				</c:if>
				<c:if test="${i == 3}">
					<a> <i class = "xi-full-moon" id = "three"></i></a>
				</c:if>
				<c:if test="${i == 4}">
					<a> <i class = "xi-full-moon" id = "four"></i></a>
				</c:if>
				<c:if test="${i == 5}">
					<a> <i class = "xi-full-moon" id = "five"></i></a>
				</c:if>
				</c:forEach>
				</div>
			</div>
			</div>
			<div class="col-4" id="productthree">
			<div id = "wineinfo">
			<div class = "row">
			<p id = "winenmk">${product.w_nm_k}</p>
			</div>
			<div class="row" id="priceinfo">
			<p style="margin:0;">판매가격</p>
			</div>
			<div class ="row" id = "pricediv">
			<p style="margin:0;"><fmt:formatNumber value="${product.w_price}" pattern="#,###"/>원</p>
			</div>
			<div class="row" id="shipping">
			<p>배송비 2,500원 별도</p>
			</div>
				<div class="buttondiv">
					<form action="addCart.wp" name="fm">
						<input type="hidden" id="w_no" name="w_no" value="${product.w_no}">
						<input type="hidden" id=w_price name="w_price"
							value="${product.w_price}"> <select name="ord_quan"
							id="quantity" class = "pl">
							<option value="">수량을 선택하세요.</option>
							<c:forEach items="${num}" var="option" varStatus="status">
								<option value="${status.count}">${status.count}</option>
							</c:forEach>
						</select>
						<button  class="btn-hover color-7" id = "cart" type="button"><i class ="xi-cart"></i> 장바구니</button>
					</form>
				</div>
				<button type="button" class="btn-hover color-7" id="paymentone">	<span>결제하기</span> </button>
			</div>
		</div>
		
		   <div class="col-12" id = "mobilepayment">
			<div id = "wineinfo">
			<div class="row" id="priceinfo">
			<p style="margin:0;">판매가격</p>
			</div>
			<div class ="row" id = "pricediv">
			<p style="margin:0;"><fmt:formatNumber value="${product.w_price}" pattern="#,###"/>원</p>
			</div>
			<div class="row" id="shipping">
			<p>배송비 2,500원 별도</p>
			</div>
				<div class="buttondiv">
					<form action="addCart.wp" name="fmm">
						<input type="hidden" id="w_no" name="w_no" value="${product.w_no}">
						<input type="hidden" id=w_price name="w_price"
							value="${product.w_price}"> <select name="ord_quan"
							id="quantitym" class = "pl">
							<option value="">수량을 선택하세요.</option>
							<c:forEach items="${num}" var="option" varStatus="status">
								<option value="${status.count}">${status.count}</option>
							</c:forEach>
						</select>
						<button  class="btn-hover color-7" id = "cartm" type="button"><i class ="xi-cart"></i> 장바구니</button>
					</form>
				</div>
				<button type="button" class="btn-hover color-7" id="paymentonemobile">	<span>결제하기</span> </button>
			</div>
		</div>
		</div>

			<!-- nav 바 1 -->
			<div class ="row">
				<nav class="col-8" id="navtag2">
					<ul class="ultag">
						<li class="litag"><a href="#detailcontents" class="nava">상품정보</a></li>
						<li class="litag"><a href="#reviewdiv" class="nava">상품후기</a></li>
					</ul>
				</nav>
			</div>

			<!-- 상품정보 이미지 -->
			<div class ="row" id="detailcontents">
				<div class="col-8">
				<img id = "productimginfo" src = "${pageContext.request.contextPath}/resources/img/예시.png">
				</div>
			</div>
			
			<!-- nav 바 2 -->
			<div class ="row">
				<nav class="col-8" id="navtag2">
					<ul class="ultag">
						<li class="litag"><a href="#detailcontents" class="nava">상품정보</a></li>
						<li class="litag"><a href="#reviewdiv" class="nava">상품후기</a></li>
					</ul>
				</nav>
			</div>
			
			<!-- 유경 추가 시작 -->
			<div class="row">
			<div class="col-8">
				<div id="reviewdiv">

					<article class="blog-post">
						<h4 class="blog-post-title mb-1" style="font-weight: bold;">REVIEW(${reviewCount})</h4>
						<div style="font-size: 30px; font-weight: bold;">
						<i class="bi bi-star-fill" style="color: #f5d142;"></i>
						${getRating}<c:if test="${getRating eq null}">-</c:if>
						</div>
						<div id="reviewContainer">
							<div id="filterdiv">
								<form action="getfilterList.wp" method="POST" id="filter">
									<input type="radio" name="filter" value="PHOTO"
										onchange="this.form.submit()"
										<c:if test="${radiochk eq 'PHOTO'}">checked</c:if>>포토리뷰만
									보기&nbsp; <input type="radio" name="filter" value="NEW"
										onchange="this.form.submit()"
										<c:if test="${radiochk eq 'NEW'}">checked</c:if>>최신순&nbsp;
									<input type="radio" name="filter" value="LIKE"
										onchange="this.form.submit()"
										<c:if test="${radiochk eq 'LIKE'}">checked</c:if>>추천순
								</form>
							</div>
							<table id="reviewtab">
								<colgroup>
									<col style="width: 20px">
									<col style="width: 100px">
									<col style="width: 40px">
									<col style="width: 40px">
									<col style="width: 50px">
									<col style="width: 20px">
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
													<i class="bi bi-image"></i>
												</c:if></td>
											<td style="text-align: left">
												<div>
													<a href="#" id="viewhidden" onclick="return false;"
														class="detailreview">${review.re_title}</a>
												</div>
											</td>
											<td class="tdCenter">
												<span class="rating" data-rate="${review.re_score}" style="color: #e6e6e6;">
													<svg xmlns="http://www.w3.org/2000/svg" width="15" height="15" fill="currentColor" class="bi bi-star-fill" viewBox="0 0 16 16">
													  <path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z"/>
													</svg>
													<svg xmlns="http://www.w3.org/2000/svg" width="15" height="15" fill="currentColor" class="bi bi-star-fill" viewBox="0 0 16 16">
													  <path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z"/>
													</svg>
													<svg xmlns="http://www.w3.org/2000/svg" width="15" height="15" fill="currentColor" class="bi bi-star-fill" viewBox="0 0 16 16">
													  <path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z"/>
													</svg>
													<svg xmlns="http://www.w3.org/2000/svg" width="15" height="15" fill="currentColor" class="bi bi-star-fill" viewBox="0 0 16 16">
													  <path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z"/>
													</svg>
													<svg xmlns="http://www.w3.org/2000/svg" width="15" height="15" fill="currentColor" class="bi bi-star-fill" viewBox="0 0 16 16">
													  <path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z"/>
													</svg>
												</span>	
											</td>
											<td class="tdCenter">${fn:substring(review.id,0,2)}<c:forEach begin="3" end="${fn:length(review.id)}" step="1">*</c:forEach>
											</td>
											<td class="tdCenter"><fmt:formatDate
													pattern="yyyy-MM-dd" value="${review.re_date}" /></td>
											<td class="tdCenter">${review.re_like}</td>
										</tr>
										<tr class="review_content_box" id="reviewblock" style="display: none;">
											<td colspan="6">
												<div class="left-div">
												<div class="content-div">
												<div style="padding: 15px 0;">
													<div style="text-align:center; margin-bottom: 10px;">
														<c:if test="${review.re_photo1 ne NULL}">
														<img class="imgBoxImg" src="${pageContext.request.contextPath}/resources/img/review/${review.re_photo1}" style="width: 200px; padding: 10px 0;">
														<c:if test="${review.re_photo2 ne NULL}">
														<img class="imgBoxImg" src="${pageContext.request.contextPath}/resources/img/review/${review.re_photo2}" style="width: 200px; padding: 10px 0;">
														<c:if test="${review.re_photo3 ne NULL}">
														<img class="imgBoxImg" src="${pageContext.request.contextPath}/resources/img/review/${review.re_photo3}" style="width: 200px; padding: 10px 0;">
														</c:if>
														</c:if>
														</c:if>
													</div>
													<p>${review.re_content}</p>
												</div>
												</div>
												</div>
											</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
							<c:if test="${getRating eq null}">
								<div class="col" id="notexist">작성된 후기가 없습니다.</div>
							</c:if>
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
							<div id="noneDiv" style="display: none;">
								<form action="insertReview.wp" method="post" id="myform"
									name="myform" enctype="multipart/form-data">
									<h4 id="comtitle">후기작성</h4>
									<div id="writeContent">
										<fieldset>
											<input type="radio" name="rating" value="5" id="rate1"><label
												for="rate1">⭐</label> <input type="radio" name="rating"
												value="4" id="rate2"><label for="rate2">⭐</label> <input
												type="radio" name="rating" value="3" id="rate3"><label
												for="rate3">⭐</label> <input type="radio" name="rating"
												value="2" id="rate4"><label for="rate4">⭐</label> <input
												type="radio" name="rating" value="1" id="rate5"><label
												for="rate5">⭐</label>
										</fieldset>
										<span style="font-size: 14px;"> ※평점을 선택해 주세요.</span>
										<div>
											<input type="hidden" id="w_no" name="w_no"
												value="${product.w_no}"> <input type="text"
												name="re_title" id="inserttitle" placeholder="제목" required>
										</div>
										<div>
											<input type="text" name="id" value="${userID}" readonly>
										</div>
										<div>
											<textarea class="form-control" rows="10" id="comment"
												name="content" style="resize: none"
												placeholder="작성할 내용을 입력하세요." required></textarea>
										</div>
										<button class="writebtn" onclick="">작성</button>
										<button class="writebtn" type="button" onclick="offDisplay()">닫기</button>
									</div>
								</form>
							</div>
						</div>
					</article>
				</div>
			</div>
			</div>
			<!-- 추가 끝 -->

	</div>
	<%@ include file="../../../footer.jsp"%>
</body>
</html>