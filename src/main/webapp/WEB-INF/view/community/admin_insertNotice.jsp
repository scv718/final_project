<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!doctype html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<meta name="description" content="">
<meta name="author" content="Mark Otto, Jacob Thornton, 그리고 Bootstrap 기여자들">
<meta name="generator" content="Hugo 0.104.2">

<title>공지사항 등록 - 관리자</title>
<!-- <link rel="canonical" href="https://getbootstrap.kr/docs/5.2/examples/carousel/">
<link href="https://getbootstrap.kr/docs/5.2/dist/css/bootstrap.min.css" rel="stylesheet"> -->
 <%@ include file="../../../header.jsp"%>
</head>

<body class="d-flex flex-column min-vh-100">
   <div class="jumbotron">
      <h1>공지사항 글 등록</h1>
   </div>

   <div class="container-fluid">
      <form action="admin_insertNotice.wp" method="post">
         <input type="hidden" class="form-control" name="commu_cat" value="0">

         <!-- <div class="input-group mb-3">
            <div class="input-group-prepend">
               <span class="input-group-text">항목내번호</span>
            </div>
            <input type="text" class="form-control" name="commu_cat_no" placeholder="항목내번호를 입력하세요" required>
         </div> -->
         
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
            <textarea class="form-control" rows="10" id="comment" name="commu_content"></textarea>
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