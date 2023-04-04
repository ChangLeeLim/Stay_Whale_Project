<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" trimDirectiveWhitespaces="true"%>
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>Pension Index</title>
	<link rel="stylesheet" type="text/css" href="css/pension_index.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
	<script src="js/pension_index.js"></script>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=9ac96333bf6ff2bb0f94315ab1e58bf1&libraries=services"></script>
</head>
<body>
	<%
		request.setCharacterEncoding("utf-8");
		String id = (String) session.getAttribute("id");
	%>
	<%
		if(id == null) {
	%>
		<jsp:include page="Header_Login_Fail.jsp" >
			<jsp:param name="id" value="<%= id%>"/>
		</jsp:include>
	<%
	} else {
	%>
		<jsp:include page="Header_Login_Success.jsp"/>
	<%
	}
	%>
	<section class="section_wrap" style="width:0px; height: 0px;"></section>
	<section>
		<form>
		<div class="top_info_wrap">
			<div id="top_li">
				<nav>
					<ul>
						<li><img src="image/pension_new_icon.png">
						<div>신규</div></li>
						<li><img src="image/pension_hot_icon.png">
						<div>Best Hot</div></li>
						<li><img src="image/pension_sale_icon.png">
						<div>특가</div></li>
						<li><img src="image/pension_golf_icon.png">
						<div>골프</div></li>
						<li><img src="image/pension_kiz_icon.png">
						<div>키즈</div></li>
						<li><img src="image/pension_suffing_icon.png">
						<div>서핑</div></li>
						<li><img src="image/pension_hanok_icon.png">
						<div>한옥</div></li>
						<li><img src="image/pension_view_icon.png">
						<div>전망</div></li>
						<li><img src="image/pension_sigol_icon.png">
						<div>시골</div></li>
						<li><img src="image/pension_sea_icon.png">
						<div>바다</div></li>
					</ul>
				</nav>
			</div>
		</div>
		<div class="map_wrap">
			<div class="map" id="map"></div>
				<script>
				var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
			    mapOption = { 
			        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
			        level: 5 // 지도의 확대 레벨 
			    }; 

				var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
	
				// HTML5의 geolocation으로 사용할 수 있는지 확인합니다 
				if (navigator.geolocation) {
				    
				    // GeoLocation을 이용해서 접속 위치를 얻어옵니다
				    navigator.geolocation.getCurrentPosition(function(position) {
				        
				        var lat = position.coords.latitude, // 위도
				            lon = position.coords.longitude; // 경도
				        
				        var locPosition = new kakao.maps.LatLng(lat, lon) // 마커가 표시될 위치를 geolocation으로 얻어온 좌표로 생성합니다
				        // 마커와 인포윈도우를 표시합니다
				        displayMarker(locPosition);
				      });
				    
				} else { // HTML5의 GeoLocation을 사용할 수 없을때 마커 표시 위치와 인포윈도우 내용을 설정합니다
				    var locPosition = new kakao.maps.LatLng(33.450701, 126.570667)
				    displayMarker(locPosition);
				}
	
				// 지도에 마커와 인포윈도우를 표시하는 함수입니다
				function displayMarker(locPosition) {
				    // 마커를 생성합니다
				    var marker = new kakao.maps.Marker({  
				        map: map, 
				        position: locPosition
				    }); 
				    // 지도 중심좌표를 접속위치로 변경합니다
				    map.setCenter(locPosition);      
				}
				</script>
				<div class="map_info">
					<ul>
						<li>
							<div class="title_image"><img src="image/ex1.jpg"></div>
							<div class="name">숲의 길 펜션</div>
							<div class="address">경기 가평</div>
							<div class="avgscore">8.9</div>
							<div class="price">200,000원</div>
						</li>
					</ul>
				</div>
		</div>
		<div class="map_search_wrap">
			<div class="map_search_ul">
				<nav>
					<ul>
						<li>
							<select name="sido1" value = "시/도" id="sido1"></select>
							<select name="gugun1" value = "구/군" id="gugun1"></select>
						</li>
						<li>입실 날짜</li>
						<li>퇴실 날짜</li>
						<li>확인</li>
						<li>상세검색</li>
					</ul>
				</nav>
			</div>
		</div>
		<div class="event_info_wrap">
			<h2 style="margin-bottom: 30px;">Hot한 행사</h2>
			<ul>
				<li>끝나가는 행사</li>
				<li>진행중인 행사1</li>
				<li>진행중인 행사2</li>
				<li>진행중인 행사3</li>
				<li>진행중인 행사4</li>
			</ul>
		</div>
		</form>
	</section>
<jsp:include page="footer.jsp"/>
</body>
</html>