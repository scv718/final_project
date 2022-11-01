<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>상세보기</title>
<link href="https://getbootstrap.kr/docs/5.2/dist/css/bootstrap.min.css"
	rel="stylesheet">
	  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  
<style>
	#imgBox {display:none;position:absolute;top:0;left:0;height:100vh!important;background-color:rgba(0,0,0,0.5);z-index:9999999;}
	#imgContentBox {width:600px;max-height:550px;overflow:auto;position:absolute;top:30%;left:30%;border-radius:5px;z-index:9999999;}
	#imgBoxTitleBar {border-bottom:1px solid #777;border-radius:5px 5px 0 0;background-color:#ddd;width:100%;padding:10px;text-align:right;font-size:20px;font-weight:bolder;}
	#imgBoxImg {width:100%;border-radius: 0 0 5px 5px;}
	#closeX {padding:5px 20px;border-radius:5px;border:1px solid #777;background-color:red;color:#fff;}
	#closeX:hover {background-color:#777;cursor:pointer;}
</style>
<script>
$(document).ready(function(){ 
	
	$("#conDel").click(function(){
		if(confirm("정말 삭제하시겠습니까?") == true){
			let v = document.fm.commu_no.value;
			location.href = "deleteNotice.wp?commu_no="+v;
		}else{
		}
	});
	
	$("#conList").click(function(){
		location.href = "getNoticeList.wp";
	});
});

</script>
</head>
<body>
<div class="jumbotron">
   <h1>공지사항 글 상세 보기</h1>      
</div>

<div class="container-fluid">

  <form name="fm" action="updateNotice.wp" method="post">
  <input type="hidden" name="commu_no" value="${community.commu_no}">
    <div class="input-group mb-3">
      <div class="input-group-prepend">
        <span class="input-group-text">제목</span>
      </div>
      <input type="text" class="form-control innm" name="commu_title" value="${community.commu_title}">      
    </div>
    <div class="input-group mb-3">
      <div class="input-group-prepend">
        <span class="input-group-text">작성자</span>
      </div>
<%--       <input type="text" class="form-control innm" name="writer" value="${board.writer}" readonly <%=sts %>>       --%>
      <input type="text" class="form-control innm" value="${community.id}" readonly>      
    </div>
    <div class="input-group mb-3">
      <div class="input-group-prepend">
        <span class="input-group-text">내용</span>
      </div>
      <textarea class="form-control innm" rows="10" id="comment" name="commu_content">${community.commu_content}</textarea>      
    </div>  
    <%-- <div class="input-group mb-3">
      <div class="input-group-prepend">
        <span class="input-group-text">파일</span>
      </div>
   		<c:if test="${board.filename ne NULL}">
   			<span style="cursor:pointer;padding:0 20px;" onclick="seeImg()">[파일보기]</span>
   			<script>
	        	function seeImg(){
	        		$("#imgBox").show();
	        	}
	        </script>
   			<span style="cursor:pointer;" onclick="downloadFile('${board.filename}')">[파일다운]</span>
   			<script>
	   			function downloadFile(filename){
	   			    window.location ='download.do?filename='+filename;
	   			}
			</script>
   		</c:if>
    </div> --%>
    <div class="input-group mb-3">
      <div class="input-group-prepend">
        <span class="input-group-text">등록일</span>
      </div>
      <input type="text" class="form-control innm" name="commu_date" value="${community.commu_date}" readonly >      
    </div>
    <div class="input-group mb-3">
      <div class="input-group-prepend">
        <span class="input-group-text">조회수</span>
      </div>
      <input type="text" class="form-control innm" name="commu_count" value="${community.commu_count}" readonly>      
    </div>
    <div id="footer">
<%--     <input class="btn btn-primary" type="submit" value="글수정하기" onclick="location.href='updateNotice.wp?commu_no=${community.commu_no}'"> --%>
    <input class="btn btn-primary" type="submit" value="글수정하기" >
<!-- 	  	<button type="submit" class="btn btn-primary">글수정</button> -->
	  	<button id="conWrite" type="button" class="btn btn-primary" onclick="location.href='insertNotice.wp'">글쓰기</button>
	  	<button id="conDel" type="button" class="btn btn-primary" >글삭제</button>
	  	<button id="conList" type="button" class="btn btn-primary">글목록</button>
	</div>
  </form>  
</div>
<!-- 클릭시 보이는 이미지 start -->
<div id="imgBox" class="container-fluid">
	<div id="imgContentBox">
		<div id="imgBoxTitleBar">
			<span id="closeX" onclick="closeX()">X</span>
			 <script>
        	function closeX(){
        		$("#imgBox").hide();
        	}
        </script>
		</div>
		<img id="imgBoxImg" src="img/${board.filename}">
	</div>
</div>
<!-- 클릭시 보이는 이미지 end -->
</body>
</html>