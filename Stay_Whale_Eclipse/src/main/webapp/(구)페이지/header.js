     
     $(function(){
		$(".more").mouseenter(function(){
			$(".announcement").stop().fadeIn();
		});
		
		$(".more").mouseleave(function(){
			$(".announcement").stop().fadeOut();
		});
	});
	
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
    
	$(document).ready(function(){
  $(window).scroll(function(){
    var scroll = $(window).scrollTop();
    if (scroll > 0) {
      $(".navbar").css("background" , "#333");
    }
    else{
      $(".navbar").css("background" , "transparent");   
    }

    $(".logodown").each(function(){
      var imagePos = $(this).offset().top;
      var topOfWindow = $(window).scrollTop();
      if (imagePos < topOfWindow+650) {
        $(this).addClass("slideUp");
      }
    });
  });
});