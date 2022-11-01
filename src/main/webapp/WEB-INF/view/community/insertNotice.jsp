<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author"
	content="Mark Otto, Jacob Thornton, 그리고 Bootstrap 기여자들">
<meta name="generator" content="Hugo 0.104.2">
<title>공지사항 글쓰기</title>

<link rel="canonical"
	href="https://getbootstrap.kr/docs/5.2/examples/carousel/">

<link href="https://getbootstrap.kr/docs/5.2/dist/css/bootstrap.min.css"
	rel="stylesheet">
<!-- 네이버 스마트에디터  -->
<!-- <head> 안에 추가 -->
<script type="text/javascript" src="resources/libs/smarteditor/js/HuskyEZCreator.js" charset="utf-8"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
<!-- head 안에 추가 -->
<script>

// function save(){
// 	oEditors.getById["txtContent"].exec("UPDATE_CONTENTS_FIELD", []);  
//     		//스마트 에디터 값을 텍스트컨텐츠로 전달
// 	var content = document.getElementById("smartEditor").value;
// 	alert(document.getElementById("txtContent").value); 
//     		// 값을 불러올 땐 document.get으로 받아오기
// 	return; 
// }

</script> 
</head>
<body>
	<div class="jumbotron">
		<h1>공지사항 글쓰기</h1>
	</div>

	<div class="container-fluid">
		<form action="insertNotice.wp" method="post"
			enctype="multipart/form-data">
			<div class="input-group mb-3">
				<div class="input-group-prepend">
					<span class="input-group-text">구분번호</span>
				</div>
				<input type="text" class="form-control" name="commu_cat" placeholder="구분번호를 입력하세요" required>
			</div>
			<div class="input-group mb-3">
				<div class="input-group-prepend">
					<span class="input-group-text">항목내번호</span>
				</div>
				<input type="text" class="form-control" name="commu_cat_no" placeholder="항목내번호를 입력하세요" required>
			</div>
			<div class="input-group mb-3">
				<div class="input-group-prepend">
					<span class="input-group-text">제목</span>
				</div>
				<input type="text" class="form-control" name="commu_title" placeholder="제목을 입력하세요." required>
			</div>
			<div class="input-group mb-3">
				<div class="input-group-prepend">
					<span class="input-group-text">작성자</span>
				</div>
				<input type="text" class="form-control innm" name="id" value="관리자" readonly>
			</div>
			<div class="input-group mb-3">
				<div class="input-group-prepend">
					<span class="input-group-text">내용</span>
				</div>
<!-- 				<textarea class="form-control" rows="10" id="comment" name="commu_content"></textarea> -->
				<textarea id="txtContent" name="commu_content" rows="10" cols="100" style="width: 100%;"></textarea>
<!-- textarea 밑에 script 작성하기 -->
<script id="smartEditor" type="text/javascript"> 
	var oEditors = [];
	nhn.husky.EZCreator.createInIFrame({
	    oAppRef: oEditors,
	    elPlaceHolder: "txtContent",  //textarea ID 입력
	    sSkinURI: "resources/libs/smarteditor/SmartEditor2Skin.html",  //martEditor2Skin.html 경로 입력
	    fCreator: "createSEditor2",
	    htParams : { 
	    	// 툴바 사용 여부 (true:사용/ false:사용하지 않음) 
	        bUseToolbar : true, 
		// 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음) 
		bUseVerticalResizer : false, 
		// 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음) 
		bUseModeChanger : false 
	    }
	});
</script>
			</div>
<!-- 			<div class="input-group mb-3"> -->
<!-- 				<div class="input-group-prepend"> -->
<!-- 					<span class="input-group-text">작성일자</span> -->
<!-- 				</div> -->
<!-- 				<input type="date" class="form-control innm" name="writer" value="작성일자"> -->
<!-- 			</div> -->
			<div class="input-group mb-3">
				<div class="input-group-prepend">
					<span class="input-group-text">파일등록</span>
				</div>
				<input type="file" class="form-control innm" name="uploadFile">
			</div>
			<div id="footer">
<!-- 				<button id="conComplete" type="submit" class="btn btn-primary">새글등록</button> -->
				<button id="conList" type="button" class="btn btn-primary">글목록</button>
				<div id="se2_sample" style="margin:10px 0;">
<!-- 	<input type="button" onclick="save();" value="본문 내용 가져오기"> -->
	<input type="submit" value="등록하기">
</div>
			</div>
		</form>
	</div>


</body>

</html>
