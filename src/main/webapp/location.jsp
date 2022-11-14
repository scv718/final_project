<%@ page language="java"%>
<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.text.*"%>
<%
request.setCharacterEncoding("UTF-8");

%>
<!DOCTYPE html>
<html>
<head>
<title>찾아오시는 길</title>
<style>
.col img {
	filter: brightness(100%) !important;
}
</style>

</head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/ordertable.css" />
</head>
<body class = "d-flex flex-column min-vh-100">
<body class = "d-flex flex-column min-vh-100">
	<%@ include file="/header.jsp"%>
	<div id="bestbooks">
		<div class="container">
			<div class="row" id="bestbooks1">
				<div class="col-1" id="bookmenu">
					<div>찾아오는 길</div>
					<hr>
					<ul>
						<li><a class="active"
							href="${pageContext.request.contextPath}/location.jsp">찾아오는 길</a></li>
					</ul>
				</div>
				<div class="col">
					<div class="row" id="titlemenu">
						<a>찾아오시는 길</a>
					</div>
					<hr>
					<div id="map" style="width: 500px; height: 350px;"></div>
					<script type="text/javascript"
						src="//dapi.kakao.com/v2/maps/sdk.js?appkey=2db5d7295a5d1c0f4730538e2141fb0a&libraries=services"></script>
					<script>
						var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
						mapOption = {
							center : new kakao.maps.LatLng(37.40018966565125, 126.92090567576712), // 지도의 중심좌표
							level : 3
						// 지도의 확대 레벨
						};
						// 지도를 생성합니다    
						var map = new kakao.maps.Map(mapContainer, mapOption);
						// 주소-좌표 변환 객체를 생성합니다
						var geocoder = new kakao.maps.services.Geocoder();
						// 주소로 좌표를 검색합니다
						geocoder
								.addressSearch(
										'경기도 안양시 만안구 안양로 314번길 10',
										function(result, status) {
											// 정상적으로 검색이 완료됐으면 
											if (status === kakao.maps.services.Status.OK) {
												var coords = new kakao.maps.LatLng(
														result[0].y,
														result[0].x);
												// 결과값으로 받은 위치를 마커로 표시합니다
												var marker = new kakao.maps.Marker(
														{
															map : map,
															position : coords
														});
												// 인포윈도우로 장소에 대한 설명을 표시합니다
												var infowindow = new kakao.maps.InfoWindow(
														{
															content : '<div style="width:150px;text-align:center;padding:6px 0;">winery</div>'
														});
												infowindow.open(map, marker);
												// 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
												map.setCenter(coords);
											}
										});
					</script>
				</div>
			</div>
		</div>
	</div>
	<%@ include file="/footer.jsp"%>
</body>
</html>