<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>QNA 글쓰기</title>
<link rel="canonical"
	href="https://getbootstrap.kr/docs/4.5.2/examples/carousel/">

<link
	href="https://getbootstrap.kr/docs/4.5.2/dist/css/bootstrap.min.css"
	rel="stylesheet">

    <!-- include libraries(jQuery, bootstrap) -->
<link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script src="resources/js/qna_fileupload.js"></script>
<!-- include summernote css/js -->
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
</head>
<body>
	<div class="jumbotron">
		<h1>1:1 문의하기</h1>
	</div>

	<div class="container-fluid">
<!-- 		<form action="insertQna.wp" method="post" enctype="multipart/form-data"> -->
			<form name="dataForm" id="dataForm"  >
			<input type="hidden" class="form-control" name="commu_cat" value="2">
			<input type="hidden" class="form-control" name="answer_status" value="답변대기">
<%-- 			<input type="hidden" class="form-control" name="id" value="<%=session.getAttribute("userID").toString() %>"> --%>
			<div class="input-group mb-3">
				<div class="input-group-prepend">
					<span class="input-group-text">작성자</span>
				</div>
				<input type="text" class="form-control" name="id" value="<%=session.getAttribute("userID").toString() %>" readonly>
			</div>
			
			<fieldset class="form-group">
				<div class="row">
					<legend class="col-form-label col-sm-2 pt-0">문의유형</legend>
					<div class="col-sm-10">
						<div class="form-check">
							<input class="form-check-input" type="radio" name="faq_cat" id="gridRadios1" value="0" checked> 
							<label class="form-check-label" for="gridRadios1"> [주문/결제/배송] </label> 
							
							<input class="form-check-input" type="radio" name="faq_cat" id="gridRadios2" value="1"> 
							<label class="form-check-label" for="gridRadios2"> [취소/교환/환불] </label> 
							
							<input class="form-check-input" type="radio" name="faq_cat" id="gridRadios3" value="2"> 
							<label class="form-check-label" for="gridRadios3"> [구독서비스] </label>
							
							<input class="form-check-input" type="radio" name="faq_cat" id="gridRadios4" value="3"> 
							<label class="form-check-label" for="gridRadios4"> [회원] </label>
							
							<input class="form-check-input" type="radio" name="faq_cat" id="gridRadios5" value="4"> 
							<label class="form-check-label" for="gridRadios5"> [기타] </label>
						</div>
					</div>
				</div>
			</fieldset>
			<div class="input-group mb-3">
				<div class="input-group-prepend">
					<span class="input-group-text">제목</span>
				</div>
				<input type="text" class="form-control" name="commu_title"
					placeholder="제목을 입력하세요." required>
			</div>
						<div class="input-group mb-3">
				<div class="input-group-prepend">
					<span class="input-group-text">내용</span>
				</div>
				<textarea class="form-control" rows="10" id="comment" name="commu_content"></textarea>
			</div>

			<button id="filebtn" type="button" name="commu_photo1">파일추가</button>
					<input id="inputfile" type="file" multiple="multiple">
					<span style="font-size:14px; color: gray;">※파일은 최대 3개까지 등록 가능합니다.</span>
					
					<div class="data_file_txt" id="data_file_txt">
						<div id="articlefileChange"></div>
					</div>
			<div id="footer">
				<div id="se2_sample" style="margin: 10px 0;">
					<input type="button" value="등록하기" onclick="registerAction()">
				</div>
			</div>
		</form>
	</div>


</body>
</html>