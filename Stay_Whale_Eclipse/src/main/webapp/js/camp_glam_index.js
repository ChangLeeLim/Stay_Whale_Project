$(function(){
      var $header = $('header'); //헤더를 변수에 넣기
      var $page = $('.section_wrap'); //색상이 변할 부분
      var $window = $(window);
      var pageOffsetTop = $page.offset().top;//색상 변할 부분의 top값 구하기

      $window.resize(function(){ //반응형을 대비하여 리사이즈시 top값을 다시 계산
        pageOffsetTop = $page.offset().top;
      });
      
      $window.on('scroll', function(){ //스크롤시
        var scrolled = $window.scrollTop() >= pageOffsetTop; //스크롤된 상태; true or false
        $header.toggleClass('down', scrolled); //클래스 토글
        $(".logo").toggleClass('logodown', scrolled);
      });
    });

$('.spot_button:first').addClass('selected');

$('.spot_button').click(function(e) {
  	e.preventDefault();
  	$('.spot_button').removeClass('selected');
  	$(this).addClass('selected');
  	showContent($(this).attr('data-content-id'));
});
    

     
$('document').ready(function() {
 var area0 = ["시/도 선택","서울특별시","인천광역시","대전광역시","광주광역시","대구광역시","울산광역시","부산광역시","경기도","강원도","충청북도","충청남도","전라북도","전라남도","경상북도","경상남도","제주도"];
  var area1 = ["강남구","강동구","강북구","강서구","관악구","광진구","구로구","금천구","노원구","도봉구","동대문구","동작구","마포구","서대문구","서초구","성동구","성북구","송파구","양천구","영등포구","용산구","은평구","종로구","중구","중랑구"];
   var area2 = ["계양구","남구","남동구","동구","부평구","서구","연수구","중구","강화군","옹진군"];
   var area3 = ["대덕구","동구","서구","유성구","중구"];
   var area4 = ["광산구","남구","동구","북구","서구"];
   var area5 = ["남구","달서구","동구","북구","서구","수성구","중구","달성군"];
   var area6 = ["남구","동구","북구","중구","울주군"];
   var area7 = ["강서구","금정구","남구","동구","동래구","부산진구","북구","사상구","사하구","서구","수영구","연제구","영도구","중구","해운대구","기장군"];
   var area8 = ["고양시","과천시","광명시","광주시","구리시","군포시","김포시","남양주시","동두천시","부천시","성남시","수원시","시흥시","안산시","안성시","안양시","양주시","오산시","용인시","의왕시","의정부시","이천시","파주시","평택시","포천시","하남시","화성시","가평군","양평군","여주군","연천군"];
   var area9 = ["강릉시","동해시","삼척시","속초시","원주시","춘천시","태백시","고성군","양구군","양양군","영월군","인제군","정선군","철원군","평창군","홍천군","화천군","횡성군"];
   var area10 = ["제천시","청주시","충주시","괴산군","단양군","보은군","영동군","옥천군","음성군","증평군","진천군","청원군"];
   var area11 = ["계룡시","공주시","논산시","보령시","서산시","아산시","천안시","금산군","당진군","부여군","서천군","연기군","예산군","청양군","태안군","홍성군"];
   var area12 = ["군산시","김제시","남원시","익산시","전주시","정읍시","고창군","무주군","부안군","순창군","완주군","임실군","장수군","진안군"];
   var area13 = ["광양시","나주시","목포시","순천시","여수시","강진군","고흥군","곡성군","구례군","담양군","무안군","보성군","신안군","영광군","영암군","완도군","장성군","장흥군","진도군","함평군","해남군","화순군"];
   var area14 = ["경산시","경주시","구미시","김천시","문경시","상주시","안동시","영주시","영천시","포항시","고령군","군위군","봉화군","성주군","영덕군","영양군","예천군","울릉군","울진군","의성군","청도군","청송군","칠곡군"];
   var area15 = ["거제시","김해시","마산시","밀양시","사천시","양산시","진주시","진해시","창원시","통영시","거창군","고성군","남해군","산청군","의령군","창녕군","하동군","함안군","함양군","합천군"];
   var area16 = ["서귀포시","제주시","남제주군","북제주군"];

 

 // 시/도 선택 박스 초기화

 $("select[name^=sido]").each(function() {
  $selsido = $(this);
  $.each(eval(area0), function() {
   $selsido.append("<option value='"+this+"'>"+this+"</option>");
  });
  $selsido.next().append("<option value=''>구/군 선택</option>");
 });

 

 // 시/도 선택시 구/군 설정

 $("select[name^=sido]").change(function() {
  var area = "area"+$("option",$(this)).index($("option:selected",$(this))); // 선택지역의 구군 Array
  var $gugun = $(this).next(); // 선택영역 군구 객체
  $("option",$gugun).remove(); // 구군 초기화

  if(area == "area0")
   $gugun.append("<option value=''>구/군 선택</option>");
  else {
   $.each(eval(area), function() {
    $gugun.append("<option value='"+this+"'>"+this+"</option>");
   });
  }
 });


});



         



// 메인 이미지 슬라이더 기능 _  수정필요함
	var images = ["image/메인이미지1.jpg", "image/메인이미지2.jpg", "image/메인이미지3.jpg", "image/메인이미지4.jpg", "image/메인이미지5.jpg"];
	var currentIndex = 0;
	var slider = document.getElementsByClassName("title")[0];
	var prevButton = document.getElementById("prevButton");
	var nextButton = document.getElementById("nextButton");
	
	// 슬라이드 버튼 기능
	prevButton.addEventListener("click", function() {
	  currentIndex--;
	  if (currentIndex < 0) {
	    currentIndex = images.length - 1;
	  }
	  slider.style.backgroundImage = "url('" + images[currentIndex] + "')";
	});
	
	nextButton.addEventListener("click", function() {
	  currentIndex++;
	  if (currentIndex == images.length) {
	    currentIndex = 0;
	  }
	  slider.style.backgroundImage = "url('" + images[currentIndex] + "')";
	});
	
	// 자동 슬라이드 기능
	setInterval(function() {
	  currentIndex++;
	  if (currentIndex == images.length) {
	    currentIndex = 0;
	  }
	  slider.style.backgroundImage = "url('" + images[currentIndex] + "')";}, 4000);


