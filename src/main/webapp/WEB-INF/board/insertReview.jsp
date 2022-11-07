<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Hugo 0.104.2">
    <title>와인검색</title>

    <link rel="canonical" href="https://getbootstrap.com/docs/5.2/examples/blog/">
	<link href="https://getbootstrap.com//docs/5.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
	<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script	src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
	<meta name="theme-color" content="#712cf9">
<style>
	#detailproduct {
    	width: 1050px;
    	margin: 0 auto;	
	}
	
	#myform fieldset {
        display: inline-block; /* 행 전체 차지하지 않고 별 영역만 사용하게끔 함. */
        border: 0px;
        direction: rtl; /* 이모지 순서 반전 */
    }

    #myform fieldset legend {
      text-align: left;
    }

    #myform input[type=radio]{
      display: none;
    }

    #myform input[type=radio]:checked ~ label {
      text-shadow: 0 0 0 #f5d142; /* 마우스 클릭 체크 */
    }

    #myform label { /* 이모지를 투명으로 하고 텍스트 그림자 효과에 색상 부여하는 방식으로 이모지 색상 변경. */
      font-size: 1.8em;
      color: transparent;
      text-shadow: 0 0 0 #e6e6e6;
    }

    #myform label:hover {
      text-shadow: 0 0 0 #f5d142;
    }

    #myform label:hover ~ label {
      text-shadow: 0 0 0 #f5d142;
    }
</style>
<script>

	$(".reply_button_wrap").on("click", function(e){
		e.preventDefault();
		
		const userId = '${userID}';
		const w_no = '${wine.w_no}';
		
		let popUrl = "/replyEnroll/" + userId + "?w_no=" + w_no;
		console.log(popUrl);
		let popOption = "width = 400px, height=450px, scrollbars=yes";
		
		window.open(popUrl,"리뷰쓰기",popOption);
	});
	
	function onDisplay() {
		$('#noneDiv').show();
	}
	function offDisplay() {
		$('#noneDiv').hide();
	}
</script>
</head>
<body>

  <div class="row g-5" id="detailproduct">
      
      <!-- 임시 -->
      <div>
    	<button class="reply_button_wrap">리뷰쓰기</button>
      </div>
      
      <c:if test="${userID ne null}">
	    <div>
    	<button class="reviewbtn" onclick="onDisplay()">리뷰쓰기</button>
      	</div>
      </c:if>
      
      <article class="blog-post" id="noneDiv" style="display:none;">
      	<h4>REVIEW</h4>
			<div>
				<form action="insertReview.wp" method="post" id="myform" name="myform" enctype="multipart/form-data">
					<fieldset>
			          <input type="radio" name="rating" value="5" id="rate1"><label for="rate1">⭐</label>
			          <input type="radio" name="rating" value="4" id="rate2"><label for="rate2">⭐</label>
			          <input type="radio" name="rating" value="3" id="rate3"><label for="rate3">⭐</label>
			          <input type="radio" name="rating" value="2" id="rate4"><label for="rate4">⭐</label>
			          <input type="radio" name="rating" value="1" id="rate5"><label for="rate5">⭐</label>
			        </fieldset>	
					<div>
						<div><span>제목</span></div>
						<input type="text" name="title" required>
					</div>
					<div>
						<div><span>작성자</span></div>
						<p>${review.id}</p>
					</div>
					<div>
						<div><span>내용</span></div>
						<textarea class="form-control" rows="10" id="comment" name="content" style="resize:none" required></textarea>
					</div>
					<div id="reviewbtn-div">
					<button class="reviewbtn" onclick="">작성</button>
					<button class="reviewbtn" type="button" onclick="offDisplay()">닫기</button>
					</div>
				</form>
			</div>
      </article>
    </div>

	<!-- 구매 관련 영역 -->
    <div class="col-md-4">
      <div class="position-sticky" style="top: 2rem;">
        <div class="p-4 mb-3 bg-light rounded">
          <h4>옵션</h4>
          <select name="product-option">
          	<option value="select-option">옵션선택</option>
          	<option value="select-option">해당상품명</option>
          </select>
        </div>
        <div class="p-4 mb-3 bg-light rounded">
          <h4>수량</h4>
        </div>
        <div class="p-4 mb-3 bg-light rounded">
          <h4>총 상품금액</h4>
        </div>
        <button type="submit">장바구니</button>
        <button type="button">구매하기</button>
      </div>
    </div>

</body>
</html>