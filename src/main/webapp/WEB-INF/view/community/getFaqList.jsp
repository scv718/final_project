<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/faq_qna_List.css" />
<title>FAQ</title>
<%@ include file="../../../header.jsp"%>

<script>
	function selTr(val) {
		location.href = "getFaq.wp?commu_no=" + val;
	}
	var id = '${userID}';
	console.log(id)
	function logincheck(){
		if(id == ""){
			alert("로그인 후 이용가능합니다.");
			location.href = "signUp.wp";
		}else{
		location.href = "insertQna_get.wp";
			}
		}
</script>
</head>

<body class="d-flex flex-column min-vh-100">

	<div id="faqContainer">
		<!-- 제목 -->
		<h3 id="comtitle">FAQ</h3>
		<p id="original_type">고객들이 자주 물어보는 여러가지 질문에 대한 답변을 모아두었습니다.</p>
		<p id="media_type">고객들이 자주 물어보는 여러가지<br>질문에 대한 답변을 모아두었습니다.</p>
		
<!-- 		<button type="button" onclick="location.href='admin_getFaqList.wp'">관리자FAQ목록확인</button> -->
		<!-- 검색창 -->
		<nav id="searchNav">
			<form action="getFaqList.wp" method="POST" id="faqform">
				<select name="searchCondition" class="searchsel">
					<c:forEach items="${conditionMap}" var="option">
						<option value="${option.value}"
							<c:if test="${category eq option.value}">selected="selected"</c:if>>${option.key}</option>
					</c:forEach>
				</select> <input type="text" class="searchinput" name="searchKeyword"
					placeholder="검색어를 입력하세요." value="${search}">
				<button type="submit" class="searchbtn">검색</button>
			</form>
		</nav>
		
		<!-- 카테고리 필터 -->
		<div id="aligndiv">
		<form action="getFaqList.wp" method="POST" id="align">
			<nav>
        <label><input type="radio" name="alignlist" value="zero" id="zero" onchange="this.form.submit()" <c:if test="${paging.viewType eq 'zero'}">checked</c:if>>주문/결제/배송&nbsp;│</label>
        <label><input type="radio" name="alignlist" value="one" id="one" onchange="this.form.submit()" <c:if test="${paging.viewType eq 'zero'}">checked</c:if>>취소/교환/환불&nbsp;│</label>
        <label><input type="radio" name="alignlist" value="two" id="two" onchange="this.form.submit()" <c:if test="${paging.viewType eq 'zero'}">checked</c:if>>구독서비스&nbsp;│</label>
        <label><input type="radio" name="alignlist" value="three" id="three" onchange="this.form.submit()" <c:if test="${paging.viewType eq 'zero'}">checked</c:if>>회원&nbsp;│</label>
        <label><input type="radio" name="alignlist" value="four" id="four" onchange="this.form.submit()" <c:if test="${paging.viewType eq 'zero'}">checked</c:if>>기타&nbsp;│</label>
        <button type="button" class="qna_btn" onclick="logincheck()">1:1 문의하기</button>
    		</nav>
		</form>
		</div>
		
		<!-- 자주하는질문 보드 -->
			<div class="li_title">
				<ul>
				<li class="title_1">문의내용</li>
				</ul>
			</div>
		<div id="accordion">
			<c:forEach var="faq" items="${FaqList}">
				<div class="accordion">
					<c:choose>
						<c:when test="${faq.faq_cat eq '0'}">
							<span>[주문/결제/배송]</span>
						</c:when>
						<c:when test="${faq.faq_cat eq '1'}">
							<span>[취소/교환/환불]</span>
						</c:when>
						<c:when test="${faq.faq_cat eq '2'}">
							<span>[구독서비스]</span>
						</c:when>
						<c:when test="${faq.faq_cat eq '3'}">
							<span>[회원]</span>
						</c:when>
						<c:otherwise>
							<span>[기타]</span>
						</c:otherwise>
					</c:choose>
					<span>${faq.commu_title}</span>
				</div>
				<div class="panel">
<%-- 					<p>${faq.commu_content}</p> --%>
					<br>
					<textarea class="addr" disabled>${faq.commu_content}</textarea>
				</div>
			</c:forEach>
		</div>

		<br>
		<!-- 페이징처리 -->
		<div id="btnBox">
			<!-- 반복처리할 태그 시작 -->
			<c:if test="${paging.nowPageBtn > 1 }">
				<a href="getFaqList.wp?nowPageBtn=${paging.nowPageBtn - 1}">&lt;</a>
			</c:if>
			<c:forEach begin="${paging.startBtn}" end="${paging.endBtn}" step="1"
				var="i">
				<c:choose>
					<c:when test="${paging.nowPageBtn == i}">
						<a class="aSel">${i}</a>
					</c:when>
					<c:otherwise>
						<a href="getFaqList.wp?nowPageBtn=${i}">${i}</a>
					</c:otherwise>
				</c:choose>
			</c:forEach>
			<c:if test="${paging.nowPageBtn < paging.totalBtnCnt}">
				<a href="getFaqList.wp?nowPageBtn=${paging.nowPageBtn + 1}">&gt;</a>
			</c:if>
			<!-- 끝 -->
		</div>
		<br> <br>
	</div>
	<%@ include file="../../../footer.jsp"%>
</body>
<script>
    var acc = document.getElementsByClassName("accordion");
    var i;
 
    for (i = 0; i < acc.length; i++) {
        acc[i].addEventListener("click", function () {
            this.classList.toggle("active");
            var panel = this.nextElementSibling;
            if (panel.style.maxHeight) {
                panel.style.maxHeight = null;
            } else {
                panel.style.maxHeight = panel.scrollHeight + "px";
            }
        });
    } 
    
    var txtArea = $(".addr");
    if (txtArea) {
        txtArea.each(function(){
            $(this).height(this.scrollHeight);
        });
    }
  
</script>

</html>