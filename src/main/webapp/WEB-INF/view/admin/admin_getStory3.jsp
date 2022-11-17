<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<title>와인이 들려주는 이야기를 들어보세요.</title>

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/story.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
<style>
.table-responsive1 {
    display: block;
    width: 80%;
    overflow-x: auto;
    -webkit-overflow-scrolling: touch;
    align-self: center;
}
.myButton {
	background:linear-gradient(to bottom, #e0e0e0 5%, #fffaff 100%);
	background-color:#e0e0e0;
	border-radius:15px;
	border:1px solid #d6bcd6;
	display:inline-block;
	cursor:pointer;
	color:#2496b3;
	font-family:Trebuchet MS;
	font-size:17px;
	padding:7px 25px;
	text-decoration:none;
	text-shadow:0px 1px 0px #e1e2ed;
}
.myButton:hover {
	background:linear-gradient(to bottom, #fffaff 5%, #e0e0e0 100%);
	background-color:#fffaff;
}
.myButton:active {
	position:relative;
	top:1px;
}
</style>
</head>



<body class="d-flex flex-column min-vh-100">

	<%@ include file="../../../header.jsp"%>

	<div id="myCarousel" class="carousel slide" data-bs-ride="carousel">

			<div class="row">
				<div class="s_t col-sm-12">
					<div class="s_t_i">
						<img class="bd-placeholder-img" id="t1"
							src="${pageContext.request.contextPath}/resources/img/story/${story3_t.story_back_img}">
					</div>
					
					<div class="s_t_c">
						<h1>
						${story3_t.story_title}  페이지 수정하기
						</h1>
					</div>
					<hr>
				</div>
				</div>
	</div>
	
	 <div class="table-responsive1">
	   <form action="admin_updateStory1.wp" method="post" enctype="multipart/form-data">   
    <table id="myTable" class="display table"  style="width=80%">
        <thead>  
         <tr style="background-color: #FCA5A5" align="center">
	    	<th width="15%">페이지 번호</th>
	        <th width="50%">페이지 타이틀</th>
			<th width="20%">타이틀 이미지</th>
			<th width="15%">타이틀 수정</th>		
        </tr> 
        </thead>  
        <tbody> 
       <tr align="center">
       	<td style="vertical-align:middle;"><input type="number"  style="width:50%; text-align:center;" id="s1_t" name="story_p_no" value="${story3_t.story_p_no}" readonly></td>
         <td style="vertical-align:middle;"><input type="text"  style="width:90%" id="s1_t" name="story_title" value="${story3_t.story_title}"></td>
      	 <td style="vertical-align:middle;"><label for="s1_t_img"> 
      	 <input type="file" class="form-control innm" id="s1_t_img" name="uploadFile">
							</label><br>현재 선택 파일 : ${story3_t.story_back_img}</td>
	  <td style="vertical-align:middle;">
	  	<button type="submit" style="background-color:#FCA5A5" class="myButton1 btn btn-lg" onclick="if(confirm('수정하시겠습니까?'))">수정</button>
      </td>
</tr>
</tbody>
    </table></form>
   <hr>
    <table id="myTable" class="display table" style="width=80%">
        <thead>  
         <tr style="background-color: #FCA5A5" align="center">
	       	<th width="15%">메뉴이름</th>
			<th width="15%">재료들</th>
			<th width="50%">레시피</th>
			<th width="10%">이미지명</th>
			<th width="10%">항목 수정</th> </tr>
        </thead>  
        <tbody> 
         
       <c:forEach items="${story3_c}" var="story3" varStatus="status"> 
                  
       <tr align="center" >
       	 <td style="vertical-align:middle;">${story3.story_title}</td>
      	 <td style="vertical-align:middle;"><p>${story3.story_semi_title}</p></td>
      	 <td style="vertical-align:middle;"><textarea style="width:90%" readonly>${story3.story_content}</textarea></td>
      	 <td style="vertical-align:middle;">현재 선택 파일 : ${story3.story_add_img}</td>
	  <td>
	  	<button type="button" style="background-color:#FCA5A5" class="myButton1 btn btn-lg" onclick="conno(${story3.story_p_no},${story3.story_a_no})">수정</button>
      </td>
       </tr>            
       </c:forEach>
       </tbody>
    </table>
    <br>
       </div>
	
	<div align="center">
		<a
			href="admin_Story1.wp">
			<button type="button" id="colre"
				class='myButton'>1번 페이지 변경</button>
		</a> <a href="admin_Story2.wp">
			<button type="button" id="colre"
				class='myButton'>2번 페이지 변경</button>
		</a> <a href="wineStory3.wp">
			<button type="button" id="colre"
				class='myButton'>해당 페이지변경 확인</button>
		</a>
	</div>
	<hr class="featurette-divider">

<script>

function conno(val1, val2){
	alert("수정 페이지로 이동합니다.")
	location.href  ="/admin_updateStory3_c_m.wp?val1=" + val1 + "&val2="+val2;
	
}


</script>


	
	<%@ include file="/footer.jsp"%>
</body>

</html>
