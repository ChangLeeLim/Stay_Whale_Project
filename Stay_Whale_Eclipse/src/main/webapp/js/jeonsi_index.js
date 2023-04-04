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

$(document).ready(function() {
    $("#icon1").click(function() {
      $(".sangpum_detail").html("<li>상품명1<br>별점:<br>가격:</li><li>상품명2<br>별점:<br>가격:</li><li>상품명3<br>별점:<br>가격:</li>");
    });
    
    $("#icon2").click(function() {
      $(".sangpum_detail").html("<li>상품명4<br>별점:<br>가격:</li><li>상품명5<br>별점:<br>가격:</li><li>상품명6<br>별점:<br>가격:</li>");
    });
    
    $("#icon3").click(function() {
      $(".sangpum_detail").html("<li>상품명7<br>별점:<br>가격:</li><li>상품명8<br>별점:<br>가격:</li><li>상품명9<br>별점:<br>가격:</li>");
    });
    
    $("#icon4").click(function() {
      $(".sangpum_detail").html("<li>상품명10<br>별점:<br>가격:</li><li>상품명11<br>별점:<br>가격:</li><li>상품명12<br>별점:<br>가격:</li>");
    });
    $("#icon6").click(function() {
        $(".sangpum_detail2").html("<li>상품명01<br>별점:<br>가격:</li><li>상품명02<br>별점:<br>가격:</li><li>상품명03<br>별점:<br>가격:</li>");
      });
      $("#icon7").click(function() {
        $(".sangpum_detail2").html("<li>상품명04<br>별점:<br>가격:</li><li>상품명05<br>별점:<br>가격:</li><li>상품명06<br>별점:<br>가격:</li>");
      });
      $("#icon8").click(function() {
        $(".sangpum_detail2").html("<li>상품명07<br>별점:<br>가격:</li><li>상품명08<br>별점:<br>가격:</li><li>상품명09<br>별점:<br>가격:</li>");
      });
      $("#icon9").click(function() {
        $(".sangpum_detail2").html("<li>상품명010<br>별점:<br>가격:</li><li>상품명011<br>별점:<br>가격:</li><li>상품명012<br>별점:<br>가격:</li>");
      });
            
  });

  $(function() {
    $(".categori_icon").click(function() {
      $(".categori_icon").removeClass("active");
      $(this).addClass("active");
      $(".sangpum_detail").removeClass("active");
      $(".sangpum_detail").eq($(this).index()).addClass("active");
    });
  });

/* 사이드바메뉴 클릭시 위치변경해주는 기능*/
  var menuLinks = document.querySelectorAll('.menu a');
/*
menuLinks.forEach(function(menuLink) {
  menuLink.addEventListener('click', function(e) {
    e.preventDefault(); // 기본 동작 중단
    var targetId = this.getAttribute('href'); // 클릭한 메뉴 항목의 href 속성값 가져오기
    var targetElement = document.querySelector(targetId); // 해당 id 값을 가진 요소 가져오기
    var targetPosition = targetElement.offsetTop; // 해당 요소의 위치 계산
    window.scrollTo({
      top: targetPosition,
      behavior: 'smooth' // 스크롤 애니메이션 적용
    });
  });
});

document.querySelectorAll('.sidebar_menu a').forEach(anchor => {
    anchor.addEventListener('click', function (e) {
      e.preventDefault(); // 기본 이벤트(링크 클릭 시 페이지 이동) 방지
      const target = document.querySelector(this.getAttribute('href'));
      target.scrollIntoView({behavior: 'smooth'}); // 부드럽게 스크롤 이동
    });
  });*/

  $(function(){
    $('a[href^="#"]').on('click', function(){
        var target = $($(this).attr("href"));
        if(target.length)
        {
            event.preventDefault();
            var headerHeight = $('header').outerHeight(); // 헤더 높이 구하기
            var targetOffset = target.offset().top - headerHeight; // 헤더 높이 빼기
            $("html, body").animate({
                scrollTop: targetOffset
            }, 400);
        }
    });
  });