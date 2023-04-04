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



//날짜 기준 검색필터 기능 _ 만드는중.....

const searchForm = document.getElementById("search_date");
const searchButton = document.getElementById("date_button");

searchForm.addEventListener("submit", function(event) {
  event.preventDefault(); // 기본 이벤트(페이지 새로고침) 방지

  const checkInDate = document.getElementById("check_in").value;
  const checkOutDate = document.getElementById("check_out").value;

  // 검색 필터 기능 추가
  // ...
});
