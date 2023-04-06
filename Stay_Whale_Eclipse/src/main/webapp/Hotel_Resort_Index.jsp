<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>STAY WHALE || Hotel Resort</title>
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
		<div class="section_wrap">
			<div class="side_wrap">
				<aside>
					<div class="select_Wrap">
						<div><b>호텔 / 리조트</b></div>
							<form id="addr_Selec">
								<select name="sido1" value = "시/도" id="sido1"></select>
								<select name="gugun1" value = "구/군" id="gugun1"></select>
							</form>
					</div>
					<div>
						<div style="margin-top: 20px;"><b>날짜</b></div>
							<form style="text-align: center;" style="margin-top: 10px;">
						  		<input type="text" readonly placeholder="날짜 선택" id="day_Selec">
						  	</form>
					</div>
					<div style="margin-bottom: 10px; margin-top: 10px;"><b>상세조건</b></div>
						<div id="bt_wrap" style="margin-top: 10px;">
							<form action='login_page.php'>
								<div class="bt1">
								  <button type="button" class="custom-btn btn-5" id="reset_Bt"><span>초기화</span></button>
								  <button type="button" class="custom-btn btn-5"><span>적 용</span></button>
								</div>
							</form>
					</div>
					<div>
						<form>
							<ul style="margin-top: 10px; margin-bottom: 10px; margin-right: 30px;">
						      <li><input type="checkbox" id="check1"><label for="check1"> 예약가능</label></li>
						      <li><input type="checkbox" id="check2"><label for="check2"> 프로모션</label></li>
					     	</ul>
					    </form>
				    </div>
				    
					    <div><b>호텔 & 리조트 유형</b></div>
						    <form>
						    	<ul style="margin-bottom: 10px;">
							      <li><input type="checkbox" id="check3"><label for="check3"> 5성급</label></li>
							      <li><input type="checkbox" id="check4"><label for="check4"> 4성급</label></li>
							      <li><input type="checkbox" id="check5"><label for="check5"> 특1급</label></li>
							      <li><input type="checkbox" id="check6"><label for="check6"> 특급</label></li>
							    </ul>
						    </form>
				    
				    <div style="margin-bottom: 10px;"><b>가격</b><span style="font-size: 5px; color: gray;">(만원)</span></div>
				    <form id="price_Wrap">
					    <div class="range-slider">
						    <input type="text" class="js-range-slider">
						</div>
						<div class="extra-controls">
						    <input type="text" disabled class="js-input-from" id="price_left" value="0">
						    <input type="text" disabled class="js-input-to" id="price_right" value="0">
						</div>
					</form>
					<div style="margin-top: 25px">
						<b>인원</b><span style="font-size: 5px; color: gray;">(최대 8명)</span>
						<div id="people_Wrap">
							<button id="dw"><img src="image/minus_Bt.png"></button>
							<span id="people_cnt" style="font-size: 22px">2</span>
							<button id="up"><img src="image/plus_BT.png"></button>
						</div>
					</div>
					<div style="margin-top: 20px"><b>배드 타입</b></div>
					<div class="icon_Wrap">
						<div class="list_Wrap">
							<ul>
								<li><img src="image/single_Bed.png"><div>싱글</div></li>
								<li><img src="image/double_Bed.png"><div>더블</div></li>
								<li><img src="image/twin_Bed.png"><div>트윈<div></li>
								<li><img src="image/ondol_Bed.png"><div>온돌<div></li>
							</ul>
						</div>
					</div>

					<div><b>공용 시설</b></div>
						<form>
							<ul style="margin-bottom: 10px">
						      <li><input type="checkbox" id="check7"><label for="check7"> 피트니스</label></li>
						      <li><input type="checkbox" id="check8"><label for="check8"> 수영장</label></li>
						      <li><input type="checkbox" id="check9"><label for="check9"> 사우나</label></li>
						      <li><input type="checkbox" id="check10"><label for="check10"> 골프장</label></li>
						      <li><input type="checkbox" id="check11"><label for="check11"> 레스토랑</label></li>
						      <li><input type="checkbox" id="check12"><label for="check12"> 엘레베이터</label></li>
						      <li><input type="checkbox" id="check13"><label for="check13"> 라운지</label></li>
						      <li><input type="checkbox" id="check14"><label for="check14"> 공용PC</label></li>
						      <li><input type="checkbox" id="check15"><label for="check15"> BBQ</label></li>
						      <li><input type="checkbox" id="check16"><label for="check16"> 카페</label></li>
						      <li><input type="checkbox" id="check17"><label for="check17"> 공용스파</label></li>
						      <li><input type="checkbox" id="check18"><label for="check18"> 족구장</label></li>
						      <li><input type="checkbox" id="check19"><label for="check19"> 세미나실</label></li>
						      <li><input type="checkbox" id="check20"><label for="check20"> 편의점</label></li>
						      <li><input type="checkbox" id="check21"><label for="check21"> 노래방</label></li>
						      <li><input type="checkbox" id="check22"><label for="check22"> 주방/식당</label></li>
						      <li><input type="checkbox" id="check23"><label for="check23"> 세탁기</label></li>
						      <li><input type="checkbox" id="check24"><label for="check24"> 건조기</label></li>
						      <li><input type="checkbox" id="check25"><label for="check25"> 탈수기</label></li>
						      <li><input type="checkbox" id="check26"><label for="check26"> 주차장</label></li>
						      <li><input type="checkbox" id="check27"><label for="check27"> 취사가능</label></li>
						      <li><input type="checkbox" id="check28"><label for="check28"> 공용샤워실</label></li>
						      <li><input type="checkbox" id="check29"><label for="check29"> 온천</label></li>
						      <li><input type="checkbox" id="check30"><label for="check30"> 스키장</label></li>
					      	</ul>
					    </form>
					<div><b>객실내 시설</b></div>
						<form>
							<ul style="margin-bottom: 10px">
						      <li><input type="checkbox" id="check31"><label for="check31"> 객실 스파</label></li>
						      <li><input type="checkbox" id="check32"><label for="check32"> 미니바</label></li>
						      <li><input type="checkbox" id="check33"><label for="check33"> 와이파이</label></li>
						      <li><input type="checkbox" id="check34"><label for="check34"> 욕실 용품</label></li>
						      <li><input type="checkbox" id="check35"><label for="check35"> TV</label></li>
						      <li><input type="checkbox" id="check36"><label for="check36"> 에어컨</label></li>
						      <li><input type="checkbox" id="check37"><label for="check37"> 냉장고</label></li>
						      <li><input type="checkbox" id="check38"><label for="check38"> 객실 샤워실</label></li>
						      <li><input type="checkbox" id="check39"><label for="check39"> 욕조</label></li>
						      <li><input type="checkbox" id="check40"><label for="check40"> 드라이기</label></li>
						      <li><input type="checkbox" id="check41"><label for="check41"> 다리미</label></li>
						      <li><input type="checkbox" id="check42"><label for="check42"> 전기밥솥</label></li>
						 	 </ul>
					    </form>
					<div><b>기 타</b></div>
						<form>
							<ul>
						      <li><input type="checkbox" id="check43"><label for="check43"> 반려견 동반</label></li>
						      <li><input type="checkbox" id="check44"><label for="check44"> 조식포함</label></li>
						      <li><input type="checkbox" id="check45"><label for="check45"> 객실내 흡연</label></li>
						      <li><input type="checkbox" id="check46"><label for="check46"> 발렛 파킹</label></li>
						      <li><input type="checkbox" id="check47"><label for="check47"> 금연</label></li>
						      <li><input type="checkbox" id="check48"><label for="check48"> 객실내 취사</label></li>
						      <li><input type="checkbox" id="check49"><label for="check49"> 프린터 사용</label></li>
						      <li><input type="checkbox" id="check50"><label for="check50"> 짐보관 가능</label></li>
						      <li><input type="checkbox" id="check51"><label for="check51"> 개인 사물함</label></li>
						      <li><input type="checkbox" id="check52"><label for="check52"> 무료 주차</label></li>
						      <li><input type="checkbox" id="check53"><label for="check53"> 픽업 가능</label></li>
						      <li><input type="checkbox" id="check54"><label for="check54"> 캠프 파이어</label></li>
						      <li><input type="checkbox" id="check55"><label for="check55"> 카드 결재</label></li>
						      <li><input type="checkbox" id="check56"><label for="check56"> 장애인 편의시설</label></li>
						    </ul>
					    </form>
				</aside>
			</div>
		<article>
			<nav>
				<ul class="info_list">
					<li><button type="button" id="map_Bt" class="custom-btnn btn-3"><span><img src="image/map_icon.png">지 도</span></button></li>
					<li><button type="button" id="high_Price_Bt" class="custom-btnn btn-3"><span><img src="image/high_price.png">높은 가격 순</span></button></li>
					<li><button type="button" id="low_Price_Bt" class="custom-btnn btn-3"><span><img src="image/low_price.png">낮은 가격 순</span></button></li>
					<li><button type="button" id="distance_Bt" class="custom-btnn btn-3"><span><img src="image/distance_icon.png">거리 순</span></button></li>
					<li><button type="button" id="recommen_Bt" class="custom-btnn btn-3"><span><img src="image/recommen_icon.png">추천 순</span></button></li>
				</ul>
			</nav>
				<div class="info">
					<div class="info_content">
						<ul>
							<li>
								<div class="list_image"><img src="image/ex1.jpg"></div>
								<div class="content_text_wrap">
									<div class="info_in_text" id="info_intext1"><span>3성급</span></div>
									<div class="info_in_text" id="info_intext2"><span>호텔이름</span></div>
									<div id="info_intext3"><span>★ 9.7 (2,761)</span></div>
									<div class="info_in_text" id="info_intext4"><span>강남구</span></div>
									<div id="info_intext5"><span>420,000원</span></div>
								</div>
							</li>
							<li>
								<div class="list_image"><img src="image/ex2.jpg"></div>
								<div class="content_text_wrap">
									<div class="info_in_text" id="info_intext1"><span>3성급</span></div>
									<div class="info_in_text" id="info_intext2"><span>호텔이름</span></div>
									<div id="info_intext3"><span>★ 9.7 (2,761)</span></div>
									<div class="info_in_text" id="info_intext4"><span>강남구</span></div>
									<div id="info_intext5"><span>420,000원</span></div>
								</div>
							</li>
							<li>
								<div class="list_image"><img src="image/ex3.jpg"></div>
								<div class="content_text_wrap">
									<div class="info_in_text" id="info_intext1"><span>3성급</span></div>
									<div class="info_in_text" id="info_intext2"><span>호텔이름</span></div>
									<div id="info_intext3"><span>★ 9.7 (2,761)</span></div>
									<div class="info_in_text" id="info_intext4"><span>강남구</span></div>
									<div id="info_intext5"><span>420,000원</span></div>
								</div>
							</li>
						</ul>
					</div>
				</div>
			</div>
		</article>
	<jsp:include page="footer.jsp"/>
</body>
<link rel="stylesheet" type="text/css" href="css/hotel_resort_index.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
	<script type="text/javascript" src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>
	<script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
	<script type="text/javascript" src="daterangepicker-master/daterangepicker.js"></script>
	<link rel="stylesheet" type="text/css" href="daterangepicker-master/daterangepicker.css"/>
	<script type="text/javascript" src="js/hotel_resort_index.js"></script>
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Gothic+A1&display=swap" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css?family=Do+Hyeon:400" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css?family=Black+Han+Sans:400" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css?family=Cute+Font:400" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css2?family=Lato&display=swap" rel="stylesheet">
  	<link href="https://fonts.googleapis.com/css2?family=Cormorant+Garamond:wght@500&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ion-rangeslider/2.3.1/css/ion.rangeSlider.min.css"/>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/ion-rangeslider/2.3.1/js/ion.rangeSlider.min.js"></script>
</html>