//스페셜 캠핑 슬라이드 스크립트	
	const moveMain = document.querySelector('.move_main');
	const moveMainBody = document.querySelectorAll('.move_main_body');
	const prevButton2 = document.querySelector('.move_button:nth-of-type(1)');
	const nextButton2 = document.querySelector('.move_button:nth-of-type(2)');
	const slideDistance = moveMainBody[0].clientWidth + 20; // 리스트가 이동하는 거리
	let currentPosition = 0; // 현재 리스트 위치
	
	// 이전 버튼 클릭 이벤트
	prevButton2.addEventListener('click', () => {
	  if (currentPosition < 0) { // 리스트가 맨 왼쪽에 위치한 경우
	    currentPosition += slideDistance;
	    moveMain.style.transform = `translateX(${currentPosition}px)`;
	  }
	});
	
	// 다음 버튼 클릭 이벤트
	nextButton2.addEventListener('click', () => {
	  if (currentPosition > -slideDistance * (moveMainBody.length - 4)) { // 리스트가 맨 오른쪽에 위치한 경우
	    currentPosition -= slideDistance;
	    moveMain.style.transform = `translateX(${currentPosition}px)`;
	  }
	});
	
	// 일정 시간마다 자동 슬라이드
	setInterval(() => {
	  if (currentPosition > -slideDistance * (moveMainBody.length - 4)) { // 리스트가 맨 오른쪽에 위치하지 않은 경우
	    currentPosition -= slideDistance;
	    moveMain.style.transform = `translateX(${currentPosition}px)`;
	  } else {
	    currentPosition = 0;
	    moveMain.style.transform = `translateX(${currentPosition}px)`;
	  }
	}, 3000);

// 캠핑 버튼 클릭 이벤트
document.getElementById("btn_camping").addEventListener("click", function() {
  // 캠핑 콘텐츠를 보이게 함
  document.getElementById("content_camping").style.display = "block";
  // 다른 콘텐츠는 숨김 처리
  document.getElementById("content_caravan").style.display = "none";
  document.getElementById("content_glamping").style.display = "none";
  document.getElementById("content_map").style.display = "none";
});

// 카라반 버튼 클릭 이벤트
document.getElementById("btn_caravan").addEventListener("click", function() {
  // 카라반 콘텐츠를 보이게 함
  document.getElementById("content_caravan").style.display = "block";
  // 다른 콘텐츠는 숨김 처리
  document.getElementById("content_camping").style.display = "none";
  document.getElementById("content_glamping").style.display = "none";
  document.getElementById("content_map").style.display = "none";
});
// 글램핑 버튼 클릭 이벤트
document.getElementById("btn_glamping").addEventListener("click", function() {
  // 글램핑 콘텐츠를 보이게 함
  document.getElementById("content_glamping").style.display = "block";
  // 다른 콘텐츠는 숨김 처리
  document.getElementById("content_camping").style.display = "none";
  document.getElementById("content_caravan").style.display = "none";
  document.getElementById("content_map").style.display = "none";
});
// 지도 버튼 클릭 이벤트
document.getElementById("btn_map").addEventListener("click", function() {
  // 지도 콘텐츠를 보이게 함
  document.getElementById("content_map").style.display = "block";
  // 다른 콘텐츠는 숨김 처리
  document.getElementById("content_camping").style.display = "none";
  document.getElementById("content_caravan").style.display = "none";
  document.getElementById("content_glamping").style.display = "none";
});



// 카카오맵 API 부분
// 마커를 클릭하면 장소명을 표출할 인포윈도우 입니다
var infowindow = new kakao.maps.InfoWindow({zIndex:1});

var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new kakao.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };  

// 지도를 생성합니다    
var map = new kakao.maps.Map(mapContainer, mapOption); 

// 장소 검색 객체를 생성합니다
var ps = new kakao.maps.services.Places(); 

// 키워드로 장소를 검색합니다

function placeSearch() {
    var keyword = document.getElementById('keyword').value;
    ps.keywordSearch(keyword, placesSearchCB);
} 

// 키워드 검색 완료 시 호출되는 콜백함수 입니다
function placesSearchCB (data, status, pagination) {
    if (status === kakao.maps.services.Status.OK) {

        // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
        // LatLngBounds 객체에 좌표를 추가합니다
        var bounds = new kakao.maps.LatLngBounds();

        for (var i=0; i<data.length; i++) {
            displayMarker(data[i]);    
            bounds.extend(new kakao.maps.LatLng(data[i].y, data[i].x));
        }       

        // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
        map.setBounds(bounds);
    } 
}

// 지도에 마커를 표시하는 함수입니다
function displayMarker(place) {
    
    // 마커를 생성하고 지도에 표시합니다
    var marker = new kakao.maps.Marker({
        map: map,
        position: new kakao.maps.LatLng(place.y, place.x) 
    });

    // 마커에 클릭이벤트를 등록합니다
    kakao.maps.event.addListener(marker, 'click', function() {
        // 마커를 클릭하면 장소명이 인포윈도우에 표출됩니다
        infowindow.setContent('<div style="padding:5px;font-size:12px;">' + place.place_name + '</div>');
        infowindow.open(map, marker);
    });
}



 