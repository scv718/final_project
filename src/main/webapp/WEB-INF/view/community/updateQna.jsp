<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>1:1 문의 수정하기</title>
<link rel="canonical"
	href="https://getbootstrap.kr/docs/4.5.2/examples/carousel/">

<link
	href="https://getbootstrap.kr/docs/4.5.2/dist/css/bootstrap.min.css"
	rel="stylesheet">

    <!-- include libraries(jQuery, bootstrap) -->
<link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<!-- include summernote css/js -->
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
<script>
$(document).ready(function() {
    
    $('#summernote').summernote({
          placeholder: 'Hello Bootstrap 4',
          tabsize: 2,
          height: 100
        });
  });

// 툴바생략
var setting = {
//         height : 300,
//         minHeight : null,
//         maxHeight : null,
//         focus : true,
//         lang : 'ko-KR',
//         toolbar : toolbar,
        //콜백 함수
        callbacks : { 
        	onImageUpload : function(files, editor, welEditable) {
        // 파일 업로드(다중업로드를 위해 반복문 사용)
        for (var i = files.length - 1; i >= 0; i--) {
        uploadSummernoteImageFile(files[i],
        this);
        		}
        	}
        }
     };
//     $('#summernote').summernote(setting);
//     });
    
    function uploadSummernoteImageFile(file, el) {
		data = new FormData();
		data.append("file", file);
		$.ajax({
			data : data,
			type : "POST",
			url : "uploadSummernoteImageFile",
			contentType : false,
			enctype : 'multipart/form-data',
			processData : false,
			success : function(data) {
				$(el).summernote('editor.insertImage', data.url);
			}
		});
	}

</script>


</head>
<body>
	<div class="jumbotron">
		<h1>1:1문의 수정</h1>
	</div>

	<div class="container-fluid">
		<form action="updateQna.wp" method="post" enctype="multipart/form-data">
			<input type="hidden" class="form-control" name="commu_cat" value="2">
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
							<input class="form-check-input" type="radio" name="faq_cat" id="gridRadios1" value="0" required> 
							<label class="form-check-label" for="gridRadios1"> [주문/결제/배송] </label> 
							
							<input class="form-check-input" type="radio" name="faq_cat" id="gridRadios2" value="1" required> 
							<label class="form-check-label" for="gridRadios2"> [취소/교환/환불] </label> 
							
							<input class="form-check-input" type="radio" name="faq_cat" id="gridRadios3" value="2" required> 
							<label class="form-check-label" for="gridRadios3"> [구독서비스] </label>
							
							<input class="form-check-input" type="radio" name="faq_cat" id="gridRadios4" value="3" required> 
							<label class="form-check-label" for="gridRadios4"> [회원] </label>
							
							<input class="form-check-input" type="radio" name="faq_cat" id="gridRadios5" value="4" required> 
							<label class="form-check-label" for="gridRadios5"> [기타] </label>
						</div>
					</div>
				</div>
			</fieldset>
			<div class="input-group mb-3">
				<div class="input-group-prepend">
					<span class="input-group-text">제목</span>
				</div>
				<input type="text" class="form-control" name="commu_title" value="${community.commu_title}" required>
			</div>
						<div class="input-group mb-3">
				<div class="input-group-prepend">
					<span class="input-group-text">내용</span>
				</div>
				 <textarea id="summernote" name="commu_content">${community.commu_content}</textarea>
<!-- 				<textarea class="form-control" rows="10" id="comment" name="commu_content"></textarea> -->
			</div>
			<div id="footer">
				<div id="se2_sample" style="margin: 10px 0;">
					<input type="submit" value="등록하기">
				</div>
			</div>
		</form>
	</div>


</body>
</html>