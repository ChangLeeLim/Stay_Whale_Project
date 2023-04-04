<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" trimDirectiveWhitespaces="true"%>
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>Pension Index</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
	<script src="js/pension_index.js"></script>
	<link rel="stylesheet" type="text/css" href="css/pension_index.css">
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=9ac96333bf6ff2bb0f94315ab1e58bf1&libraries=services"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
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
	<section>
		<div id="main_search_wrap">
			<div id="image_in" class="image_in">
				<div class="selec_wrap">
					<div id="search_01">
						<ul>
							<li>지역 선택</li>
							<li>체크인</li>
							<li>체크아웃</li>
						</ul>
					</div>
					<form>
						<div id="search_02">			
							<ul>
								<li>
									<select name="sido1" value = "시/도" id="sido1"></select>
									<select name="gugun1" value = "구/군" id="gugun1"></select>
								</li>
								<li>
									<input type="text" name="from" id="from" class="datepicker" style="cursor: ponter" placeholder="select a check-in date">
								</li>
								<li>
									<input type="text" name="to" id="to" class="datepicker" style="cursor: ponter" placeholder="select a check-out date">
								</li>
							</ul>
						</div>
						<div class="bt_wrap">
							<button type="reset" class="custom-btn btn-5" id="reset_Bt"><span>초기화</span></button>
							<button type="button" class="custom-btn btn-5" id="confim_Bt"><span>검 색</span></button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</section>
	<section id="sec_section">
		<div id="map_serarch_title"><img src="image/map_search_icon.png">&nbsp지도 검색</div>
		<div class="map_wrap">
			
			<div class="map" id="map"></div>
				<script>
				var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
			    mapOption = { 
			        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
			        level: 5 // 지도의 확대 레벨 
			    }; 

				var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
				// 주소-좌표 변환 객체를 생성합니다
	
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
		<h2 style="margin-bottom: 30px; margin-top: 50px;">Hot한 행사</h2>
		<div class="event_info_wrap">
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
<script src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.css"/>
</html>