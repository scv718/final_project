<%@ page contentType="text/html; charset=utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/preference.css"/>
	
<body class = "d-flex flex-column min-vh-100">
<%@ include file="/header.jsp"%>
	<div class = "select">
	<form action="preference_setting.wp">
	<label for="customRange2" class="form-label">당도(Sweetness)</label>
	<div>당도는 와인의 맛 중에서 단맛, 달콤한 정도를 뜻합니다. </div>
	<input type="range" class="form-range" value = "2" min="0" max="5" id="s_sweet" name = "s_sweet">
	<br>
	<label for="customRange2" class="form-label">바디(Body)</label>
	<div>와인의 바디감은 와인을 머금었을 때 입안에서 느껴지는 '묵직함' 을 의미합니다. </div>
	<input type="range" class="form-range" value = "2" min="0" max="5" id="s_body" name = "s_body">
	<br>
	<label for="customRange2" class="form-label">산도(Acidity)</label>
	<div>산도는 식초와 같이 톡 쏘는 새콤한 맛을 뜻합니다. 와인의 맛에 생동감을 주며, 장기 숙성을 가능하게 하는 요소이기도 합니다.</div>
	<input type="range" class="form-range" value = "2" min="0" max="5" id="s_acidity" name = "s_acidity">
	<br>
	<label for="customRange2" class="form-label">탄닌(Tannin)	</label>
	<div>와인 맛의 뼈대를 이루는 중요한 요소로, 덜 익은 감을 먹을 때 느껴지는 떫은 맛을 떠올리는 것이 가장 적당합니다.<br>
	와인에서 느껴지는 쌉싸름한 맛이 바로 탄닌입니다. <br>
	</div>
	<input type="range" class="form-range" value = "2" min="0" max="5" id="s_tannins" name = "s_tannins">
	<br>
		<button class="btn" id="detailbtn">	<span>설정</span> </button>
	</form>
	</div>
<%@ include file="/footer.jsp"%>
</body>
</html>