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

$('.nav_button:first').addClass('selected');

$('.nav_button').click(function(e) {
  	e.preventDefault();
  	$('.nav_button').removeClass('selected');
  	$(this).addClass('selected');
  	showContent($(this).attr('data-content-id'));
});



const listImages = document.querySelectorAll('.list_image');
  listImages.forEach((img) => {
    img.addEventListener('click', () => {
      const selectedImg = document.querySelector('#selected_image');
      selectedImg.src = img.src;
    });
  });
  
// 예약페이지 네비게이션바 클릭 이벤트
document.getElementById("reserve").addEventListener("click", function() {
  document.getElementById("room_section").style.display = "block";
  
  document.getElementById("camping_info").style.display = "none";
  document.getElementById("review_info").style.display = "none";
});
document.getElementById("infomation").addEventListener("click", function() {
  document.getElementById("camping_info").style.display = "block";
 
  document.getElementById("room_section").style.display = "none";
  document.getElementById("review_info").style.display = "none";
});
document.getElementById("review").addEventListener("click", function() {
  document.getElementById("review_info").style.display = "block";
  
  document.getElementById("room_section").style.display = "none";
  document.getElementById("camping_info").style.display = "none";
});
