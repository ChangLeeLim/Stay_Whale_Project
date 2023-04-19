
var dataObj = document.getElementById("data");
var data = dataObj.value;
var jsonData = JSON.parse(data);
console.log(jsonData);



var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
    mapOption = { 
        center: new kakao.maps.LatLng(jsonData[0].latitude, jsonData[0].longitude), // 지도의 중심좌표
        level: 10 // 지도의 확대 레벨
    };

var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
 
// 마커를 표시할 위치와 title 객체 배열입니다 
var positions = [];    // 비어있는 배열을 선언하고 

for(var i =0 ; i<jsonData.length; i++){  //객체를 변수로 선언할 때는 쉼표 없이도 객체를 선언할 수 있다. 
	var info = {     // 객채를 차례로 생성해서 
			title : jsonData[i].attName,
			latlng : new kakao.maps.LatLng(jsonData[i].latitude, jsonData[i].longitude)
	};
	
	positions[i] = info;   // 배열에 차례로 담는다.
	console.log(positions[i].latlng);
}








// 마커 이미지의 이미지 주소입니다
var imageSrc ;//"https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png"; 
     
for (var i = 0; i < positions.length; i ++) {
	imageSrc = "image/marker_"+(i+1)+".png";
    
    // 마커 이미지의 이미지 크기 입니다
    var imageSize = new kakao.maps.Size(24, 24); 
    
    // 마커 이미지를 생성합니다    
    var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize); 
    
    // 마커를 생성합니다
    var marker = new kakao.maps.Marker({
        map: map, // 마커를 표시할 지도
        position: positions[i].latlng, // 마커를 표시할 위치
        title : positions[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
        image : markerImage // 마커 이미지 
    });
}