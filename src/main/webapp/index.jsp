<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.util.Date"%>

<script>
	// 	window.onload = function(){
	// 		 sendRequest();
	// 	}

	// 	function sendRequest(){
	// 		$.ajax({
	// 			method:"GET",
	// 			url: 'test.do',
	// 			success: function(data){
	// 				let a = data.split(" ");
	// 				let t = a[1].split(":");
	// 				let tm = t[0]+":"+t[1]+":"+t[2];

	// 				document.getElementById("text").innerHTML = "현재 접속 시각: "+tm;
	// 			},

	// 			error:function(request, status){
	// 				alert("오류가 발생했습니다.");
	// 			}
	// 		});
	// 	}

	// 	window.setInterval("sendRequest()", 1000); // 매 1초마다 ajax 요청을 보냄
</script>
<%@ include file="header.jsp"%>

<style>
video {
	width: 100%;
	display: block;
	height: 610px;
}
.Btnimg{
	width: 60px;
}
.WaterBtn{
	
	background-color: white;
	border: none;
	margin-right: 50px;
}
.WaterBtn p{
	font-family: Parisienne !important;
	font-size: 20px;

}
#btncontainer{
	margin-top: 30px;
}
</style>
<body class = "d-flex flex-column min-vh-100">

	<div>

		<video muted autoplay loop>
			<source src="img/와인메인3.mp4" type="video/mp4">
		</video>

	</div>


	<div class="container" id = "btncontainer">
		<div class="text-center">
		<button class = "WaterBtn"><img class = "Btnimg" src = "img/물방울이미지스파클링.png"><br/><p>Sparkling</p></button>
		<button class = "WaterBtn"><img class = "Btnimg" src = "img/물방울이미지화이트.png"><p>White</p></button>
			<button class = "WaterBtn"><img class = "Btnimg" src = "img/물방울이미지로제.png"><p>Rose</p></button>
			<button class = "WaterBtn"><img class = "Btnimg" src = "img/물방울이미지레드.png"><p>Red</p></button>
		</div>
		<hr>
	</div>
	<%@ include file="footer.jsp"%>
</body>
</html>