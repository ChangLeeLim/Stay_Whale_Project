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
    
    $(function(){
		$(".custom-btn span").click(function(){
			var txt = $(this).text();
			var post_num = $("input[name='post_num']").val();
		
			if(txt === "수 정")
			{
				location.href="Bulletin_Board_Update.jsp?post_num=" + post_num;
			}
			else if(txt === "삭 제")
			{
				location.href="dbprocess/Bulletin_Board_Delete.jsp?post_num="+post_num;
			}
			else
			{
				
			}
		});
	});